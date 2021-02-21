//
//  StoryViewController.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/21/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit
import Kingfisher

class StoryViewController: UIViewController {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageView: UIImageView!
    
    var achieved:[String]?
    var memberName:String?
    var profileImageName:String?
    let achievementReuseIdentifier = "memberGoalReuseIdentifier"
    var pics:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let name = memberName, let profile = profileImageName {
            userNameLabel.text = name
            profileImageView.image = UIImage(named:profile)
        }
        print(achieved)
        print(pics)
//        self.collectionView.reloadData()
        self.view.reloadInputViews()
        if let pic = pics {
            let url = URL(string: pic)
            imageView.kf.setImage(with: url)
        }
    }

    @IBAction func backButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
