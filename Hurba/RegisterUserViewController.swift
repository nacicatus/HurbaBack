//
//  RegisterUserViewController.swift
//  Hurba
//
//  Created by Saurabh Sikka on 12/09/16.
//  Copyright (c) 2016 Saurabh Sikka. All rights reserved.
//

import UIKit

class RegisterUserViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func haveAccountButton(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func registerButtonTapped(sender: UIButton) {
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let repeatPassword = repeatPasswordTextField.text
        
        // check for entities
        
        if (userEmail.isEmpty || userPassword.isEmpty || repeatPassword.isEmpty) {
            displayAlertMessage("All fields must be filled")
            return
        }
        
        
        //check if passwords match
        if (userPassword != repeatPassword) {
            displayAlertMessage("Passwords do not match")
            return
        }
        
        // Store Data
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "userEmail")
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey: "userPassword")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        
        // Display Alert message with confirmation
        var myAlert = UIAlertController(title: "Alert", message: "Registration successful. Thank you!", preferredStyle: UIAlertControllerStyle.Alert)
        var okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default) {
            action in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }

    
    func displayAlertMessage(userMessage: String) {
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        var okAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
