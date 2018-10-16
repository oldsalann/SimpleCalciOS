//
//  ViewController.swift
//  SimpleCalciOS
//
//  Created by Nicholas Olds on 10/16/18.
//  Copyright © 2018 Nicholas Olds. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var userIsTyping = false
    var count = 0
    @IBOutlet weak var lblDisplay: UILabel!
    
    @IBAction func btnClickCalc(_ sender: UIButton) {
        let digit = sender.currentTitle!
        count = count + 1
        if (!userIsTyping) {
            lblDisplay.text = digit
            userIsTyping = true
        } else {
            let textInDisplay = lblDisplay.text!
            lblDisplay.text = textInDisplay + digit
        }
    }
    
    var displayValue: Int {
        get {
            return Int(lblDisplay.text!)!
        }
        set {
            lblDisplay.text! = String(newValue)
        }
    }
    @IBAction func btnPerform(_ sender: UIButton) {
        if userIsTyping {
            brain.setOperand(displayValue)
            userIsTyping = false;
        }
        if let mathSymbol = sender.currentTitle {
            brain.performOp(mathSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

