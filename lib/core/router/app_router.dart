import 'package:auto_route/auto_route.dart';
import 'package:web_funnel/ui/builder_page/builder_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: BuilderRoute.page, initial: true),
      ];
}
