//
//  FirstViewController.swift
//  TesteiOS
//
//  Created by Gustavo Quenca on 09/09/18.
//  Copyright © 2018 Quenca. All rights reserved.
//

import UIKit

class InvestimentoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var funNameLabel: UILabel!
    @IBOutlet weak var oQueELabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var riskTitleLabel: UILabel!
    @IBOutlet weak var infoTitleLabel: UILabel!
    @IBOutlet weak var cdMLabel: UILabel!
    @IBOutlet weak var cdALabel: UILabel!
    @IBOutlet weak var cdDozeLabel: UILabel!
    @IBOutlet weak var fundMLabel: UILabel!
    @IBOutlet weak var fundALabel: UILabel!
    @IBOutlet weak var fundDozeLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

