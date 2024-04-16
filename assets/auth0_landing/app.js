/**
 * The Auth0 client, initialized in configureClient()
 */
let auth0Client = null;
/**
 * The Auth0 config, initialized in configureClient()
 */
let auth0Config = null;
/**
 * After the Flutter InApp web view finished initialise javascript handler
 * We can start initialise Auth0.
 */
window.addEventListener("flutterInAppWebViewPlatformReady", function(event) {
	console.log('flutterInAppWebViewPlatformReady');
	initializeAuth0();
});
/**
 * Initializes the Auth0 client
 */
const configureClient = async() => {
	console.log("Landing page url:", window.location.origin + window.location.pathname);
	auth0Config = await askConfig();
	auth0Client = await auth0.createAuth0Client({
		domain: auth0Config.domain,
		clientId: auth0Config.clientId,
		authorizationParams: {
			audience: auth0Config.audience,
			redirect_uri: window.location.origin + window.location.pathname
		}
	});
};
/**
 * Starts the authentication flow
 */
const login = async(hint) => {
	try {
		console.log("Logging in ...", hint);
		let ap = null;
		if(hint === 'login') {
			if(auth0Config.email === null) {
				ap = {
				    prompt: 'login',
					redirect_uri: window.location.origin + window.location.pathname,
					screen_hint: 'login'
				};
			} else {
				ap = {
				    login_hint: auth0Config.email,
                    prompt: 'login',
					redirect_uri: window.location.origin + window.location.pathname,
					screen_hint: 'login'
				};
			}
		} else if(hint === 'refresh') {
			ap = {
			    prompt: 'none',
				redirect_uri: window.location.origin + window.location.pathname
			};
		} else if(hint === 'signup'){
			ap = {
			    prompt: 'login',
				redirect_uri: window.location.origin + window.location.pathname,
				screen_hint: 'signup'
			};
		} else {
            ap = {
                redirect_uri: window.location.origin + window.location.pathname
            };
        }
		await auth0Client.loginWithRedirect({
			authorizationParams: ap
		});
	} catch(err) {
		console.log("Log in failed", err);
	}
};
/**
 * Executes the logout flow
 */
const logout = async() => {
	try {
		console.log("Logging out...");
		await auth0Client.logout({
			logoutParams: {
				returnTo: window.location.origin + window.location.pathname
			}
		});
	} catch(err) {
		console.log("Log out failed", err);
	}
};
/**
 * Ask the Flutter app about Auth0 config.
 */
const askConfig = async() => {
	console.log("Javascript asks Auth0 config");
	const config = await window.flutter_inappwebview.callHandler('Auth0Config');
	console.log("Javascript got Auth0 config:", config.domain, config.clientId, config.audience);
	return config;
};
/**
 * Report the signed in to Flutter app.
 */
const reportSignedIn = async() => {
	const token = await auth0Client.getTokenSilently();
	const claims = await auth0Client.getIdTokenClaims();
	let auth0CredentialsString = '{"status":"signedIn","accessToken":"' + token + '","idToken":"' + claims.__raw + '"}';
	console.log("Javascript reports Auth0 signed in");
	await window.flutter_inappwebview.callHandler('Auth0Report', auth0CredentialsString);
};
/**
 * Report the signed out to Flutter app.
 */
const reportSignedOut = async() => {
	console.log("Javascript reports Auth0 signed out");
	await window.flutter_inappwebview.callHandler('Auth0Report', '{"status":"signedOut"}');
};
/**
 * Report the refreshing to Flutter app.
 */
const reportRefreshing = async() => {
	console.log("Javascript reports Auth0 refreshing");
	await window.flutter_inappwebview.callHandler('Auth0Report', '{"status":"refreshing"}');
};
/**
 * Report the Timeout to Flutter app.
 */
const reportTimeout = async() => {
	console.log("Javascript reports Auth0 timeout");
	await window.flutter_inappwebview.callHandler('Auth0Report', '{"status":"timeout"}');
};
/**
 * Initialise Auth0.
 */
const initializeAuth0 = async() => {
	await configureClient();
	const query = window.location.search;
	let searchParams = new URLSearchParams(query);
	let action = searchParams.get('action');
	if(action != null) {
		console.log('Action is', action, '. It means this is the initial landing page.');
		if(action === 'logout') {
			logout();
		} else {
			try {
				console.log('Trying to get token silently...');
				await auth0Client.getTokenSilently({
					timeoutInSeconds: 10
				});
				console.log('Looks like user is already authenticated.');
				reportSignedIn();
			} catch(error) {
				console.log("Getting token silently failed:", error.error);
				if(error.error === 'timeout') {
					reportTimeout();
				} else {
					if(action === 'refresh') {
						reportRefreshing();
					}
					login(action);
				}
			}
		}
	} else {
		console.log('Action is null. It means this is the redirected landing page.');
		const shouldParseResult = searchParams.has("code") && searchParams.has("state");
		if(shouldParseResult) {
			console.log("We have code and state to be parsed. It means user just signed in. Parsing...");
			try {
				const result = await auth0Client.handleRedirectCallback();
				console.log("We got user's token.");
				reportSignedIn();
			} catch(err) {
				console.log("Error parsing code and state:", err);
				console.log("User is in an unknown state and we report signed out here.");
				reportSignedOut();
			}
			window.history.replaceState({}, document.title, "/");
		} else {
			console.log("We have nothing to be parsed. It means user just signed out.");
			reportSignedOut();
		}
	}
};