//
//  ViewController+GoalTableView.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/20/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate {
}

extension ViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.segmentedControl.selectedSegmentIndex == 0, let count = self.smallGoals?.count {
            return count
        }
        else if let count = self.bigGoals?.count {
            return count
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: goalTableReuseIdentifier, for: indexPath as IndexPath) as! GoalTableViewCell
        if self.segmentedControl.selectedSegmentIndex == 0, let goal = smallGoals?[indexPath.row] {
            cell.goalLabel.text = self.iconToGoal[goal]
            cell.contentView.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.7764705882, blue: 0.2470588235, alpha: 1)
            cell.goalLabel.textColor = #colorLiteral(red: 0.09411764706, green: 0.09411764706, blue: 0.09411764706, alpha: 1)
            cell.checkButton.setImage(UIImage(named:"buttonCheckboxBlank"), for: .normal)
            cell.checkButton.setImage(UIImage(named:"buttonCheckboxActive"), for: .selected)
        }
        else if let goal = bigGoals?[indexPath.row] {
            cell.goalLabel.text = self.iconToGoal[goal]
            cell.contentView.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2431372549, blue: 0.2431372549, alpha: 1)
            cell.goalLabel.textColor = UIColor.white
            cell.checkButton.setImage(UIImage(named:"buttonYCheckboxBlank"), for: .normal)
            cell.checkButton.setImage(UIImage(named:"buttonYCheckboxActive"), for: .selected)
        }
        
        if let goalText = cell.goalLabel.text,
            let goalIcon = self.goalToIcon[goalText] {
            let index = self.goalItems.firstIndex(of: goalIcon)
            if index != nil {
                cell.checkButton.isSelected = true
            }
            else {
                cell.checkButton.isSelected = false
            }
        }
        
        cell.delegate = self
        
        return cell
    }
}

extension ViewController: GoalTableViewCellDelegate {
    func goalTableViewCell(_ goalTableViewCell: GoalTableViewCell, checkButtonFor goal: String) {
        print("\(goal) Button Clicked")

        if goalTableViewCell.checkButton.isSelected {
            goalTableViewCell.checkButton.isSelected = false
            if let index = self.goalItems.firstIndex(of: goal){
                self.goalItems.remove(at: index)
            }
        }
        else {
            goalTableViewCell.checkButton.isSelected = true
            self.goalItems.insert(goal, at: 0)
        }
        print(self.goalItems)
        self.collectionView.reloadData()
    }
}
