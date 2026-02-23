import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class STabView
    extends StatefulWidget {
  const STabView({
    super.key,
    this.controller,
    required this.children,
    this.physics =
        const BouncingScrollPhysics(),
    this.dragStartBehavior =
        DragStartBehavior.start,
  });

  /// This widget's selection and animation state.
  ///
  /// If [TabController] is not provided, then the value of [DefaultTabController.of]
  /// will be used.
  final TabController?
      controller;

  /// One widget per tab.
  ///
  /// Its length must match the length of the [TabBar.tabs]
  /// list, as well as the [controller]'s [TabController.length].
  final List<Widget>
      children;

  /// How the page view should respond to user input.
  ///
  /// For example, determines how the page view continues to animate after the
  /// user stops dragging the page view.
  final ScrollPhysics?
      physics;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior
      dragStartBehavior;

  @override
  State<STabView>
      createState() =>
          _STabViewState();
}

class _STabViewState
    extends State<
        STabView> {
  TabController?
      _controller;

  @override
  void
      didChangeDependencies() {
    super
        .didChangeDependencies();
    _updateController();
  }

  @override
  void didUpdateWidget(
      STabView
          oldWidget) {
    super.didUpdateWidget(
        oldWidget);
    if (widget.controller !=
        oldWidget.controller) {
      _updateController();
    }
  }

  void
      _updateController() {
    final TabController
        newController =
        widget.controller ?? DefaultTabController.of(context);
    assert(
        () {
      return true;
    }());

    if (newController !=
        _controller) {
      _controller =
          newController;
    }
  }

  @override
  Widget build(
      BuildContext
          context) {
    return TabBarView(
      controller:
          _controller,
      physics:
          widget.physics,
      dragStartBehavior:
          widget.dragStartBehavior,
      children:
          widget.children,
    );
  }
}
