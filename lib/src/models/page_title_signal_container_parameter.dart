import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_title_signal_container_parameter.freezed.dart';

@Freezed()
abstract class PageTitleSignalContainerParameter with _$PageTitleSignalContainerParameter {
  const factory PageTitleSignalContainerParameter({final String? routeName, final String? initialTitle}) = _PageTitleSignalContainerParameter;
}
