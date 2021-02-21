//
//  UserNameViewController.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/20/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit

class UserNameViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var nextButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        nextButton.isEnabled = false
        nextButton.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        userNameTextField.becomeFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }

    @IBAction func textFieldChangedAction(_ sender: UITextField) {
        userNameTextField.activateButtonIfNotEmpty(button: nextButton)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.destination is DurationViewController {
            if let vc = segue.destination as? DurationViewController, let name = userNameTextField.text {
                vc.userName = name
            }
            
        }
    }
}

extension UserNameViewController {
    @objc func keyboardWillShow(notification: NSNotification) {

        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                let height = keyboardSize.height
                print(nextButtonBottomConstraint.constant)
                print(height)
                nextButtonBottomConstraint.constant += height
            }

        }

    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y != 0 {
                let height = keyboardSize.height
                print(nextButtonBottomConstraint.constant)
                nextButtonBottomConstraint.constant -= height
                print(nextButtonBottomConstraint.constant)
            }

        }
    }
}
