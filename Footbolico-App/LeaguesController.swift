//
//  LeaguesController.swift
//  Footbolico-App
//
//  Created by Adam Kadri on 2019-12-17.
//  Copyright © 2019 Adam Kadri. All rights reserved.
//

import Foundation

struct leagues : Decodable{
    var id : Int?
    var name : String?
    var logoUrl : String?
    var events : [event]?
}

struct event : Decodable{
    var id : Int?
    var startDate : String?
    var homeTeam : homeTeam?
    var awayTeam : awayTeam?
    var result : result?
    var status : status?
}

struct homeTeam : Decodable{
    var id : String?
    var name : String?
    var logoUrl : String?
    var isWinner : Bool?
}


struct awayTeam : Decodable{
    var id : String?
    var name : String?
    var logoUrl : String?
    var isWinner : Bool?
}

struct result : Decodable{
    var runningScore : runningScore?
}

struct runningScore : Decodable{
    var home : Int?
    var away : Int?
    }

struct status : Decodable{
    var type : String?
}
