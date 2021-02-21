//
//  GroupViewController+CollectionViews.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/21/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit

extension GroupViewController: UICollectionViewDelegate {
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
}
extension GroupViewController: UICollectionViewDataSource {
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.memberCollection {
            return self.members.count
        }
        else if collectionView == self.pictureCollection {
            return self.imgs.count
        }
        else if let achievements = self.myAchievements {
            return achievements.count
        } else {
            return 0
        }
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        if collectionView == self.memberCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: memberReuseIdentifier, for: indexPath as IndexPath) as! MemberCollectionViewCell
            if indexPath.row > 5 {
                cell.memberButton.isHidden = true
                cell.additionalLabel.isHidden = false
                let additional = indexPath.row - 5
                cell.additionalLabel.text = String(additional)
            }
            else {
                let profileImgName = self.profileList[indexPath.row]
                cell.memberButton.setImage(UIImage(named: profileImgName), for: .normal)
                cell.memberButton.isHidden = false
                cell.additionalLabel.isHidden = true
                
                cell.memberButtonAction = { [unowned self] in
                    self.profileImgName = profileImgName
                    self.memberUserName = self.members[indexPath.row]
                    self.memberIndex = indexPath.row
                }
            }
            
            return cell
        }
        else if collectionView == self.pictureCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pictureReuseIdentifier, for: indexPath as IndexPath) as! PictureCollectionViewCell
            let imgName = imgs[indexPath.row]
            cell.pictureImageView.image = UIImage(named: imgName)
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myGoalReuseIdentifier, for: indexPath as IndexPath) as! MyGoalCollectionViewCell
            
            if let achievements = myAchievements {
                let imgName = achievements[indexPath.row] + "White"
                cell.myAchievementImageView.image = UIImage(named: imgName)
            }
            
            return cell
        }
    }
}
