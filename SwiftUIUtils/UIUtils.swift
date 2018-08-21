//
//  UIUtils.swift
//  SwiftUIUtils
//
//  Created by Ryan Lee on 8/11/18.
//  Copyright © 2018 Ryan Lee. All rights reserved.
//

import Foundation
import UIKit

class UIUtils{
    
    let DEFAULT_PARAMS = ["x": 0 as Double, "y": 0 as Double, "width": 70 as Double, "height": 30 as Double, "text": "DEFAULT", "color": UIColor.black] as [String : Any];
    
    /********************* UI Button Creation *********************/
    
    // Creates a button based on passed in parameters
    func create_button (view: UIView, specs: [String : Any]) -> UIButton {
        let button = UIButton();
        var new_specs = self.eval_specs(specs: specs);
        button.setTitle((new_specs["text"] as! String), for: .normal);
        button.setTitleColor(UIColor.blue, for: .normal);
        let width = new_specs["width"] as! Double;
        let height = new_specs["height"] as! Double;
        let x = new_specs["x"] as! Double - width/2;
        let y = new_specs["y"] as! Double - height/2;
        button.setTitleColor(new_specs["color"] as? UIColor, for: .normal)
        button.frame = CGRect(x: x, y: y, width: width, height: height);
        view.addSubview(button);
        return button;
    }
    
    // Creates a label based on passed in parameters
    func create_label(view: UIView, specs: [String: Any]) -> UILabel {
        let label = UILabel();
        var new_specs = self.eval_specs(specs: specs);
        label.text = (new_specs["text"] as! String);
        label.textAlignment = .center;
        let width = new_specs["width"] as! Double;
        let height = new_specs["height"] as! Double;
        let x = new_specs["x"] as! Double - width/2;
        let y = new_specs["y"] as! Double - height/2;
        label.textColor = new_specs["color"] as? UIColor;
        label.frame = CGRect(x: x, y: y, width: width, height: height);
        view.addSubview(label);
        return label;
    }
    
    /********************* Helper Functions *********************/
    func eval_specs(specs: [String: Any]) -> [String: Any]{
        var new_specs = specs;
        for (key, value) in DEFAULT_PARAMS {
            if (!Array(new_specs.keys).contains(key)){
                new_specs[key] = value;
            }
        }
        return new_specs;
    }
}

