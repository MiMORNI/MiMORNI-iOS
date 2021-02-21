//
//  UITextField+ActivateButton.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/20/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit

extension UITextField {
    func activateButtonIfNotEmpty(button: UIButton) {
        if hasText {
            button.isEnabled = true
            button.backgroundColor = #colorLiteral(red: 1, green: 0.8117647059, blue: 0.2862745098, alpha: 1)
        } else {
            button.isEnabled = false
            button.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        }
    }
}
