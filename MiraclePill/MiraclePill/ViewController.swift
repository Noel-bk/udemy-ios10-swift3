//
//  ViewController.swift
//  MiraclePill
//
//  Created by Noel Nolan Masters on 1/20/17.
//  Copyright © 2017 Noel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let states = ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]
    
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerBtn: UIButton!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var buynowBtn: UIButton!
    @IBOutlet weak var successImgView: UIImageView!
    
    var requestInfo = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        statePicker.dataSource = self
        statePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stateBtnPressed(_ sender: Any) {
        self.hideTextFields(flag: true)
        statePicker.isHidden = false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState.normal)
        self.hideTextFields(flag: false)
        statePicker.isHidden = true
        
        requestInfo["state"] = states[row]
    }
    
    func hideTextFields(flag: Bool) {
        countryLabel.isHidden = flag
        countryTextField.isHidden = flag
        zipLabel.isHidden = flag
        zipTextField.isHidden = flag
    }
    
    @IBAction func buynowBtnPressed(_ sender: Any) {
        // hide everything
        for view in self.view.subviews as [UIView] {
            if !view.isHidden {
                view.isHidden = true
            }
        }
        successImgView.isHidden = false
        
        // store data
        requestInfo["full_name"] = fullnameTextField.text
        requestInfo["street_address"] = streetAddressTextField.text
        requestInfo["city"] = cityTextField.text
        requestInfo["country"] = countryTextField.text
        requestInfo["zip"] = zipTextField.text
        print("requestInfo: \(requestInfo)")
        
        
        // downcasting??
        let fullName = requestInfo["full_name"]! as String
        // alert
        let alert = UIAlertController(title: "requestInfo", message: "Hello, \(fullName).", preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "close", style: .cancel, handler: nil)
        
        alert.addAction(closeAction)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
}

