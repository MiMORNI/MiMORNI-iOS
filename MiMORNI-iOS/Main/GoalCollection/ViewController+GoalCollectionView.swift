//
//  ViewController+GoalCollectionView.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/20/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit

extension ViewController: UICollectionViewDelegate {
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
}

extension ViewController: UICollectionViewDataSource {
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.items.count
        if self.achievedGoalItems.count == 0 {
            return 1
        }
        else {
            return self.achievedGoalItems.count
        }
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: goalCollectionReuseIdentifier, for: indexPath as IndexPath) as! GoalCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        if self.achievedGoalItems.count == 0 {
            cell.goalImage.image = UIImage(named: "iconNonWhite")
        }
        else {
            let item = self.achievedGoalItems[indexPath.row]
            var imgName = item
            if self.segmentedControl.selectedSegmentIndex == 0 {
                imgName += "Black"
            }
            else {
                imgName += "Yellow"
            }
            cell.goalImage.image = UIImage(named:imgName)
        }
        
        return cell
    }
}
