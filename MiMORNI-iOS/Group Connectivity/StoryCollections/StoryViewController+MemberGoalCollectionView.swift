//
//  StoryViewController+MemberGoalCollectionView.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/21/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit

extension StoryViewController:UICollectionViewDelegate {
    
}

extension StoryViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let achievements = achieved {
            print(achievements.count)
            return achievements.count
        }
        else {
            return 0
        }
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: achievementReuseIdentifier, for: indexPath as IndexPath) as! memberGoalCollectionViewCell
        if let achievements = achieved {
            let imageName = achievements[indexPath.row] + "White"
            cell.achievementsImageView.image = UIImage(named: imageName)
        }
        return cell
    }
    
    
}
