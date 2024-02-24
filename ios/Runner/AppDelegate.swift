import UIKit
import Flutter
import workmanager

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    WorkmanagerPlugin.registerBGProcessingTask(withIdentifier: "download-task")
    WorkmanagerPlugin.registerBGProcessingTask(withIdentifier: "upload-task")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
