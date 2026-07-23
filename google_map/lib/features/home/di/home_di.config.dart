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
import 'package:google_map/core/di/third_part.dart' as _i823;
import 'package:google_map/core/network/dio_client.dart' as _i168;
import 'package:google_map/core/services/local_keys_service.dart' as _i374;
import 'package:google_map/features/chat_bot/data/datasources/chat_bot_remote_data_source.dart'
    as _i746;
import 'package:google_map/features/chat_bot/data/repositories/chat_bot_repository_data.dart'
    as _i517;
import 'package:google_map/features/chat_bot/domain/repositories/chat_bot_repository_domain.dart'
    as _i626;
import 'package:google_map/features/chat_bot/domain/use_cases/chat_bot_use_case.dart'
    as _i505;
import 'package:google_map/features/home/data/datasources/home_remote_data_source.dart'
    as _i311;
import 'package:google_map/features/home/data/repositories/home_repository_data.dart'
    as _i853;
import 'package:google_map/features/home/domain/repositories/home_repository_domain.dart'
    as _i395;
import 'package:google_map/features/home/domain/use_cases/home_use_case.dart'
    as _i298;
import 'package:google_map/features/home/sub/add_car/data/datasources/add_car_remote_data_source.dart'
    as _i976;
import 'package:google_map/features/home/sub/add_car/data/repositories/add_car_repository_data.dart'
    as _i1017;
import 'package:google_map/features/home/sub/add_car/domain/repositories/add_car_repository_domain.dart'
    as _i66;
import 'package:google_map/features/home/sub/add_car/domain/use_cases/add_car_use_case.dart'
    as _i263;
import 'package:google_map/features/home/sub/expenses/data/datasources/expenses_remote_data_source.dart'
    as _i909;
import 'package:google_map/features/home/sub/expenses/data/repositories/expenses_repository_data.dart'
    as _i689;
import 'package:google_map/features/home/sub/expenses/domain/repositories/expenses_repository_domain.dart'
    as _i994;
import 'package:google_map/features/home/sub/expenses/domain/use_cases/expenses_use_case.dart'
    as _i939;
import 'package:google_map/features/scan/data/datasources/scan_remote_data_source.dart'
    as _i1030;
import 'package:google_map/features/scan/data/repositories/scan_repository_data.dart'
    as _i112;
import 'package:google_map/features/scan/domain/repositories/scan_repository_domain.dart'
    as _i425;
import 'package:google_map/features/scan/domain/use_cases/scan_use_case.dart'
    as _i843;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initHome({
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
    gh.lazySingleton<_i168.DioClient>(() => _i168.DioClient());
    gh.lazySingleton<_i976.VehicleLocalDataSource>(
      () => _i976.VehicleLocalDataSourceImpl(gh<_i979.Box<dynamic>>()),
    );
    gh.lazySingleton<_i311.BaseHomeRemoteDataSource>(
      () => _i311.HomeRemoteDataSource(
        gh<_i374.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i1030.BaseScanRemoteDataSource>(
      () => _i1030.ScanRemoteDataSource(
        gh<_i374.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i395.HomeRepositoryDomain>(
      () => _i853.HomeRepositoryData(gh<_i311.BaseHomeRemoteDataSource>()),
    );
    gh.lazySingleton<_i976.BaseAddCarRemoteDataSource>(
      () => _i976.AddCarRemoteDataSource(
        gh<_i374.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i263.AddCarUseCase0>(
      () => _i263.AddCarUseCase0(gh<_i66.VehicleLocalDataSource>()),
    );
    gh.lazySingleton<_i425.ScanRepositoryDomain>(
      () => _i112.ScanRepositoryData(gh<_i1030.BaseScanRemoteDataSource>()),
    );
    gh.lazySingleton<_i909.BaseExpensesRemoteDataSource>(
      () => _i909.ExpensesRemoteDataSource(
        gh<_i374.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i746.BaseChatBotRemoteDataSource>(
      () => _i746.ChatBotRemoteDataSource(
        gh<_i374.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i626.ChatBotRepositoryDomain>(
      () =>
          _i517.ChatBotRepositoryData(gh<_i746.BaseChatBotRemoteDataSource>()),
    );
    gh.lazySingleton<_i298.HomeUseCase>(
      () => _i298.HomeUseCase(gh<_i395.HomeRepositoryDomain>()),
    );
    gh.lazySingleton<_i66.AddCarRepositoryDomain>(
      () => _i1017.AddCarRepositoryData(gh<_i976.BaseAddCarRemoteDataSource>()),
    );
    gh.lazySingleton<_i505.ChatBotUseCase>(
      () => _i505.ChatBotUseCase(gh<_i626.ChatBotRepositoryDomain>()),
    );
    gh.lazySingleton<_i263.AddCarUseCase>(
      () => _i263.AddCarUseCase(gh<_i66.AddCarRepositoryDomain>()),
    );
    gh.lazySingleton<_i994.ExpensesRepositoryDomain>(
      () => _i689.ExpensesRepositoryData(
        gh<_i909.BaseExpensesRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i843.ScanUseCase>(
      () => _i843.ScanUseCase(gh<_i425.ScanRepositoryDomain>()),
    );
    gh.lazySingleton<_i939.ExpensesUseCase>(
      () => _i939.ExpensesUseCase(gh<_i994.ExpensesRepositoryDomain>()),
    );
    gh.singleton<_i374.LocalKeysService>(() => _i374.LocalKeysService());
    return this;
  }
}

class _$ThirdPartyConfig extends _i823.ThirdPartyConfig {}
