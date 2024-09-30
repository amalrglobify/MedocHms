

import 'package:auto_route/auto_route.dart';
import 'package:medochms/screens/Reports/lab_bill_report.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      page: SplashRoute.page,
      initial: true,
    ),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: DepartmentsListingRoute.page),
    AutoRoute(page: DashboardRoute.page),
    AutoRoute(page: RegistrationListRoute.page),
    AutoRoute(page: LabBillReportRoute.page),
    AutoRoute(page: RevisitListingRoute.page),
    AutoRoute(page: NewIpListingRoute.page),
    AutoRoute(page: TotalAdmitListingRoute.page),
    AutoRoute(page: ProcedureBillReportRoute.page),
    AutoRoute(page: RegistrationReportRoute.page),
    AutoRoute(page: RevisitReportRoute.page),
  ];
}