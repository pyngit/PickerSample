//
//  ViewController.swift
//  PickerSample
//
//  Created by pyngit on 2015/11/15.
//
//

import UIKit

class ViewController: UIViewController {
    //日付
    @IBOutlet var datePicker:AppDatePicker!;
    //月日
    @IBOutlet var appPikerView:AppPickerView!;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapBtn(sender:AnyObject){
        print("selectPicker :\(sender)");
        print("\(appPikerView.monthValue)-\(appPikerView.dayValue)");
        let dateValue:NSDate? = datePicker.getDateValue();
        if(dateValue == nil){
            print("date format error.");
        }else{
            let dateFormatter = NSDateFormatter()
            dateFormatter.locale = NSLocale(localeIdentifier: NSLocaleLanguageCode) // ロケールの設定
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // 日付フォーマットの設定
            
            print("date:\(dateFormatter.stringFromDate(dateValue!))");
        }
    }

}

