import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// MAIN VIDEO (REMOTE USER)
          Positioned.fill(
            child: Image.network(
              "https://i.pravatar.cc/600?img=45",
              fit: BoxFit.cover,
            ),
          ),

          /// TOP BAR
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sneha Patil | 00:23",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          /// SELF VIDEO (PIP VIEW)
          Positioned(
            right: 16,
            bottom: 180,
            child: Container(
              height: 140,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white, width: 2),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://i.pravatar.cc/200?img=12",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          /// BOTTOM CONTROLS
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _controlButton(
                  icon: Icons.cameraswitch,
                  bgColor: Colors.black54,
                  iconColor: Colors.white,
                ),
                _controlButton(
                  icon: Icons.call_end,
                  bgColor: Colors.red,
                  iconColor: Colors.white,
                  size: 70,
                  onTap: () {
                    Navigator.pop(context); // End call
                  },
                ),
                _controlButton(
                  icon: Icons.mic,
                  bgColor: Colors.black54,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _controlButton({
    required IconData icon,
    required Color bgColor,
    required Color iconColor,
    double size = 60,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor, size: 28),
      ),
    );
  }
}
