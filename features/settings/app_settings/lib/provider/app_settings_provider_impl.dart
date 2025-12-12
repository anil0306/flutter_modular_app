import 'package:app_settings/provider/app_settings_provider.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AppSettingsProvider, env: [Environment.prod])
class ProdAppSettingsProviderImpl implements AppSettingsProvider {
  @override
  String getAppLanguage() {
    return "English";
  }

  @override
  String getThemeType() {
    return "dark";
  }
}

@Injectable(as: AppSettingsProvider, env: [Environment.dev])
class DevAppSettingsProviderImpl implements AppSettingsProvider {
  @override
  String getAppLanguage() {
    return "Arabic";
  }

  @override
  String getThemeType() {
    return "light";
  }
}
