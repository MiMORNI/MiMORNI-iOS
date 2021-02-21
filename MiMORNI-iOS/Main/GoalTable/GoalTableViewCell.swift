//
//  GoalTableViewCell.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/20/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit

class GoalTableViewCell: UITableViewCell {
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    // the delegate, remember to set to weak to prevent cycles
    weak var delegate : GoalTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0))
    }
    
    @IBAction func checkboxButtonClicked(_ sender: UIButton) {
        if let goal = goalLabel.text,
            let delegate = delegate {
            var goal_icon:String
            
            switch goal {
            case "Make a bed":
                goal_icon = "iconBed"
            case "Drink 1L of water":
                goal_icon = "iconWater"
            case "Write a blog":
                goal_icon = "iconBlog"
            case "Read newspaper":
                goal_icon = "iconNews"
            case "Meditation":
                goal_icon = "iconMeditation"
            case "Journaling":
                goal_icon = "iconJournal"
            case "Exercise":
                goal_icon = "iconExercise"
            case "Read a book":
                goal_icon = "iconBook"
            case "Study (learn some new things)":
                goal_icon = "iconStudy"
            default:
                goal_icon = "iconNonWhite"
            }
            delegate.goalTableViewCell(self, checkButtonFor: goal_icon)
        }
    }
}

// Only class object can conform to this protocol (struct/enum can't)
protocol GoalTableViewCellDelegate: AnyObject {
  func goalTableViewCell(_ goalTableViewCell: GoalTableViewCell, checkButtonFor goal: String)
}
