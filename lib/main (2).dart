import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hatilaqi/app.dart';

void main() => runApp(
      EasyLocalization(
        child: MyApp(),
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', 'DZ'),
        ],
        path: 'assets/language',
        // fallbackLocale: Locale('en', 'US'),
        // useOnlyLangCode: true,
        // optional assetLoader default used is RootBundleAssetLoader which uses flutter's assetloader
        // assetLoader: RootBundleAssetLoader()
        // assetLoader: NetworkAssetLoader()
        // assetLoader: TestsAssetLoader()
        // assetLoader: FileAssetLoader()
        // assetLoader: StringAssetLoader()
      ),
    );
//void main() => runApp(TestListView());
