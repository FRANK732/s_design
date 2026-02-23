import 'package:flutter/cupertino.dart'
    show
        CupertinoScrollbar;
import 'package:flutter/material.dart'
    as m;
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../localizations/s_localizations.dart';
import '../../themes/s_theme.dart';
import '../../themes/s_theme_data.dart';

/// Describes how [Scrollable] widgets behave for [SApp]s.
/// By default we will use [CupertinoScrollbar] for iOS and macOS platforms
/// for Windows and Linux [m.Scrollbar]
/// for Android and Fuchsia we will return the child
class SScrollBehavior
    extends ScrollBehavior {
  const SScrollBehavior();

  @override
  Widget
      buildScrollbar(
    BuildContext
        context,
    Widget
        child,
    ScrollableDetails
        details,
  ) {
    switch (
        axisDirectionToAxis(details.direction)) {
      case Axis.horizontal:
        return child;
      case Axis.vertical:
        switch (getPlatform(context)) {
          case TargetPlatform.macOS:
          case TargetPlatform.iOS:
            return CupertinoScrollbar(
              controller: details.controller,
              child: child,
            );
          case TargetPlatform.linux:
          case TargetPlatform.windows:
            return m.Scrollbar(controller: details.controller, child: child);
          case TargetPlatform.android:
          case TargetPlatform.fuchsia:
            return child;
        }
    }
  }
}

/// An application that uses SDesign components.
///
/// A convenience widget that wraps a number of widgets that are commonly
/// required for applications using SDesign. It builds upon a [m.MaterialApp] by
/// adding SDesign specific functionality, such as [SScrollBehavior].
class SApp
    extends StatefulWidget {
  const SApp({
    super.key,
    this.navigatorKey,
    this.home,
    this.routes =
        const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.navigatorObservers =
        const <NavigatorObserver>[],
    this.builder,
    this.title =
        '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.themeMode = m
        .ThemeMode
        .system,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales =
        const <Locale>[
      Locale('en',
          'US')
    ],
    this.debugShowMaterialGrid =
        false,
    this.showPerformanceOverlay =
        false,
    this.checkerboardRasterCacheImages =
        false,
    this.checkerboardOffscreenLayers =
        false,
    this.showSemanticsDebugger =
        false,
    this.debugShowCheckedModeBanner =
        true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
  })  : routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        routerConfig = null,
        backButtonDispatcher = null;

  /// Creates an [SApp] that uses the [Router] instead of a [Navigator].
  const SApp.router({
    super.key,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.routerConfig,
    this.backButtonDispatcher,
    this.builder,
    this.title =
        '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.themeMode = m
        .ThemeMode
        .system,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales =
        const <Locale>[
      Locale('en',
          'US')
    ],
    this.debugShowMaterialGrid =
        false,
    this.showPerformanceOverlay =
        false,
    this.checkerboardRasterCacheImages =
        false,
    this.checkerboardOffscreenLayers =
        false,
    this.showSemanticsDebugger =
        false,
    this.debugShowCheckedModeBanner =
        true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
  })  : navigatorObservers = null,
        navigatorKey = null,
        onGenerateRoute = null,
        home = null,
        onGenerateInitialRoutes = null,
        onUnknownRoute = null,
        routes = null,
        initialRoute = null;

  final GlobalKey<NavigatorState>?
      navigatorKey;
  final Widget?
      home;
  final Map<
      String,
      WidgetBuilder>? routes;
  final String?
      initialRoute;
  final RouteFactory?
      onGenerateRoute;
  final InitialRouteListFactory?
      onGenerateInitialRoutes;
  final RouteFactory?
      onUnknownRoute;
  final List<NavigatorObserver>?
      navigatorObservers;
  final RouteInformationProvider?
      routeInformationProvider;
  final RouteInformationParser<Object>?
      routeInformationParser;
  final RouterDelegate<Object>?
      routerDelegate;
  final BackButtonDispatcher?
      backButtonDispatcher;
  final RouterConfig<Object>?
      routerConfig;
  final TransitionBuilder?
      builder;
  final String
      title;
  final GenerateAppTitle?
      onGenerateTitle;
  final SThemeData?
      theme;
  final SThemeData?
      darkTheme;
  final m
      .ThemeMode?
      themeMode;
  final Color?
      color;
  final Locale?
      locale;
  final Iterable<LocalizationsDelegate<dynamic>>?
      localizationsDelegates;
  final LocaleListResolutionCallback?
      localeListResolutionCallback;
  final LocaleResolutionCallback?
      localeResolutionCallback;
  final Iterable<Locale>
      supportedLocales;
  final bool
      showPerformanceOverlay;
  final bool
      showSemanticsDebugger;
  final bool
      debugShowCheckedModeBanner;
  final Map<
      ShortcutActivator,
      Intent>? shortcuts;
  final Map<
      Type,
      Action<Intent>>? actions;
  final String?
      restorationScopeId;
  final ScrollBehavior?
      scrollBehavior;
  final bool
      debugShowMaterialGrid;
  final bool
      checkerboardRasterCacheImages;
  final bool
      checkerboardOffscreenLayers;

  @override
  State<SApp>
      createState() =>
          _SAppState();
}

class _SAppState
    extends State<
        SApp> {
  bool get _usesRouter =>
      widget.routerDelegate !=
          null ||
      widget.routerConfig !=
          null;

  SThemeData
      theme(BuildContext context) {
    final m.ThemeMode mode =
        widget.themeMode ?? m.ThemeMode.system;
    final m.Brightness platformBrightness =
        MediaQuery.platformBrightnessOf(context);
    final bool useDarkStyle =
        mode == m.ThemeMode.dark || (mode == m.ThemeMode.system && platformBrightness == Brightness.dark);

    final SThemeData data =
        () {
      late SThemeData
          result;
      if (useDarkStyle) {
        result = widget.darkTheme ?? widget.theme ?? SThemeData.dark();
      } else {
        result = widget.theme ?? SThemeData.light();
      }
      return result;
    }();
    return data;
  }

  Widget _builder(
      BuildContext
          context,
      Widget?
          child) {
    final SThemeData themeData =
        theme(context);

    // Convert SDesign primary token to a basic Material ColorScheme
    final m.ColorScheme colorScheme = themeData.brightness == Brightness.light
        ? m.ColorScheme.fromSeed(seedColor: themeData.colorToken.primary)
        : m.ColorScheme.fromSeed(seedColor: themeData.colorToken.primary, brightness: Brightness.dark);

    return m
        .AnimatedTheme(
      data:
          m.ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: themeData.colorToken.background,
        // Material widgets will fallback to these properties
        textTheme: m.TextTheme(
          bodyMedium: themeData.typographyToken.bodyMedium,
          bodyLarge: themeData.typographyToken.bodyLarge,
          titleLarge: themeData.typographyToken.titleLarge,
          labelSmall: themeData.typographyToken.labelSmall,
        ),
      ),
      child:
          AnimatedSTheme(
        data: themeData,
        child: widget.builder != null
            ? Builder(
                builder: (m.BuildContext context) {
                  return widget.builder!(context, child);
                },
              )
            : child ?? const SizedBox.shrink(),
      ),
    );
  }

  @override
  Widget build(
      BuildContext
          context) {
    if (_usesRouter) {
      return m.MaterialApp.router(
        key: widget.key,
        routeInformationProvider: widget.routeInformationProvider,
        routeInformationParser: widget.routeInformationParser,
        routerDelegate: widget.routerDelegate,
        routerConfig: widget.routerConfig,
        backButtonDispatcher: widget.backButtonDispatcher,
        builder: _builder,
        title: widget.title,
        onGenerateTitle: widget.onGenerateTitle,
        color: widget.color,
        themeMode: widget.themeMode,
        locale: widget.locale,
        localizationsDelegates: <m.LocalizationsDelegate<dynamic>>[
          SLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          ...?widget.localizationsDelegates,
        ],
        localeListResolutionCallback: widget.localeListResolutionCallback,
        localeResolutionCallback: widget.localeResolutionCallback,
        supportedLocales: widget.supportedLocales,
        debugShowMaterialGrid: widget.debugShowMaterialGrid,
        showPerformanceOverlay: widget.showPerformanceOverlay,
        checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
        checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
        showSemanticsDebugger: widget.showSemanticsDebugger,
        debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
        shortcuts: widget.shortcuts,
        actions: widget.actions,
        restorationScopeId: widget.restorationScopeId,
        scrollBehavior: widget.scrollBehavior ?? const SScrollBehavior(),
      );
    }

    return m
        .MaterialApp(
      key:
          widget.key,
      navigatorKey:
          widget.navigatorKey,
      home:
          widget.home,
      routes:
          widget.routes ?? const <String, WidgetBuilder>{},
      initialRoute:
          widget.initialRoute,
      onGenerateRoute:
          widget.onGenerateRoute,
      onGenerateInitialRoutes:
          widget.onGenerateInitialRoutes,
      onUnknownRoute:
          widget.onUnknownRoute,
      navigatorObservers:
          widget.navigatorObservers ?? const <NavigatorObserver>[],
      builder:
          _builder,
      title:
          widget.title,
      onGenerateTitle:
          widget.onGenerateTitle,
      color:
          widget.color,
      themeMode:
          widget.themeMode,
      locale:
          widget.locale,
      localizationsDelegates: <m.LocalizationsDelegate<dynamic>>[
        SLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        ...?widget.localizationsDelegates,
      ],
      localeListResolutionCallback:
          widget.localeListResolutionCallback,
      localeResolutionCallback:
          widget.localeResolutionCallback,
      supportedLocales:
          widget.supportedLocales,
      debugShowMaterialGrid:
          widget.debugShowMaterialGrid,
      showPerformanceOverlay:
          widget.showPerformanceOverlay,
      checkerboardRasterCacheImages:
          widget.checkerboardRasterCacheImages,
      checkerboardOffscreenLayers:
          widget.checkerboardOffscreenLayers,
      showSemanticsDebugger:
          widget.showSemanticsDebugger,
      debugShowCheckedModeBanner:
          widget.debugShowCheckedModeBanner,
      shortcuts:
          widget.shortcuts,
      actions:
          widget.actions,
      restorationScopeId:
          widget.restorationScopeId,
      scrollBehavior:
          widget.scrollBehavior ?? const SScrollBehavior(),
    );
  }
}
