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
    
    let DEFAULT_PARAMS = ["x": 50 as Double, "y": 50 as Double, "width": 100 as Double, "height": 30 as Double, "text": "DEFAULT", "color": UIColor.black, "placeholder_text": "DEFAULT", "border_style": UITextBorderStyle.line, "title_color": UIColor.black, "image_name": "DEFAULT"] as [String : Any];
    
    /********************* UI Button Creation *********************/
    
    // Creates a button based on passed in parameters
    func create_button (view: UIView, specs: [String : Any]) -> UIButton {
        var new_specs = self.eval_specs(specs: specs);
        let button = UIButton();
        // Begin non-customizable specs
        button.layer.cornerRadius = 10.0;
        // End non-customizable specs
        // Begin customizable specs
        button.setTitle((new_specs["text"] as! String), for: .normal);
        button.setTitleColor(new_specs["title_color"] as? UIColor, for: .normal);
        button.backgroundColor = new_specs["color"] as? UIColor;
        button.frame = create_frame(specs_x: new_specs["x"]!, specs_y: new_specs["y"]!, specs_width: new_specs["width"]!, specs_height: new_specs["height"]!);
        // End customizable specs
        view.addSubview(button);
        return button;
    }
    
    // Creates a label based on passed in parameters
    func create_label(view: UIView, specs: [String: Any]) -> UILabel {
        var new_specs = self.eval_specs(specs: specs);
        let label = UILabel();
        // Begin non-customizable specs
        label.textAlignment = .center;
        label.lineBreakMode = .byWordWrapping;
        label.numberOfLines = 10
        // End non-customizable specs
        // Begin customizable specs
        label.text = (new_specs["text"] as! String);
        label.textColor = new_specs["color"] as? UIColor;
        label.frame = create_frame(specs_x: new_specs["x"]!, specs_y: new_specs["y"]!, specs_width: new_specs["width"]!, specs_height: new_specs["height"]!);
        // End customizable specs
        view.addSubview(label);
        return label;
    }
    
    // Creates a label based on passed in parameters
    func create_text_field(view: UIView, specs: [String: Any]) -> UITextField {
        var new_specs = self.eval_specs(specs: specs);
        let text_field = UITextField();
        // Begin non-customizable specs
        // End non-customizable specs
        // Begin customizable specs
        text_field.placeholder = new_specs["placeholder_text"] as? String;
        text_field.borderStyle = new_specs["border_style"] as! UITextBorderStyle;
        text_field.textColor = new_specs["color"] as? UIColor;
        text_field.frame = create_frame(specs_x: new_specs["x"]!, specs_y: new_specs["y"]!, specs_width: new_specs["width"]!, specs_height: new_specs["height"]!);
        // End customizable specs
        view.addSubview(text_field);
        return text_field;
    }
    
    func create_image(view: UIView, specs: [String: Any]) -> UIImageView {
        var new_specs = self.eval_specs(specs: specs);
        // Begin non-customizable specs
        // End non-customizable specs
        // Begin customizable specs
        let image_name = new_specs["image_name"] as! String;
        let image = UIImage(named: image_name)
        let image_view = UIImageView(image: image!)
        image_view.frame = create_frame(specs_x: new_specs["x"]!, specs_y: new_specs["y"]!, specs_width: new_specs["width"]!, specs_height: new_specs["height"]!);
        // End customizable specs
        view.addSubview(image_view);
        return image_view;
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
    // Returns a frame for the UI Elems based on x, y, width, and height
    func create_frame(specs_x: Any, specs_y: Any, specs_width: Any, specs_height: Any) -> CGRect {
        let width = specs_width as! Double;
        let height = specs_height as! Double;
        let x = specs_x as! Double - width/2;
        let y = specs_y as! Double - height/2;
        return CGRect(x: x, y: y, width: width, height: height);
    }
}

