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
    
    struct TableViewCellIdentifiers {
        static let infoCell = "InfoTableViewCell"
    }
    
    override func viewDidLoad() {
        
        var cellNib = UINib(nibName: TableViewCellIdentifiers.infoCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: TableViewCellIdentifiers.infoCell)
        
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

extension InvestimentoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        switch dataSource.state {
        case .noResults:
            return 0
        case .results(let list):
            return list.info.count
        }
        // return numberOfRows
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch dataSource.state {
        case .noResults:
            print("ERROR ------")
            fatalError("Error")
            
        case .results(let list):
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.infoCell, for: indexPath) as! InfoTableViewCell
            
            //    let donwnCell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.downInfoCell, for: indexPath) as! DownInfoTableViewCell
            
            //   let downResult = list.downInfo![indexPath.row]
            //   print("--- Down Info no table view: \(downResult)")
            
            let screenResult = list.info[indexPath.row]
            print("Screen no table view: \(screenResult)")
            cell.configure(for: screenResult)
            return cell
        }
    }
}


