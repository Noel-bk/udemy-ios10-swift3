//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Noel Nolan Masters on 2/8/17.
//  Copyright © 2017 Noel. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLbl: UILabel!
    
    var btnSound: AVAudioPlayer!
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    var currentOperation:Operation = Operation.Empty
    var runningNumber:String = ""
    var leftValStr:String = ""
    var rightValStr:String = ""
    var result:Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    @IBAction func clearPressed(_ sender: Any) {
        outputLbl.text = "0"
        processOperation(operation: .Empty)
    }
    
    @IBAction func numberPressed(sender: UIButton) {
        playSound()
        runningNumber += "\(sender.tag)"
        outputLbl.text = displayCommas(str: runningNumber)
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(operation: .Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(operation: .Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(operation: .Subtract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(operation: .Add)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(operation: currentOperation)
    }
    
    func playSound() {
        if (btnSound.isPlaying) {
            btnSound.stop()
        }
        btnSound.play()
    }
    
    func processOperation(operation: Operation) {
        playSound()
        if (currentOperation != Operation.Empty) {
            
            // A user selected an operator, but then selected another operator without first entering a number
            if (runningNumber != "") {
                rightValStr = runningNumber
                runningNumber = ""
                
                if (currentOperation == Operation.Multiply) {
                    result = Double(leftValStr)! * Double(rightValStr)!
                } else if (currentOperation == Operation.Divide) {
                    result = Double(leftValStr)! / Double(rightValStr)!
                } else if (currentOperation == Operation.Subtract) {
                    result = Double(leftValStr)! - Double(rightValStr)!
                } else if (currentOperation == Operation.Add) {
                    result = Double(leftValStr)! + Double(rightValStr)!
                }
                
                leftValStr = forTailingZero(temp: result)
                outputLbl.text = leftValStr
            }
            currentOperation = operation
        } else {
            // This is the first time an operator has been pressed
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
    func displayCommas(str: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.numberStyle = .decimal
        
        let result:String = numberFormatter.string(from: NSNumber.init(value: Int32(str)!))!
        
        return result
    }
    
    func forTailingZero(temp: Double) -> String {
        let tempVar = String(format: "%g", temp)
        return tempVar
    }
}

