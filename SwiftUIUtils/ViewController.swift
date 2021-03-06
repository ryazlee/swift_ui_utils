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
        self.hideKeyboard()
        
        // Create a label
        let demo_label = utils.create_label(view: self.view, specs: ["x": Double(self.view.center.x) , "y": Double(self.view.frame.height) * 0.075, "width": 300.0, "height": 200.0, "text": "hi there, this is a demo for my swift ui utils library!", "color": UIColor.orange]);
                
        // Create a text field
        let demo_text_field = utils.create_text_field(view: self.view, specs: ["x": Double(self.view.center.x) , "y": Double(self.view.frame.height) * 0.15, "text": "button!", "color": UIColor.red, "placeholder_text": "Type in something", "border_style": UITextBorderStyle.roundedRect]);
        
        // Create a button
        let demo_button = utils.create_button(view: self.view, specs: ["x": Double(self.view.center.x) , "y": Double(self.view.frame.height) * 0.20, "width": Double(self.view.frame.height) * 0.20, "text": "button!", "color": UIColor.red, "title_color": UIColor.white]);
        // Specify button action
        demo_button.addTarget(self, action:#selector(buttonClicked), for: .touchUpInside);
        
        // Create a image
        let demo_image = utils.create_image(view: self.view, specs: ["image_name": "squirrel", "x": Double(self.view.center.x), "y": Double(self.view.frame.height) * 0.8, "width": Double(self.view.frame.width) * 0.8, "height": Double(self.view.frame.height) * 0.3, "border_style": UITextBorderStyle.roundedRect, "border_width": 6.0 as CGFloat, "border_color": UIColor.yellow]);
    }
    
    // Func for demo_button
    @objc func buttonClicked() {
        print("Button Clicked");
        let start_height = Double(self.view.frame.height) * 0.25;
        utils.create_label(view: self.view, specs: ["x": Double(self.view.frame.width) * drand48() , "y": start_height + Double(self.view.frame.height) * drand48(), "width": 500.0, "height": 100.0, "text": "button clicked", "color": UIColor.purple]);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UIViewController{
    func hideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
