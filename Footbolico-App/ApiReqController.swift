//
//  ApiReqController.swift
//  Footbolico-App
//
//  Created by Adam Kadri on 2019-12-17.
//  Copyright © 2019 Adam Kadri. All rights reserved.
//

import Foundation

var league = [leagues]()

   func getLeagues() {
    let urlString = "https://sports-app-code-test.herokuapp.com/api/events?date=today"
    let url = URL(string: urlString)!
    let dataTask = URLSession.shared.dataTask(with: url) {(data, response, err) in
        guard let jsonData = data else { return }
        
        do {
            let decoder = JSONDecoder()
            let teamResp = try decoder.decode([leagues].self, from: jsonData)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Detail"), object: teamResp)
        } catch { print("Error:")}
    }
    dataTask.resume()
}
