//
//  TabBarController.swift
//  WorldTrotterProgrammaticUI
//
//  Created by George Mapaya on 2022-12-27.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the tab bar background color, bar tint color
        view.backgroundColor = .customBgColor
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .systemBlue
        
        // Create the view controllers to be displayed by the tab bar
        let conversionViewController = ConversionViewController()
        let mapViewController = MapViewController()
        self.viewControllers = [conversionViewController, mapViewController]
        createTabBarItems()
    }
    
    /// Creates tab bar items for all of the tab bar's root view controllers
    fileprivate func createTabBarItems() {
        let conversionViewController = viewControllers?[0] as? ConversionViewController
        let mapViewController = viewControllers?[1] as? MapViewController
        conversionViewController?.tabBarItem = UITabBarItem(title: "Conversion", image: UIImage(named: "ConvertIcon"), tag: 0)
        mapViewController?.tabBarItem = UITabBarItem(title: "Map", image: UIImage(named: "MapIcon"), tag: 1)
    }
}
