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
    
    let DEFAULT_PARAMS = ["x": 0 as Double, "y": 0 as Double, "width": 70 as Double, "height": 30 as Double, "text": "DEFAULT", "color": UIColor.black, "placeholder_text": "DEFAULT", "border_style": UITextBorderStyle.line, "title_color": UIColor.black] as [String : Any];
    
    /********************* UI Button Creation *********************/
    
    // Creates a button based on passed in parameters
    func create_button (view: UIView, specs: [String : Any]) -> UIButton {
        let button = UIButton();
        var new_specs = self.eval_specs(specs: specs);
        button.setTitle((new_specs["text"] as! String), for: .normal);
        button.setTitleColor(new_specs["title_color"] as? UIColor, for: .normal);
        button.backgroundColor = new_specs["color"] as? UIColor;
        button.layer.cornerRadius = 10.0;
        let width = new_specs["width"] as! Double;
        let height = new_specs["height"] as! Double;
        let x = new_specs["x"] as! Double - width/2;
        let y = new_specs["y"] as! Double - height/2;
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
        label.lineBreakMode = .byWordWrapping;
        label.numberOfLines = 10
        let width = new_specs["width"] as! Double;
        let height = new_specs["height"] as! Double;
        let x = new_specs["x"] as! Double - width/2;
        let y = new_specs["y"] as! Double - height/2;
        label.textColor = new_specs["color"] as? UIColor;
        label.frame = CGRect(x: x, y: y, width: width, height: height);
        view.addSubview(label);
        return label;
    }
    
    // Creates a label based on passed in parameters
    func create_text_field(view: UIView, specs: [String: Any]) -> UITextField {
        let text_field = UITextField();
        var new_specs = self.eval_specs(specs: specs);
        text_field.placeholder = new_specs["placeholder_text"] as? String;
        text_field.borderStyle = new_specs["border_style"] as! UITextBorderStyle;
        let width = new_specs["width"] as! Double;
        let height = new_specs["height"] as! Double;
        let x = new_specs["x"] as! Double - width/2;
        let y = new_specs["y"] as! Double - height/2;
        text_field.textColor = new_specs["color"] as? UIColor;
        text_field.frame = CGRect(x: x, y: y, width: width, height: height);
        view.addSubview(text_field);
        return text_field;
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

