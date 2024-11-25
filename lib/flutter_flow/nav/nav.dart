import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? LoginEntityDecisionPageWidget()
          : HomePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? LoginEntityDecisionPageWidget()
              : HomePageWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: 'HrLoginPage',
          path: '/hrLoginPage',
          builder: (context, params) => HrLoginPageWidget(),
        ),
        FFRoute(
          name: 'HrHomePage',
          path: '/hrHomePage',
          requireAuth: true,
          builder: (context, params) => HrHomePageWidget(),
        ),
        FFRoute(
          name: 'HrUpdateDriverProfilePage',
          path: '/hrUpdateDriverProfilePage',
          requireAuth: true,
          builder: (context, params) => HrUpdateDriverProfilePageWidget(
            driverReference: params.getParam(
              'driverReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['driver'],
            ),
          ),
        ),
        FFRoute(
          name: 'HrProfilePage',
          path: '/hrProfilePage',
          requireAuth: true,
          builder: (context, params) => HrProfilePageWidget(),
        ),
        FFRoute(
          name: 'PrivacyPolicyPage',
          path: '/privacyPolicyPage',
          requireAuth: true,
          builder: (context, params) => PrivacyPolicyPageWidget(),
        ),
        FFRoute(
          name: 'HelpAndSupportPage',
          path: '/helpAndSupportPage',
          requireAuth: true,
          builder: (context, params) => HelpAndSupportPageWidget(),
        ),
        FFRoute(
          name: 'HrUpdateProfilePage',
          path: '/hrUpdateProfilePage',
          requireAuth: true,
          builder: (context, params) => HrUpdateProfilePageWidget(),
        ),
        FFRoute(
          name: 'loginEntityDecisionPage',
          path: '/loginEntityDecisionPage',
          builder: (context, params) => LoginEntityDecisionPageWidget(),
        ),
        FFRoute(
          name: 'HrDriversListPage',
          path: '/hrDriversListPage',
          requireAuth: true,
          builder: (context, params) => HrDriversListPageWidget(
            actionType: params.getParam(
              'actionType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'HrViewDriverProfilePage',
          path: '/hrViewDriverProfilePage',
          requireAuth: true,
          builder: (context, params) => HrViewDriverProfilePageWidget(
            driverReference: params.getParam(
              'driverReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['driver'],
            ),
          ),
        ),
        FFRoute(
          name: 'HrAddDriverPage',
          path: '/hrAddDriverPage',
          requireAuth: true,
          builder: (context, params) => HrAddDriverPageWidget(),
        ),
        FFRoute(
          name: 'HrDeleteDriverProfilePage',
          path: '/hrDeleteDriverProfilePage',
          requireAuth: true,
          builder: (context, params) => HrDeleteDriverProfilePageWidget(
            driverReference: params.getParam(
              'driverReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['driver'],
            ),
          ),
        ),
        FFRoute(
          name: 'HrAddVehiclePage',
          path: '/hrAddVehiclePage',
          requireAuth: true,
          builder: (context, params) => HrAddVehiclePageWidget(),
        ),
        FFRoute(
          name: 'HrVehicleListPage',
          path: '/hrVehicleListPage',
          requireAuth: true,
          builder: (context, params) => HrVehicleListPageWidget(
            actionType: params.getParam(
              'actionType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'HrUpdateVehiclePage',
          path: '/hrUpdateVehiclePage',
          requireAuth: true,
          builder: (context, params) => HrUpdateVehiclePageWidget(
            vehicleReference: params.getParam(
              'vehicleReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['vehicles'],
            ),
          ),
        ),
        FFRoute(
          name: 'HrViewVehicleProfilePage',
          path: '/hrViewVehicleProfilePage',
          requireAuth: true,
          builder: (context, params) => HrViewVehicleProfilePageWidget(
            vehicleReference: params.getParam(
              'vehicleReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['vehicles'],
            ),
          ),
        ),
        FFRoute(
          name: 'HrDeleteVehiclePage',
          path: '/hrDeleteVehiclePage',
          requireAuth: true,
          builder: (context, params) => HrDeleteVehiclePageWidget(
            vehicleReference: params.getParam(
              'vehicleReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['vehicles'],
            ),
          ),
        ),
        FFRoute(
          name: 'SupplierAddCustomerPage',
          path: '/supplierAddCustomerPage',
          requireAuth: true,
          builder: (context, params) => SupplierAddCustomerPageWidget(),
        ),
        FFRoute(
          name: 'HrSupplierListPage',
          path: '/hrSupplierListPage',
          requireAuth: true,
          builder: (context, params) => HrSupplierListPageWidget(
            actionType: params.getParam(
              'actionType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'HrUpdateSupplierProfilePage',
          path: '/hrUpdateSupplierProfilePage',
          requireAuth: true,
          builder: (context, params) => HrUpdateSupplierProfilePageWidget(
            supplierReference: params.getParam(
              'supplierReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['suppliers'],
            ),
          ),
        ),
        FFRoute(
          name: 'HrViewSupplierProfilePage',
          path: '/hrViewSupplierProfilePage',
          requireAuth: true,
          builder: (context, params) => HrViewSupplierProfilePageWidget(
            supplierReference: params.getParam(
              'supplierReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['suppliers'],
            ),
          ),
        ),
        FFRoute(
          name: 'SupplierHomePage',
          path: '/supplierHomePage',
          requireAuth: true,
          builder: (context, params) => SupplierHomePageWidget(),
        ),
        FFRoute(
          name: 'SupplierDashboardPage',
          path: '/supplierDashboardPage',
          builder: (context, params) => SupplierDashboardPageWidget(),
        ),
        FFRoute(
          name: 'SupplierCustomerListPage',
          path: '/supplierCustomerListPage',
          requireAuth: true,
          builder: (context, params) => SupplierCustomerListPageWidget(),
        ),
        FFRoute(
          name: 'SupplierUpdateCustomerProfilePage',
          path: '/supplierUpdateCustomerProfilePage',
          requireAuth: true,
          builder: (context, params) => SupplierUpdateCustomerProfilePageWidget(
            customerReference: params.getParam(
              'customerReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['customer'],
            ),
          ),
        ),
        FFRoute(
          name: 'SupplierViewCustomerProfilePage',
          path: '/supplierViewCustomerProfilePage',
          requireAuth: true,
          builder: (context, params) => SupplierViewCustomerProfilePageWidget(
            customerReference: params.getParam(
              'customerReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['customer'],
            ),
          ),
        ),
        FFRoute(
          name: 'HrDeleteSupplierProfilePage',
          path: '/hrDeleteSupplierProfilePage',
          requireAuth: true,
          builder: (context, params) => HrDeleteSupplierProfilePageWidget(
            supplierReference: params.getParam(
              'supplierReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['suppliers'],
            ),
          ),
        ),
        FFRoute(
          name: 'SupplierOrdersList',
          path: '/supplierOrdersList',
          requireAuth: true,
          builder: (context, params) => SupplierOrdersListWidget(),
        ),
        FFRoute(
          name: 'SupplierOrderDetailsPage',
          path: '/supplierOrderDetailsPage',
          requireAuth: true,
          builder: (context, params) => SupplierOrderDetailsPageWidget(
            orderReference: params.getParam(
              'orderReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['orders'],
            ),
            isDelivered: params.getParam(
              'isDelivered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'SupplierOrderProcessSelectDriverPage',
          path: '/supplierOrderProcessSelectDriverPage',
          requireAuth: true,
          builder: (context, params) =>
              SupplierOrderProcessSelectDriverPageWidget(
            orderReference: params.getParam(
              'orderReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['orders'],
            ),
          ),
        ),
        FFRoute(
          name: 'SupplierOrderProcessSelectVehiclePage',
          path: '/supplierOrderProcessSelectVehiclePage',
          requireAuth: true,
          builder: (context, params) =>
              SupplierOrderProcessSelectVehiclePageWidget(
            orderReference: params.getParam(
              'orderReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['orders'],
            ),
            driverReference: params.getParam(
              'driverReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['driver'],
            ),
          ),
        ),
        FFRoute(
          name: 'SupplierOrderProcessConfirmDeliveryPage',
          path: '/supplierOrderProcessConfirmDeliveryPage',
          requireAuth: true,
          builder: (context, params) =>
              SupplierOrderProcessConfirmDeliveryPageWidget(
            orderReference: params.getParam(
              'orderReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['orders'],
            ),
            driverReference: params.getParam(
              'driverReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['driver'],
            ),
            vehicleReference: params.getParam(
              'vehicleReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['vehicles'],
            ),
          ),
        ),
        FFRoute(
          name: 'SupplierOrderProcessOrderConfirmedPage',
          path: '/supplierOrderProcessOrderConfirmedPage',
          requireAuth: true,
          builder: (context, params) =>
              SupplierOrderProcessOrderConfirmedPageWidget(),
        ),
        FFRoute(
          name: 'SupplierProfilePage',
          path: '/supplierProfilePage',
          requireAuth: true,
          builder: (context, params) => SupplierProfilePageWidget(
            supplierEmail: params.getParam(
              'supplierEmail',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'SupplierUpdateProfilePage',
          path: '/supplierUpdateProfilePage',
          requireAuth: true,
          builder: (context, params) => SupplierUpdateProfilePageWidget(
            supplierReference: params.getParam(
              'supplierReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['suppliers'],
            ),
          ),
        ),
        FFRoute(
          name: 'SupplierLoginPage',
          path: '/supplierLoginPage',
          builder: (context, params) => SupplierLoginPageWidget(),
        ),
        FFRoute(
          name: 'SupplierCreateAccountPage',
          path: '/supplierCreateAccountPage',
          asyncParams: {
            'supplierDocument':
                getDoc(['suppliers'], SuppliersRecord.fromSnapshot),
          },
          builder: (context, params) => SupplierCreateAccountPageWidget(
            supplierEmail: params.getParam(
              'supplierEmail',
              ParamType.String,
            ),
            supplierPassword: params.getParam(
              'supplierPassword',
              ParamType.String,
            ),
            supplierConfirmPassword: params.getParam(
              'supplierConfirmPassword',
              ParamType.String,
            ),
            supplierDocument: params.getParam(
              'supplierDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'HrAddSupplierPage',
          path: '/hrAddSupplierPage',
          requireAuth: true,
          builder: (context, params) => HrAddSupplierPageWidget(),
        ),
        FFRoute(
          name: 'DriverHomePage',
          path: '/driverHomePage',
          requireAuth: true,
          builder: (context, params) => DriverHomePageWidget(),
        ),
        FFRoute(
          name: 'DriverProfilePage',
          path: '/driverProfilePage',
          requireAuth: true,
          builder: (context, params) => DriverProfilePageWidget(
            driverEmail: params.getParam(
              'driverEmail',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'DriverUpdateProfilePage',
          path: '/driverUpdateProfilePage',
          requireAuth: true,
          builder: (context, params) => DriverUpdateProfilePageWidget(
            driverReference: params.getParam(
              'driverReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['driver'],
            ),
          ),
        ),
        FFRoute(
          name: 'DriverJobsListPage',
          path: '/driverJobsListPage',
          requireAuth: true,
          builder: (context, params) => DriverJobsListPageWidget(
            toViewActiveOrders: params.getParam(
              'toViewActiveOrders',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'DriverOrderDetailsPage',
          path: '/driverOrderDetailsPage',
          requireAuth: true,
          builder: (context, params) => DriverOrderDetailsPageWidget(
            orderReference: params.getParam(
              'orderReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['orders'],
            ),
            isDelivered: params.getParam(
              'isDelivered',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'DriverCreateAccountPage',
          path: '/driverCreateAccountPage',
          asyncParams: {
            'driverDocument': getDoc(['driver'], DriverRecord.fromSnapshot),
          },
          builder: (context, params) => DriverCreateAccountPageWidget(
            driverEmail: params.getParam(
              'driverEmail',
              ParamType.String,
            ),
            driverPassword: params.getParam(
              'driverPassword',
              ParamType.String,
            ),
            driverConfirmPassword: params.getParam(
              'driverConfirmPassword',
              ParamType.String,
            ),
            driverDocument: params.getParam(
              'driverDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'DriverLoginPage',
          path: '/driverLoginPage',
          builder: (context, params) => DriverLoginPageWidget(),
        ),
        FFRoute(
          name: 'CustomerHomePage',
          path: '/customerHomePage',
          requireAuth: true,
          builder: (context, params) => CustomerHomePageWidget(),
        ),
        FFRoute(
          name: 'CustomerProfilePage',
          path: '/customerProfilePage',
          requireAuth: true,
          builder: (context, params) => CustomerProfilePageWidget(
            customerEmail: params.getParam(
              'customerEmail',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'CustomerUpdateProfilePage',
          path: '/customerUpdateProfilePage',
          requireAuth: true,
          builder: (context, params) => CustomerUpdateProfilePageWidget(
            customerReference: params.getParam(
              'customerReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['customer'],
            ),
          ),
        ),
        FFRoute(
          name: 'CustomerOrdersListPage',
          path: '/customerOrdersListPage',
          builder: (context, params) => CustomerOrdersListPageWidget(),
        ),
        FFRoute(
          name: 'CustomerOrderDetailsPage',
          path: '/customerOrderDetailsPage',
          requireAuth: true,
          builder: (context, params) => CustomerOrderDetailsPageWidget(
            orderReference: params.getParam(
              'orderReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['orders'],
            ),
            isCompleted: params.getParam(
              'isCompleted',
              ParamType.bool,
            ),
            isOnGoing: params.getParam(
              'isOnGoing',
              ParamType.bool,
            ),
            isActive: params.getParam(
              'isActive',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'CustomerInventoryListPage',
          path: '/customerInventoryListPage',
          builder: (context, params) => CustomerInventoryListPageWidget(),
        ),
        FFRoute(
          name: 'CustomerAddProductPage',
          path: '/customerAddProductPage',
          requireAuth: true,
          builder: (context, params) => CustomerAddProductPageWidget(),
        ),
        FFRoute(
          name: 'CustomerUpdateProductPage',
          path: '/customerUpdateProductPage',
          requireAuth: true,
          builder: (context, params) => CustomerUpdateProductPageWidget(
            productReference: params.getParam(
              'productReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['customer', 'inventory'],
            ),
          ),
        ),
        FFRoute(
          name: 'CustomerProductViewPage',
          path: '/customerProductViewPage',
          requireAuth: true,
          builder: (context, params) => CustomerProductViewPageWidget(
            productReference: params.getParam(
              'productReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['customer', 'inventory'],
            ),
          ),
        ),
        FFRoute(
          name: 'CustomerLoginPage',
          path: '/customerLoginPage',
          builder: (context, params) => CustomerLoginPageWidget(),
        ),
        FFRoute(
          name: 'CustomerCreateAccountPage',
          path: '/customerCreateAccountPage',
          asyncParams: {
            'customerDocument':
                getDoc(['customer'], CustomerRecord.fromSnapshot),
          },
          builder: (context, params) => CustomerCreateAccountPageWidget(
            customerEmail: params.getParam(
              'customerEmail',
              ParamType.String,
            ),
            customerPassword: params.getParam(
              'customerPassword',
              ParamType.String,
            ),
            customerConfirmPassword: params.getParam(
              'customerConfirmPassword',
              ParamType.String,
            ),
            customerDocument: params.getParam(
              'customerDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'CustomerSellProductPage',
          path: '/customerSellProductPage',
          requireAuth: true,
          builder: (context, params) => CustomerSellProductPageWidget(
            productReference: params.getParam(
              'productReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['customer', 'inventory'],
            ),
          ),
        ),
        FFRoute(
          name: 'SupplierDriversListPage',
          path: '/supplierDriversListPage',
          requireAuth: true,
          builder: (context, params) => SupplierDriversListPageWidget(),
        ),
        FFRoute(
          name: 'SupplierViewDriverProfilePage',
          path: '/supplierViewDriverProfilePage',
          requireAuth: true,
          builder: (context, params) => SupplierViewDriverProfilePageWidget(
            driverReference: params.getParam(
              'driverReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['driver'],
            ),
          ),
        ),
        FFRoute(
          name: 'SupplierVehicleListPage',
          path: '/supplierVehicleListPage',
          requireAuth: true,
          builder: (context, params) => SupplierVehicleListPageWidget(),
        ),
        FFRoute(
          name: 'SupplierViewVehicleProfilePage',
          path: '/supplierViewVehicleProfilePage',
          requireAuth: true,
          builder: (context, params) => SupplierViewVehicleProfilePageWidget(
            vehicleReference: params.getParam(
              'vehicleReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['vehicles'],
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/homePage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 200.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
