//
//  AppDatePicker.swift
//  PickerSample
//
//  Created by pyngit on 2015/11/16.
//
//

import UIKit

class AppDatePicker : UIPickerView,UIPickerViewDelegate,UIPickerViewDataSource{
    /* 日付のフォーマット */
    static let DEFAULT_DATE_FORMAT = "yyyy-MM-dd";

    /* 年 */
    var YEAR_LIST:[Int] = [];
    /* 月 */
    let MONTH_LIST = ["01","02","03","04","05","06","07","08","09","10","11","12"];
    /* 日 */
    let DAY_LIST = ["01","02","03","04","05","06","07","08","09","10"
        ,"11","12","13","14","15","16","17","18","19","20"
        ,"21","22","23","24","25","26","27","28","29","30","31"]
    
    var yearValue:String = "2015";
    /* 月の選択した値 */
    var monthValue:String = "01";
    /* 日の選択した値 */
    var dayValue:String = "01";
    
    /* テキストカラー */
    var textColor:UIColor = UIColor.orangeColor();
    
    override init(frame: CGRect) {
        print("AppPickerView init");
        super.init(frame: frame);
        
        initView();
    }
    /*
     Storybord から生成
    */
    required init(coder aDecoder: NSCoder) {
        print("AppPickerView init \(aDecoder)");
        super.init(coder: aDecoder)!;
        
        initView();
    }
    /* 
     表示列
    */
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3;
    }
    /*
     列ごとの選択肢の数
    */
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0){
            // 1列目の選択肢の数
            return YEAR_LIST.count;
        }else if(component == 1){
            // 2列目の選択肢の数
            return MONTH_LIST.count;
        }else{
            // 3列目の選択肢の数
            return DAY_LIST.count;
        }
    }
    /*
     列の設定
    */
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel();
        if(component == 0){
            // 1列目の選択肢の数
            pickerLabel.attributedText = createLabelText(String(YEAR_LIST[row]));
        }else if(component == 1){
            // 2列目の選択肢の数
            pickerLabel.attributedText = createLabelText(MONTH_LIST[row]);
        }else{
            // 3列目の選択肢の数
            pickerLabel.attributedText = createLabelText(DAY_LIST[row]);
        }
        //ラベルをセンター寄せ
        pickerLabel.textAlignment = NSTextAlignment.Center
        pickerLabel.frame = CGRectMake(0, 0, 75, 15);
        

        return pickerLabel;
    }
    /*
     pickerが選択された際に呼ばれるデリゲートメソッド.
    */
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
            //年
            yearValue = String(YEAR_LIST[row]);
        }else if(component == 1){
            //月
            monthValue = MONTH_LIST[row];
        }else{
            //日
            dayValue = DAY_LIST[row];
        }
    }
    /*
    　選択された値を NSDateとして取得
      1月32日などありえない日付を設定して、パースを失敗した場合はnilを返す
    
    */
    func getDateValue() -> NSDate?{
        return convertToDate("\(yearValue)-\(monthValue)-\(dayValue)");
    }
    
    /*
    VIEWの初期化
    */
    private func initView(){
        
        let baseDate = NSDate();
        let cal:NSCalendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!;
        let calUtil:NSCalendarUnit = .Year;
        let components = cal.components(calUtil, fromDate: baseDate);
        //今年を選択する
        var yearIdx:Int = 0;
        for(var n:Int = 1950;n<=2020;n++){
            YEAR_LIST.append(n);
            if(components.year > n){
                yearIdx++;
            }
        }
        
        delegate = self;
        dataSource = self;
        selectRow(yearIdx, inComponent: 0, animated: true);
        selectRow(0, inComponent: 1, animated: true);
        selectRow(0, inComponent: 2, animated: true);
        
    }
    /*
     選択肢のラベルを生成する
    */
    private func createLabelText(text:String) -> NSAttributedString{
        return NSAttributedString(string: text, attributes: [NSFontAttributeName:UIFont(name: "Helvetica Neue", size: 15.0)!,NSForegroundColorAttributeName:textColor])

    }
    /*
     文字列から日付へ変換
    */
    private func convertToDate(dateStr:String) -> NSDate?{
        let dateFormatter = NSDateFormatter();
        dateFormatter.locale = NSLocale(localeIdentifier: NSLocaleLanguageCode);
        dateFormatter.dateFormat = AppDatePicker.DEFAULT_DATE_FORMAT;
        return dateFormatter.dateFromString(dateStr);
    }
}