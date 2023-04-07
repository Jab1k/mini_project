import 'package:dartz/dartz.dart';
import 'package:setup_provider/domain/model/restaurant_model.dart';


abstract class HomeFacade {
  Future<Either<RestaurantModel, String>> getRestaurants();
}
