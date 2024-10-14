import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
      
      let registrar = flutterViewController.registrar(forPlugin: "plugin-name")
      let factory = NativeViewFactory(messenger: registrar.messenger)
      registrar.register(
        factory,
        withId: "platformviewtype")
  }
}
