import 'package:flutter/animation.dart';

import 'support/app_cache_manager.dart';
import 'support/network/app_client.dart';

const debugTag = "Feech";
const frameDelay = Duration(milliseconds: 16);
final defaultAppCacheManager = AppCacheManager(httpClient: AppClient());
const allCurves = [
  (Curves.bounceIn, "bounceIn"),
  (Curves.bounceInOut, "bounceInOut"),
  (Curves.bounceOut, "bounceOut"),
  (Curves.decelerate, "decelerate"),
  (Curves.ease, "ease"),
  (Curves.easeIn, "easeIn"),
  (Curves.easeInBack, "easeInBack"),
  (Curves.easeInCirc, "easeInCirc"),
  (Curves.easeInCubic, "easeInCubic"),
  (Curves.easeInExpo, "easeInExpo"),
  (Curves.easeInQuad, "easeInQuad"),
  (Curves.easeInQuart, "easeInQuart"),
  (Curves.easeInQuint, "easeInQuint"),
  (Curves.easeInSine, "easeInSine"),
  (Curves.easeInToLinear, "easeInToLinear"),
  (Curves.easeInOut, "easeInOut"),
  (Curves.easeInOutBack, "easeInOutBack"),
  (Curves.easeInOutCirc, "easeInOutCirc"),
  (Curves.easeInOutCubic, "easeInOutCubic"),
  (Curves.easeInOutCubicEmphasized, "easeInOutCubicEmphasized"),
  (Curves.easeInOutExpo, "easeInOutExpo"),
  (Curves.easeInOutQuad, "easeInOutQuad"),
  (Curves.easeInOutQuart, "easeInOutQuart"),
  (Curves.easeInOutQuint, "easeInOutQuint"),
  (Curves.easeInOutSine, "easeInOutSine"),
  (Curves.easeOut, "easeOut"),
  (Curves.easeOutBack, "easeOutBack"),
  (Curves.easeOutCirc, "easeOutCirc"),
  (Curves.easeOutCubic, "easeOutCubic"),
  (Curves.easeOutExpo, "easeOutExpo"),
  (Curves.easeOutQuad, "easeOutQuad"),
  (Curves.easeOutQuart, "easeOutQuart"),
  (Curves.easeOutQuint, "easeOutQuint"),
  (Curves.easeOutSine, "easeOutSine"),
  (Curves.elasticIn, "elasticIn"),
  (Curves.elasticInOut, "elasticInOut"),
  (Curves.elasticOut, "elasticOut"),
  (Curves.fastEaseInToSlowEaseOut, "fastEaseInToSlowEaseOut"),
  (Curves.fastLinearToSlowEaseIn, "fastLinearToSlowEaseIn"),
  (Curves.fastOutSlowIn, "fastOutSlowIn"),
  (Curves.linear, "linear"),
  (Curves.linearToEaseOut, "linearToEaseOut"),
  (Curves.slowMiddle, "slowMiddle"),
];
