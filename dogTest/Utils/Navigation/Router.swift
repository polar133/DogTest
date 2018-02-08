
//
//  Router.swift
//  Router
//
//  Created by Sacha Durand Saint Omer on 27/02/2017.
//  Copyright © 2017 freshOS. All rights reserved.
//
import UIKit

public class Router {
    public static let `default`:IsRouter = DefaultRouter()
}

public protocol Navigation { }

public protocol AppNavigation {
    func viewcontrollerForNavigation(navigation: Navigation) -> UIViewController
    func navigate(_ navigation: Navigation, from: UIViewController, to: UIViewController)
    func start(_ navigation: Navigation, from: UIViewController, to: UIViewController)
    func presenterVC(from: UIViewController, to: UIViewController)
}

public protocol IsRouter {
    func setupAppNavigation(appNavigation: AppNavigation)
    func navigate(_ navigation: Navigation, from: UIViewController)
    func start(from: UIViewController, to: Navigation)
    func presenterVC(from: UIViewController, to: Navigation)
    func didNavigate(block: @escaping (Navigation) -> Void)
    var appNavigation: AppNavigation? { get }
}

public extension UIViewController {
    public func navigate(_ navigation: Navigation) {
        Router.default.navigate(navigation, from: self)
    }
    
    public func start(_ navigation: Navigation){
        Router.default.start(from: self, to: navigation)
    }
    
    public func presenterVC(_ navigation: Navigation){
        Router.default.presenterVC(from: self, to: navigation)
    }
    
}

public class DefaultRouter: IsRouter {
    
    
    public var appNavigation: AppNavigation?
    var didNavigateBlocks = [((Navigation) -> Void)] ()
    
    public func setupAppNavigation(appNavigation: AppNavigation) {
        self.appNavigation = appNavigation
    }
    
    public func navigate(_ navigation: Navigation, from: UIViewController) {
        if let toVC = appNavigation?.viewcontrollerForNavigation(navigation: navigation) {
            appNavigation?.navigate(navigation, from: from, to: toVC)
            for b in didNavigateBlocks {
                b(navigation)
            }
        }
    }
    
    public func start(from: UIViewController, to: Navigation) {
        if let toVC = appNavigation?.viewcontrollerForNavigation(navigation: to) {
            appNavigation?.start(to, from: from, to: toVC)
        }
    }
    
    public func presenterVC(from: UIViewController, to: Navigation) {
        if let toVC = appNavigation?.viewcontrollerForNavigation(navigation: to) {
            appNavigation?.presenterVC(from: from, to: toVC)
        }
    }
    
    public func didNavigate(block: @escaping (Navigation) -> Void) {
        didNavigateBlocks.append(block)
    }
}

// Injection helper
public protocol Initializable { init() }
open class RuntimeInjectable: NSObject, Initializable {
    public required override init() {}
}

public func appNavigationFromString(_ appNavigationClassString: String) -> AppNavigation {
    let appNavClass = NSClassFromString(appNavigationClassString) as! RuntimeInjectable.Type
    let appNav = appNavClass.init()
    return appNav as! AppNavigation
}

