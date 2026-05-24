// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/theme/data/repositories/theme_repository_impl.dart'
    as _i592;
import '../../features/theme/domain/repositories/theme_repository.dart'
    as _i869;
import '../../features/theme/domain/usecases/get_theme_usecase.dart' as _i620;
import '../../features/theme/domain/usecases/set_theme_usecase.dart' as _i684;
import '../../features/theme/presentation/cubit/theme_cubit.dart' as _i5;
import '../network/dio_client.dart' as _i667;
import '../network/interceptors/auth_interceptor.dart' as _i745;
import '../router/app_routers.dart' as _i283;
import '../storage/app_database.dart' as _i690;
import '../storage/preferences_service.dart' as _i636;
import '../storage/secure_storage_service.dart' as _i666;
import 'network_module.dart' as _i567;
import 'storage_module.dart' as _i371;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final storageModule = _$StorageModule();
    final networkModule = _$NetworkModule();
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => storageModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => storageModule.secureStorage,
    );
    gh.lazySingleton<_i690.AppDatabase>(() => storageModule.appDatabase);
    gh.lazySingleton<_i745.AuthInterceptor>(() => _i745.AuthInterceptor());
    gh.lazySingleton<_i283.AppRouters>(() => _i283.AppRouters());
    gh.lazySingleton<String>(
      () => networkModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i666.SecureStorageService>(
      () => _i666.SecureStorageService(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i667.DioClient>(
      () => networkModule.getDioClient(
        gh<String>(instanceName: 'baseUrl'),
        gh<_i745.AuthInterceptor>(),
      ),
    );
    gh.lazySingleton<_i636.PreferencesService>(
      () => _i636.PreferencesService(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i869.ThemeRepository>(
      () => _i592.ThemeRepositoryImpl(gh<_i636.PreferencesService>()),
    );
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio(gh<_i667.DioClient>()));
    gh.factory<_i620.GetThemeUseCase>(
      () => _i620.GetThemeUseCase(gh<_i869.ThemeRepository>()),
    );
    gh.factory<_i684.SetThemeUseCase>(
      () => _i684.SetThemeUseCase(gh<_i869.ThemeRepository>()),
    );
    gh.factory<_i5.ThemeCubit>(
      () => _i5.ThemeCubit(
        gh<_i620.GetThemeUseCase>(),
        gh<_i684.SetThemeUseCase>(),
      ),
    );
    return this;
  }
}

class _$StorageModule extends _i371.StorageModule {}

class _$NetworkModule extends _i567.NetworkModule {}
