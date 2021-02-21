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
    @IBOutlet weak var userNameAddtionalLabel: UILabel!
    @IBOutlet weak var daytimeLabel: UILabel!
    @IBOutlet weak var forLabel: UILabel!
    @IBOutlet weak var withLabel: UILabel!
    @IBOutlet weak var todayDateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var numOfGoalsLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    let goalCollectionReuseIdentifier = "goalCollectionCell"
    let goalTableReuseIdentifier = "goalTableCell"
    let tableCellSpacingHeight: CGFloat = 4
    
    var smallGoals = ["Make a bed", "Drink 1L of water", "Write a blog", "Read newspaper", "Meditation", "Journaling", ]
    var bigGoals = ["Exercise", "Read a book", "Study (learn some new things)"]
    var goalItems = ["1"]
    
    let goalToIcon = ["Make a bed": "iconBed",  "Drink 1L of water": "iconWater", "Write a blog": "iconBlog", "Read newspaper": "iconNews", "Meditation": "iconMeditation", "Journaling": "iconJournal", "Exercise": "iconExercise", "Read a book": "iconBook", "Study (learn some new things)":"iconStudy"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userNameLabel.text = "MiMORNi"
        
        todayDateLabel.text = "Today, " + formatPrettyDate()
        self.goalItems = []
//        if segmentedControl.selectedSegmentIndex == 0 {
//            self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.09411764706, green: 0.09411764706, blue: 0.09411764706, alpha: 1)], for: .normal)
//            segmentedControl.selectedSegmentTintColor = #colorLiteral(red: 0.5529411765, green: 0.4274509804, blue: 0.07450980392, alpha: 1)
//        } else {
//            segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
//            segmentedControl.selectedSegmentTintColor = #colorLiteral(red: 1, green: 0.8117647059, blue: 0.2862745098, alpha: 1)
//        }
    }
    
    @IBAction func goalSegmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("Small Goal Selected")
            self.view.backgroundColor = #colorLiteral(red: 1, green: 0.8117647059, blue: 0.2862745098, alpha: 1)
            self.daytimeLabel.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            self.userNameLabel.textColor = #colorLiteral(red: 0.5529411765, green: 0.4274509804, blue: 0.07450980392, alpha: 1)
            self.userNameAddtionalLabel.textColor = #colorLiteral(red: 0.5529411765, green: 0.4274509804, blue: 0.07450980392, alpha: 1)
            self.forLabel.textColor = #colorLiteral(red: 0.5529411765, green: 0.4274509804, blue: 0.07450980392, alpha: 1)
            self.withLabel.textColor = #colorLiteral(red: 0.5529411765, green: 0.4274509804, blue: 0.07450980392, alpha: 1)
            self.todayDateLabel.textColor = #colorLiteral(red: 0.09411764706, green: 0.09411764706, blue: 0.09411764706, alpha: 1)
            self.goalLabel.textColor = #colorLiteral(red: 0.09411764706, green: 0.09411764706, blue: 0.09411764706, alpha: 1)
//            self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.09411764706, green: 0.09411764706, blue: 0.09411764706, alpha: 1)], for: .normal)
//            self.segmentedControl.selectedSegmentTintColor = #colorLiteral(red: 0.5529411765, green: 0.4274509804, blue: 0.07450980392, alpha: 1)
        case 1:
            print("Big Goal Selected")
            self.view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            self.daytimeLabel.textColor = UIColor.white
            self.userNameLabel.textColor = #colorLiteral(red: 1, green: 0.8117647059, blue: 0.2862745098, alpha: 1)
            self.userNameAddtionalLabel.textColor = #colorLiteral(red: 1, green: 0.8117647059, blue: 0.2862745098, alpha: 1)
            self.forLabel.textColor = #colorLiteral(red: 1, green: 0.8117647059, blue: 0.2862745098, alpha: 1)
            self.withLabel.textColor = #colorLiteral(red: 1, green: 0.8117647059, blue: 0.2862745098, alpha: 1)
            self.todayDateLabel.textColor = #colorLiteral(red: 1, green: 0.8117647059, blue: 0.2862745098, alpha: 1)
            self.goalLabel.textColor = #colorLiteral(red: 1, green: 0.8117647059, blue: 0.2862745098, alpha: 1)
//            self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
//            self.segmentedControl.selectedSegmentTintColor = #colorLiteral(red: 1, green: 0.8117647059, blue: 0.2862745098, alpha: 1)
        default:
            break
        }
        self.tableView.reloadData()
        self.collectionView.reloadData()
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
