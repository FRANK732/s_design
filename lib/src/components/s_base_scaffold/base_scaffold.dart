import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

/// A reusable scaffold widget that provides a customizable page structure with
/// support for pull-to-refresh, loading indicators, and shimmer effects.
class SScaffold extends StatefulWidget {
  SScaffold({
    super.key,
    this.appBar,
    this.renderBody,
    this.centerBody = false,
    this.drawer,
    this.renderFooter,
    this.scrollable = false,
    this.isLoading = false,
    this.loadingIndicator,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bodyShimmer,
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
    this.enableRefresh = false,
    this.onRefresh,
    this.refreshIndicatorColor,
    this.refreshIndicatorBackgroundColor,
    this.refreshIndicatorTriggerMode = RefreshIndicatorTriggerMode.onEdge,
    this.minimumRefreshDuration = 1000,
  })  :
        // Ensure shimmer is only used with shimmer loader type
        assert(
          bodyShimmer == null ||
              loadingIndicator?.loaderType == SLoaderType.shimmer,
          'Shimmer should only be used with shimmer loader type.',
        ),
        // Require onRefresh callback when refresh is enabled
        assert(
          !enableRefresh || onRefresh != null,
          'onRefresh must be provided when enableRefresh is true',
        ),
        // Ensure refresh duration is non-negative
        assert(
          minimumRefreshDuration >= 0,
          'minimumRefreshDuration must be non-negative',
        ),
        // Validate drawer drag width is positive
        assert(
          drawerEdgeDragWidth == null || drawerEdgeDragWidth > 0,
          'drawerEdgeDragWidth must be positive if provided',
        ),
        // Prevent conflicting footer widgets
        assert(
          !(renderFooter != null && bottomNavigationBar != null),
          'Cannot provide both renderFooter and bottomNavigationBar',
        ),
        // Prevent persistent footer buttons with custom footer
        assert(
          !(persistentFooterButtons != null && renderFooter != null),
          'Cannot use persistentFooterButtons with renderFooter',
        ),
        // Prevent bottom sheet with custom footer
        assert(
          !(bottomSheet != null && renderFooter != null),
          'Cannot use bottomSheet with renderFooter',
        ),
        // Ensure drawer callback is only used when drawer is interactive
        assert(
          !(drawer != null &&
              !drawerEnableOpenDragGesture &&
              onDrawerChanged != null),
          'onDrawerChanged is unnecessary when drawerEnableOpenDragGesture is false',
        ),
        // Ensure end drawer callback is only used when end drawer is interactive
        assert(
          !(endDrawer != null &&
              !endDrawerEnableOpenDragGesture &&
              onEndDrawerChanged != null),
          'onEndDrawerChanged is unnecessary when endDrawerEnableOpenDragGesture is false',
        ),
        // Require FAB when its location or animator is specified
        assert(
          !(floatingActionButton == null &&
              (floatingActionButtonLocation != null ||
                  floatingActionButtonAnimator != null)),
          'floatingActionButton must be provided when floatingActionButtonLocation or floatingActionButtonAnimator is set',
        );

  /// Function to build the body of the page.
  final Widget Function(BuildContext context)? renderBody;

  /// Function to build the footer of the page.
  final Widget Function(BuildContext context)? renderFooter;

  /// Whether the body is scrollable.
  final bool scrollable;

  /// Whether to center the body content vertically and horizontally.
  final bool centerBody;

  /// Whether to show a loading indicator.
  final bool isLoading;

  /// Customizes the appearance of the loading indicator.
  final SLoadingIndicator? loadingIndicator;

  /// Custom shimmer widget to display during loading with shimmer loader type.
  final Widget? bodyShimmer;

  /// Optional app bar widget.
  final PreferredSizeWidget? appBar;

  /// Drawer widget for the scaffold.
  final Widget? drawer;

  /// Floating action button widget.
  final Widget? floatingActionButton;

  /// Callback triggered when the drawer state changes.
  final DrawerCallback? onDrawerChanged;

  /// Position of the floating action button.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// List of buttons to display in the persistent footer.
  final List<Widget>? persistentFooterButtons;

  /// Alignment for persistent footer buttons.
  final AlignmentDirectional persistentFooterAlignment;

  /// End drawer widget for the scaffold.
  final Widget? endDrawer;

  /// Callback triggered when the end drawer state changes.
  final DrawerCallback? onEndDrawerChanged;

  /// Bottom navigation bar widget.
  final Widget? bottomNavigationBar;

  /// Bottom sheet widget.
  final Widget? bottomSheet;

  /// Background color of the scaffold.
  final Color? backgroundColor;

  /// Whether to resize the scaffold to avoid the bottom inset (e.g., keyboard).
  final bool? resizeToAvoidBottomInset;

  /// Whether the scaffold is primary (affects scroll behavior).
  final bool primary;

  /// Drag behavior for opening the drawer.
  final DragStartBehavior drawerDragStartBehavior;

  /// Whether to extend the body to the bottom of the scaffold.
  final bool extendBody;

  /// Whether to extend the body behind the app bar.
  final bool extendBodyBehindAppBar;

  /// Scrim color for the drawer.
  final Color? drawerScrimColor;

  /// Width of the edge that triggers the drawer drag gesture.
  final double? drawerEdgeDragWidth;

  /// Whether to enable the open drag gesture for the drawer.
  final bool drawerEnableOpenDragGesture;

  /// Whether to enable the open drag gesture for the end drawer.
  final bool endDrawerEnableOpenDragGesture;

  /// Animator for the floating action button.
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  /// Restoration ID for state restoration.
  final String? restorationId;

  /// Enables pull-to-refresh functionality.
  final bool enableRefresh;

  /// Callback triggered when the user pulls to refresh.
  final Future<void> Function()? onRefresh;

  /// Color of the refresh indicator.
  final Color? refreshIndicatorColor;

  /// Background color of the refresh indicator.
  final Color? refreshIndicatorBackgroundColor;

  /// Refresh trigger node
  final RefreshIndicatorTriggerMode refreshIndicatorTriggerMode;

  /// Minimum duration of the refresh animation in milliseconds.
  final int minimumRefreshDuration;

  @override
  State<SScaffold> createState() => _SScaffoldState();
}

/// State class for [SScaffold] that manages loading and refresh states.
class _SScaffoldState extends State<SScaffold> {
  // Provider for managing loading state
  late LoadingProvider _loadingProvider;
  // Tracks whether a refresh is in progress
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    // Initialize loading provider with initial isLoading state
    _loadingProvider = LoadingProvider();
    _loadingProvider.setLoading(widget.isLoading);
  }

  @override
  void didUpdateWidget(covariant SScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update loading state if isLoading changes
    if (oldWidget.isLoading != widget.isLoading) {
      _loadingProvider.setLoading(widget.isLoading);
    }
  }

  /// Handles the pull-to-refresh action, ensuring minimum duration and error handling.
  Future<void> _handleRefresh() async {
    // Prevent concurrent refreshes or invalid refresh configurations
    if (_isRefreshing || !widget.enableRefresh || widget.onRefresh == null) {
      return;
    }

    setState(() {
      _isRefreshing = true;
      _loadingProvider.setLoading(true);
    });

    try {
      // Run refresh callback and enforce minimum duration concurrently
      await Future.wait([
        widget.onRefresh!(),
        Future<void>.delayed(
            Duration(milliseconds: widget.minimumRefreshDuration)),
      ]);
    } catch (e, stackTrace) {
      // Log errors for debugging in production
      debugPrint('Refresh error: $e\n$stackTrace');
      // Show error feedback to user
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to refresh: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      // Reset refresh and loading states if widget is still mounted
      if (mounted) {
        setState(() {
          _isRefreshing = false;
          _loadingProvider.setLoading(widget.isLoading);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Provide loading state to descendants
    return ChangeNotifierProvider<LoadingProvider>.value(
      value: _loadingProvider,
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: widget.appBar,
            drawer: widget.drawer,
            onDrawerChanged: widget.onDrawerChanged,
            floatingActionButton: widget.floatingActionButton,
            floatingActionButtonLocation: widget.floatingActionButtonLocation,
            floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
            persistentFooterButtons: widget.persistentFooterButtons,
            persistentFooterAlignment: widget.persistentFooterAlignment,
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
            body: _buildBody(context, widget.loadingIndicator),
            bottomNavigationBar: widget.renderFooter != null
                ? _buildFooter(context)
                : widget.bottomNavigationBar,
          ),
          // Display loading indicator (non-shimmer) when loading and not refreshing
          if (widget.loadingIndicator?.loaderType != SLoaderType.shimmer)
            Consumer<LoadingProvider>(
              builder: (BuildContext context, LoadingProvider loadingProvider,
                  Widget? child) {
                return loadingProvider.isLoading && !_isRefreshing
                    ? widget.loadingIndicator ?? _buildLoadingIndicator()
                    : const SizedBox.shrink();
              },
            ),
        ],
      ),
    );
  }

  /// Builds the body content with support for loading, shimmer, and refresh.
  Widget _buildBody(BuildContext context, SLoadingIndicator? loadingIndicator) {
    final Consumer<LoadingProvider> bodyContent = Consumer<LoadingProvider>(
      builder: (BuildContext context, LoadingProvider loadingProvider,
          Widget? child) {
        if (loadingProvider.isLoading &&
            loadingIndicator?.loaderType == SLoaderType.shimmer &&
            !_isRefreshing) {
          return widget.bodyShimmer ??
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

    // Center content if centerBody is true
    final Widget content =
        widget.centerBody ? Center(child: bodyContent) : bodyContent;

    // Wrap in scroll view and refresh indicator if scrollable or refresh enabled
    if (widget.scrollable || widget.enableRefresh) {
      return RefreshIndicator(
        onRefresh: _handleRefresh,
        color: widget.refreshIndicatorColor ?? Theme.of(context).primaryColor,
        backgroundColor: widget.refreshIndicatorBackgroundColor ?? Colors.white,
        triggerMode: widget.refreshIndicatorTriggerMode,
        edgeOffset: widget.appBar?.preferredSize.height ?? 0.0,
        child: SingleChildScrollView(
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
        ),
      );
    }
    return content;
  }

  /// Builds the footer with proper constraints and padding.
  Widget _buildFooter(BuildContext context) {
    final Widget? footerWidget = widget.renderFooter?.call(context);
    final double additionalBottomPadding =
        MediaQuery.viewPaddingOf(context).bottom;

    // Use provided footer directly if it's a BottomNavigationBar
    if (footerWidget is BottomNavigationBar) {
      return widget.renderFooter!(context);
    }

    // Apply constraints for custom footer
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: kBottomNavigationBarHeight + additionalBottomPadding,
        maxHeight: 2 * kBottomNavigationBarHeight,
      ),
      child: widget.renderFooter!(context),
    );
  }

  /// Builds the default loading indicator.
  Widget _buildLoadingIndicator() {
    return const SLoadingIndicator(
      spinnerColor: Colors.teal,
    );
  }

  /// Builds a default shimmer loader with a list view of placeholder cards.
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

class LoadingProvider extends ChangeNotifier {
  // Current loading state
  bool _isLoading = false;

  /// Gets the current loading state.
  bool get isLoading => _isLoading;

  /// Sets the loading state and notifies listeners if changed.
  void setLoading(bool value) {
    if (_isLoading != value) {
      _isLoading = value;
      notifyListeners();
    }
  }
}
