//
//  UIStoryboard+Extension.swift
//  RateX
//
//  Created by Andre Souza on 12/06/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import Foundation
import UIKit


enum StoryboardType: String {
    
    case home   = "Home"
    
    var name: String {
        return rawValue
    }

}

extension UIStoryboard {
    
    convenience init(type storyboardType: StoryboardType, bundle: Bundle? = nil) {
        self.init(name: storyboardType.name, bundle: bundle)
    }
    
    func instantiateViewController<T: UIViewController>(ofType type: T.Type) -> T {
        guard let viewController = instantiateViewController(withIdentifier: T.identifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.identifier) ")
        }
        return viewController
    }
    
}
