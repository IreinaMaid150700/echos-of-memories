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
import 'package:local_auth/local_auth.dart' as _i152;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/app_lock/data/repositories/app_lock_repository_impl.dart'
    as _i731;
import '../../features/app_lock/data/services/app_lock_storage.dart' as _i151;
import '../../features/app_lock/domain/repositories/app_lock_repository.dart'
    as _i98;
import '../../features/app_lock/presentation/cubit/lock_session_cubit.dart'
    as _i746;
import '../../features/app_lock/presentation/cubit/pin_cubit.dart' as _i693;
import '../../features/create_collection/data/repositories/collection_repository_impl.dart'
    as _i412;
import '../../features/create_collection/domain/repositories/collection_repository.dart'
    as _i1058;
import '../../features/create_collection/domain/usecases/create_collection_usecase.dart'
    as _i451;
import '../../features/create_moment/data/repositories/tag_repository_impl.dart'
    as _i167;
import '../../features/create_moment/data/services/moment_asset_service.dart'
    as _i577;
import '../../features/create_moment/data/services/moment_location_service.dart'
    as _i347;
import '../../features/create_moment/domain/repositories/moment_asset_repository.dart'
    as _i1059;
import '../../features/create_moment/domain/repositories/moment_location_repository.dart'
    as _i246;
import '../../features/create_moment/domain/repositories/tag_repository.dart'
    as _i705;
import '../../features/create_moment/domain/usecases/cleanup_moment_assets_usecase.dart'
    as _i398;
import '../../features/create_moment/domain/usecases/create_tag_usecase.dart'
    as _i938;
import '../../features/create_moment/domain/usecases/delete_tag_usecase.dart'
    as _i74;
import '../../features/create_moment/domain/usecases/get_current_moment_location_usecase.dart'
    as _i25;
import '../../features/create_moment/domain/usecases/get_tags_usecase.dart'
    as _i173;
import '../../features/create_moment/domain/usecases/persist_moment_assets_usecase.dart'
    as _i1022;
import '../../features/create_moment/domain/usecases/pick_moment_images_usecase.dart'
    as _i90;
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
import '../../features/moment/domain/usecases/update_moment_flags_usecase.dart'
    as _i479;
import '../../features/moment/domain/usecases/watch_moments_usecase.dart'
    as _i583;
import '../../features/mood_tone/data/repositories/mood_tone_repository_impl.dart'
    as _i296;
import '../../features/mood_tone/domain/repositories/mood_tone_repository.dart'
    as _i1018;
import '../../features/mood_tone/domain/usecases/get_moods_usecase.dart'
    as _i874;
import '../../features/mood_tone/domain/usecases/get_tones_usecase.dart'
    as _i618;
import '../../features/search/data/repositories/search_history_repository_impl.dart'
    as _i25;
import '../../features/search/domain/repositories/search_history_repository.dart'
    as _i513;
import '../../features/search/domain/usecases/add_recent_search_usecase.dart'
    as _i951;
import '../../features/search/domain/usecases/get_recent_searches_usecase.dart'
    as _i224;
import '../../features/search/domain/usecases/get_suggested_tags_usecase.dart'
    as _i1026;
import '../../features/search/domain/usecases/search_moments_usecase.dart'
    as _i87;
import '../../features/theme/data/repositories/theme_repository_impl.dart'
    as _i592;
import '../../features/theme/domain/repositories/theme_repository.dart'
    as _i869;
import '../../features/theme/domain/usecases/get_available_themes_usecase.dart'
    as _i426;
import '../../features/theme/domain/usecases/get_selected_theme_usecase.dart'
    as _i1;
import '../../features/theme/domain/usecases/get_theme_usecase.dart' as _i620;
import '../../features/theme/domain/usecases/set_selected_theme_usecase.dart'
    as _i831;
import '../../features/theme/domain/usecases/set_theme_usecase.dart' as _i684;
import '../../features/theme/presentation/cubit/theme_cubit.dart' as _i5;
import '../location/data/location_service.dart' as _i659;
import '../location/domain/location_gateway.dart' as _i637;
import '../media/data/media_picker_service.dart' as _i775;
import '../media/domain/media_picker_gateway.dart' as _i181;
import '../network/dio_client.dart' as _i667;
import '../network/interceptors/auth_interceptor.dart' as _i745;
import '../permissions/data/permission_service.dart' as _i417;
import '../permissions/domain/permission_gateway.dart' as _i327;
import '../router/app_lock_guard.dart' as _i813;
import '../router/app_routers.dart' as _i283;
import '../security/biometric_service.dart' as _i379;
import '../security/security_module.dart' as _i870;
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
    final securityModule = _$SecurityModule();
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
    gh.lazySingleton<_i283.AppRouters>(() => _i283.AppRouters());
    gh.lazySingleton<_i152.LocalAuthentication>(() => securityModule.localAuth);
    gh.lazySingleton<_i746.LockSessionCubit>(() => _i746.LockSessionCubit());
    gh.lazySingleton<_i327.PermissionGateway>(() => _i417.PermissionService());
    gh.lazySingleton<_i151.AppLockStorage>(
      () => _i151.AppLockStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i637.LocationGateway>(() => _i659.LocationService());
    gh.lazySingleton<_i1059.MomentAssetRepository>(
      () => _i577.MomentAssetService(),
    );
    gh.lazySingleton<String>(
      () => networkModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i745.AuthInterceptor>(
      () => _i745.AuthInterceptor(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i246.MomentLocationRepository>(
      () => _i347.MomentLocationService(gh<_i327.PermissionGateway>()),
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
    gh.lazySingleton<_i181.MediaPickerGateway>(
      () => _i775.MediaPickerService(gh<_i183.ImagePicker>()),
    );
    gh.lazySingleton<_i636.PreferencesService>(
      () => _i636.PreferencesService(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i398.CleanupMomentAssetsUseCase>(
      () =>
          _i398.CleanupMomentAssetsUseCase(gh<_i1059.MomentAssetRepository>()),
    );
    gh.factory<_i1022.PersistMomentAssetsUseCase>(
      () =>
          _i1022.PersistMomentAssetsUseCase(gh<_i1059.MomentAssetRepository>()),
    );
    gh.lazySingleton<_i705.TagRepository>(
      () => _i167.TagRepositoryImpl(gh<_i690.AppDatabase>()),
    );
    gh.lazySingleton<_i1058.CollectionRepository>(
      () => _i412.CollectionRepositoryImpl(gh<_i690.AppDatabase>()),
    );
    gh.lazySingleton<_i98.AppLockRepository>(
      () => _i731.AppLockRepositoryImpl(gh<_i151.AppLockStorage>()),
    );
    gh.lazySingleton<_i813.AppLockGuard>(
      () => _i813.AppLockGuard(
        gh<_i636.PreferencesService>(),
        gh<_i746.LockSessionCubit>(),
        gh<_i690.AppDatabase>(),
      ),
    );
    gh.lazySingleton<_i1018.MoodToneRepository>(
      () => _i296.MoodToneRepositoryImpl(gh<_i690.AppDatabase>()),
    );
    gh.factory<_i25.GetCurrentMomentLocationUseCase>(
      () => _i25.GetCurrentMomentLocationUseCase(
        gh<_i246.MomentLocationRepository>(),
      ),
    );
    gh.lazySingleton<_i379.BiometricService>(
      () => _i379.BiometricService(gh<_i152.LocalAuthentication>()),
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
    gh.factory<_i479.UpdateMomentFlagsUseCase>(
      () => _i479.UpdateMomentFlagsUseCase(gh<_i286.MomentRepository>()),
    );
    gh.factory<_i583.WatchMomentsUseCase>(
      () => _i583.WatchMomentsUseCase(gh<_i286.MomentRepository>()),
    );
    gh.factory<_i87.SearchMomentsUseCase>(
      () => _i87.SearchMomentsUseCase(gh<_i286.MomentRepository>()),
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
    gh.factory<_i1026.GetSuggestedTagsUseCase>(
      () => _i1026.GetSuggestedTagsUseCase(gh<_i705.TagRepository>()),
    );
    gh.lazySingleton<_i869.ThemeRepository>(
      () => _i592.ThemeRepositoryImpl(
        gh<_i636.PreferencesService>(),
        gh<_i690.AppDatabase>(),
      ),
    );
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio(gh<_i667.DioClient>()));
    gh.factory<_i874.GetMoodsUseCase>(
      () => _i874.GetMoodsUseCase(gh<_i1018.MoodToneRepository>()),
    );
    gh.factory<_i618.GetTonesUseCase>(
      () => _i618.GetTonesUseCase(gh<_i1018.MoodToneRepository>()),
    );
    gh.factory<_i90.PickMomentImagesUseCase>(
      () => _i90.PickMomentImagesUseCase(gh<_i181.MediaPickerGateway>()),
    );
    gh.lazySingleton<_i513.SearchHistoryRepository>(
      () => _i25.SearchHistoryRepositoryImpl(gh<_i636.PreferencesService>()),
    );
    gh.factory<_i451.CreateCollectionUsecase>(
      () => _i451.CreateCollectionUsecase(gh<_i1058.CollectionRepository>()),
    );
    gh.factory<_i951.AddRecentSearchUseCase>(
      () => _i951.AddRecentSearchUseCase(gh<_i513.SearchHistoryRepository>()),
    );
    gh.factory<_i224.GetRecentSearchesUseCase>(
      () => _i224.GetRecentSearchesUseCase(gh<_i513.SearchHistoryRepository>()),
    );
    gh.factory<_i693.PinCubit>(
      () => _i693.PinCubit(
        gh<_i98.AppLockRepository>(),
        gh<_i379.BiometricService>(),
        gh<_i746.LockSessionCubit>(),
      ),
    );
    gh.factory<_i426.GetAvailableThemesUseCase>(
      () => _i426.GetAvailableThemesUseCase(gh<_i869.ThemeRepository>()),
    );
    gh.factory<_i1.GetSelectedThemeUseCase>(
      () => _i1.GetSelectedThemeUseCase(gh<_i869.ThemeRepository>()),
    );
    gh.factory<_i620.GetThemeUseCase>(
      () => _i620.GetThemeUseCase(gh<_i869.ThemeRepository>()),
    );
    gh.factory<_i831.SetSelectedThemeUseCase>(
      () => _i831.SetSelectedThemeUseCase(gh<_i869.ThemeRepository>()),
    );
    gh.factory<_i684.SetThemeUseCase>(
      () => _i684.SetThemeUseCase(gh<_i869.ThemeRepository>()),
    );
    gh.factory<_i5.ThemeCubit>(
      () => _i5.ThemeCubit(
        gh<_i620.GetThemeUseCase>(),
        gh<_i684.SetThemeUseCase>(),
        gh<_i426.GetAvailableThemesUseCase>(),
        gh<_i1.GetSelectedThemeUseCase>(),
        gh<_i831.SetSelectedThemeUseCase>(),
      ),
    );
    return this;
  }
}

class _$StorageModule extends _i371.StorageModule {}

class _$SecurityModule extends _i870.SecurityModule {}

class _$NetworkModule extends _i567.NetworkModule {}
