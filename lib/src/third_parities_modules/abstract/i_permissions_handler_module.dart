abstract class IPermissionsHandlerModule {
  Future<bool> hasGrantLocationPermission({required final bool gracefully});
  Future<void> openAppSettings();
}
