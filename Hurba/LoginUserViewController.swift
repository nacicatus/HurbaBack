//
//  LoginUserViewController.swift
//  Hurba
//
//  Created by Saurabh Sikka on 12/09/16.
//  Copyright (c) 2016 Saurabh Sikka. All rights reserved.
//

import UIKit

class LoginUserViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: UIButton) {
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        
        // validate
        let storedUserEmail = NSUserDefaults.standardUserDefaults().stringForKey("userEmail")
        let storedUserPassword = NSUserDefaults.standardUserDefaults().stringForKey("userPassword")
        
        if (storedUserEmail == userEmail && storedUserPassword == userPassword) {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn")
            NSUserDefaults.standardUserDefaults().synchronize()
            self.dismissViewControllerAnimated(true, completion: nil)
        } else {
            displayAlertMessage("Email/Password combination not stored")
            return
        }
    }

    
    
    
    @IBAction func registerButtonTapped(sender: UIButton) {
        
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
