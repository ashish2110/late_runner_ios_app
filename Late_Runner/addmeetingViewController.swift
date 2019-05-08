//
//  addmeetingViewController.swift
//  Late_Runner
//
//  Created by Students on 2/22/19.
//  Copyright © 2019 Students. All rights reserved.
//

import UIKit

class addmeetingViewController: UIViewController {

    
    @IBOutlet weak var info: UITextField!
    @IBOutlet weak var datevalue: UITextField!
    
    private var datePicker: UIDatePicker?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker=UIDatePicker()
        datePicker?.datePickerMode = .dateAndTime
        datePicker?.addTarget(self, action: #selector(addmeetingViewController.dateChanged(datePicker:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target:self, action: #selector(addmeetingViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        datevalue.inputView=datePicker
        // Do any additional setup after loading the view.
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat="yyyy-MM-dd HH:mm:ss "
        datevalue.text = dateFormatter.string(from:datePicker.date)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
     }
    */
    @IBAction func done_button(_ sender: Any) {
        checkMaxLength(textField: info, maxLength: 20)
        
        var title_val=info.text
        var date_val=datevalue.text
        var title_list:[String]=[]
        var date_list:[String]=[]
        
        if((title_val?.isEmpty)!  || (date_val?.isEmpty)!)
        {
            displayMyAlertMessage(userMessage: "All fields are required");
            return;
        }
        
        
        if UserDefaults.standard.array(forKey: "title2") == nil {
            title_list=[]
        }
        else{
        title_list = UserDefaults.standard.array(forKey:"title2") as! [String]
        }
        
        
        if UserDefaults.standard.array(forKey: "date_val2") == nil {
            date_list=[]
        }
        else{
        date_list = UserDefaults.standard.array(forKey:"date_val2") as! [String]
        }

        title_list.append(title_val!)
        date_list.append(date_val!)
        UserDefaults.standard.set(title_list,forKey:"title2")
        UserDefaults.standard.set(date_list,forKey:"date_val2")
        UserDefaults.standard.synchronize();
        
        var myAlert = UIAlertController(title:"Alert",message:"Meeting noted",preferredStyle:UIAlertController.Style.alert);
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
    
    func checkMaxLength(textField: UITextField!, maxLength: Int) {
        while textField.text!.characters.count > maxLength {
            textField.deleteBackward()
        }
    }

}

