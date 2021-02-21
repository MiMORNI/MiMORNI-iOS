//
//  SmallTableViewCell.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/21/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit

class SmallTableViewCell: UITableViewCell {
    @IBOutlet weak var smallButton: UIButton!
    @IBOutlet weak var smallLabel: UILabel!
    
    weak var delegate: SmallGoalTableViewCellDelegate?
    
    let goalToIcon = ["Make a bed": "iconBed",  "Drink 1L of water": "iconWater", "Write a blog": "iconBlog", "Read newspaper": "iconNews", "Meditation": "iconMeditation", "Journaling": "iconJournal", "Exercise": "iconExercise", "Read a book": "iconBook", "Study (learn some new things)":"iconStudy"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func smallButtonClicked(_ sender: UIButton) {
        if let goal = smallLabel.text,
            let delegate = delegate {
            let goalIcon = goalToIcon[goal]!
            
            delegate.smallGoalTableViewCell(self, checkButtonFor: goalIcon)
        }
    }
}

protocol SmallGoalTableViewCellDelegate: AnyObject {
    func smallGoalTableViewCell(_ smallTableViewCell: SmallTableViewCell, checkButtonFor goal: String)
}
