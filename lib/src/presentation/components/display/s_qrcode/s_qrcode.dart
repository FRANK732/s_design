import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../../s_design.dart';

enum SQRCodeStatus {
  active,
  expired,
  loading,
  scanned,
}

class SQRCode
    extends StatelessWidget {
  const SQRCode({
    super.key,
    required this.value,
    this.size =
        160,
    this.icon,
    this.iconSize =
        40,
    this.color =
        Colors.black,
    this.backgroundColor =
        Colors.white,
    this.bordered =
        true,
    this.errorLevel =
        QrErrorCorrectLevel.M,
    this.status =
        SQRCodeStatus.active,
    this.onRefresh,
    this.padding = const EdgeInsets
        .all(
        12),
  });

  /// The core exact data string logically mapped into the QR matrix.
  final String
      value;
      
  /// The physical structural dimension scaling both height and width of the square.
  final double
      size;
      
  /// Independent widget overlaid perfectly in the center (often a brand logo).
  final Widget?
      icon;
      
  /// Physical dimension clamping the bounding box of the overlay `icon`.
  final double
      iconSize;
      
  /// Extracted hex tint painting the active QR data modules.
  final Color
      color;
      
  /// Replaces the default transparent layer behind the QR module grid.
  final Color
      backgroundColor;
      
  /// Toggles the native structural outline tracing the QR padding bounds.
  final bool
      bordered;
      
  /// Error correction complexity determining the grid density (defaults to M).
  final int
      errorLevel;
      
  /// Current state mapping rendering overlays over the QR code (e.g. `loading`, `expired`).
  final SQRCodeStatus
      status;
      
  /// Event trigger bound to the `Refresh` button displayed exclusively in the `expired` state.
  final VoidCallback?
      onRefresh;
      
  /// The explicit quiet zone padding enforcing safe scanning distance from other layout boundaries.
  final EdgeInsetsGeometry
      padding;

  @override
  Widget build(
      BuildContext
          context) {
    return Container(
      width:
          size,
      height:
          size,
      padding:
          padding,
      decoration:
          BoxDecoration(
        color: backgroundColor,
        border: bordered ? Border.all(color: Colors.grey.shade200) : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child:
          Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // QR Code
          Opacity(
            opacity: status == SQRCodeStatus.active ? 1.0 : 0.2, // Fade if not active
            child: QrImageView(
              data: value,
              errorCorrectionLevel: errorLevel,
              eyeStyle: QrEyeStyle(
                eyeShape: QrEyeShape.square,
                color: color,
              ),
              dataModuleStyle: QrDataModuleStyle(
                dataModuleShape: QrDataModuleShape.square,
                color: color,
              ),
              padding: EdgeInsets.zero,
              // gapless: false,
            ),
          ),

          // Icon Overlay (if active)
          if (icon != null && status == SQRCodeStatus.active)
            Center(
              child: Container(
                width: iconSize,
                height: iconSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.white, width: 2), // White border around icon
                  boxShadow: <BoxShadow>[
                    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4),
                  ],
                ),
                child: icon,
              ),
            ),

          // Status Overlay
          if (status != SQRCodeStatus.active) _buildStatusOverlay(context),
        ],
      ),
    );
  }

  Widget _buildStatusOverlay(
      BuildContext
          context) {
    switch (
        status) {
      case SQRCodeStatus.loading:
        return const Center(
          child: CircularProgressIndicator(), // Use SSpin if available
        );
      case SQRCodeStatus.expired:
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'QR code expired',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 8),
              SButton(
                variant: SButtonVariant.link,
                onPressed: onRefresh,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.refresh, size: 14),
                    SizedBox(width: 4),
                    Text('Refresh'),
                  ],
                ),
              ),
            ],
          ),
        );
      case SQRCodeStatus.scanned:
        return const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.check_circle_outline, color: Colors.green, size: 32),
              SizedBox(height: 8),
              Text('Scanned', style: TextStyle(color: Colors.grey)),
            ],
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
