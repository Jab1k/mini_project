import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:setup_provider/domain/facade/home_facade.dart';
import 'package:setup_provider/domain/model/restaurant_model.dart';
import 'package:setup_provider/infastructura/servises/dio.dart';

class HomeRepo implements HomeFacade {
  @override
  Future<Either<RestaurantModel, String>> getRestaurants() async {
    try {
      final res = await DioService.client().get(
          "/api/v1/rest/shops/paginate?perPage=15&page=1&type=restaurant&lang=en");
          

      return left(RestaurantModel.fromJson(res.data));
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 400) {
          return right("Something went wrong");
        } else {
          return right(
              e.response?.statusCode.toString() ?? "something is wrong");
        }
      } else {
        return right(e.toString());
      }
    }
  }
}
