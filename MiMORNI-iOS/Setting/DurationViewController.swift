//
//  DurationViewController.swift
//  MiMORNI-iOS
//
//  Created by Suji Kim on 2/20/21.
//  Copyright © 2021 sjkim. All rights reserved.
//

import UIKit

class DurationViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    let months = ["1 month", "2 months", "3 months"]
    let durationTableReuseIdentifier = "durationTableCell"
    var selectedElement = String()
    
    var userName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.destination is TimeViewController {
            if let vc = segue.destination as? TimeViewController,
                let name = userName
            {
                vc.userName = name
                vc.duration = selectedElement
            }
            
        }
    }
}
