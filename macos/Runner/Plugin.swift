//
//  Plugin.swift
//  Runner
//
//  Created by HuyNQ on 14/10/24.
//

import Cocoa
import FlutterMacOS

public class Plugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let factory = NativeViewFactory(messenger: registrar.messenger)
    registrar.register(factory, withId: "platformviewtype")
  }
}
