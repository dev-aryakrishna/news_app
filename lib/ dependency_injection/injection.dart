import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/services/local_storage_service.dart';

final sl = GetIt.instance;
Future<void> configureDependencies() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);
  sl.registerLazySingleton<LocalStorageService>(() => LocalStorageServiceImpl(sl<SharedPreferences>()));
}