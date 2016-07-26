//
//  ViewControllerRegisterPage.swift
//  Xpress
//
//  Created by Maricela Avina on 7/18/16.
//  Copyright © 2016 RickyAvina. All rights reserved.
//

import UIKit

class ViewControllerRegisterPage: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var checkForAvaliabilityButton: UIButton!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet var firstNameTextField: UITextField!
    
    @IBOutlet weak var midleInitialLabel: UILabel!
    @IBOutlet var middleInitialPicker: UIPickerView!
    
    @IBOutlet var lastNameTextField: UITextField!
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    var middleInitialPickerData : [String] = [String]()
    
    @IBAction func checkForAvaliability(sender: UIButton) {
        
        let middleInitial: String = self.pickerView(middleInitialPicker, titleForRow: middleInitialPicker.selectedRowInComponent(0), forComponent: 0)!
        
        if (firstNameTextField.text?.characters.count > 0 &&  lastNameTextField.text?.characters.count > 0){
            print("firstNametrue")
            if (emailTextField.text?.containsString("@") == true && emailTextField.text?.containsString(".") == true){
                print("email")
                
                if (GlobalData.sharedInstance.verifyUser(email: emailTextField.text!) == true){
                    checkForAvaliabilityButton.hidden = true
                    registerButton.hidden = false
                if (middleInitial.characters.count > 0){
                    GlobalData.sharedInstance.registerUser(firstNameTextField.text!, lastName: lastNameTextField.text!, middleInitial: middleInitial, email: emailTextField.text!, password: passwordTextField.text!, onSuccess: { Void in
                        
                    })
                } else {
                    GlobalData.sharedInstance.registerUser(firstNameTextField.text!, lastName: lastNameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, onSuccess: { Void in
                        
                    })
                }
                } else {
                    print("Login not verified")
                }
            } else {
                print("Enter a valid email")
            }
        } else {
            print("Enter valid First name and last name")
        }
        
    }
    @IBAction func registerUser(sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.middleInitialPicker.delegate = self
        self.middleInitialPicker.dataSource = self
        middleInitialPickerData = ["", "A.", "B.", "C.", "D.", "E.", "F.", "G.", "H.", "I.", "J.", "K.", "L.", "M.", "N.", "O.", "P.", "Q.", "R.", "S.", "T.", "U.", "V.", "W.", "X.", "Y.", "Z."]
        
        registerButton.hidden = true
        checkForAvaliabilityButton.hidden = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // The number of colums of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // the number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return middleInitialPickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return middleInitialPickerData[row]
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // called when the user click on the view
        self.view.endEditing(true)
    }
    
}
