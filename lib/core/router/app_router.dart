import 'package:auto_route/auto_route.dart';
import 'package:currency_converter/presentation/screens/converter_screen.dart';
import 'package:currency_converter/presentation/screens/currency_list_screen.dart';
import 'package:currency_converter/presentation/screens/splash_screen.dart';
import 'package:injectable/injectable.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: ConverterRoute.page),
        AutoRoute(page: CurrencyListRoute.page),
      ];
}