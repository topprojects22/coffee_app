import 'package:mobx/mobx.dart';

part 'error_store.g.dart';

class ErrorStore = _ErrorStore with _$ErrorStore;

abstract class _ErrorStore with Store {

  // constructor:---------------------------------------------------------------
  _ErrorStore() {
    _disposers = <ReactionDisposer>[
      reaction((_) => errorMessage, reset, delay: 200),
    ];
  }
  // disposers
  late List<ReactionDisposer> _disposers;

  // store variables:-----------------------------------------------------------
  @observable
  String errorMessage = '';

  // actions:-------------------------------------------------------------------
  @action
  void setErrorMessage(String message) {
    errorMessage = message;
  }

  @action
  void reset(String value) {
    errorMessage = '';
  }

  // dispose:-------------------------------------------------------------------
  @action
  dispose() {
    for (final ReactionDisposer disposer in _disposers) {
      disposer();
    }
  }
}
