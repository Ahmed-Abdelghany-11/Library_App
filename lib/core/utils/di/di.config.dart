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
import '../../../features/auth/domain/usecase/signin_use_case.dart' as _i612;
import '../../../features/auth/domain/usecase/signout_use_case.dart' as _i716;
import '../../../features/auth/domain/usecase/signup_use_case.dart' as _i955;
import '../../../features/auth/presentation/view_model/signin/signin_cubit.dart'
    as _i703;
import '../../../features/auth/presentation/view_model/signup/signup_cubit.dart'
    as _i122;
import '../../../features/book_details/data/data_source/contract/book_details_remote_data_source.dart'
    as _i830;
import '../../../features/book_details/data/data_source/remote/book_details_remote_data_source_impl.dart'
    as _i284;
import '../../../features/book_details/data/repo_impl/book_details_repo_impl.dart'
    as _i1072;
import '../../../features/book_details/domain/repo/book_details_repo.dart'
    as _i148;
import '../../../features/book_details/domain/usecase/add_book_review_use_case.dart'
    as _i263;
import '../../../features/book_details/domain/usecase/add_book_to_reading_list_use_case.dart'
    as _i980;
import '../../../features/book_details/domain/usecase/get_book_reviews_use_case.dart'
    as _i92;
import '../../../features/book_details/domain/usecase/get_use_data_use_case.dart'
    as _i485;
import '../../../features/book_details/presentation/view_model/book_details_cubit.dart'
    as _i977;
import '../../../features/home/data/data_source/contract/home_remote_data_source.dart'
    as _i1043;
import '../../../features/home/data/data_source/remote/home_remote_data_source_impl.dart'
    as _i859;
import '../../../features/home/data/repo_impl/home_repo_impl.dart' as _i801;
import '../../../features/home/domain/repo/home_repo.dart' as _i242;
import '../../../features/home/domain/usecase/get_all_books_use_case.dart'
    as _i413;
import '../../../features/home/domain/usecase/get_book_by_id_use_case.dart'
    as _i443;
import '../../../features/home/domain/usecase/get_books_by_category_use_case.dart'
    as _i247;
import '../../../features/home/domain/usecase/get_books_by_rating_use_case.dart'
    as _i304;
import '../../../features/home/domain/usecase/get_some_books_use_case.dart'
    as _i71;
import '../../../features/home/presentation/view_model/all_books/all_books_cubit.dart'
    as _i904;
import '../../../features/home/presentation/view_model/home/home_cubit.dart'
    as _i598;
import '../../../features/library/data/data_source/contract/library_remote_data_source.dart'
    as _i46;
import '../../../features/library/data/data_source/remote/library_remote_data_source_impl.dart'
    as _i993;
import '../../../features/library/data/repo_impl/library_repo_impl.dart'
    as _i1045;
import '../../../features/library/domain/repo/library_repo.dart' as _i101;
import '../../../features/library/domain/usecase/add_reading_list_use_case.dart'
    as _i949;
import '../../../features/library/domain/usecase/delete_reading_list_use_case.dart'
    as _i1066;
import '../../../features/library/domain/usecase/get_books_in_reading_list_use_case.dart'
    as _i263;
import '../../../features/library/domain/usecase/get_reading_list_by_name_use_case.dart'
    as _i809;
import '../../../features/library/domain/usecase/get_reading_lists_use_case.dart'
    as _i760;
import '../../../features/library/domain/usecase/remove_book_from_reading_list_use_case.dart'
    as _i889;
import '../../../features/library/presentaion/view_model/library/library_cubit.dart'
    as _i258;
import '../../../features/library/presentaion/view_model/library_books/library_books_cubit.dart'
    as _i635;
import '../../../features/main_layout/presentation/view_model/main_layout_cubit.dart'
    as _i233;
import '../../../features/search/data/data_source/contract/search_remote_data_source.dart'
    as _i424;
import '../../../features/search/data/data_source/remote/search_remote_data_source_impl.dart'
    as _i88;
import '../../../features/search/data/repo_impl/search_repo_impl.dart'
    as _i1058;
import '../../../features/search/domain/repo/search_repo.dart' as _i884;
import '../../../features/search/domain/usecase/search_use_case.dart' as _i605;
import '../../../features/search/presentation/view_model/search_cubit.dart'
    as _i541;
import '../bloc_observer/bloc_observer_service.dart' as _i649;
import '../flutter_secure_storage_module.dart' as _i712;
import '../logging/logger_module.dart' as _i470;
import '../networking/api_manager.dart' as _i943;
import '../networking/dio_module.dart' as _i444;
import '../validators/validator.dart' as _i437;
import 'modules/firebase_module.dart' as _i398;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    final secureStorageModule = _$SecureStorageModule();
    final loggerModule = _$LoggerModule();
    final dioModule = _$DioModule();
    gh.factory<_i233.MainLayoutCubit>(() => _i233.MainLayoutCubit());
    gh.singleton<_i943.ApiManager>(() => _i943.ApiManager());
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.auth);
    gh.lazySingleton<_i974.FirebaseFirestore>(() => firebaseModule.firestore);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => secureStorageModule.storage,
    );
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.lazySingleton<_i437.Validator>(() => _i437.Validator());
    gh.singleton<_i649.BlocObserverService>(
      () => _i649.BlocObserverService(gh<_i974.Logger>()),
    );
    gh.factory<_i46.LibraryRemoteDataSource>(
      () => _i993.LibraryRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i1015.AuthLocalDataSource>(
      () => _i241.AuthLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i830.BookDetailsRemoteDataSource>(
      () =>
          _i284.BookDetailsRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i1043.HomeRemoteDataSource>(
      () => _i859.HomeRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i101.LibraryRepo>(
      () => _i1045.LibraryRepoImpl(
        gh<_i943.ApiManager>(),
        gh<_i46.LibraryRemoteDataSource>(),
        gh<_i1015.AuthLocalDataSource>(),
      ),
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
    gh.factory<_i424.SearchRemoteDataSource>(
      () => _i88.SearchRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i913.AuthRepo>(
      () => _i822.AuthRepoImpl(
        gh<_i305.AuthRemoteDataSource>(),
        gh<_i943.ApiManager>(),
        gh<_i1015.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i242.HomeRepo>(
      () => _i801.HomeRepoImpl(
        gh<_i1043.HomeRemoteDataSource>(),
        gh<_i943.ApiManager>(),
      ),
    );
    gh.factory<_i949.AddReadingListUseCase>(
      () => _i949.AddReadingListUseCase(gh<_i101.LibraryRepo>()),
    );
    gh.factory<_i1066.DeleteReadingListUseCase>(
      () => _i1066.DeleteReadingListUseCase(gh<_i101.LibraryRepo>()),
    );
    gh.factory<_i263.GetBooksInReadingListUseCase>(
      () => _i263.GetBooksInReadingListUseCase(gh<_i101.LibraryRepo>()),
    );
    gh.factory<_i760.GetReadingListsUseCase>(
      () => _i760.GetReadingListsUseCase(gh<_i101.LibraryRepo>()),
    );
    gh.factory<_i809.GetReadingListByNameUseCase>(
      () => _i809.GetReadingListByNameUseCase(gh<_i101.LibraryRepo>()),
    );
    gh.factory<_i889.RemoveBookFromReadingListUseCase>(
      () => _i889.RemoveBookFromReadingListUseCase(gh<_i101.LibraryRepo>()),
    );
    gh.factory<_i635.LibraryBooksCubit>(
      () => _i635.LibraryBooksCubit(
        gh<_i263.GetBooksInReadingListUseCase>(),
        gh<_i889.RemoveBookFromReadingListUseCase>(),
      ),
    );
    gh.factory<_i148.BookDetailsRepo>(
      () => _i1072.BookDetailsRepoImpl(
        gh<_i830.BookDetailsRemoteDataSource>(),
        gh<_i943.ApiManager>(),
        gh<_i1015.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i884.SearchRepo>(
      () => _i1058.SearchRepoImpl(
        gh<_i424.SearchRemoteDataSource>(),
        gh<_i943.ApiManager>(),
      ),
    );
    gh.factory<_i258.LibraryCubit>(
      () => _i258.LibraryCubit(
        gh<_i760.GetReadingListsUseCase>(),
        gh<_i949.AddReadingListUseCase>(),
        gh<_i1066.DeleteReadingListUseCase>(),
        gh<_i809.GetReadingListByNameUseCase>(),
      ),
    );
    gh.factory<_i605.SearchUseCase>(
      () => _i605.SearchUseCase(gh<_i884.SearchRepo>()),
    );
    gh.factory<_i330.GetUserStateUseCase>(
      () => _i330.GetUserStateUseCase(gh<_i913.AuthRepo>()),
    );
    gh.factory<_i612.SigninUseCase>(
      () => _i612.SigninUseCase(gh<_i913.AuthRepo>()),
    );
    gh.factory<_i716.SignoutUseCase>(
      () => _i716.SignoutUseCase(gh<_i913.AuthRepo>()),
    );
    gh.factory<_i955.SignupUseCase>(
      () => _i955.SignupUseCase(gh<_i913.AuthRepo>()),
    );
    gh.factory<_i122.SignupCubit>(
      () => _i122.SignupCubit(gh<_i955.SignupUseCase>(), gh<_i437.Validator>()),
    );
    gh.factory<_i541.SearchCubit>(
      () => _i541.SearchCubit(gh<_i605.SearchUseCase>()),
    );
    gh.factory<_i413.GetAllBooksUseCase>(
      () => _i413.GetAllBooksUseCase(gh<_i242.HomeRepo>()),
    );
    gh.factory<_i443.GetBookByIdUseCase>(
      () => _i443.GetBookByIdUseCase(gh<_i242.HomeRepo>()),
    );
    gh.factory<_i247.GetBooksByCategoryUseCase>(
      () => _i247.GetBooksByCategoryUseCase(gh<_i242.HomeRepo>()),
    );
    gh.factory<_i304.GetBooksByRatingUseCase>(
      () => _i304.GetBooksByRatingUseCase(gh<_i242.HomeRepo>()),
    );
    gh.factory<_i71.GetSomeBooksUseCase>(
      () => _i71.GetSomeBooksUseCase(gh<_i242.HomeRepo>()),
    );
    gh.factory<_i703.SigninCubit>(
      () => _i703.SigninCubit(gh<_i612.SigninUseCase>(), gh<_i437.Validator>()),
    );
    gh.factory<_i263.AddBookReviewUseCase>(
      () => _i263.AddBookReviewUseCase(gh<_i148.BookDetailsRepo>()),
    );
    gh.factory<_i92.GetBookReviewsUseCase>(
      () => _i92.GetBookReviewsUseCase(gh<_i148.BookDetailsRepo>()),
    );
    gh.factory<_i485.GetUseDataUseCase>(
      () => _i485.GetUseDataUseCase(gh<_i148.BookDetailsRepo>()),
    );
    gh.factory<_i980.AddBookToReadingListUseCase>(
      () => _i980.AddBookToReadingListUseCase(gh<_i148.BookDetailsRepo>()),
    );
    gh.factory<_i904.AllBooksCubit>(
      () => _i904.AllBooksCubit(
        gh<_i413.GetAllBooksUseCase>(),
        gh<_i247.GetBooksByCategoryUseCase>(),
        gh<_i304.GetBooksByRatingUseCase>(),
      ),
    );
    gh.factory<_i977.BookDetailsCubit>(
      () => _i977.BookDetailsCubit(
        gh<_i263.AddBookReviewUseCase>(),
        gh<_i92.GetBookReviewsUseCase>(),
        gh<_i485.GetUseDataUseCase>(),
        gh<_i760.GetReadingListsUseCase>(),
        gh<_i980.AddBookToReadingListUseCase>(),
      ),
    );
    gh.factory<_i598.HomeCubit>(
      () => _i598.HomeCubit(
        gh<_i71.GetSomeBooksUseCase>(),
        gh<_i760.GetReadingListsUseCase>(),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i398.FirebaseModule {}

class _$SecureStorageModule extends _i712.SecureStorageModule {}

class _$LoggerModule extends _i470.LoggerModule {}

class _$DioModule extends _i444.DioModule {}
