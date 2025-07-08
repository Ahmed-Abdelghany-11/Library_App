// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

import '../../../features/auth/data/data_source/contract/auth_local_data_source.dart'
    as _i1015;
import '../../../features/auth/data/data_source/contract/auth_remote_data_source.dart'
    as _i305;
import '../../../features/auth/data/data_source/local/auth_local_data_source_impl.dart'
    as _i241;
import '../../../features/auth/data/data_source/remote/auth_remote_data_source_impl.dart'
    as _i212;
import '../../../features/auth/data/repo_impl/auth_repo_impl.dart' as _i822;
import '../../../features/auth/domain/repo/auth_repo.dart' as _i913;
import '../../../features/auth/domain/usecase/get_user_state_use_case.dart'
    as _i330;
import '../../../features/auth/domain/usecase/signup_use_case.dart' as _i955;
import '../../../features/auth/presentation/view_model/signup/signup_cubit.dart'
    as _i122;
import '../bloc_observer/bloc_observer_service.dart' as _i649;
import '../flutter_secure_storage_module.dart' as _i712;
import '../logging/logger_module.dart' as _i470;
import '../networking/api_manager.dart' as _i943;
import '../networking/dio_module.dart' as _i444;
import '../validators/validator.dart' as _i437;
import 'modules/firebase_firestore_module.dart' as _i466;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final secureStorageModule = _$SecureStorageModule();
    final loggerModule = _$LoggerModule();
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    final dioModule = _$DioModule();
    gh.singleton<_i943.ApiManager>(() => _i943.ApiManager());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => secureStorageModule.storage,
    );
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.lazySingleton<_i437.Validator>(() => _i437.Validator());
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseInjectableModule.auth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore,
    );
    gh.singleton<_i649.BlocObserverService>(
      () => _i649.BlocObserverService(gh<_i974.Logger>()),
    );
    gh.factory<_i1015.AuthLocalDataSource>(
      () => _i241.AuthLocalDataSourceImpl(),
    );
    gh.factory<_i305.AuthRemoteDataSource>(
      () => _i212.AuthRemoteDataSourceImpl(
        gh<_i59.FirebaseAuth>(),
        gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.provideDio(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i913.AuthRepo>(
      () => _i822.AuthRepoImpl(
        gh<_i305.AuthRemoteDataSource>(),
        gh<_i943.ApiManager>(),
      ),
    );
    gh.factory<_i330.GetUserStateUseCase>(
      () => _i330.GetUserStateUseCase(gh<_i913.AuthRepo>()),
    );
    gh.factory<_i955.SignupUseCase>(
      () => _i955.SignupUseCase(gh<_i913.AuthRepo>()),
    );
    gh.factory<_i122.SignupCubit>(
      () => _i122.SignupCubit(gh<_i955.SignupUseCase>(), gh<_i437.Validator>()),
    );
    return this;
  }
}

class _$SecureStorageModule extends _i712.SecureStorageModule {}

class _$LoggerModule extends _i470.LoggerModule {}

class _$FirebaseInjectableModule extends _i466.FirebaseInjectableModule {}

class _$DioModule extends _i444.DioModule {}
