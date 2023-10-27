import SwiftUI
@available(iOS 13.0, *)
@objc(BoilerLibrary)
open class BoilerLibrary: RCTEventEmitter {
    
    override init() {
        super.init()
        self.setupNotifications()
        EventEmitter.sharedInstance.registerEventEmitter(eventEmitter: self)
    }
    
    /// Base overide for RCTEventEmitter.
    ///
    /// - Returns: all supported events
    @objc open override func supportedEvents() -> [String] {
        return EventEmitter.sharedInstance.allEvents
    }

  @objc(multiply:withB:withResolver:withRejecter:)
  func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
    resolve(a*b)
  }
    @objc(showNativeUI)
    func showNativeUI()  {
        DispatchQueue.main.async {
            let viewController = UIHostingController(rootView: SampleDetailScreen())
            viewController.modalPresentationCapturesStatusBarAppearance = true
            viewController.modalPresentationStyle = .fullScreen
            UIApplication.getTopViewController()?.present(viewController, animated: true)
            //        UIWindow.fadeInNewRootViewController(viewController)
        }
    }
    
    func setupNotifications() {
          NotificationCenter.default.addObserver(self, selector: #selector(self.onSystemUpdatedContent), name: NSNotification.Name("event"), object: nil)
      }
    
    @objc private func onSystemUpdatedContent(notification: Notification) {
          print("notification recieved")
        EventEmitter.sharedInstance.dispatch(name: "event", body: "shahul")
       }
}


extension UIApplication {

    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)

        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}

