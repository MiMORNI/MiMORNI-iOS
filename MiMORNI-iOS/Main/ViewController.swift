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
    
    var userName:String?
    var duration:String?
    var waketime:String?
    var bedtime:String?
    var smallGoals:[String]?
    var bigGoals:[String]?
//    var smallGoals = ["Make a bed", "Drink 1L of water", "Write a blog", "Read newspaper", "Meditation", "Journaling", ]
//    var bigGoals = ["Exercise", "Read a book", "Study (learn some new things)"]
    var groupInfoResponse: GroupInfoResponse?
    
    var achievedGoalItems = [String()]
    
    let goalToIcon = ["Make a bed": "iconBed",  "Drink 1L of water": "iconWater", "Write a blog": "iconBlog", "Read newspaper": "iconNews", "Meditation": "iconMeditation", "Journaling": "iconJournal", "Exercise": "iconExercise", "Read a book": "iconBook", "Study (learn some new things)":"iconStudy"]
    
    let iconToGoal = ["iconBed": "Make a bed", "iconWater": "Drink 1L of water", "iconBlog" :"Write a blog", "iconNews": "Read newspaper", "iconMeditation":"Meditation", "iconJournal": "Journaling", "iconExercise": "Exercise", "iconBook": "Read a book", "iconStudy": "Study (learn some new things)"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userNameLabel.text = "MiMORNi"
        
        todayDateLabel.text = "Today, " + formatPrettyDate()
        self.achievedGoalItems = []
        
        if let name = userName, let duration = duration, let waketime = waketime, let bedtime = bedtime, let sGoal = smallGoals, let bGoal = bigGoals {
            userNameLabel.text = name
            durationLabel.text = duration
            daytimeLabel.text = waketime + " TO " + bedtime
            let numGoals = sGoal.count + bGoal.count
            if numGoals == 1 {
                numOfGoalsLabel.text = "\(numGoals) Goal"
            }
            else {
                numOfGoalsLabel.text = "\(numGoals) Goals"
            }
        }
        
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
    @IBAction func groupButtonClicked(_ sender: Any) {
        requestGroupInfo()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.destination is GroupViewController {
//            if let vc = segue.destination as? GroupViewController,
//                let name = userName, let duration = duration, let waketime = waketime, let bedtime = bedtime,
//                let sGoals = smallGoals, let bGoals = bigGoals
//            {
//                vc.userName = name
//                vc.duration = duration
//                vc.waketime = waketime
//                vc.bedtime = bedtime
//                vc.numOfGoals = sGoals.count + bGoals.count
//                vc.myAchievements = achievedGoalItems
//                requestGroupInfo()
//
//            }
//        }
    }
    @IBAction func plusButtonClicked(_ sender: UIButton) {
        if let name = userName {
            var goals = [String:Bool]()
            for eachGoal in achievedGoalItems {
                goals[eachGoal] = true
            }
            requestUpdateGoals(userName: name, goals: goals)
        }
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

extension ViewController {
    func requestUpdateGoals(userName: String, goals: [String:Bool]) {
        MiMORNiProvider().updateGoals(username: userName, goals: goals, completion: { [weak self] data in
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    print(data)
                    print("UPDATE Success")
                    
                } catch {
                    print("error: ", error)
                }
            }
            
        }) { error in
            print("error: ", error)
        }
    }
    
    func requestGroupInfo() {
        MiMORNiProvider().getGroupInfo(completion: { [weak self] data in
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let groupInfo = try decoder.decode(GroupInfoResponse.self, from: data)
                    self?.groupInfoResponse = groupInfo
                    print(groupInfo)
                    
                    
                } catch {
                    print("error: ", error)
                }
            }
            
            DispatchQueue.main.async {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Connectivity", bundle: nil)
                let newViewController = storyBoard.instantiateInitialViewController() as! GroupViewController
                newViewController.groupInfo = self?.groupInfoResponse
                newViewController.modalPresentationStyle = .fullScreen
                
                if let name = self?.userName, let duration = self?.duration, let waketime = self?.waketime, let bedtime = self?.bedtime,
                    let sGoals = self?.smallGoals, let bGoals = self?.bigGoals
                {
                    newViewController.userName = name
                    newViewController.duration = duration
                    newViewController.waketime = waketime
                    newViewController.bedtime = bedtime
                    newViewController.numOfGoals = sGoals.count + bGoals.count
                    newViewController.myAchievements = self?.achievedGoalItems
                }
                self?.present(newViewController, animated: true, completion: nil)
            }
            
        }) { error in
            print("error: ", error)
        }
    }
}
