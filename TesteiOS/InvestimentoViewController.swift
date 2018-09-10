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
    
    var dataSource = DataSource()
    var screen: Screen? {
        didSet {
            //  numberOfRows = 1
            tableView.reloadData()
        }
    }
    var numberOfRows = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.getJSON { (didSucceed) in
            if case let .results(screen) = self.dataSource.state {
                self.screen = screen
                self.titleLabel.text = self.screen?.title
                self.funNameLabel.text = self.screen?.fundName
                self.oQueELabel.text = self.screen?.whatIs
                self.definitionLabel.text = self.screen?.definition
                self.riskTitleLabel.text = self.screen?.riskTitle
                self.infoTitleLabel.text = self.screen?.infoTitle
                self.cdMLabel.text = String(format: "%.1f",(self.screen?.moreInfo.month.cdi)!)
                self.cdALabel.text = String(format: "%.1f", (self.screen?.moreInfo.year.cdi)!)
                self.cdDozeLabel.text = String(format: "%.1f", (self.screen?.moreInfo.twelveMonths.cdi)!)
                self.fundMLabel.text = String(format: "%.1f", (self.screen?.moreInfo.month.fund)!)
                self.fundALabel.text = String(format: "%.1f", (self.screen?.moreInfo.year.fund)!)
                self.fundDozeLabel.text = String(format: "%.1f", (self.screen?.moreInfo.twelveMonths.fund)!)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

