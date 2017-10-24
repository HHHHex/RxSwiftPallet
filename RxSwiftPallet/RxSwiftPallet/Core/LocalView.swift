//
//  LocalView.swift
//  RxSwift&MVVMDemo
//
//  Created by welkj on 2017/10/23.
//  Copyright © 2017年 Heinz. All rights reserved.
//

import UIKit


class LocalView: UIView {
    
    public var color: UIColor?
    
    let r_textField: UITextField = {
        let tf = UITextField.init()
        tf.textAlignment = .right
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let g_textField: UITextField = {
        let tf = UITextField.init()
        tf.textAlignment = .right
        tf.borderStyle = .roundedRect
        return tf
    }()
    let b_textField: UITextField = {
        let tf = UITextField.init()
        tf.textAlignment = .right
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let r_slider: UISlider = {
        let slider = UISlider.init()
        slider.maximumValue = 255
        slider.minimumValue = 0
        slider.tintColor = UIColor.red
        slider.addTarget(self, action:
            #selector(sliderValueChange(sender:)), for: .valueChanged)
        return slider
    }()
    let g_slider: UISlider = {
        let slider = UISlider.init()
        slider.maximumValue = 255
        slider.minimumValue = 0
        slider.tintColor = UIColor.green
        slider.addTarget(self, action:
            #selector(sliderValueChange(sender:)), for: .valueChanged)
        return slider
    }()
    let b_slider: UISlider = {
        let slider = UISlider.init()
        slider.maximumValue = 255
        slider.minimumValue = 0
        slider.tintColor = UIColor.blue
        slider.addTarget(self, action:
            #selector(sliderValueChange(sender:)), for: .valueChanged)
        return slider
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGray
        self.addSubview(r_slider)
        self.addSubview(b_slider)
        self.addSubview(g_slider)
        self.addSubview(r_textField)
        self.addSubview(g_textField)
        self.addSubview(b_textField)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        r_textField.resignFirstResponder()
        g_textField.resignFirstResponder()
        b_textField.resignFirstResponder()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let slider_width = self.frame.size.width * 0.6 - 10
        r_slider.frame = CGRect.init(x: 10, y: 40, width: slider_width, height: 44)
        g_slider.frame = CGRect.init(x: 10, y: 120, width: slider_width, height: 44)
        b_slider.frame = CGRect.init(x: 10, y: 200, width: slider_width, height: 44)
        //textField
        let tf_x = r_slider.frame.maxX + 20
        let tf_width = self.frame.size.width * 0.4 - 30
        r_textField.frame = CGRect.init(x: tf_x, y: 40, width: tf_width, height: 44)
        g_textField.frame = CGRect.init(x: tf_x, y: 120, width: tf_width, height: 44)
        b_textField.frame = CGRect.init(x: tf_x, y: 200, width: tf_width, height: 44)
    }
    
    @objc func sliderValueChange(sender: UISlider) {
        let value = Int(sender.value)
        if sender == r_slider {
            r_textField.text = "\(value)"
        } else if sender == g_slider {
            g_textField.text = "\(value)"
        } else if sender == b_slider {
            b_textField.text = "\(value)"
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
