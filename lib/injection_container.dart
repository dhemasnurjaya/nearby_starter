import 'package:get_it/get_it.dart';
import 'package:nearby_starter/core/data/local/cache.dart';
import 'package:nearby_starter/core/id_generator.dart';
import 'package:nearby_starter/core/nearby/nearby.dart';
import 'package:nearby_starter/core/permissions_util.dart';
import 'package:nearby_starter/core/time.dart';
import 'package:nearby_starter/data/local/models/user_model.dart';
import 'package:nearby_starter/data/remote/data_sources/nearby_connection_remote_data_source.dart';
import 'package:nearby_starter/data/remote/models/nearby_connection_message_model.dart';
import 'package:nearby_starter/data/remote/models/nearby_connection_model.dart';
import 'package:nearby_starter/data/remote/models/nearby_connection_status_model.dart';
import 'package:nearby_starter/data/repositories/connection_repository_impl.dart';
import 'package:nearby_starter/domain/repositories/connection_repository.dart';
import 'package:nearby_starter/domain/usecases/get_devices.dart';
import 'package:nearby_starter/domain/usecases/request_connection.dart';
import 'package:nearby_starter/domain/usecases/request_permissions.dart';
import 'package:nearby_starter/domain/usecases/start_advertising.dart';
import 'package:nearby_starter/domain/usecases/start_discovering.dart';
import 'package:nearby_starter/domain/usecases/stop_advertising.dart';
import 'package:nearby_starter/domain/usecases/stop_discovering.dart';
import 'package:nearby_starter/presentation/bloc/nearby_service/connection/connection_bloc.dart';
import 'package:nearby_starter/presentation/bloc/nearby_service/connection_message/connection_message_bloc.dart';
import 'package:nearby_starter/presentation/bloc/nearby_service/peer_sync/peer_sync_bloc.dart';
import 'package:nearby_starter/presentation/bloc/permissions/permissions_bloc.dart';

final _ic = GetIt.I;

Future<void> setup() async {
  // cores
  _ic.registerLazySingleton<Nearby>(() => NearbyImpl());
  _ic.registerLazySingleton<Time>(() => TimeImpl());
  _ic.registerLazySingleton<IdGenerator>(() => IdGeneratorImpl());
  _ic.registerLazySingleton<PermissionUtil>(() => PermissionUtilImpl());

  // caches
  _ic.registerLazySingleton<Cache<String, UserModel>>(
    () => MemoryCache<String, UserModel>(),
  );
  _ic.registerLazySingleton<Cache<String, NearbyConnectionModel>>(
    () => MemoryCache<String, NearbyConnectionModel>(),
  );
  _ic.registerLazySingleton<Cache<String, NearbyConnectionMessageModel>>(
    () => MemoryCache<String, NearbyConnectionMessageModel>(),
  );
  _ic.registerLazySingleton<Cache<String, NearbyConnectionStatusModel>>(
    () => MemoryCache<String, NearbyConnectionStatusModel>(),
  );

  // data sources
  _ic.registerLazySingleton<NearbyConnectionRemoteDataSource>(
    () => NearbyConnectionRemoteDataSourceImpl(
      nearby: _ic(),
      time: _ic(),
      idGenerator: _ic(),
      statusCache: _ic(),
      deviceCache: _ic(),
      messageCache: _ic(),
    ),
  );

  // repositories
  _ic.registerLazySingleton<ConnectionRepository>(
    () => ConnectionRepositoryImpl(connectionRemoteDataSource: _ic()),
  );

  // use cases
  _ic.registerLazySingleton<RequestPermissions>(
    () => RequestPermissions(permissionUtil: _ic()),
  );
  _ic.registerLazySingleton<StartAdvertising>(
    () => StartAdvertising(connectionRepository: _ic()),
  );
  _ic.registerLazySingleton<StopAdvertising>(
    () => StopAdvertising(connectionRepository: _ic()),
  );
  _ic.registerLazySingleton<StartDiscovering>(
    () => StartDiscovering(connectionRepository: _ic()),
  );
  _ic.registerLazySingleton<StopDiscovering>(
    () => StopDiscovering(connectionRepository: _ic()),
  );
  _ic.registerLazySingleton<GetDevices>(
    () => GetDevices(connectionRepository: _ic()),
  );
  _ic.registerLazySingleton<RequestConnection>(
    () => RequestConnection(connectionRepository: _ic()),
  );

  // blocs
  _ic.registerLazySingleton<PermissionsBloc>(
    () => PermissionsBloc(requestPermissions: _ic()),
  );
  _ic.registerFactory<ConnectionBloc>(
    () => ConnectionBloc(getDevices: _ic(), requestConnection: _ic()),
  );
  _ic.registerFactory<ConnectionMessageBloc>(
    () => ConnectionMessageBloc(processMessages: _ic()),
  );
  _ic.registerFactory<PeerSyncBloc>(() => PeerSyncBloc(syncWithPeers: _ic()));
}
