// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:get_storage/get_storage.dart' as _i792;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../../features/chat_bot/data/datasources/chat_bot_remote_data_source.dart'
    as _i277;
import '../../features/chat_bot/data/repositories/chat_bot_repository_data.dart'
    as _i923;
import '../../features/chat_bot/domain/repositories/chat_bot_repository_domain.dart'
    as _i347;
import '../../features/chat_bot/domain/use_cases/chat_bot_use_case.dart'
    as _i889;
import '../../features/home/data/datasources/home_remote_data_source.dart'
    as _i362;
import '../../features/home/data/repositories/home_repository_data.dart'
    as _i145;
import '../../features/home/domain/repositories/home_repository_domain.dart'
    as _i257;
import '../../features/home/domain/use_cases/home_use_case.dart' as _i933;
import '../../features/home/sub/add_car/data/datasources/add_car_remote_data_source.dart'
    as _i474;
import '../../features/home/sub/add_car/data/repositories/add_car_repository_data.dart'
    as _i310;
import '../../features/home/sub/add_car/domain/repositories/add_car_repository_domain.dart'
    as _i880;
import '../../features/home/sub/add_car/domain/use_cases/add_car_use_case.dart'
    as _i468;
import '../../features/home/sub/expenses/data/datasources/expenses_remote_data_source.dart'
    as _i690;
import '../../features/home/sub/expenses/data/repositories/expenses_repository_data.dart'
    as _i917;
import '../../features/home/sub/expenses/domain/repositories/expenses_repository_domain.dart'
    as _i633;
import '../../features/home/sub/expenses/domain/use_cases/expenses_use_case.dart'
    as _i951;
import '../../features/scan/data/datasources/scan_remote_data_source.dart'
    as _i814;
import '../../features/scan/data/repositories/scan_repository_data.dart'
    as _i1030;
import '../../features/scan/domain/repositories/scan_repository_domain.dart'
    as _i890;
import '../../features/scan/domain/use_cases/scan_use_case.dart' as _i399;
import '../network/dio_client.dart' as _i667;
import '../services/local_keys_service.dart' as _i945;
import 'third_part.dart' as _i423;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final thirdPartyConfig = _$ThirdPartyConfig();
    gh.lazySingleton<_i792.GetStorage>(() => thirdPartyConfig.storage);
    gh.lazySingleton<_i454.SupabaseClient>(
      () => thirdPartyConfig.supabaseClient,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => thirdPartyConfig.flutterSecureStorage,
    );
    gh.lazySingleton<_i667.DioClient>(() => _i667.DioClient());
    gh.lazySingleton<_i474.VehicleLocalDataSource>(
      () => _i474.VehicleLocalDataSourceImpl(gh<_i979.Box<dynamic>>()),
    );
    gh.lazySingleton<_i362.BaseHomeRemoteDataSource>(
      () => _i362.HomeRemoteDataSource(
        gh<_i945.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i814.BaseScanRemoteDataSource>(
      () => _i814.ScanRemoteDataSource(
        gh<_i945.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i257.HomeRepositoryDomain>(
      () => _i145.HomeRepositoryData(gh<_i362.BaseHomeRemoteDataSource>()),
    );
    gh.lazySingleton<_i474.BaseAddCarRemoteDataSource>(
      () => _i474.AddCarRemoteDataSource(
        gh<_i945.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i468.AddCarUseCase0>(
      () => _i468.AddCarUseCase0(gh<_i880.VehicleLocalDataSource>()),
    );
    gh.lazySingleton<_i890.ScanRepositoryDomain>(
      () => _i1030.ScanRepositoryData(gh<_i814.BaseScanRemoteDataSource>()),
    );
    gh.lazySingleton<_i690.BaseExpensesRemoteDataSource>(
      () => _i690.ExpensesRemoteDataSource(
        gh<_i945.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i277.BaseChatBotRemoteDataSource>(
      () => _i277.ChatBotRemoteDataSource(
        gh<_i945.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i347.ChatBotRepositoryDomain>(
      () =>
          _i923.ChatBotRepositoryData(gh<_i277.BaseChatBotRemoteDataSource>()),
    );
    gh.lazySingleton<_i933.HomeUseCase>(
      () => _i933.HomeUseCase(gh<_i257.HomeRepositoryDomain>()),
    );
    gh.lazySingleton<_i880.AddCarRepositoryDomain>(
      () => _i310.AddCarRepositoryData(gh<_i474.BaseAddCarRemoteDataSource>()),
    );
    gh.lazySingleton<_i889.ChatBotUseCase>(
      () => _i889.ChatBotUseCase(gh<_i347.ChatBotRepositoryDomain>()),
    );
    gh.lazySingleton<_i468.AddCarUseCase>(
      () => _i468.AddCarUseCase(gh<_i880.AddCarRepositoryDomain>()),
    );
    gh.lazySingleton<_i633.ExpensesRepositoryDomain>(
      () => _i917.ExpensesRepositoryData(
        gh<_i690.BaseExpensesRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i399.ScanUseCase>(
      () => _i399.ScanUseCase(gh<_i890.ScanRepositoryDomain>()),
    );
    gh.lazySingleton<_i951.ExpensesUseCase>(
      () => _i951.ExpensesUseCase(gh<_i633.ExpensesRepositoryDomain>()),
    );
    gh.singleton<_i945.LocalKeysService>(() => _i945.LocalKeysService());
    return this;
  }
}

class _$ThirdPartyConfig extends _i423.ThirdPartyConfig {}
