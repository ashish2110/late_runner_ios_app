//
//  MessageViewController.swift
//  Late_Runner
//
//  Created by Stevens on 5/8/19.
//  Copyright © 2019 Students. All rights reserved.
//

import UIKit
import MessageUI

class MessageViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtMsg: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendSMS(_ sender: Any) {
        
        let msgVC = MFMessageComposeViewController()
        msgVC.body=txtMsg.text!
        msgVC.recipients=[txtPhone.text!]
        msgVC.messageComposeDelegate = self
        self.present(msgVC, animated: true, completion:nil)
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
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
