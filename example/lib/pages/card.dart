import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SCard Showcase'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Card 1: With Linear Gradient Background
            const SCard(
              title: 'Gradient Background',
              description: 'This card has a linear gradient background.',
              color: Color.fromARGB(255, 50, 206, 74),
              // gradient: LinearGradient(
              //   colors: [Colors.blueAccent, Colors.purpleAccent],
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              // ),
              shape: SCardShape.rounded,
              borderRadius: 16,
              shadowStyle: SCardShadow.moderate,
              body: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Experience the vibrant colors of a linear gradient background that enhances the visual appeal of the card.',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Card 2: With Image Background
            SCard(
              title: 'Image Background',
              description: 'This card features an image as its background.',
              backgroundImage: const NetworkImage(
                'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?auto=format&fit=crop&w=800&q=60',
              ),
              shape: SCardShape.rounded,
              borderRadius: 16,
              shadowStyle: SCardShadow.prominent,
              body: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.black54,
                child: const Text(
                  'The image background provides a stunning visual backdrop, making the content stand out beautifully.',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Card 3: Default Styling (No Background Customization)
            const SCard(
              title: 'Default Card',
              description:
                  'This card uses the default styling without any background customization.',
              shape: SCardShape.rounded,
              borderRadius: 10,
              shadowStyle: SCardShadow.subtle,
              body: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'This is a default styled card. It uses the standard background color and shadow, making it versatile for various content types.',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
