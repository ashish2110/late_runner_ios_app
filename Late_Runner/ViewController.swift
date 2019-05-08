//
//  ViewController.swift
//  Late_Runner
//
//  Created by Students on 2/22/19.
//  Copyright © 2019 Students. All rights reserved.
//

import UIKit
import UserNotifications
import MapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    //@IBOutlet weak var titlelist: UILabel!
    //@IBOutlet weak var datelist: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UserDefaults.standard.set([],forKey:"title2")
        //UserDefaults.standard.set([],forKey:"date_val2")
        // Do any additional setup after loading the view, typically from a nib.
//        var x = UserDefaults.standard.stringArray(forKey: "title2")  ?? [String]()
//        var y = UserDefaults.standard.stringArray(forKey:"date_val2")  ?? [String]()
//        let center = UNUserNotificationCenter.current()
//        if (x.count-1)>=0{
//            for val_x in 0...(x.count-1){
//                print("*********")
//                let name = String(x[val_x])
//                var time = String(y[val_x])
//
//
//                let dateFormatter = DateFormatter()
//                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss "
//                dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
//                let date = dateFormatter.date(from:time)!
//
//
//
//
//                let notification = UNMutableNotificationContent()
//                notification.title = "Reminder"
//                notification.body = "Don't forget, today is \(String(describing: name))!"
//
//                print("hi:",date)
//
//                let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
//                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
//
//                notification.sound=UNNotificationSound.default
//
//                let request = UNNotificationRequest(identifier: "reminder", content: notification, trigger: trigger)
//
//                center.add(request, withCompletionHandler:nil)
//                print("working")
//            }
//        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        var x = UserDefaults.standard.stringArray(forKey: "title2")  ?? [String]()
        var y = UserDefaults.standard.stringArray(forKey:"date_val2")  ?? [String]()
        return x.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        var x = UserDefaults.standard.stringArray(forKey: "title2")  ?? [String]()
        var y = UserDefaults.standard.stringArray(forKey:"date_val2")  ?? [String]()
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = x[indexPath.row]
        cell.detailTextLabel?.text=y[indexPath.row]
        return cell
    }
    
    
    
    
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        guard editingStyle == .delete else {return}
//        var x = UserDefaults.standard.stringArray(forKey: "title2")  ?? [String]()
//        var y = UserDefaults.standard.stringArray(forKey:"date_val2")  ?? [String]()
//        
//        x.remove(at: indexPath.row)
//        y.remove(at: indexPath.row)
//        tableview.deleteRows(at: [indexPath], with: .automatic)
//    }
    
    
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        var userlogin = UserDefaults.standard.bool(forKey: "UserLoggedin");
        if(!userlogin)
        {
            self.performSegue(withIdentifier: "loginView", sender: self)
        }
        var x = UserDefaults.standard.stringArray(forKey: "title2")  ?? [String]()
        var y = UserDefaults.standard.stringArray(forKey:"date_val2")  ?? [String]()



        let center = UNUserNotificationCenter.current()
        if (x.count-1)>=0{
            for val_x in 0...(x.count-1){
                print("*********")
                var name = String(x[val_x])
                var time = String(y[val_x])

                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss "
                dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
                let date = dateFormatter.date(from:time)!

                let notification = UNMutableNotificationContent()
                notification.title = "Reminder"
                notification.body = "Don't forget, today is \(String(describing: name))!"

                print("hi:",date)

                var triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)


                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)


                notification.sound=UNNotificationSound.default

                let request = UNNotificationRequest(identifier: "reminder", content: notification, trigger: trigger)


                center.add(request, withCompletionHandler:nil)

                print("working")
            }
//
//            var p=""
//            for val_x in 0...(x.count-1){
//                p=p+String(x[val_x])+"\n"
//            }
//
//            var q=""
//            for val_y in 0...(y.count-1){
//                q=q+String(y[val_y])+"\n"
//            }
//            print(p,q)
//
//            self.titlelist.text=p
//            self.datelist.text=q
//            print(self.titlelist)
//            print(self.datelist)
//            let temp = self.titlelist.text?.components(separatedBy: "\n")
//            self.titlelist.numberOfLines  = temp!.count
//            self.datelist.numberOfLines  = temp!.count
 }
        super.viewDidAppear(true)
        tableview.reloadData()
 }
    @IBAction func userlogout(_ sender: Any) {
        UserDefaults.standard.set(false, forKey:"UserLoggedin");
        UserDefaults.standard.synchronize();
        self.performSegue(withIdentifier: "loginView", sender: self)
    }
    
    
    
    @IBAction func showMeWhere(_ sender: Any) {
        
        let latitude:CLLocationDegrees = 40.747772
        let longitude:CLLocationDegrees = -74.047364
        
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "My House"
        mapItem.openInMaps(launchOptions: options)
    }
    
}
