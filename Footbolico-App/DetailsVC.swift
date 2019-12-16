//
//  DetailsVC.swift
//  Footbolico-App
//
//  Created by Adam Kadri on 2019-12-17.
//  Copyright © 2019 Adam Kadri. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController{
    
    //HomeItems
    @IBOutlet weak var imgHomeTeam: UIImageView!
    @IBOutlet weak var homeTeamLbl: UILabel!
    @IBOutlet weak var homeTeamScore: UILabel!
    @IBOutlet weak var homeTeamNameLbl: UILabel!
    @IBOutlet weak var homeTeamIdLbl: UILabel!
    @IBOutlet weak var homeTeamIsWinnerLbl: UILabel!
    
    //AwayItems
    @IBOutlet weak var imgAwayTeam: UIImageView!
    @IBOutlet weak var awayTeamLbl: UILabel!
    @IBOutlet weak var awayTeamScore: UILabel!
    @IBOutlet weak var awayTeamNameLbl: UILabel!
    @IBOutlet weak var awayTeamIdLbl: UILabel!
    @IBOutlet weak var awayTeamIsWinnerLbl: UILabel!
    
    var event: event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // HomeTeam Details
        homeTeamLbl.text = "Home Team"
        homeTeamScore.text = String(event?.result?.runningScore?.home ?? 0)
        homeTeamNameLbl.text = event?.homeTeam?.name
        homeTeamIdLbl.text = "ID : \(event?.homeTeam?.id! ?? "")"
        setImgUrl(url: (event?.homeTeam!.logoUrl)!, img: imgHomeTeam, sizeStr: "?rule=clip-112x112")
       
        if ((event?.homeTeam!.isWinner)!) {
            homeTeamIsWinnerLbl.text = "Is Winner : True"
        }else{
            homeTeamIsWinnerLbl.text = "Is Winner : False"
        }
        
        // AwayTeam Details
        awayTeamLbl.text = "Away Team"
        awayTeamScore.text = String(event?.result?.runningScore?.away ?? 0)
        awayTeamNameLbl.text = event?.awayTeam?.name
        awayTeamIdLbl.text = "ID : \(event?.awayTeam?.id! ?? "")"
        setImgUrl(url: (event?.awayTeam!.logoUrl)!, img: imgAwayTeam, sizeStr: "?rule=clip-112x112")

        if ((event?.awayTeam!.isWinner)!) {
            awayTeamIsWinnerLbl.text = "Is Winner : True"
        }else{
            awayTeamIsWinnerLbl.text = "Is Winner : False"
        }
    }
}
