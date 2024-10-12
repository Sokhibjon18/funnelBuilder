import 'package:auto_route/auto_route.dart';
import 'package:web_funnel/features/funnel_builder_page/pages/funnel_builder_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: FunnelBuilderRoute.page, initial: true),
      ];
}
