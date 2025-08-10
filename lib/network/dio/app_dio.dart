import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/network/dio/auth_interceptor.dart';
import 'package:mobile_app_template/network/dio/connection_interceptor.dart';
import 'package:mobile_app_template/services/api/authentication.dart';
import 'package:path_provider/path_provider.dart';

class AppDio {
  static final AppDio _instance = AppDio._internal();

  AppDio._internal();

  factory AppDio() => _instance;

  Dio? _dio;

  /// Configures the dio instance
  Future<void> init() async{
    // prevent the re-initialization of the dio instance
    if(_dio != null){
      TLogger.info("Dio is already initialized");
      return;
    }
    //cach directory
    final cacheDir = await getTemporaryDirectory();
    final cacheOptions = CacheOptions(
      store: HiveCacheStore(cacheDir.path),
      policy: CachePolicy.request,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 7)
    );

    final newDio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        contentType: 'application/json', //requests are json on default
        responseType: ResponseType.json, //responses are json in default
      )
    );

    newDio.interceptors.addAll(
      [
        DioCacheInterceptor(options: cacheOptions),

        ConnectionInterceptor(),

        AuthInterceptor(
          getAccessToken: TAuthenticationService().getAccesstoken, 
          rotateToken: TAuthenticationService().rotateToken, 
          dio: newDio
        ),

        RetryInterceptor(
          dio: newDio,
          retries: 3,
          retryDelays: const [
            Duration(seconds: 1),
            Duration(seconds: 2),
            Duration(seconds: 3)
          ],
          logPrint: print
        )
      ],
    );

    _dio = newDio;
  }

  Dio get dio {
    if(_dio == null){
      throw Exception("Dio is not initialized, call init() first");
    }
    return _dio!;
  }
}