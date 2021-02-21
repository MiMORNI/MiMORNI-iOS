//
//  TimeViewController.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/20/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {
    @IBOutlet weak var wakeTimeTableView: UITableView!
    @IBOutlet weak var bedTimeTableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    var userName:String?
    var duration:String?
    
    let wakeTimes = ["4 AM", "5 AM", "6 AM", "7 AM"]
    let bedTimes = ["10 PM", "11 PM", "12 AM"]
    let wakeTableReuseIdentifier = "wakeTableCell"
    let bedTableReuseIdentifier = "bedTableCell"
    
    var wakeSelectedElement = String()
    var bedSelectedElement = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.destination is GoalSettingViewController {
            if let vc = segue.destination as? GoalSettingViewController,
                let name = userName, let duration = duration
            {
                vc.userName = name
                vc.duration = duration
                vc.waketime = wakeSelectedElement
                vc.bedtime = bedSelectedElement
            }
            
        }
    }
}
