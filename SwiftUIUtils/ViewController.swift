//
//  ViewController.swift
//  SwiftUIUtils
//
//  Created by Ryan Lee on 8/11/18.
//  Copyright © 2018 Ryan Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Load the Utils library
    let utils = UIUtils();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Create a button
        let demo_button = utils.create_button(view: self.view, specs: ["x": Double(self.view.center.x) , "y": Double(self.view.frame.height) * 0.15, "text": "button!", "color": UIColor.green]);
        // Specify button action
        demo_button.addTarget(self, action:#selector(buttonClicked), for: .touchUpInside)
        
        // Create a Label
        let demo_label = utils.create_label(view: self.view, specs: ["x": Double(self.view.center.x) , "y": Double(self.view.frame.height) * 0.10, "width": 500.0, "height": 100.0, "text": "hi there, this is a demo for my module!", "color": UIColor.orange]);
    }
    
    // Func for demo_button
    @objc func buttonClicked() {
        print("Button Clicked");
        let start_height = Double(self.view.frame.height) * 0.20;
        utils.create_label(view: self.view, specs: ["x": Double(self.view.frame.width) * drand48() , "y": start_height + Double(self.view.frame.height) * drand48(), "width": 500.0, "height": 100.0, "text": "button pushed", "color": UIColor.purple]);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

