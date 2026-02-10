import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../s_design.dart';
import 'widgets/floating_action_button_config.dart';
import 'widgets/loading_config.dart';
import 'widgets/loading_provider.dart';

class SScaffold extends StatefulWidget {
  SScaffold({
    super.key,
    this.appBar,
    this.renderBody,
    this.centerBody = false,
    this.drawer,
    this.renderFooter,
    this.scrollable = false,
    FloatingActionButtonConfig? floatingActionButtonConfig,
    this.bodyPadding = EdgeInsets.zero,
    this.useSafeArea = true,
    @Deprecated('Use floatingActionButtonConfig instead')
    this.floatingActionButton,
    @Deprecated('Use floatingActionButtonConfig instead')
    this.floatingActionButtonLocation,
    @Deprecated('Use floatingActionButtonConfig instead')
    this.floatingActionButtonAnimator,
    PersistentFooterConfig? persistentFooterConfig,
    @Deprecated('Use persistentFooterConfig instead')
    this.persistentFooterButtons,
    @Deprecated('Use persistentFooterConfig instead')
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
    RefreshConfig? refreshConfig,
    @Deprecated('Use refreshConfig instead') this.enableRefresh = false,
    @Deprecated('Use refreshConfig instead') this.onRefresh,
    @Deprecated('Use refreshConfig instead') this.refreshIndicatorColor,
    @Deprecated('Use refreshConfig instead')
    this.refreshIndicatorBackgroundColor,
    @Deprecated('Use refreshConfig instead')
    this.refreshIndicatorTriggerMode = RefreshIndicatorTriggerMode.onEdge,
    @Deprecated('Use refreshConfig instead') this.minimumRefreshDuration = 1000,
    LoadingConfig? loadingConfig,
    @Deprecated('Use loadingConfig instead') this.isLoading = false,
    @Deprecated('Use loadingConfig instead') this.loadingIndicator,
    @Deprecated('Use loadingConfig instead') this.bodyShimmer,
  })  : floatingActionButtonConfig = floatingActionButtonConfig ??
            (floatingActionButton != null ||
                    floatingActionButtonLocation != null ||
                    floatingActionButtonAnimator != null
                ? FloatingActionButtonConfig(
                    floatingActionButton: floatingActionButton,
                    location: floatingActionButtonLocation,
                    animator: floatingActionButtonAnimator,
                  )
                : null),
        persistentFooterConfig = persistentFooterConfig ??
            (persistentFooterButtons != null
                ? PersistentFooterConfig(
                    buttons: persistentFooterButtons,
                    alignment: persistentFooterAlignment,
                  )
                : null),
        refreshConfig = refreshConfig ??
            (enableRefresh || onRefresh != null
                ? RefreshConfig(
                    enabled: enableRefresh,
                    onRefresh: onRefresh,
                    indicatorColor: refreshIndicatorColor,
                    indicatorBackgroundColor: refreshIndicatorBackgroundColor,
                    triggerMode: refreshIndicatorTriggerMode,
                    minimumDuration: minimumRefreshDuration,
                  )
                : null),
        loadingConfig = loadingConfig ??
            (isLoading || loadingIndicator != null || bodyShimmer != null
                ? LoadingConfig(
                    isLoading: isLoading,
                    indicator: loadingIndicator,
                    bodyShimmer: bodyShimmer,
                  )
                : null),
        assert(
          (loadingConfig?.bodyShimmer ?? bodyShimmer) == null ||
              (loadingConfig?.indicator?.loaderType ??
                      loadingIndicator?.loaderType) ==
                  SLoaderType.shimmer,
          'Shimmer should only be used with shimmer loader type.',
        ),
        assert(
          !(refreshConfig?.enabled ?? enableRefresh) ||
              (refreshConfig?.onRefresh ?? onRefresh) != null,
          'onRefresh must be provided when enableRefresh is true',
        ),
        assert(
          (refreshConfig?.minimumDuration ?? minimumRefreshDuration) >= 0,
          'minimumRefreshDuration must be non-negative',
        ),
        assert(
          drawerEdgeDragWidth == null || drawerEdgeDragWidth > 0,
          'drawerEdgeDragWidth must be positive if provided',
        ),
        assert(
          !(renderFooter != null && bottomNavigationBar != null),
          'Cannot provide both renderFooter and bottomNavigationBar',
        ),
        assert(
          !((persistentFooterConfig?.buttons ?? persistentFooterButtons) !=
                  null &&
              renderFooter != null),
          'Cannot use persistentFooterButtons with renderFooter',
        ),
        assert(
          !(bottomSheet != null && renderFooter != null),
          'Cannot use bottomSheet with renderFooter',
        ),
        assert(
          !(drawer != null &&
              !drawerEnableOpenDragGesture &&
              onDrawerChanged != null),
          'onDrawerChanged is unnecessary when drawerEnableOpenDragGesture is false',
        ),
        assert(
          !(endDrawer != null &&
              !endDrawerEnableOpenDragGesture &&
              onEndDrawerChanged != null),
          'onEndDrawerChanged is unnecessary when endDrawerEnableOpenDragGesture is false',
        ),
        assert(
          !((floatingActionButtonConfig?.floatingActionButton ??
                      floatingActionButton) ==
                  null &&
              ((floatingActionButtonConfig?.location ??
                          floatingActionButtonLocation) !=
                      null ||
                  (floatingActionButtonConfig?.animator ??
                          floatingActionButtonAnimator) !=
                      null)),
          'floatingActionButton must be provided when location or animator is set',
        );

  /// The app bar to display at the top of the scaffold.
  /// If null, no app bar is shown. Typically an [AppBar] widget.
  final PreferredSizeWidget? appBar;

  /// A function that builds the main content of the scaffold's body.
  /// Called with the current [BuildContext] to construct the body widget.
  /// If null, an empty [SizedBox.shrink] is displayed.
  final Widget Function(BuildContext context)? renderBody;

  /// Whether to center the body content vertically and horizontally.
  /// Defaults to false. When true, wraps the body in a [Center] widget.
  final bool centerBody;

  /// The drawer widget to display on the left side of the scaffold.
  /// Typically a [Drawer] widget. If null, no drawer is available.
  final Widget? drawer;

  /// A function that builds the footer content of the scaffold.
  /// Called with the current [BuildContext] to construct the footer widget.
  /// Mutually exclusive with [bottomNavigationBar] and [bottomSheet].
  /// If provided, takes precedence over [bottomNavigationBar].
  final Widget Function(BuildContext context)? renderFooter;

  /// Whether the body content is scrollable.
  /// Defaults to false. When true, wraps the body in a [SingleChildScrollView].
  /// Also enables scroll physics for pull-to-refresh if [refreshConfig] is enabled.
  final bool scrollable;

  /// Configuration for the floating action button (FAB).
  /// Preferred over deprecated props [floatingActionButton], [floatingActionButtonLocation],
  /// and [floatingActionButtonAnimator]. If null and no deprecated FAB props are set,
  /// no FAB is displayed.
  final FloatingActionButtonConfig? floatingActionButtonConfig;

  /// Whether to wrap the body content in a [SafeArea] widget.
  /// Defaults to true. When true, ensures content avoids notches, status bars, or navigation bars.
  final bool useSafeArea;

  /// The floating action button widget.
  /// Deprecated: Use [floatingActionButtonConfig] instead.
  /// If [floatingActionButtonConfig] is not provided, this is used to construct
  /// a [FloatingActionButtonConfig] internally.
  @Deprecated('Use floatingActionButtonConfig instead')
  final Widget? floatingActionButton;

  /// The position of the floating action button.
  /// Deprecated: Use [floatingActionButtonConfig] instead.
  /// If [floatingActionButtonConfig] is not provided, this is used to construct
  /// a [FloatingActionButtonConfig] internally.
  @Deprecated('Use floatingActionButtonConfig instead')
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// The animator for the floating action button's transitions.
  /// Deprecated: Use [floatingActionButtonConfig] instead.
  /// If [floatingActionButtonConfig] is not provided, this is used to construct
  /// a [FloatingActionButtonConfig] internally.
  @Deprecated('Use floatingActionButtonConfig instead')
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  /// Configuration for persistent footer buttons.
  /// Preferred over deprecated props [persistentFooterButtons] and [persistentFooterAlignment].
  /// If null and no deprecated footer props are set, no persistent footer is displayed.
  final PersistentFooterConfig? persistentFooterConfig;

  /// The list of buttons to display in the persistent footer.
  /// Deprecated: Use [persistentFooterConfig] instead.
  /// If [persistentFooterConfig] is not provided, this is used to construct
  /// a [PersistentFooterConfig] internally.
  @Deprecated('Use persistentFooterConfig instead')
  final List<Widget>? persistentFooterButtons;

  /// The alignment of persistent footer buttons.
  /// Deprecated: Use [persistentFooterConfig] instead.
  /// Defaults to [AlignmentDirectional.centerEnd].
  /// If [persistentFooterConfig] is not provided, this is used to construct
  /// a [PersistentFooterConfig] internally.
  @Deprecated('Use persistentFooterConfig instead')
  final AlignmentDirectional persistentFooterAlignment;

  /// Callback invoked when the [drawer] is opened or closed.
  /// Called with true when the drawer is opened, false when closed.
  /// Unnecessary if [drawerEnableOpenDragGesture] is false.
  final DrawerCallback? onDrawerChanged;

  /// The drawer widget to display on the right side of the scaffold.
  /// Typically a [Drawer] widget. If null, no end drawer is available.
  final Widget? endDrawer;

  /// Callback invoked when the [endDrawer] is opened or closed.
  /// Called with true when the end drawer is opened, false when closed.
  /// Unnecessary if [endDrawerEnableOpenDragGesture] is false.
  final DrawerCallback? onEndDrawerChanged;

  /// The bottom navigation bar widget to display at the bottom of the scaffold.
  /// Typically a [BottomNavigationBar]. Mutually exclusive with [renderFooter].
  /// If [renderFooter] is provided, this is ignored.
  final Widget? bottomNavigationBar;

  /// The bottom sheet widget to display at the bottom of the scaffold.
  /// Mutually exclusive with [renderFooter]. If [renderFooter] is provided, this is ignored.
  final Widget? bottomSheet;

  /// The background color of the scaffold.
  /// If null, defaults to the theme's scaffold background color.
  final Color? backgroundColor;

  /// Whether to resize the scaffold to avoid the bottom inset (e.g., keyboard).
  /// If null, the default behavior is determined by the platform.
  final bool? resizeToAvoidBottomInset;

  /// Whether the scaffold is the primary scrollable widget in the view hierarchy.
  /// Defaults to true. Affects scroll behavior, particularly with nested scrollable.
  final bool primary;

  /// The padding to apply to the body content.
  /// Defaults to [EdgeInsets.zero]. Wraps the body content in a [Padding] widget.
  final EdgeInsets bodyPadding;

  /// The drag behavior for opening the [drawer].
  /// Defaults to [DragStartBehavior.start].
  final DragStartBehavior drawerDragStartBehavior;

  /// Whether to extend the body content to the bottom of the scaffold.
  /// Defaults to false. Useful for allowing content to appear behind [bottomNavigationBar].
  final bool extendBody;

  /// Whether to extend the body content behind the [appBar].
  /// Defaults to false. Useful for transparent or translucent app bars.
  final bool extendBodyBehindAppBar;

  /// The color of the scrim displayed when the [drawer] is open.
  /// If null, defaults to a semi-transparent black color.
  final Color? drawerScrimColor;

  /// The width of the edge area that triggers the [drawer] drag gesture.
  /// If null, uses the default system value. Must be positive if provided.
  final double? drawerEdgeDragWidth;

  /// Whether to enable the drag gesture to open the [drawer].
  /// Defaults to true. If false, the drawer can only be opened programmatically.
  final bool drawerEnableOpenDragGesture;

  /// Whether to enable the drag gesture to open the [endDrawer].
  /// Defaults to true. If false, the end drawer can only be opened programmatically.
  final bool endDrawerEnableOpenDragGesture;

  /// The restoration ID for state restoration of the scaffold.
  /// If null, state restoration is not enabled.
  final String? restorationId;

  /// Configuration for pull-to-refresh functionality.
  /// Preferred over deprecated props [enableRefresh], [onRefresh], [refreshIndicatorColor],
  /// [refreshIndicatorBackgroundColor], [refreshIndicatorTriggerMode], and [minimumRefreshDuration].
  /// If null and no deprecated refresh props are set, pull-to-refresh is disabled.
  final RefreshConfig? refreshConfig;

  /// Whether pull-to-refresh is enabled.
  /// Deprecated: Use [refreshConfig] instead.
  /// Defaults to false. If [refreshConfig] is not provided, this is used to construct
  /// a [RefreshConfig] internally.
  @Deprecated('Use refreshConfig instead')
  final bool enableRefresh;

  /// Callback invoked when the user triggers a pull-to-refresh.
  /// Deprecated: Use [refreshConfig] instead.
  /// Required if [enableRefresh] is true. If [refreshConfig] is not provided, this is used
  /// to construct a [RefreshConfig] internally.
  @Deprecated('Use refreshConfig instead')
  final Future<void> Function()? onRefresh;

  /// The color of the refresh indicator.
  /// Deprecated: Use [refreshConfig] instead.
  /// If [refreshConfig] is not provided, this is used to construct a [RefreshConfig] internally.
  /// Defaults to the theme's primary color if not set.
  @Deprecated('Use refreshConfig instead')
  final Color? refreshIndicatorColor;

  /// The background color of the refresh indicator.
  /// Deprecated: Use [refreshConfig] instead.
  /// If [refreshConfig] is not provided, this is used to construct a [RefreshConfig] internally.
  /// Defaults to white if not set.
  @Deprecated('Use refreshConfig instead')
  final Color? refreshIndicatorBackgroundColor;

  /// The trigger mode for the refresh indicator.
  /// Deprecated: Use [refreshConfig] instead.
  /// Defaults to [RefreshIndicatorTriggerMode.onEdge].
  /// If [refreshConfig] is not provided, this is used to construct a [RefreshConfig] internally.
  @Deprecated('Use refreshConfig instead')
  final RefreshIndicatorTriggerMode refreshIndicatorTriggerMode;

  /// The minimum duration of the refresh animation in milliseconds.
  /// Deprecated: Use [refreshConfig] instead.
  /// Defaults to 1000. Must be non-negative.
  /// If [refreshConfig] is not provided, this is used to construct a [RefreshConfig] internally.
  @Deprecated('Use refreshConfig instead')
  final int minimumRefreshDuration;

  /// Configuration for the loading state and indicator.
  /// Preferred over deprecated props [isLoading], [loadingIndicator], and [bodyShimmer].
  /// If null and no deprecated loading props are set, no loading indicator is displayed.
  final LoadingConfig? loadingConfig;

  /// Whether to show a loading indicator.
  /// Deprecated: Use [loadingConfig] instead.
  /// Defaults to false. If [loadingConfig] is not provided, this is used to construct
  /// a [LoadingConfig] internally.
  @Deprecated('Use loadingConfig instead')
  final bool isLoading;

  /// The custom loading indicator widget.
  /// Deprecated: Use [loadingConfig] instead.
  /// Typically an [SLoadingIndicator]. If [loadingConfig] is not provided, this is used
  /// to construct a [LoadingConfig] internally.
  @Deprecated('Use loadingConfig instead')
  final SLoadingIndicator? loadingIndicator;

  /// The custom shimmer widget to display during loading with shimmer loader type.
  /// Deprecated: Use [loadingConfig] instead.
  /// Only used when [loadingIndicator]'s [loaderType] is [SLoaderType.shimmer].
  /// If [loadingConfig] is not provided, this is used to construct a [LoadingConfig] internally.
  @Deprecated('Use loadingConfig instead')
  final Widget? bodyShimmer;

  @override
  State<SScaffold> createState() => _SScaffoldState();
}

class _SScaffoldState extends State<SScaffold> {
  late LoadingProvider _loadingProvider;
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    _loadingProvider = LoadingProvider();
    _loadingProvider
        .setLoading(widget.loadingConfig?.isLoading ?? widget.isLoading);
  }

  @override
  void didUpdateWidget(covariant SScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if ((oldWidget.loadingConfig?.isLoading ?? oldWidget.isLoading) !=
        (widget.loadingConfig?.isLoading ?? widget.isLoading)) {
      _loadingProvider
          .setLoading(widget.loadingConfig?.isLoading ?? widget.isLoading);
    }
  }

  Future<void> _handleRefresh() async {
    if (_isRefreshing ||
        (widget.refreshConfig?.enabled ?? widget.enableRefresh) != true ||
        (widget.refreshConfig?.onRefresh ?? widget.onRefresh) == null) {
      return;
    }

    setState(() {
      _isRefreshing = true;
      _loadingProvider.setLoading(true);
    });

    try {
      await Future.wait(<Future<void>>[
        (widget.refreshConfig?.onRefresh ?? widget.onRefresh)!(),
        Future<void>.delayed(Duration(
            milliseconds: widget.refreshConfig?.minimumDuration ??
                widget.minimumRefreshDuration)),
      ]);
    } catch (e, stackTrace) {
      debugPrint('Refresh error: $e\n$stackTrace');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to refresh: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isRefreshing = false;
          _loadingProvider
              .setLoading(widget.loadingConfig?.isLoading ?? widget.isLoading);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoadingProvider>.value(
      value: _loadingProvider,
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: widget.appBar,
            drawer: widget.drawer,
            onDrawerChanged: widget.onDrawerChanged,
            floatingActionButton:
                widget.floatingActionButtonConfig?.floatingActionButton ??
                    widget.floatingActionButton,
            floatingActionButtonLocation:
                widget.floatingActionButtonConfig?.location ??
                    widget.floatingActionButtonLocation,
            floatingActionButtonAnimator:
                widget.floatingActionButtonConfig?.animator ??
                    widget.floatingActionButtonAnimator,
            persistentFooterButtons: widget.persistentFooterConfig?.buttons ??
                widget.persistentFooterButtons,
            persistentFooterAlignment:
                widget.persistentFooterConfig?.alignment ??
                    widget.persistentFooterAlignment,
            endDrawer: widget.endDrawer,
            onEndDrawerChanged: widget.onEndDrawerChanged,
            bottomSheet: widget.bottomSheet,
            backgroundColor: widget.backgroundColor,
            resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
            primary: widget.primary,
            drawerDragStartBehavior: widget.drawerDragStartBehavior,
            extendBody: widget.extendBody,
            extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
            drawerScrimColor: widget.drawerScrimColor,
            drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
            drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
            endDrawerEnableOpenDragGesture:
                widget.endDrawerEnableOpenDragGesture,
            restorationId: widget.restorationId,
            body: _buildBody(context,
                widget.loadingConfig?.indicator ?? widget.loadingIndicator),
            bottomNavigationBar: widget.renderFooter != null
                ? _buildFooter(context)
                : widget.bottomNavigationBar,
          ),
          if ((widget.loadingConfig?.indicator?.loaderType ??
                  widget.loadingIndicator?.loaderType) !=
              SLoaderType.shimmer)
            Consumer<LoadingProvider>(
              builder: (BuildContext context, LoadingProvider loadingProvider,
                  Widget? child) {
                return loadingProvider.isLoading && !_isRefreshing
                    ? (widget.loadingConfig?.indicator ??
                        widget.loadingIndicator ??
                        _buildLoadingIndicator())
                    : const SizedBox.shrink();
              },
            ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, SLoadingIndicator? loadingIndicator) {
    final Consumer<LoadingProvider> bodyContent = Consumer<LoadingProvider>(
      builder: (BuildContext context, LoadingProvider loadingProvider,
          Widget? child) {
        if (loadingProvider.isLoading &&
            (widget.loadingConfig?.indicator?.loaderType ??
                    widget.loadingIndicator?.loaderType) ==
                SLoaderType.shimmer &&
            !_isRefreshing) {
          return (widget.loadingConfig?.bodyShimmer ?? widget.bodyShimmer) ??
              Shimmer.fromColors(
                baseColor: const Color.fromARGB(255, 118, 111, 111),
                highlightColor: Colors.grey[100]!,
                child: widget.renderBody != null
                    ? widget.renderBody!(context)
                    : _buildShimmerLoader(),
              );
        }
        return widget.renderBody != null
            ? widget.renderBody!(context)
            : const SizedBox.shrink();
      },
    );

    final Widget paddedContent = Padding(
      padding: widget.bodyPadding,
      child: bodyContent,
    );

    final Widget safeContent =
        widget.useSafeArea ? SafeArea(child: paddedContent) : paddedContent;

    final Widget content =
        widget.centerBody ? Center(child: safeContent) : safeContent;

    if (widget.refreshConfig?.enabled ?? widget.enableRefresh) {
      return RefreshIndicator(
          onRefresh: _handleRefresh,
          color: widget.refreshConfig?.indicatorColor ??
              widget.refreshIndicatorColor ??
              Theme.of(context).primaryColor,
          backgroundColor: widget.refreshConfig?.indicatorBackgroundColor ??
              widget.refreshIndicatorBackgroundColor ??
              Colors.white,
          triggerMode: widget.refreshConfig?.triggerMode ??
              widget.refreshIndicatorTriggerMode,
          edgeOffset: widget.appBar?.preferredSize.height ?? 0.0,
          child: widget.scrollable
              ? SingleChildScrollView(
                  // Ensure scrollability for refresh even if content is short
                  physics: widget.enableRefresh
                      ? const AlwaysScrollableScrollPhysics()
                      : null,
                  child: widget.centerBody
                      ? ConstrainedBox(
                          constraints: BoxConstraints(
                            // Ensure content fills available height
                            minHeight: MediaQuery.of(context).size.height -
                                (widget.appBar?.preferredSize.height ?? 0) -
                                (widget.renderFooter != null
                                    ? kBottomNavigationBarHeight
                                    : 0),
                          ),
                          child: content,
                        )
                      : content,
                )
              : ConstrainedBox(
                  constraints: BoxConstraints(
                    // Ensure content fills available height
                    minHeight: MediaQuery.of(context).size.height -
                        (widget.appBar?.preferredSize.height ?? 0) -
                        (widget.renderFooter != null
                            ? kBottomNavigationBarHeight
                            : 0),
                  ),
                  child: content,
                ));
    }

    // For scrollable content without refresh
    if (widget.scrollable) {
      return SingleChildScrollView(
        physics: (widget.refreshConfig?.enabled ?? widget.enableRefresh)
            ? const AlwaysScrollableScrollPhysics()
            : null,
        child: widget.centerBody
            ? ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height -
                      (widget.appBar?.preferredSize.height ?? 0) -
                      (widget.renderFooter != null
                          ? kBottomNavigationBarHeight
                          : 0),
                ),
                child: content,
              )
            : content,
      );
    }

    // if (widget.scrollable ||
    //     (widget.refreshConfig?.enabled ?? widget.enableRefresh)) {
    //   return RefreshIndicator(
    //     onRefresh: _handleRefresh,
    //     color: widget.refreshConfig?.indicatorColor ??
    //         widget.refreshIndicatorColor ??
    //         Theme.of(context).primaryColor,
    //     backgroundColor: widget.refreshConfig?.indicatorBackgroundColor ??
    //         widget.refreshIndicatorBackgroundColor ??
    //         Colors.white,
    //     triggerMode: widget.refreshConfig?.triggerMode ??
    //         widget.refreshIndicatorTriggerMode,
    //     edgeOffset: widget.appBar?.preferredSize.height ?? 0.0,
    //     child: SingleChildScrollView(
    //       physics: (widget.refreshConfig?.enabled ?? widget.enableRefresh)
    //           ? const AlwaysScrollableScrollPhysics()
    //           : null,
    //       child: widget.centerBody
    //           ? ConstrainedBox(
    //               constraints: BoxConstraints(
    //                 minHeight: MediaQuery.of(context).size.height -
    //                     (widget.appBar?.preferredSize.height ?? 0) -
    //                     (widget.renderFooter != null
    //                         ? kBottomNavigationBarHeight
    //                         : 0),
    //               ),
    //               child: content,
    //             )
    //           : content,
    //     ),
    //   );
    // }

    return content;
  }

  Widget _buildFooter(BuildContext context) {
    final Widget? footerWidget = widget.renderFooter?.call(context);
    final double additionalBottomPadding =
        MediaQuery.viewPaddingOf(context).bottom;

    if (footerWidget is BottomNavigationBar) {
      return widget.renderFooter!(context);
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: kBottomNavigationBarHeight + additionalBottomPadding,
        maxHeight: 2 * kBottomNavigationBarHeight,
      ),
      child: widget.renderFooter!(context),
    );
  }

  Widget _buildLoadingIndicator() {
    return const SLoadingIndicator(
      spinnerColor: Colors.teal,
    );
  }

  Widget _buildShimmerLoader() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
