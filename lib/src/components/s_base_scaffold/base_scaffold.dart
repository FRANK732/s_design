import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:s_design/src/common/s_loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

/// The SScaffold widget that provides a reusable scaffold for pages.
class SScaffold extends StatefulWidget {
  /// Function to build the body of the page.
  final Widget Function(BuildContext context)? renderBody;

  /// Function to build the footer of the page.
  final Widget Function(BuildContext context)? renderFooter;

  /// Whether the body is scrollable.
  final bool scrollable;

  /// Center body
  final bool centerBody;

  /// Whether to show a loading indicator.
  final bool isLoading;

  /// Customize loading appearance
  final SLoadingIndicator? loadingIndicator;

  /// Optional appBar.
  final PreferredSizeWidget? appBar;

  final Widget? drawer;

  final Widget? floatingActionButton;

  final DrawerCallback? onDrawerChanged;

  final FloatingActionButtonLocation? floatingActionButtonLocation;

  final List<Widget>? persistentFooterButtons;

  final AlignmentDirectional persistentFooterAlignment;

  final Widget? endDrawer;

  final DrawerCallback? onEndDrawerChanged;

  final Widget? bottomNavigationBar;

  final Widget? bottomSheet;

  final Color? backgroundColor;

  final bool? resizeToAvoidBottomInset;

  final bool primary;

  final DragStartBehavior drawerDragStartBehavior;

  final bool extendBody;

  final bool extendBodyBehindAppBar;

  final Color? drawerScrimColor;

  final double? drawerEdgeDragWidth;

  final bool drawerEnableOpenDragGesture;

  final bool endDrawerEnableOpenDragGesture;

  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  final String? restorationId;

  const SScaffold({
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
  });

  @override
  _SScaffoldState createState() => _SScaffoldState();
}

class _SScaffoldState extends State<SScaffold> {
  late LoadingProvider _loadingProvider;

  @override
  void initState() {
    super.initState();
    _loadingProvider = LoadingProvider();
    _loadingProvider.setLoading(widget.isLoading);
  }

  @override
  void didUpdateWidget(covariant SScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isLoading != widget.isLoading) {
      _loadingProvider.setLoading(widget.isLoading);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoadingProvider>.value(
      value: _loadingProvider,
      child: Stack(
        children: [
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
            body: _buildBody(context),
            bottomNavigationBar:
                widget.renderFooter != null ? _buildFooter(context) : null,
          ),
          Consumer<LoadingProvider>(
            builder: (context, loadingProvider, child) {
              return loadingProvider.isLoading
                  ? widget.loadingIndicator ?? _buildLoadingIndicator()
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final bodyContent = widget.renderBody != null
        ? widget.renderBody!(context)
        : const SizedBox.shrink();

    Widget content =
        widget.centerBody ? Center(child: bodyContent) : bodyContent;

    if (widget.scrollable) {
      return SingleChildScrollView(
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
    } else {
      return content;
    }
  }

  Widget _buildFooter(BuildContext context) {
    final footerWidget = widget.renderFooter?.call(context);
    final double additionalBottomPadding =
        MediaQuery.viewPaddingOf(context).bottom;

    if (footerWidget is BottomNavigationBar) {
      return widget.renderFooter!(context);
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: kBottomNavigationBarHeight + additionalBottomPadding,
          maxHeight: 2 * kBottomNavigationBarHeight),
      child: widget.renderFooter!(context),
    );
  }

  Widget _buildLoadingIndicator() {
    return SLoadingIndicator(
      showBackground: true,
      spinnerColor: Colors.teal,
    );
  }
}

class LoadingProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    if (_isLoading != value) {
      _isLoading = value;
      notifyListeners();
    }
  }
}
