//
//  RegisterPageViewController.swift
//  Late_Runner
//
//  Created by Students on 2/22/19.
//  Copyright © 2019 Students. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var useremail: UITextField!
    @IBOutlet weak var userpassword: UITextField!
    @IBOutlet weak var userrepeatpassword: UITextField!
    @IBOutlet weak var usercontact: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func registerbutton(_ sender: Any) {
        let userEmailid=useremail.text;
        let userPass=userpassword.text;
        let userrepeatPass=userrepeatpassword.text;
        let userCon=usercontact.text;
        
        if((userEmailid?.isEmpty)!  || (userPass?.isEmpty)! || (userrepeatPass?.isEmpty)! || (userCon?.isEmpty)!)
        {
            displayMyAlertMessage(userMessage: "All fields are required");
            return;
        }
        
        if(userPass != userrepeatPass)
        {
            displayMyAlertMessage(userMessage: "Passwords do not message");
            return;
        }
        // store thae data
        UserDefaults.standard.set(userEmailid,forKey:"userEmailid");
        UserDefaults.standard.set(userPass,forKey:"userPass");
        UserDefaults.standard.set(userCon,forKey:"userCon");
        UserDefaults.standard.synchronize();
        
        
        
        
        //displaying that te data is stored
        var myAlert = UIAlertController(title:"Alert",message:"Registration is successful. Thank you!",preferredStyle:UIAlertController.Style.alert);
        let okbutton=UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){
            action in self.dismiss(animated: true,completion:nil);
        }
        myAlert.addAction(okbutton)
        self.present(myAlert,animated:true,completion:nil)
    }
    
    func displayMyAlertMessage(userMessage:String)
    {
        var myAlert = UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertController.Style.alert);
        let okbutton=UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okbutton)
        self.present(myAlert,animated:true,completion:nil)
    }
    
    
    
    @IBAction func loginback(_ sender: Any) {
        self.performSegue(withIdentifier: "loginView", sender: self)
    }
    
    
    
    
    /*
    // zzzz

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
