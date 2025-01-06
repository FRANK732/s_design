import 'package:flutter/material.dart';
import 'package:s_design/src/common/enums/s_loading_types.dart';
import 'package:s_design/src/common/loading_circle.dart';
import 'package:provider/provider.dart';

/// The BaseScaffold widget that provides a reusable scaffold for pages.
class BaseScaffold extends StatefulWidget {
  /// Function to build the body of the page.
  final Widget Function(BuildContext context)? renderBody;

  /// Function to build the footer of the page.
  final Widget Function(BuildContext context)? renderFooter;

  /// Whether the body is scrollable.
  final bool scrollable;

  /// Whether to show a loading indicator.
  final bool isLoading;

  final String? loadingMessage;

  /// Optional appBar.
  final PreferredSizeWidget? appBar;

  /// The loading type of [SLoaderType]
  final SLoaderType? loadingType;

  final Widget? drawer;

  const BaseScaffold({
    super.key,
    this.appBar,
    this.renderBody,
    this.drawer,
    this.renderFooter,
    this.scrollable = false,
    this.isLoading = false,
    this.loadingMessage,
    this.loadingType = SLoaderType.threeBounce,
  });

  @override
  _BaseScaffoldState createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  late LoadingProvider _loadingProvider;

  @override
  void initState() {
    super.initState();
    _loadingProvider = LoadingProvider();
    _loadingProvider.setLoading(widget.isLoading);
  }

  @override
  void didUpdateWidget(covariant BaseScaffold oldWidget) {
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
            body: _buildBody(context),
            bottomNavigationBar:
                widget.renderFooter != null ? _buildFooter(context) : null,
          ),
          Consumer<LoadingProvider>(
            builder: (context, loadingProvider, child) {
              return loadingProvider.isLoading
                  ? _buildLoadingIndicator(
                      widget.loadingMessage, widget.loadingType)
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

    return widget.scrollable
        ? SingleChildScrollView(
            child: bodyContent,
          )
        : bodyContent;
  }

  Widget _buildFooter(BuildContext context) {
    return widget.renderFooter!(context);
  }

  Widget _buildLoadingIndicator(String? loadingText, SLoaderType? loadingType) {
    return SLoadingIndicator(
      showBackground: true,
      loaderType: loadingType,
      message: loadingText ?? "Loading...",
      color: Colors.teal,
    );
  }
}

/// Provider to manage the loading state.
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
