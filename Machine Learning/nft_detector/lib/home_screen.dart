import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:nft_detector/download_model.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';

  @override
  void initState() {
    super.initState();
    loadCamera();
    // loadmodel();
  }

  loadCamera() async {
    List<CameraDescription> cameras = await availableCameras();

    cameraController = CameraController(cameras[0], ResolutionPreset.low);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController!.startImageStream((imageStream) {
            cameraImage = imageStream;

            // runModel();
          });
        });
      }
    });
  }

  // runModel() async {
  //   if (cameraImage != null) {
  //     var predictions = await Tflite.runModelOnFrame(
  //         bytesList: cameraImage!.planes.map((plane) {
  //           return plane.bytes;
  //         }).toList(),
  //         imageHeight: cameraImage!.height,
  //         imageWidth: cameraImage!.width,
  //         imageMean: 127.5,
  //         imageStd: 127.5,
  //         rotation: 90,
  //         numResults: 2,
  //         threshold: 0.1,
  //         asynch: true);
  //     for (var element in predictions!) {
  //       setState(() {
  //         output = element['label'];
  //       });
  //     }
  //   }
  // }

  loadmodel() async {
    final file = await NFTModel.downloadModel();

    final interpreter = tfl.Interpreter.fromFile(file);

    print(interpreter.isAllocated);

    // // input: List<Object>
    // var inputs = cameraImage!.planes.map((e) => e.bytes).toList();

    // var output0 = List<double>.filled(1, 0);
    // var output1 = List<double>.filled(1, 0);

    // // output: Map<int, Object>
    // var outputs = {0: output0, 1: output1};

    // // inference
    // interpreter.run(inputs, outputs);

    // // print outputs
    // print(outputs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Emotion Detection App')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: !cameraController!.value.isInitialized
                ? Container()
                : AspectRatio(
                    aspectRatio: cameraController!.value.aspectRatio,
                    child: CameraPreview(cameraController!),
                  ),
          ),
        ),
        TextButton(
            onPressed: () async {
              // final file = await NFTModel.downloadModel();

              // print(file.path);
              // print(file.isAbsolute);
              // print(file.parent);
              // print(file.uri.toString());

              loadmodel();
            },
            child: const Text('IDENTIFY')),
        TextButton(
            onPressed: () async {
              final file = await NFTModel.downloadModel();
              final interpreter = tfl.Interpreter.fromFile(file);
              interpreter.close();
            },
            child: const Text('CLOSED')),
        Text(
          output,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      ]),
    );
  }
}
