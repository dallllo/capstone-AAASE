// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_map/core/services/local_keys_service.dart' as _i374;
import 'package:google_map/features/chat_bot/data/datasources/chat_bot_remote_data_source.dart'
    as _i746;
import 'package:google_map/features/chat_bot/data/repositories/chat_bot_repository_data.dart'
    as _i517;
import 'package:google_map/features/chat_bot/domain/repositories/chat_bot_repository_domain.dart'
    as _i626;
import 'package:google_map/features/chat_bot/domain/use_cases/chat_bot_use_case.dart'
    as _i505;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initChatBot({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
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
    gh.lazySingleton<_i505.ChatBotUseCase>(
      () => _i505.ChatBotUseCase(gh<_i626.ChatBotRepositoryDomain>()),
    );
    return this;
  }
}
