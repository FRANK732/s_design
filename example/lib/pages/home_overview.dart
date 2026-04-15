import 'dart:math';

import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../widgets/code_snippet.dart';
import '../widgets/schrift_flow_logo.dart';

/// Welcome/overview page shown when the app first opens.
class HomeOverviewPage
    extends StatefulWidget {
  const HomeOverviewPage(
      {super.key});

  @override
  State<HomeOverviewPage>
      createState() =>
          _HomeOverviewPageState();
}

class _HomeOverviewPageState
    extends State<
        HomeOverviewPage> {
  @override
  Widget build(
      BuildContext
          context) {
    final theme =
        Theme.of(context);
    final colors =
        STheme.of(context).colorToken;
    final isDesktop =
        MediaQuery.of(context).size.width > 800;
    final l10n =
        SLocalizations.ofContext(context);

    return SScaffold(
      backgroundColor:
          colors.surface,
      renderBody: (context) =>
          Stack(
        children: [
          const Positioned.fill(
            child: _AnimatedBackground(),
          ),
          ListView(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 64 : 24,
              vertical: isDesktop ? 80 : 40,
            ),
            children: [
              Align(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    children: [
                      _EntranceAnimation(
                        delay: const Duration(milliseconds: 100),
                        child: SCard(
                          elevation: 0,
                          color: colors.surface,
                          borderColor: colors.secondary,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          borderRadius: 20.0,
                          body: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.auto_awesome, size: 16, color: colors.secondary),
                              const SizedBox(width: 8),
                              Text(
                                l10n.heroTagline,
                                style: theme.textTheme.labelLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      _EntranceAnimation(
                        delay: const Duration(milliseconds: 200),
                        child: Text(
                          l10n.heroTitle,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                            letterSpacing: -1.5,
                            height: 1.1,
                            color: colors.textPrimary,
                            fontSize: isDesktop ? 72 : 48,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      _EntranceAnimation(
                        delay: const Duration(milliseconds: 300),
                        child: Text(
                          l10n.heroDescription,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: colors.textSecondary,
                            height: 1.5,
                            fontSize: isDesktop ? 22 : 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 48),
                      _EntranceAnimation(
                        delay: const Duration(milliseconds: 400),
                        child: Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          alignment: WrapAlignment.center,
                          children: [
                            SButton(
                              size: SButtonSize.lg,
                              icon: const Icon(Icons.rocket_launch),
                              child: Text(l10n.heroGetStarted),
                              onPressed: () {
                                // Scroll down or navigate
                              },
                            ),
                            SButton(
                              size: SButtonSize.lg,
                              variant: SButtonVariant.outline,
                              icon: const Icon(Icons.dashboard),
                              child: Text(l10n.heroBrowse),
                              onPressed: () {
                                SSonner.show(message: 'Navigate using the sidebar!', variant: SSonnerVariant.success);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 100),
              const _EntranceAnimation(
                delay: Duration(milliseconds: 500),
                child: _LiveShowcase(),
              ),
              const SizedBox(height: 100),
              _EntranceAnimation(
                delay: const Duration(milliseconds: 600),
                child: Column(
                  children: [
                    Text(
                      l10n.featuresTitle,
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 48),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      alignment: WrapAlignment.center,
                      children: [
                        _FeatureCard(
                          icon: Icons.palette,
                          title: l10n.featCustomTitle,
                          description: l10n.featCustomDesc,
                          width: isDesktop ? 350 : double.infinity,
                        ),
                        _FeatureCard(
                          icon: Icons.dark_mode,
                          title: l10n.featDarkTitle,
                          description: l10n.featDarkDesc,
                          width: isDesktop ? 350 : double.infinity,
                        ),
                        _FeatureCard(
                          icon: Icons.language,
                          title: l10n.featLocTitle,
                          description: l10n.featLocDesc,
                          width: isDesktop ? 350 : double.infinity,
                        ),
                        _FeatureCard(
                          icon: Icons.animation,
                          title: l10n.featAnimTitle,
                          description: l10n.featAnimDesc,
                          width: isDesktop ? 350 : double.infinity,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
              _EntranceAnimation(
                delay: const Duration(milliseconds: 700),
                child: Column(
                  children: [
                    Text(
                      l10n.footerIntegrate,
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Align(
                      child: SizedBox(
                        width: 800,
                        child: CodeSnippet(
                          code: '''
import 'package:s_design/s_design.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SApp(
      title: 'Flawless App',
      theme: SThemeData.light(),
      darkTheme: SThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const SScaffold(
        appBar: AppBar(title: Text('Hello sDesign')),
        // ...
      ),
    );
  }
}''',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
              _EntranceAnimation(
                delay: const Duration(milliseconds: 800),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 24,
                  runSpacing: 24,
                  children: [
                    _LinkCard(
                      icon: Icons.code,
                      title: 'pub.dev package',
                      subtitle: 'pub.dev/packages/s_design',
                      onTap: () => launchUrlString('https://pub.dev/packages/s_design'),
                    ),
                    _LinkCard(
                      icon: Icons.hub,
                      title: 'GitHub Repository',
                      subtitle: 'github.com/FRANK732/s_design',
                      onTap: () => launchUrlString('https://github.com/FRANK732/s_design'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.footerBuiltBy,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colors.disabled,
                      ),
                    ),
                    const SchriftFlowLogo(size: 24, withText: true),
                    Text(
                      l10n.footerLicense,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colors.disabled,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// A live interactive showcase of sDesign components
class _LiveShowcase
    extends StatefulWidget {
  const _LiveShowcase();

  @override
  State<_LiveShowcase>
      createState() =>
          _LiveShowcaseState();
}

class _LiveShowcaseState
    extends State<
        _LiveShowcase> {
  bool
      _switchVal =
      true;
  double
      _sliderVal =
      40;
  SCheckboxState
      _checkVal =
      SCheckboxState.checked;

  @override
  Widget build(
      BuildContext
          context) {
    final theme =
        Theme.of(context);
    final colors =
        STheme.of(context).colorToken;
    final l10n =
        SLocalizations.ofContext(context);

    return Container(
      width:
          double.infinity,
      constraints:
          const BoxConstraints(maxWidth: 900),
      padding:
          const EdgeInsets.all(40),
      decoration:
          BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colors.divider),
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withOpacity(0.05),
            blurRadius: 40,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child:
          Column(
        children: [
          Text(
            l10n.showcaseTitle,
            style: theme.textTheme.titleMedium?.copyWith(
              color: colors.primary,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              // Column 1
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SButton(
                    onPressed: () {
                      SSonner.show(
                        message: l10n.showcaseNotifySuccess,
                        variant: SSonnerVariant.success,
                      );
                    },
                    child: Text(l10n.showcaseNotifyBtn),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SSwitch(
                        value: _switchVal,
                        onChanged: (v) => setState(() => _switchVal = v),
                      ),
                      const SizedBox(width: 16),
                      SCheckbox(
                        value: _checkVal,
                        onChanged: (v) => setState(() => _checkVal = v),
                      ),
                    ],
                  ),
                ],
              ),

              // Column 2
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SInputField(
                    labelText: l10n.showcaseEmailLabel,
                    hintText: l10n.showcaseEmailHint,
                    startIcon: const Icon(Icons.email_outlined),
                  ),
                  const SizedBox(height: 24),
                  Slider(
                    value: _sliderVal,
                    max: 100,
                    onChanged: (double v) => setState(() => _sliderVal = v),
                  ),
                ],
              ),

              // Column 3
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SInputField.datePicker(
                    controller: TextEditingController(),
                    hintText: l10n.showcaseDateHint,
                  ),
                  const SizedBox(height: 24),
                  SButton(
                    variant: SButtonVariant.outline,
                    child: Text(l10n.showcaseDeleteBtn, style: const TextStyle(color: Colors.red)),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FeatureCard
    extends StatefulWidget {
  const _FeatureCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.width,
  });

  final String
      title;
  final String
      description;
  final IconData
      icon;
  final double
      width;

  @override
  State<_FeatureCard>
      createState() =>
          _FeatureCardState();
}

class _FeatureCardState
    extends State<
        _FeatureCard> {
  bool
      _isHovered =
      false;

  @override
  Widget build(
      BuildContext
          context) {
    final theme =
        Theme.of(context);
    final colors =
        STheme.of(context).colorToken;

    return MouseRegion(
      onEnter: (_) =>
          setState(() => _isHovered = true),
      onExit: (_) =>
          setState(() => _isHovered = false),
      child:
          AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width,
        transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
        child: SCard(
          elevation: _isHovered ? 2 : 0,
          borderColor: _isHovered ? colors.primary.withOpacity(0.5) : colors.divider,
          padding: const EdgeInsets.all(32),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(widget.icon, color: colors.primary, size: 28),
              ),
              const SizedBox(height: 24),
              Text(
                widget.title,
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                widget.description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.textSecondary,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LinkCard
    extends StatefulWidget {
  const _LinkCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData
      icon;
  final String
      title;
  final String
      subtitle;
  final VoidCallback
      onTap;

  @override
  State<_LinkCard>
      createState() =>
          _LinkCardState();
}

class _LinkCardState
    extends State<
        _LinkCard> {
  bool
      _isHovered =
      false;

  @override
  Widget build(
      BuildContext
          context) {
    // final theme =
    //     Theme.of(context);
    final colors =
        STheme.of(context).colorToken;

    return MouseRegion(
      onEnter: (_) =>
          setState(() => _isHovered = true),
      onExit: (_) =>
          setState(() => _isHovered = false),
      cursor:
          SystemMouseCursors.click,
      child:
          GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 350,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: _isHovered ? colors.surface : colors.background,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered ? colors.primary : colors.divider,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(widget.icon, color: colors.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(
                      widget.subtitle,
                      style: TextStyle(color: colors.textSecondary, fontSize: 13),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 14, color: colors.disabled),
            ],
          ),
        ),
      ),
    );
  }
}

/// A reusable widget that provides a slide-up and fade-in entrance animation.
class _EntranceAnimation
    extends StatefulWidget {
  const _EntranceAnimation({
    required this.child,
    this.delay =
        Duration.zero,
  });
  final Widget
      child;
  final Duration
      delay;

  @override
  State<_EntranceAnimation>
      createState() =>
          _EntranceAnimationState();
}

class _EntranceAnimationState
    extends State<
        _EntranceAnimation>
    with
        SingleTickerProviderStateMixin {
  late final AnimationController
      _controller;
  late final Animation<double>
      _opacity;
  late final Animation<Offset>
      _offset;

  @override
  void
      initState() {
    super
        .initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600));

    _opacity =
        Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOut),
    );

    _offset =
        Tween<Offset>(begin: const Offset(0, 30), end: Offset.zero).animate(
      CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOutCubic),
    );

    Future.delayed(
        widget.delay,
        () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void
      dispose() {
    _controller
        .dispose();
    super
        .dispose();
  }

  @override
  Widget build(
      BuildContext
          context) {
    return AnimatedBuilder(
      animation:
          _controller,
      builder:
          (context, child) {
        return Opacity(
          opacity: _opacity.value,
          child: Transform.translate(
            offset: _offset.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}

/// Renders a subtle, animated background pattern.
class _AnimatedBackground
    extends StatefulWidget {
  const _AnimatedBackground();

  @override
  State<_AnimatedBackground>
      createState() =>
          _AnimatedBackgroundState();
}

class _AnimatedBackgroundState
    extends State<
        _AnimatedBackground>
    with
        SingleTickerProviderStateMixin {
  late final AnimationController
      _controller;

  @override
  void
      initState() {
    super
        .initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 30))
      ..repeat();
  }

  @override
  void
      dispose() {
    _controller
        .dispose();
    super
        .dispose();
  }

  @override
  Widget build(
      BuildContext
          context) {
    final theme =
        Theme.of(context);
    final colors =
        STheme.of(context).colorToken;
    final isDark =
        theme.brightness == Brightness.dark;

    return RepaintBoundary(
      child:
          AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _BackgroundPainter(
              color: colors.secondary.withOpacity(isDark ? 0.03 : 0.04),
              animation: _controller.value,
            ),
          );
        },
      ),
    );
  }
}

class _BackgroundPainter
    extends CustomPainter {
  _BackgroundPainter(
      {required this.color,
      required this.animation});
  final Color
      color;
  final double
      animation;

  @override
  void paint(
      Canvas
          canvas,
      Size
          size) {
    final paint = Paint()
      ..color =
          color
      ..style =
          PaintingStyle.stroke
      ..strokeWidth = 1.0;

    const double
        spacing =
        100.0;
    final int
        rows =
        (size.height / spacing).ceil() + 1;
    final int
        cols =
        (size.width / spacing).ceil() + 1;

    for (var i = 0;
        i < cols;
        i++) {
      for (var j = 0;
          j < rows;
          j++) {
        // Create an organic moving grid of pluses/crosses
        final x = i * spacing + (sin(animation * 2 * pi + j) * 10);
        final y = j * spacing + (cos(animation * 2 * pi + i) * 10);

        canvas.drawLine(Offset(x - 5, y), Offset(x + 5, y), paint);
        canvas.drawLine(Offset(x, y - 5), Offset(x, y + 5), paint);
      }
    }
  }

  @override
  bool shouldRepaint(
      covariant _BackgroundPainter
          oldDelegate) {
    return oldDelegate.animation != animation ||
        oldDelegate.color != color;
  }
}
