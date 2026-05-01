import 'package:card_scan_app/core/routes/route_paths.dart';
import 'package:card_scan_app/feature/presentation/screens/main_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  Routes._();
  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(path: RoutePaths.main, builder: (context, state) => MainScreen()),
      // GoRoute(
      //   path: RoutePaths.scan,
      //   builder: (context, state) => ScannerScreen(),
      // ),
      // GoRoute(
      //   path: RoutePaths.scanMl,
      //   builder: (context, state) => MlScanScreen(),
      // ),
    ],
  );
}
