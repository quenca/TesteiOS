//
//  DataSource.swift
//  TesteiOS
//
//  Created by Gustavo Quenca on 09/09/18.
//  Copyright © 2018 Quenca. All rights reserved.
//
import Foundation
import UIKit

class DataSource {
    typealias Completion = (Bool) -> Void
    
    enum State {
        case noResults
        case results(Screen)
    }
    
    private(set) var state: State = .noResults
    
    func getURL () -> URL {
        let urlString = "https://floating-mountain-50292.herokuapp.com/fund.json"
        let url = URL(string: urlString)
        return url!
    }
    
    // Json to Screen
    func parse(data: Data) -> Screen? {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(Result.self, from: data)
            print("Parse complete: \(result.screen)")
            return result.screen
        } catch {
            print("JSON Error: \(error)")
            return nil
        }
    }
    
    func getJSON(completion: @escaping Completion) {
        var dataTask: URLSessionDataTask? = nil
        let url = getURL()
        let session = URLSession.shared
        dataTask = session.dataTask(with: url, completionHandler: { data, response, error in
            var success = false
            var newState = State.noResults
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data {
                let screen = self.parse(data: data)
                if screen == nil {
                    newState = State.noResults
                } else {
                    newState = .results(screen!)
                }
                success = true
            }
            DispatchQueue.main.async {
                self.state = newState
                completion(success)
            }
        })
        dataTask?.resume()
    }
}
