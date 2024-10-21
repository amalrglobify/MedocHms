// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:medochms/screens/dashboard.dart' as _i2;
import 'package:medochms/screens/departments/departments_listing_screen.dart'
    as _i3;
import 'package:medochms/screens/Login/sign_in_screen.dart' as _i11;
import 'package:medochms/screens/new_ip_listing_screen.dart' as _i5;
import 'package:medochms/screens/Registrations/registration_list_screen.dart'
    as _i7;
import 'package:medochms/screens/Reports/collection_report.dart' as _i1;
import 'package:medochms/screens/Reports/lab_bill_report.dart' as _i4;
import 'package:medochms/screens/Reports/procedure_bill_report.dart' as _i6;
import 'package:medochms/screens/Reports/registration_report.dart' as _i8;
import 'package:medochms/screens/Reports/revisit_report.dart' as _i10;
import 'package:medochms/screens/revisit_listing_screen.dart' as _i9;
import 'package:medochms/screens/splash_screen.dart' as _i12;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    CollectionReportRoute.name: (routeData) {
      final args = routeData.argsAs<CollectionReportRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CollectionReportScreen(
          key: args.key,
          fromDate: args.fromDate,
          toDate: args.toDate,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardScreen(),
      );
    },
    DepartmentsListingRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DepartmentsListingScreen(),
      );
    },
    LabBillReportRoute.name: (routeData) {
      final args = routeData.argsAs<LabBillReportRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.LabBillReportScreen(
          key: args.key,
          fromDate: args.fromDate,
          toDate: args.toDate,
        ),
      );
    },
    NewIpListingRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.NewIpListingScreen(),
      );
    },
    ProcedureBillReportRoute.name: (routeData) {
      final args = routeData.argsAs<ProcedureBillReportRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ProcedureBillReportScreen(
          key: args.key,
          fromDate: args.fromDate,
          toDate: args.toDate,
        ),
      );
    },
    RegistrationListRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.RegistrationListScreen(),
      );
    },
    RegistrationReportRoute.name: (routeData) {
      final args = routeData.argsAs<RegistrationReportRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.RegistrationReportScreen(
          key: args.key,
          fromDate: args.fromDate,
          toDate: args.toDate,
        ),
      );
    },
    RevisitListingRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.RevisitListingScreen(),
      );
    },
    RevisitReportRoute.name: (routeData) {
      final args = routeData.argsAs<RevisitReportRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.RevisitReportScreen(
          key: args.key,
          fromDate: args.fromDate,
          toDate: args.toDate,
        ),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.SignInScreen(
          key: args.key,
          departmentValue: args.departmentValue,
          departmentId: args.departmentId,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CollectionReportScreen]
class CollectionReportRoute
    extends _i13.PageRouteInfo<CollectionReportRouteArgs> {
  CollectionReportRoute({
    _i14.Key? key,
    required String fromDate,
    required String toDate,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          CollectionReportRoute.name,
          args: CollectionReportRouteArgs(
            key: key,
            fromDate: fromDate,
            toDate: toDate,
          ),
          initialChildren: children,
        );

  static const String name = 'CollectionReportRoute';

  static const _i13.PageInfo<CollectionReportRouteArgs> page =
      _i13.PageInfo<CollectionReportRouteArgs>(name);
}

class CollectionReportRouteArgs {
  const CollectionReportRouteArgs({
    this.key,
    required this.fromDate,
    required this.toDate,
  });

  final _i14.Key? key;

  final String fromDate;

  final String toDate;

  @override
  String toString() {
    return 'CollectionReportRouteArgs{key: $key, fromDate: $fromDate, toDate: $toDate}';
  }
}

/// generated route for
/// [_i2.DashboardScreen]
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
/// [_i3.DepartmentsListingScreen]
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
/// [_i4.LabBillReportScreen]
class LabBillReportRoute extends _i13.PageRouteInfo<LabBillReportRouteArgs> {
  LabBillReportRoute({
    _i14.Key? key,
    required String fromDate,
    required String toDate,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          LabBillReportRoute.name,
          args: LabBillReportRouteArgs(
            key: key,
            fromDate: fromDate,
            toDate: toDate,
          ),
          initialChildren: children,
        );

  static const String name = 'LabBillReportRoute';

  static const _i13.PageInfo<LabBillReportRouteArgs> page =
      _i13.PageInfo<LabBillReportRouteArgs>(name);
}

class LabBillReportRouteArgs {
  const LabBillReportRouteArgs({
    this.key,
    required this.fromDate,
    required this.toDate,
  });

  final _i14.Key? key;

  final String fromDate;

  final String toDate;

  @override
  String toString() {
    return 'LabBillReportRouteArgs{key: $key, fromDate: $fromDate, toDate: $toDate}';
  }
}

/// generated route for
/// [_i5.NewIpListingScreen]
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
/// [_i6.ProcedureBillReportScreen]
class ProcedureBillReportRoute
    extends _i13.PageRouteInfo<ProcedureBillReportRouteArgs> {
  ProcedureBillReportRoute({
    _i14.Key? key,
    required String fromDate,
    required String toDate,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ProcedureBillReportRoute.name,
          args: ProcedureBillReportRouteArgs(
            key: key,
            fromDate: fromDate,
            toDate: toDate,
          ),
          initialChildren: children,
        );

  static const String name = 'ProcedureBillReportRoute';

  static const _i13.PageInfo<ProcedureBillReportRouteArgs> page =
      _i13.PageInfo<ProcedureBillReportRouteArgs>(name);
}

class ProcedureBillReportRouteArgs {
  const ProcedureBillReportRouteArgs({
    this.key,
    required this.fromDate,
    required this.toDate,
  });

  final _i14.Key? key;

  final String fromDate;

  final String toDate;

  @override
  String toString() {
    return 'ProcedureBillReportRouteArgs{key: $key, fromDate: $fromDate, toDate: $toDate}';
  }
}

/// generated route for
/// [_i7.RegistrationListScreen]
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
/// [_i8.RegistrationReportScreen]
class RegistrationReportRoute
    extends _i13.PageRouteInfo<RegistrationReportRouteArgs> {
  RegistrationReportRoute({
    _i14.Key? key,
    required String fromDate,
    required String toDate,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          RegistrationReportRoute.name,
          args: RegistrationReportRouteArgs(
            key: key,
            fromDate: fromDate,
            toDate: toDate,
          ),
          initialChildren: children,
        );

  static const String name = 'RegistrationReportRoute';

  static const _i13.PageInfo<RegistrationReportRouteArgs> page =
      _i13.PageInfo<RegistrationReportRouteArgs>(name);
}

class RegistrationReportRouteArgs {
  const RegistrationReportRouteArgs({
    this.key,
    required this.fromDate,
    required this.toDate,
  });

  final _i14.Key? key;

  final String fromDate;

  final String toDate;

  @override
  String toString() {
    return 'RegistrationReportRouteArgs{key: $key, fromDate: $fromDate, toDate: $toDate}';
  }
}

/// generated route for
/// [_i9.RevisitListingScreen]
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
/// [_i10.RevisitReportScreen]
class RevisitReportRoute extends _i13.PageRouteInfo<RevisitReportRouteArgs> {
  RevisitReportRoute({
    _i14.Key? key,
    required String fromDate,
    required String toDate,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          RevisitReportRoute.name,
          args: RevisitReportRouteArgs(
            key: key,
            fromDate: fromDate,
            toDate: toDate,
          ),
          initialChildren: children,
        );

  static const String name = 'RevisitReportRoute';

  static const _i13.PageInfo<RevisitReportRouteArgs> page =
      _i13.PageInfo<RevisitReportRouteArgs>(name);
}

class RevisitReportRouteArgs {
  const RevisitReportRouteArgs({
    this.key,
    required this.fromDate,
    required this.toDate,
  });

  final _i14.Key? key;

  final String fromDate;

  final String toDate;

  @override
  String toString() {
    return 'RevisitReportRouteArgs{key: $key, fromDate: $fromDate, toDate: $toDate}';
  }
}

/// generated route for
/// [_i11.SignInScreen]
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
/// [_i12.SplashScreen]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
