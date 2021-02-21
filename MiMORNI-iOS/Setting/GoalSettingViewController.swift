//
//  GoalSettingViewController.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/21/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit

class GoalSettingViewController: UIViewController {
    @IBOutlet weak var smallTableView: UITableView!
    @IBOutlet weak var bigTableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    var userName:String?
    var duration:String?
    var waketime:String?
    var bedtime:String?
    
    let smallGoalReuseIdentifier = "smallTableCell"
    let bigGoalReuseIdentifier = "bigTableCell"
    let tableCellSpacingHeight: CGFloat = 4
    
    var smallGoals = ["Make a bed", "Drink 1L of water", "Write a blog", "Read newspaper", "Meditation", "Journaling", ]
    var bigGoals = ["Exercise", "Read a book", "Study (learn some new things)"]
    var smallGoalsAdded = [String()]
    var bigGoalsAdded = [String()]
    var goalItems = [String()]
    
    let goalToIcon = ["Make a bed": "iconBed",  "Drink 1L of water": "iconWater", "Write a blog": "iconBlog", "Read newspaper": "iconNews", "Meditation": "iconMeditation", "Journaling": "iconJournal", "Exercise": "iconExercise", "Read a book": "iconBook", "Study (learn some new things)":"iconStudy"]


    override func viewDidLoad() {
        super.viewDidLoad()
        self.goalItems = []
        self.smallGoalsAdded = []
        self.bigGoalsAdded = []

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.destination is ViewController {
            if let vc = segue.destination as? ViewController,
                let name = userName, let duration = duration, let waketime = waketime, let bedtime = bedtime
            {
                vc.userName = name
                vc.duration = duration
                vc.waketime = waketime
                vc.bedtime = bedtime
                vc.smallGoals = smallGoalsAdded
                vc.bigGoals = bigGoalsAdded
                
                var durationInt = 1
                if duration == "2 months" {
                    durationInt = 2
                }
                else if duration == "3 months" {
                    durationInt = 3
                }
                
                var goals = [String:[String:Bool]]()
                goals["smallGoals"] = [String:Bool]()
                goals["bigGoals"] = [String:Bool]()
                for eachSmall in smallGoalsAdded {
                    goals["smallGoals"]![eachSmall] = false
                }
                
                for eachBig in bigGoalsAdded {
                    goals["bigGoals"]![eachBig] = false
                }
//                print(goals)
                requestAddUser(userName: name, wakeTime: waketime, bedTime: bedtime, duration: durationInt, goals: goals)
            }
            
        }
    }
}

extension GoalSettingViewController {
    func requestAddUser(userName: String, wakeTime: String, bedTime:String, duration:Int, goals:[String : [String : Bool]]) {
        MiMORNiProvider().addUserName(username: userName, wakeTime: wakeTime, sleepTime: bedTime, durationInMonths: duration, goals: goals, completion: { [weak self] data in
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    print(data)
                    
                } catch {
                    print("error: ", error)
                }
            }
            
        }) { error in
            print("error: ", error)
        }
    }
}
