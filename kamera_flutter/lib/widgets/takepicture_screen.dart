import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'filter_carousel.dart';
import 'displaypicture_screen.dart';

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;
  const TakePictureScreen({super.key, required this.camera});

  @override
  State<TakePictureScreen> createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Fungsi pengambilan foto yang menavigasi ke FilterCarousel
  void _takePicture() async {
    // Pastikan controller sudah siap
    try {
      await _initializeControllerFuture;

      // Ambil foto (operasi async)
      final XFile imageFile = await _controller.takePicture();

      if (!mounted) return;

      // Navigasi ke halaman filter dengan membawa path gambar
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PhotoFilterCarousel(
            imagePath: imageFile.path, 
          ),
        ),
      );
    } catch (e) {
      // Tampilkan error jika gagal
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error mengambil gambar: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture - 2341720222')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If initialized, show the preview
            return CameraPreview(_controller);
          } else {
            // Otherwise show a loading indicator
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'displaypicture_screen.dart';

// class TakePictureScreen extends StatefulWidget {
//   final CameraDescription camera;
//   const TakePictureScreen({super.key, required this.camera});

//   @override
//   State<TakePictureScreen> createState() => _TakePictureScreenState();
// }

// class _TakePictureScreenState extends State<TakePictureScreen> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();
//     _controller = CameraController(
//       widget.camera,
//       ResolutionPreset.medium,
//     );

//     _initializeControllerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Take a picture - 2341720222')),
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // If initialized, show the preview
//             return CameraPreview(_controller);
//           } else {
//             // Otherwise show a loading indicator
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           try {
//             await _initializeControllerFuture;
//             final image = await _controller.takePicture();

//             if (!context.mounted) return;
//             await Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => DisplayPictureScreen(imagePath: image.path),
//               ),
//             );
//           } catch (e) {
//             print(e);
//           }
//         },
//         child: const Icon(Icons.camera_alt),
//       ),
//     );
//   }
// }
