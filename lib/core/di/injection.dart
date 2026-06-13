import 'package:get_it/get_it.dart';
import 'package:we_care/core/network/dio_client.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  //
  getIt.registerSingleton<DioClient>(DioClient());
  //
}
