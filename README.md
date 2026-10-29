Feech stands for "Flutter Experience Emma Can Help".

## Features

Use the package to simplify your Flutter project development.

## Getting started

### SQLite3 on web

If you use `SqliteHelper` on Flutter web, download `sqlite3.wasm` file from [SQLite Download Page](https://sqlite.org/download.html) to your app's `web/` directory (for example `web/sqlite3.wasm`).

## Command to update dependencies

Use `flutter packages get` to fetch new packages.

## Command to publish the package

Use `dart pub publish` to publish new packages. Before that, make sure you have push the code to the main branch.

## How to generate the generated classes

```shell
dart run build_runner build
```

## Usage

```dart
import 'package:feech/feech.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Option 1: auto-extract frames from one SVG file.
/// The SVG should contain groups like <g id="frame_1"> ... </g>, <g id="frame_2"> ... </g>.
final loading = AnimatedSvgAutoFrameSequence(
  svgAssetPath: 'assets/loader/loader.svg',
  frameDuration: const Duration(milliseconds: 80),
  width: 120,
  height: 120,
);

/// Option 2: SMIL MVP engine in pure Flutter (supports animate/animateTransform/set).
final smilMvp = SmilCssSvgMvpWidget.asset(
  assetPath: 'assets/images/nature.svg',
  targetFrameRate: 60,
  width: 240,
  height: 240,
);

/// Option 3: unknown SVG animation model (SMIL/CSS) -> run it in browser engine directly.
final runtimeAnimated = AnimatedRuntimeSvgWidget.asset(
  assetPath: 'assets/images/nature.svg',
  width: 240,
  height: 240,
);

/// Option 4: animate a static SVG with Flutter transforms.
final pulse = AnimatedSvgTransform(
  beginScale: 0.9,
  endScale: 1.1,
  beginOpacity: 0.6,
  endOpacity: 1,
  duration: const Duration(milliseconds: 900),
  child: SvgPicture.asset('assets/logo.svg', width: 96, height: 96),
);
```

The MVP renderer interpolates percentage-based CSS `offset-distance` keyframes
along `offset-path: path(...)`, including paths supplied in inline styles.
CSS `d: path(...)` keyframes morph continuously when both paths have matching
command sequences and argument counts; incompatible paths switch discretely.
`targetFrameRate` controls cached frame sampling, not guaranteed device rendering
performance. SMIL/CSS support remains partial, not browser-equivalent.

## Additional information

Contact me via shanyuliang@gmail.com
