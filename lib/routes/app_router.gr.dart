// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:medochms/screens/dashboard.dart' as _i1;
import 'package:medochms/screens/departments/departments_listing_screen.dart'
    as _i2;
import 'package:medochms/screens/Login/sign_in_screen.dart' as _i10;
import 'package:medochms/screens/new_ip_listing_screen.dart' as _i4;
import 'package:medochms/screens/Registrations/registration_list_screen.dart'
    as _i6;
import 'package:medochms/screens/Reports/lab_bill_report.dart' as _i3;
import 'package:medochms/screens/Reports/procedure_bill_report.dart' as _i5;
import 'package:medochms/screens/Reports/registration_report.dart' as _i7;
import 'package:medochms/screens/Reports/revisit_report.dart' as _i9;
import 'package:medochms/screens/revisit_listing_screen.dart' as _i8;
import 'package:medochms/screens/splash_screen.dart' as _i11;
import 'package:medochms/screens/total_admit_listing_screen.dart' as _i12;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardScreen(),
      );
    },
    DepartmentsListingRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DepartmentsListingScreen(),
      );
    },
    LabBillReportRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LabBillReportScreen(),
      );
    },
    NewIpListingRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.NewIpListingScreen(),
      );
    },
    ProcedureBillReportRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProcedureBillReportScreen(),
      );
    },
    RegistrationListRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RegistrationListScreen(),
      );
    },
    RegistrationReportRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.RegistrationReportScreen(),
      );
    },
    RevisitListingRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.RevisitListingScreen(),
      );
    },
    RevisitReportRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.RevisitReportScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.SignInScreen(
          key: args.key,
          departmentValue: args.departmentValue,
          departmentId: args.departmentId,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SplashScreen(),
      );
    },
    TotalAdmitListingRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.TotalAdmitListingScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardScreen]
class DashboardRoute extends _i13.PageRouteInfo<void> {
  const DashboardRoute({List<_i13.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DepartmentsListingScreen]
class DepartmentsListingRoute extends _i13.PageRouteInfo<void> {
  const DepartmentsListingRoute({List<_i13.PageRouteInfo>? children})
      : super(
          DepartmentsListingRoute.name,
          initialChildren: children,
        );

  static const String name = 'DepartmentsListingRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LabBillReportScreen]
class LabBillReportRoute extends _i13.PageRouteInfo<void> {
  const LabBillReportRoute({List<_i13.PageRouteInfo>? children})
      : super(
          LabBillReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'LabBillReportRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.NewIpListingScreen]
class NewIpListingRoute extends _i13.PageRouteInfo<void> {
  const NewIpListingRoute({List<_i13.PageRouteInfo>? children})
      : super(
          NewIpListingRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewIpListingRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProcedureBillReportScreen]
class ProcedureBillReportRoute extends _i13.PageRouteInfo<void> {
  const ProcedureBillReportRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ProcedureBillReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProcedureBillReportRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RegistrationListScreen]
class RegistrationListRoute extends _i13.PageRouteInfo<void> {
  const RegistrationListRoute({List<_i13.PageRouteInfo>? children})
      : super(
          RegistrationListRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationListRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.RegistrationReportScreen]
class RegistrationReportRoute extends _i13.PageRouteInfo<void> {
  const RegistrationReportRoute({List<_i13.PageRouteInfo>? children})
      : super(
          RegistrationReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationReportRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.RevisitListingScreen]
class RevisitListingRoute extends _i13.PageRouteInfo<void> {
  const RevisitListingRoute({List<_i13.PageRouteInfo>? children})
      : super(
          RevisitListingRoute.name,
          initialChildren: children,
        );

  static const String name = 'RevisitListingRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i9.RevisitReportScreen]
class RevisitReportRoute extends _i13.PageRouteInfo<void> {
  const RevisitReportRoute({List<_i13.PageRouteInfo>? children})
      : super(
          RevisitReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'RevisitReportRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SignInScreen]
class SignInRoute extends _i13.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i14.Key? key,
    required String departmentValue,
    required String departmentId,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(
            key: key,
            departmentValue: departmentValue,
            departmentId: departmentId,
          ),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i13.PageInfo<SignInRouteArgs> page =
      _i13.PageInfo<SignInRouteArgs>(name);
}

class SignInRouteArgs {
  const SignInRouteArgs({
    this.key,
    required this.departmentValue,
    required this.departmentId,
  });

  final _i14.Key? key;

  final String departmentValue;

  final String departmentId;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key, departmentValue: $departmentValue, departmentId: $departmentId}';
  }
}

/// generated route for
/// [_i11.SplashScreen]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.TotalAdmitListingScreen]
class TotalAdmitListingRoute extends _i13.PageRouteInfo<void> {
  const TotalAdmitListingRoute({List<_i13.PageRouteInfo>? children})
      : super(
          TotalAdmitListingRoute.name,
          initialChildren: children,
        );

  static const String name = 'TotalAdmitListingRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
