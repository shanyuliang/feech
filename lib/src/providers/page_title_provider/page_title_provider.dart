import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_title_provider.g.dart';

@Riverpod()
class PageTitleProvider extends _$PageTitleProvider {
  @override
  String? build(String? routeName) {
    return null;
  }

  void setTitle(String? title) {
    state = title;
  }
}
