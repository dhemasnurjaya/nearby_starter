import 'package:fpdart/fpdart.dart';
import 'package:nearby_starter/core/domain/no_params.dart';
import 'package:nearby_starter/core/domain/use_case.dart';
import 'package:nearby_starter/core/error/failures.dart';
import 'package:nearby_starter/core/permissions_util.dart';

class RequestPermissions extends UseCase<void, NoParams> {
  RequestPermissions({required this.permissionUtil});

  final PermissionUtil permissionUtil;

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return permissionUtil.requestPermissions();
  }
}
