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
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/create_moment/data/repositories/tag_repository_impl.dart'
    as _i167;
import '../../features/create_moment/domain/repositories/tag_repository.dart'
    as _i705;
import '../../features/create_moment/domain/usecases/create_tag_usecase.dart'
    as _i938;
import '../../features/create_moment/domain/usecases/delete_tag_usecase.dart'
    as _i74;
import '../../features/create_moment/domain/usecases/get_tags_usecase.dart'
    as _i173;
import '../../features/moment/data/repositories/moment_repository_impl.dart'
    as _i1042;
import '../../features/moment/domain/repositories/moment_repository.dart'
    as _i286;
import '../../features/moment/domain/usecases/create_moment_usecase.dart'
    as _i777;
import '../../features/moment/domain/usecases/delete_moment_usecase.dart'
    as _i918;
import '../../features/moment/domain/usecases/get_moment_by_id_usecase.dart'
    as _i752;
import '../../features/moment/domain/usecases/get_moments_usecase.dart'
    as _i707;
import '../../features/moment/domain/usecases/update_moment_flags_usecase.dart'
    as _i479;
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
    gh.lazySingleton<_i183.ImagePicker>(() => storageModule.imagePicker);
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
    gh.lazySingleton<_i705.TagRepository>(
      () => _i167.TagRepositoryImpl(gh<_i690.AppDatabase>()),
    );
    gh.lazySingleton<_i286.MomentRepository>(
      () => _i1042.MomentRepositoryImpl(gh<_i690.AppDatabase>()),
    );
    gh.factory<_i777.CreateMomentUseCase>(
      () => _i777.CreateMomentUseCase(gh<_i286.MomentRepository>()),
    );
    gh.factory<_i918.DeleteMomentUseCase>(
      () => _i918.DeleteMomentUseCase(gh<_i286.MomentRepository>()),
    );
    gh.factory<_i752.GetMomentByIdUseCase>(
      () => _i752.GetMomentByIdUseCase(gh<_i286.MomentRepository>()),
    );
    gh.factory<_i707.GetMomentsUseCase>(
      () => _i707.GetMomentsUseCase(gh<_i286.MomentRepository>()),
    );
    gh.factory<_i479.UpdateMomentFlagsUseCase>(
      () => _i479.UpdateMomentFlagsUseCase(gh<_i286.MomentRepository>()),
    );
    gh.factory<_i938.CreateTagUseCase>(
      () => _i938.CreateTagUseCase(gh<_i705.TagRepository>()),
    );
    gh.factory<_i74.DeleteTagUseCase>(
      () => _i74.DeleteTagUseCase(gh<_i705.TagRepository>()),
    );
    gh.factory<_i173.GetTagsUseCase>(
      () => _i173.GetTagsUseCase(gh<_i705.TagRepository>()),
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
