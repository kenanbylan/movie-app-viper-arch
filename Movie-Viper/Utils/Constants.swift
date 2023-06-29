//
//  Constants.swift
//  viper-fetch-example
//
//  Created by Kenan Baylan on 27.06.2023.
//

import Foundation
import UIKit

class Constant {
    
    static var screenWith: CGFloat {
        
        get {
            if UIDevice.current.orientation.isLandscape {
                return max(UIScreen.main.bounds.size.height, UIScreen.main.bounds.size.width)
            } else {
                return min(UIScreen.main.bounds.size.height, UIScreen.main.bounds.size.width)
            }
        }
    }
}


