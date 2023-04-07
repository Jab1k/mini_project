
import 'package:get_it/get_it.dart';
import 'package:setup_provider/domain/facade/auth_facade.dart';
import 'package:setup_provider/domain/facade/home_facade.dart';
import 'package:setup_provider/infastructura/repo/auth_repo.dart';
import 'package:setup_provider/infastructura/repo/restaurants_repo.dart';

final getIt = GetIt.instance;


setUp(){
  getIt.registerSingleton<AuthFacade>(AuthRepo());
  getIt.registerSingleton<HomeFacade>(HomeRepo());
}

final authRepo = getIt.get<AuthFacade>();
final homeRepo = getIt.get<HomeFacade>();