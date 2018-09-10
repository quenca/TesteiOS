//
//  Screen.swift
//  TesteiOS
//
//  Created by Gustavo Quenca on 09/09/18.
//  Copyright © 2018 Quenca. All rights reserved.
//

import Foundation

struct Screen: Codable {
    
    let title: String
    let fundName: String
    let whatIs: String
    let definition: String
    let riskTitle: String
    let risk: Int
    let infoTitle: String
    let info: [Info]
    let downInfo: [Info]?
    let moreInfo: MoreInfo
    
}

class Result: Codable {
    let screen: Screen
}

struct Info: Codable {
    let name: String
    let data: String?
}

struct MoreInfo: Codable {
    let month: MoreInfoDetail
    let year: MoreInfoDetail
    let twelveMonths: MoreInfoDetail
    enum CodingKeys: String, CodingKey {
        case twelveMonths = "12months"
        case year = "year"
        case month = "month"
    }
}

struct MoreInfoDetail: Codable {
    let fund: Double
    let cdi: Double
    enum CodingKeys: String, CodingKey {
        case fund = "fund"
        case cdi = "CDI"
    }
}
