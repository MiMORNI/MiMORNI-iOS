//
//  GroupViewController.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/21/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var routineLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var numOfGoalsLabel: UILabel!
    @IBOutlet weak var groupAchievementsLabel: UILabel!
    @IBOutlet weak var userNameAchiLabel: UILabel!
    @IBOutlet weak var userAchievementsLabel: UILabel!
    
    @IBOutlet weak var memberCollection: UICollectionView!
    @IBOutlet weak var pictureCollection: UICollectionView!
    @IBOutlet weak var myGoalCollection: UICollectionView!
    
    let memberReuseIdentifier = "memberReuseIdentifier"
    let pictureReuseIdentifier = "pictureReuseIdentifier"
    let myGoalReuseIdentifier = "myGoalReuseIdentifier"
    
    let profileList = ["iconProfileA","iconProfileB","iconProfileC","iconProfileD","iconProfileE"]
    
    var members = ["1", "2", "3", "4"]
    var imgs = ["miracle1", "miracle2", "miracle3", "miracle4", "miracle5"]
    var membersAchievedList:[[String:[String:Bool]]]?
    var membersPictures:[String]?
    
    var groupInfo:GroupInfoResponse?
    
    var myAchievements:[String]?
    var userName:String?
    var duration:String?
    var waketime:String?
    var bedtime:String?
    var numOfGoals:Int?
    
    var profileImgName:String?
    var memberUserName:String?
    var memberIndex:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dateLabel.text = formatPrettyDate()
        if let num = numOfGoals, let userName = userName, let duration = duration,
            let waketime = waketime, let bedtime = bedtime, let achievements = myAchievements {
            userNameLabel.text = userName
            routineLabel.text = waketime + " TO " + bedtime
            durationLabel.text = duration
            if num == 1 {
                numOfGoalsLabel.text = "1 Goal"
            } else {
                numOfGoalsLabel.text = "\(num) Goals"
            }
            userNameAchiLabel.text = userName + " (you)"
            let myAchievementPercent = (Double(achievements.count)/Double(num)) * 100
            userAchievementsLabel.text = String(format: "%.2f", myAchievementPercent) + "%"
        }
        if let infos = groupInfo {
            groupAchievementsLabel.text = String(format: "%.2f", infos.percentCompleteCommunity) + "%"
            processDatas(groupInfo: infos.users)
            print(self.members.count)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is StoryViewController {
            if let vc = segue.destination as? StoryViewController,
                let profileImgName = profileImgName, let memberUserName = memberUserName, let index = memberIndex
            {
                vc.memberName = memberUserName
                vc.profileImageName = profileImgName
                
                var achieved:[String] = []
                if let membersAchieved = membersAchievedList {
                    let goals = membersAchieved[index]
                    for (eachGoal, result) in goals {
                        for (each, value) in result {
                            if value {
                                achieved.append(each)
                            }
                        }
                    }
                }
                
                vc.achieved = achieved
                
                var img:String = ""
                if let mempics = membersPictures {
                    img = mempics[index]
                    print(img)
                }
                vc.pics = img
            }
        }
    }
    
    func processDatas(groupInfo:[User]) {
        self.members = []
        self.membersAchievedList = []
        self.membersPictures = []
        
        for eachGroup in groupInfo {
            if eachGroup.images.count != 0 {
                self.members.append(eachGroup.username)
                self.membersAchievedList?.append(eachGroup.goals)
                self.membersPictures?.append(eachGroup.images[0])
            }
        }
    }
}

extension GroupViewController {
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
