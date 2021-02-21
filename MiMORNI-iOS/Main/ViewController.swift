//
//  ViewController.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/20/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var daytimeLabel: UILabel!
    @IBOutlet weak var todayDateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var numOfGoalsLabel: UILabel!
    
    let goalCollectionReuseIdentifier = "goalCollectionCell"
    let goalTableReuseIdentifier = "goalTableCell"
    let tableCellSpacingHeight: CGFloat = 4
    
    var smallGoals = ["Make a bed", "Drink 1L of Water", "Write a blog"]
    var bigGoals = ["Exercise", "Read a Book"]
    var items = ["1", "2", "3", "4", "5", "6"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userNameLabel.text = "MiMORNi"
        
        todayDateLabel.text = "Today, " + formatPrettyDate()
//        self.items = []
    }
}

extension ViewController {
    func formatPrettyDate() -> String {
        let now = Date()
        
        let calendar = Calendar.current
        let day = calendar.component(.day, from: now)
        let daySuffix: String

        switch day {
        case 11...13: daySuffix = "th"
        default:
            switch day % 10 {
            case 1: daySuffix = "st"
            case 2: daySuffix = "nd"
            case 3: daySuffix = "rd"
            default: daySuffix = "th"
            }
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd'\(daySuffix)' LLL"
        formatter.locale = Locale(identifier: "en_US")

        return formatter.string(from: now)
    }
}
