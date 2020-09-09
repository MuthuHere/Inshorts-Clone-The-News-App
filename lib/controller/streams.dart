import 'dart:async';

class ServiceStream {
  ServiceStream._();
  static StreamController _appBarVisible = StreamController<bool>.broadcast();
  static StreamController _appBarTitle = StreamController<String>.broadcast();

  static Stream<int> get appbarVisibleStream => _appBarVisible.stream;
  static Stream<int> get appbarTitleStream => _appBarTitle.stream;

  static void updateAppbarVisibility(bool isvisible) {
    _appBarVisible.sink.add(isvisible);
  }

  static void addCurrentArticleIndex(String title) {
    _appBarTitle.sink.add(title);
  }

  dispos() {
    _appBarVisible.close();
    _appBarTitle.close();
  }
}
