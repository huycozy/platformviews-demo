import UIKit
import Flutter
import VisualEffectView


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let viewFactory = BlurViewFactory()
    registrar(forPlugin: "blur")!.register(viewFactory, withId: "blureTest" )
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

public class BlurViewFactory: NSObject, FlutterPlatformViewFactory {
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
    public func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
        ) -> FlutterPlatformView {
        return BlurView(frame, viewId: viewId, args: args)
    }
}

public class BlurView : NSObject, FlutterPlatformView {
    let frame: CGRect
    let viewId: Int64
    let radius: CGFloat
    
    init(_ frame: CGRect, viewId: Int64, args: Any?) {
        self.frame = frame
        self.viewId = viewId
        let params = args as! NSDictionary
        self.radius = params["radius"] as! CGFloat
    }
    
    
    public func view() -> UIView {
        let view = UIView()
        let visualEffectView = VisualEffectView(frame: view.bounds)
        visualEffectView.blurRadius = self.radius
        visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(visualEffectView)
        return view
    }
}
