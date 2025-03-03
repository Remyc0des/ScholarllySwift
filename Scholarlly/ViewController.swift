//
//  ViewController.swift
//  Scholarlly
//
//  Created by student on 11/25/24.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
        if defaults.bool(forKey: "First Launch") == true {
            print("Second+")
            
            defaults.set(true, forKey: "First Launch")
        } else {
            
            print("First")
            
            defaults.set(true, forKey: "First Launch")
        }
         
    }
    

    
}
