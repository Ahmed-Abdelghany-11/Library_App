import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import '../contract/auth_local_data_source.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String userIdKey = 'USER_ID';
  final FlutterSecureStorage _secureStorage;

  AuthLocalDataSourceImpl(this._secureStorage);
  @override
  Future<void> saveUserId(String userId) async {
    await _secureStorage.write(key: userIdKey, value: userId);
  }

  @override
  Future<String?> getUserId() async {
    return await _secureStorage.read(key: userIdKey);
  }

  @override
  Future<void> clearUserId() async {
    await _secureStorage.delete(key: userIdKey);
  }
}
