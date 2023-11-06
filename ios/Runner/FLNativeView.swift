import Flutter
import UIKit

class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private let messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return CustomPlatformView(frame: frame, viewId: viewId, args: args, messenger: messenger)
    }
}

class CustomPlatformView: NSObject, FlutterPlatformView {
    private var viewController: CustomTableViewController!

    init(frame: CGRect, viewId: Int64, args: Any?, messenger: FlutterBinaryMessenger) {
        super.init()
        viewController = CustomTableViewController()
    }

    func view() -> UIView {
        return viewController.view
    }
}
