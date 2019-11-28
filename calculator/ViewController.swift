//
//  ViewController.swift
//  calculator
//
//  Created by Kim Yeon Jeong on 2019/11/28.
//  Copyright © 2019 Kim Yeon Jeong. All rights reserved.
// https://www.youtube.com/watch?v=5tpQEsJ0iVg

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen : Double = 0
    var previouNumber : Double = 0
    var performingMath = false
    var operation = 0
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            label.text = String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        } else {
            label.text = label.text! + String(sender.tag - 1)
                   numberOnScreen = Double(label.text!)!
        }
        
    }
    
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if label.text! != "" && sender.tag != 11 && sender.tag != 16 {
            previouNumber = Double(label.text!)!
            if sender.tag == 12 {
                  label.text = " / "
            }
            else if sender.tag == 13 {
                  label.text = " * "
            }
            else if sender.tag == 14 {
                label.text = " - "
            }
            else if sender.tag == 15 {
                label.text = " + "
            }
            operation = sender.tag
            performingMath = true
        } else if sender.tag == 16 {
            if operation == 12{
                 label.text = String(previouNumber / numberOnScreen)
            }
            else if operation == 13{
                 label.text = String(previouNumber * numberOnScreen)
            }
            else if operation == 14{
                 label.text = String(previouNumber - numberOnScreen)
            }
            else if operation == 15{
                
                label.text = String(previouNumber + numberOnScreen)
                
            }
        } else if sender.tag == 11 {
            label.text = ""
            previouNumber = 0
            numberOnScreen = 0
            operation = 0
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
