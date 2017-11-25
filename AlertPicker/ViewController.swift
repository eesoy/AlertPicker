//
//  ViewController.swift
//  DatePicker
//
//  Created by Ho-Jeong Song on 2016. 10. 10..
//  Copyright © 2016년 Ho-Jeong Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime: String?
    var alertFlag = false
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
        //            lblCurrentTime.text = String(count++)
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        
        if (alarmTime == currentTime) {
            if(!alertFlag){
                //메시지 박스 생성
                let alert = UIAlertController(title: "알림", message: "설정된 시간입니다 !!!", preferredStyle: .alert)
                
                let onAction = UIAlertAction(title: "YES", style: .default, handler: nil)
                
                //버튼 생성
                alert.addAction(onAction)
                //메시지 박스 모달 형태로 띄우기
                present(alert, animated: true, completion: nil)
                alertFlag = true
            }
        }
        else {
            alertFlag = false
        }
    }
}

