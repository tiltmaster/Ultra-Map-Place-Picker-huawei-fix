import 'package:flutter/material.dart';
import 'package:ultra_map_place_picker/ultra_map_place_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map thumbnail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UltraMapThumbnail(
              height: 250,
              width: 250,
              borderRadius: BorderRadius.circular(16),
              enableScrolling: false,
              enableMapTypeButton: false,
              enableMyLocationButton: false,
              googleApiKey: 'YourApiKey',
              initialPosition:
                  LocationModel(25.1974767426511, 55.279669543133615),
              mapTypes: (isHuaweiDevice) =>
                  isHuaweiDevice ? [UltraMapType.normal] : UltraMapType.values,
              zoomControlsEnabled: false,
              //  resizeToAvoidBottomInset: true, // only works in page mode, less flickery, remove if wrong offsets
            ),
          ],
        ),
      ),
    );
  }
}
