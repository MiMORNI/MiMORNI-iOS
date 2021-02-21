//
//  MemberCollectionViewCell.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/21/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit

class MemberCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var memberButton: UIButton!
    @IBOutlet weak var additionalLabel: UILabel!
    
    var memberButtonAction : (() -> ())?
    
    @IBAction func memberButtonClicked(_ sender: UIButton) {
        print("memberButtonClicked")
        memberButtonAction?()
    }
}
