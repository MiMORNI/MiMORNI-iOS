//
//  GoalSettingViewController+GoalTableView.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/21/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit

extension GoalSettingViewController: UITableViewDelegate {
    
}

extension GoalSettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.bigTableView {
            return 3
        } else {
            return 6
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.bigTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: self.bigGoalReuseIdentifier, for: indexPath as IndexPath) as! BigTableViewCell
            cell.bigLabel.text = self.bigGoals[indexPath.row]
            let imageName = self.goalToIcon[self.bigGoals[indexPath.row]]! + "Setting"
            cell.bigButton.setImage(UIImage(named: imageName), for: .normal)
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: self.smallGoalReuseIdentifier, for: indexPath as IndexPath) as! SmallTableViewCell
            cell.smallLabel.text = self.smallGoals[indexPath.row]
            let imageName = self.goalToIcon[self.smallGoals[indexPath.row]]! + "Setting"
            cell.smallButton.setImage(UIImage(named: imageName), for: .normal)
            cell.delegate = self
            return cell
        }
    }
    
    
}

extension GoalSettingViewController: SmallGoalTableViewCellDelegate {
    func smallGoalTableViewCell(_ smallTableViewCell: SmallTableViewCell, checkButtonFor goal: String) {
        print("\(goal) Button Clicked")
        
        if smallTableViewCell.smallButton.isSelected {
            smallTableViewCell.smallButton.isSelected = false
            let imageName = goal + "Setting"
            smallTableViewCell.smallButton.setImage(UIImage(named: imageName), for: .normal)
            if let index = self.goalItems.firstIndex(of: goal), let smallIndex = self.smallGoalsAdded.firstIndex(of:goal){
                self.goalItems.remove(at: index)
                self.smallGoalsAdded.remove(at:smallIndex)
            }
        } else {
            smallTableViewCell.smallButton.isSelected = true
            let imageName = goal + "Yellow"
            smallTableViewCell.smallButton.setImage(UIImage(named: imageName), for: .normal)
            self.goalItems.insert(goal, at: 0)
            self.smallGoalsAdded.insert(goal, at:0)
        }
        print(self.goalItems)
        print(self.smallGoalsAdded)
        
        if self.goalItems.count != 0 {
            self.nextButton.isEnabled = true
            self.nextButton.backgroundColor = #colorLiteral(red: 1, green: 0.8117647059, blue: 0.2862745098, alpha: 1)
        }
        else {
            self.nextButton.isEnabled = false
            self.nextButton.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        }
    }
    
    
}

extension GoalSettingViewController: BigGoalTableViewCellDelegate {
    func bigGoalTableViewCell(_ bigTableViewCell: BigTableViewCell, checkButtonFor goal: String) {
        print("\(goal) Button Clicked")
        
        if bigTableViewCell.bigButton.isSelected {
            bigTableViewCell.bigButton.isSelected = false
            let imageName = goal + "Setting"
            bigTableViewCell.bigButton.setImage(UIImage(named: imageName), for: .normal)
            if let index = self.goalItems.firstIndex(of: goal), let bigIndex = self.bigGoalsAdded.firstIndex(of:goal){
                self.goalItems.remove(at: index)
                self.bigGoalsAdded.remove(at:bigIndex)
            }
        } else {
            bigTableViewCell.bigButton.isSelected = true
            let imageName = goal + "Yellow"
            bigTableViewCell.bigButton.setImage(UIImage(named: imageName), for: .normal)
            self.goalItems.insert(goal, at: 0)
            self.bigGoalsAdded.insert(goal, at:0)
        }
        print(self.goalItems)
        print(self.bigGoalsAdded)
        
        if self.goalItems.count != 0 {
            self.nextButton.isEnabled = true
            self.nextButton.backgroundColor = #colorLiteral(red: 1, green: 0.8117647059, blue: 0.2862745098, alpha: 1)
        }
        else {
            self.nextButton.isEnabled = false
            self.nextButton.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        }
    }
    
    
}
