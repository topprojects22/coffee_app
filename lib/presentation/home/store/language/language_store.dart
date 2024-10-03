import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/domain/entity/language/Language.dart';
import 'package:boilerplate/domain/repository/setting/setting_repository.dart';
import 'package:mobx/mobx.dart';

part 'language_store.g.dart';

class LanguageStore = _LanguageStore with _$LanguageStore;

abstract class _LanguageStore with Store {

  // constructor:---------------------------------------------------------------
  _LanguageStore(this._repository, this.errorStore) {
    init();
  }
  static const String TAG = 'LanguageStore';

  // repository instance
  final SettingRepository _repository;

  // store for handling errors
  final ErrorStore errorStore;

  // supported languages
  List<Language> supportedLanguages = <Language>[
    Language(code: 'US', locale: 'en', language: 'English'),
    Language(code: 'DK', locale: 'da', language: 'Danish'),
    Language(code: 'ES', locale: 'es', language: 'España'),
  ];

  // store variables:-----------------------------------------------------------
  @observable
  String _locale = 'en';

  @computed
  String get locale => _locale;

  // actions:-------------------------------------------------------------------
  @action
  void changeLanguage(String value) {
    _locale = value;
    _repository.changeLanguage(value).then((_) {
      // write additional logic here
    });
  }

  @action
  String getCode() {
    String code;

    if (_locale == 'en') {
      code = 'US';
    } else if (_locale == 'da') {
      code = 'DK';
    } else if (_locale == 'es') {
      code = 'ES';
    } else {
      code = 'Error language';
    }

    return code;
  }

  @action
  String? getLanguage() {
    return supportedLanguages[supportedLanguages
            .indexWhere((Language language) => language.locale == _locale)]
        .language;
  }

  // general:-------------------------------------------------------------------
  Future<void> init() async {
    // getting current language from shared preference
    if (_repository.currentLanguage != null) {
      _locale = _repository.currentLanguage!;
    }
  }

  // dispose:-------------------------------------------------------------------
  void dispose() {}
}
