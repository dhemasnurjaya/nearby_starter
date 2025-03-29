import 'package:device_info_plus/device_info_plus.dart';
import 'package:fpdart/fpdart.dart';
import 'package:location/location.dart';
import 'package:nearby_starter/core/error/failures.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class PermissionUtil {
  Future<Either<Failure, void>> requestPermissions();
}

class PermissionUtilImpl extends PermissionUtil {
  @override
  Future<Either<Failure, void>> requestPermissions() async {
    try {
      final bluetoothStatus = await _checkAndRequest(
        _isBluetoothPermissionsGranted(),
        _requestBluetoothPermissions,
      );

      final locationStatus = await _checkAndRequest(
        Permission.location.isGranted,
        _requestLocationPermission,
      );

      final locationServiceStatus = await _checkAndRequest(
        Permission.location.serviceStatus.isEnabled,
        _requestLocationService,
      );

      final nearbyWifiDevicesStatus = await _checkAndRequest(
        Permission.nearbyWifiDevices.isGranted,
        _requestNearbyWifiDevices,
      );

      final allGranted = [
        bluetoothStatus,
        locationStatus,
        locationServiceStatus,
        nearbyWifiDevicesStatus,
      ].every((granted) => granted);
      if (allGranted) {
        return right(null);
      } else {
        return left(PermissionFailure(message: 'Permissions denied'));
      }
    } on Exception catch (e) {
      return left(PermissionFailure(message: e.toString(), cause: e));
    }
  }

  Future<bool> _checkAndRequest(
    Future<bool> isGranted,
    Future<bool> Function() requestPermission,
  ) async {
    final granted = await isGranted;
    if (!granted) {
      return await requestPermission();
    }
    return true;
  }

  Future<bool> _isBluetoothPermissionsGranted() async {
    final isGranted = (await Future.wait([
      Permission.bluetooth.isGranted,
      Permission.bluetoothAdvertise.isGranted,
      Permission.bluetoothConnect.isGranted,
      Permission.bluetoothScan.isGranted,
    ])).every((granted) => granted);

    return isGranted;
  }

  Future<bool> _requestNearbyWifiDevices() async {
    final deviceInfo = await DeviceInfoPlugin().androidInfo;
    final isAndroid12 = deviceInfo.version.sdkInt >= 31;
    if (isAndroid12) {
      final result = await Permission.nearbyWifiDevices.request();
      return result.isGranted;
    } else {
      return true;
    }
  }

  Future<bool> _requestLocationPermission() async {
    final result = await Permission.location.request();
    return result.isGranted;
  }

  Future<bool> _requestLocationService() {
    return Location.instance.requestService();
  }

  Future<bool> _requestBluetoothPermissions() async {
    final requestResult =
        await [
          Permission.bluetooth,
          Permission.bluetoothAdvertise,
          Permission.bluetoothConnect,
          Permission.bluetoothScan,
        ].request();
    return requestResult.values.every((result) => result.isGranted);
  }
}
