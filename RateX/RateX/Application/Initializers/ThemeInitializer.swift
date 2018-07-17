//
//  ThemeInitializer.swift
//  RateX
//
//  Created by Andre on 12/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import UIKit

class ThemeInitializer: Initializable {
    
    func performInitialization() {
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().barTintColor = .mainColor
        UINavigationBar.appearance().prefersLargeTitles = false
        let titleArr: [NSAttributedStringKey : Any] = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().titleTextAttributes = titleArr
        UINavigationBar.appearance().largeTitleTextAttributes = titleArr
    }
    
}
