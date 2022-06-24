import 'dart:io';

import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';

class NFTModel {
  static Future<File> downloadModel() async {
    final model = await FirebaseModelDownloader.instance.getModel(
      "nft-detector",
      FirebaseModelDownloadType.latestModel,
      FirebaseModelDownloadConditions(
        iosAllowsCellularAccess: true,
        iosAllowsBackgroundDownloading: false,
        androidChargingRequired: false,
        androidWifiRequired: false,
        androidDeviceIdleRequired: false,
      ),
    );

    print(model.name);
    print(model.size);
    return model.file;
  }
}
