//
//  AppDatePicker.swift
//  PickerSample
//
//  Created by pyngit on 2015/11/15.
//
//

import UIKit

class AppPickerView : UIPickerView,UIPickerViewDelegate,UIPickerViewDataSource{
    /* 月 */
    let MONTH_LIST = ["01","02","03","04","05","06","07","08","09","10","11","12"];
    /* 日 */
    let DAY_LIST = ["01","02","03","04","05","06","07","08","09","10"
        ,"11","12","13","14","15","16","17","18","19","20"
        ,"21","22","23","24","25","26","27","28","29","30","31"]
    
    /* 月の選択した値 */
    var monthValue:String = "1";
    /* 日の選択した値 */
    var dayValue:String = "01";

    override init(frame: CGRect) {
        print("AppPickerView init");

        super.init(frame: frame);
        delegate = self;
        dataSource = self;
    }
    required init(coder aDecoder: NSCoder) {
        print("AppPickerView init \(aDecoder)");
        super.init(coder: aDecoder)!
        delegate = self;
        dataSource = self;
    }
    
    
    //UI Picer用設定
    //表示列
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
//        print("AppPickerView numberOfComponentsInPickerView");
        return 2
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        print("AppPickerView pickerView \(component)");
        if(component == 0){
            return MONTH_LIST.count;  // 1列目の選択肢の数
        }else{
            return DAY_LIST.count;  // 2列目の選択肢の数
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == 0){
            return MONTH_LIST[row]  // 1列目のrow番目に表示する値
        }else{
            return DAY_LIST[row]  // 2列目のrow番目に表示する値
        }
    }
    
    /*
    pickerが選択された際に呼ばれるデリゲートメソッド.
    */
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
            //月
            monthValue = MONTH_LIST[row];
        }else{
            //日
            dayValue = DAY_LIST[row];
        }
    }

}
