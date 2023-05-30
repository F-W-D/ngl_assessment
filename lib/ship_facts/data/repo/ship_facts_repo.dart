import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:ngl_assessment/ship_facts/data/model/ship_data.dart';
import 'package:ngl_assessment/ship_facts/data/model/ships_enum.dart';
import 'package:ngl_assessment/util/failure.dart';

abstract class IShipFactsRepo {
  Future<Either<Failure, ShipData>> fetchShipData({
    required ShipsEnum ship,
  });
}

class ShipFactsRepo implements IShipFactsRepo {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://ncl.com/cms-service/cruise-ships',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  Future<Either<Failure, ShipData>> fetchShipData({
    required ShipsEnum ship,
  }) async {
    try {
      final response = await _dio.get('/${ship.value}');
      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        // Map the response data
        final data = ShipData.fromJson(response.data as Map<String, dynamic>);
        return Right(data);
      } else {
        // Server exists but service error occurred
        final message =
            'Response Error:  ${response.statusCode} - ${response.statusMessage}';
        return Left(
          Failure(code: response.statusCode, message: message),
        );
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          // Server returned an error response (4xx or 5xx status code)
          final message =
              'Server error: ${e.response?.statusCode} - ${e.response?.statusMessage}';
          return Left(
            Failure(code: e.response?.statusCode, message: message),
          );
        } else {
          // No response received from the server
          final message = 'Connection error: ${e.message}';
          return Left(
            Failure(message: message),
          );
        }
      } else {
        // Other exceptions occurred
        final message = 'Error: $e';
        return Left(
          Failure(message: message),
        );
      }
    }
  }
}
