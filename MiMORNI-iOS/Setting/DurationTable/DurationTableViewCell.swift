//
//  DurationTableViewCell.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/20/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit

class DurationTableViewCell: UITableViewCell {
    @IBOutlet weak var radioButton: UIButton!
    @IBOutlet weak var monthLabel: UILabel!
    
    // the delegate, remember to set to weak to prevent cycles
    weak var delegate : DurationRadioTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func radioButtonClicked(_ sender: UIButton) {
        print("radio button tapped")
        let isSelected = !self.radioButton.isSelected
        self.radioButton.isSelected = isSelected
        if isSelected {
            deselectOtherButton()
            
        }
        let tableView = self.superview as! UITableView
        let tappedCellIndexPath = tableView.indexPath(for: self)!
        delegate?.didToggleRadioButton(tappedCellIndexPath)
    }
    
    private func deselectOtherButton() {
        let tableView = self.superview as! UITableView
        let tappedCellIndexPath = tableView.indexPath(for: self)!
        let indexPaths = tableView.indexPathsForVisibleRows
        for indexPath in indexPaths! {
            if indexPath.row != tappedCellIndexPath.row {
                let cell = tableView.cellForRow(at: IndexPath(row: indexPath.row, section: indexPath.section)) as! DurationTableViewCell
                cell.radioButton.isSelected = false
            }
        }
    }
    
}

// Only class object can conform to this protocol (struct/enum can't)
protocol DurationRadioTableViewCellDelegate: AnyObject {
  func didToggleRadioButton(_ indexPath: IndexPath)
}
