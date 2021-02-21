//
//  DurationViewController+DurationTableView.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/20/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit

extension DurationViewController: UITableViewDelegate {
    
}

extension DurationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: durationTableReuseIdentifier, for: indexPath as IndexPath) as! DurationTableViewCell
        cell.monthLabel.text = self.months[indexPath.row]
        
        if self.months[indexPath.row] == self.selectedElement {
            cell.radioButton.isSelected = true
        } else {
            cell.radioButton.isSelected = false
        }
        
        cell.delegate = self
        
        return cell
    }
    
}

extension DurationViewController: DurationRadioTableViewCellDelegate {
    func didToggleRadioButton(_ indexPath: IndexPath) {
        let data = self.months[indexPath.row]
        self.selectedElement = data
        print(self.selectedElement)
        if self.selectedElement != "" {
            self.nextButton.isEnabled = true
            self.nextButton.backgroundColor = #colorLiteral(red: 1, green: 0.8117647059, blue: 0.2862745098, alpha: 1)
        } else {
            self.nextButton.isEnabled = false
            self.nextButton.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        }
    }
}
