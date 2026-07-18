import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Divider(color: Colors.white24),

          const SizedBox(height: 15),

          const Text(
            "Follow Us",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () => _launch(
              "https://www.instagram.com/hotel__nathkrupa?igsh=b25hcmswOWpldTNh",
            ),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.05),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white24),
              ),
              child: const FaIcon(
                FontAwesomeIcons.instagram,
                color: Colors.pinkAccent,
                size: 30,
              ),
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Hotel Nathkrupa",
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),

          const SizedBox(height: 20),

          const Divider(color: Colors.white24),

          const SizedBox(height: 20),

          const Text(
            "A Product by",
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),

          const SizedBox(height: 8),

          InkWell(
            onTap: () => _launch(
              "https://www.instagram.com/benchwork.media?igsh=eTVha2R3b3ZpdGM2",
            ),
            borderRadius: BorderRadius.circular(8),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              child: Text(
                "Benchwork Pvt. Ltd. Media",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            "Designed & Developed by",
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),

          const SizedBox(height: 8),

          InkWell(
            onTap: () => _launch(
              "https://www.linkedin.com/in/ashutosh-tiwari-5a4818288/",
            ),
            borderRadius: BorderRadius.circular(8),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              child: Text(
                "Ashutosh Tiwari",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "Need a QR Menu or Restaurant Website?\nGet in touch.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white60, fontSize: 14),
          ),

          const SizedBox(height: 20),

          const Divider(color: Colors.white24),

          const SizedBox(height: 15),

          const Text(
            "© 2026 Hotel Nathkrupa",
            style: TextStyle(color: Colors.white38, fontSize: 13),
          ),

          const SizedBox(height: 5),

          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
