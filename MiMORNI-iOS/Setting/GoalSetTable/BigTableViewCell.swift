//
//  BigTableViewCell.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/21/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit

class BigTableViewCell: UITableViewCell {
    @IBOutlet weak var bigButton: UIButton!
    @IBOutlet weak var bigLabel: UILabel!
    
    weak var delegate: BigGoalTableViewCellDelegate?
    
    let goalToIcon = ["Make a bed": "iconBed",  "Drink 1L of water": "iconWater", "Write a blog": "iconBlog", "Read newspaper": "iconNews", "Meditation": "iconMeditation", "Journaling": "iconJournal", "Exercise": "iconExercise", "Read a book": "iconBook", "Study (learn some new things)":"iconStudy"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func bigButtonClicked(_ sender: UIButton) {
        print("BigButton Clicked")
        
        if let goal = bigLabel.text,
            let delegate = delegate {
            let goalIcon = goalToIcon[goal]!
            
            delegate.bigGoalTableViewCell(self, checkButtonFor: goalIcon)
        }
    }
}

protocol BigGoalTableViewCellDelegate: AnyObject {
    func bigGoalTableViewCell(_ bigTableViewCell: BigTableViewCell, checkButtonFor goal: String)
}
