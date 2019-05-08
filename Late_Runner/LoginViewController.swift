//
//  LoginViewController.swift
//  Late_Runner
//
//  Created by Students on 2/22/19.
//  Copyright © 2019 Students. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var useremail: UITextField!
    @IBOutlet weak var userpassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        let userEmail=useremail.text;
        let userPassword=userpassword.text;
        
        let emailstored=UserDefaults.standard.string(forKey:"userEmailid");
        let passwordstored=UserDefaults.standard.string(forKey:"userPass");
        
        if(userEmail==emailstored){
            if(userPassword==passwordstored){
                UserDefaults.standard.set(true, forKey:"UserLoggedin");
                UserDefaults.standard.synchronize();
                self.dismiss(animated: true, completion: nil)
            }
            else{
                var myAlert = UIAlertController(title:"Alert",message:"user_id or password is wrong",preferredStyle:UIAlertController.Style.alert);
                let okbutton=UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                myAlert.addAction(okbutton)
                self.present(myAlert,animated:true,completion:nil)
            }
        }
        else
        {
            var myAlert = UIAlertController(title:"Alert",message:"user_id or password is wrong",preferredStyle:UIAlertController.Style.alert);
            let okbutton=UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            myAlert.addAction(okbutton)
            self.present(myAlert,animated:true,completion:nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
