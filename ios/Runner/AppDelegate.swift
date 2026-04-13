import Flutter
import UIKit
import GoogleMaps
import flutter_foreground_task

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      SwiftFlutterForegroundTaskPlugin.setPluginRegistrantCallback { registry in
          GeneratedPluginRegistrant.register(with: registry)
      }

      let apiKey = Bundle.main.object(forInfoDictionaryKey: "MAPS_API_KEY") as? String ?? ""
      GMSServices.provideAPIKey(apiKey)

      GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
