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
        return self.smallGoals.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: goalTableReuseIdentifier, for: indexPath as IndexPath) as! GoalTableViewCell
        cell.goalLabel.text = smallGoals[indexPath.row]
        
        return cell
    }
}
