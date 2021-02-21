//
//  TimeViewController+TimeTableView.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/20/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit

extension TimeViewController: UITableViewDelegate {
    
}

extension TimeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.wakeTimeTableView {
            return 4
        }
        else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.wakeTimeTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: wakeTableReuseIdentifier, for: indexPath as IndexPath) as! WakeTimeTableViewCell
            cell.timeLabel.text = self.wakeTimes[indexPath.row]
            
            if self.wakeTimes[indexPath.row] == self.wakeSelectedElement {
                cell.radioButton.isSelected = true
            } else {
                cell.radioButton.isSelected = false
            }
            cell.delegate = self
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: bedTableReuseIdentifier, for: indexPath as IndexPath) as! BedTimeTableViewCell
            cell.timeLabel.text = self.bedTimes[indexPath.row]
            
            if self.bedTimes[indexPath.row] == self.bedSelectedElement {
                cell.radioButton.isSelected = true
            } else {
                cell.radioButton.isSelected = false
            }
            cell.delegate = self
            return cell
        }
    }
    
}

extension TimeViewController: TimeRadioTableViewCellDelegate {
    func didToggleRadioButton(_ indexPath: IndexPath, tableView: UITableView) {
        if tableView == self.bedTimeTableView {
            let data = self.bedTimes[indexPath.row]
            self.bedSelectedElement = data
            print(self.bedSelectedElement)
        } else {
            let data = self.wakeTimes[indexPath.row]
            self.wakeSelectedElement = data
            print(self.wakeSelectedElement)
        }
        
        if self.bedSelectedElement != "" && self.wakeSelectedElement != "" {
            self.nextButton.isEnabled = true
            self.nextButton.backgroundColor = #colorLiteral(red: 1, green: 0.8117647059, blue: 0.2862745098, alpha: 1)
        } else {
            self.nextButton.isEnabled = false
            self.nextButton.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        }
    }
}
