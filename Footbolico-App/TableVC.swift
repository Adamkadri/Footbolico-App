//
//  TableVC.swift
//  Footbolico-App
//
//  Created by Adam Kadri on 2019-12-17.
//  Copyright © 2019 Adam Kadri. All rights reserved.
//

import UIKit

class TableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var imgLeague1: UIImageView!
    @IBOutlet weak var imgLeague2: UIImageView!
    @IBOutlet weak var lblLeague1: UILabel!
    @IBOutlet weak var lblLeague2: UILabel!
    @IBOutlet var tableViewLeague1: UITableView!
    @IBOutlet var tableViewLeague2: UITableView!
    
    var league: [leagues] = []
    var firstLeagueEvents:[event] = []
    var secLeagueEvents:[event] = []
    var firstLeague : String = ""
    var secLeague : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.doDetail(_:)), name: NSNotification.Name("Detail"), object: nil)
        getLeagues()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if firstLeague != "" && secLeague != "" && league[0].logoUrl != nil && league[1].logoUrl != nil {
            setLeaguesData()
        }else {
            Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.reloadData), userInfo: nil, repeats: false)
        }
        tableViewLeague1.reloadData()
        tableViewLeague2.reloadData()
    }
    
    // func to reload the Data in case Apis take time to load.
    @objc func reloadData() {
        tableViewLeague1.reloadData()
        tableViewLeague2.reloadData()
        setLeaguesData()
    }
    
    @objc func doDetail(_ notification: NSNotification){
        league = notification.object as! [leagues]
        firstLeagueEvents = league[0].events!
        secLeagueEvents = league[1].events!
        firstLeague = league[0].name!
        secLeague = league[1].name!
    }
    
    func setLeaguesData(){
        lblLeague1.text = firstLeague
        lblLeague2.text = secLeague
        setImgUrl(url: league[0].logoUrl!, img: imgLeague1, sizeStr: "?rule=clip-56x56")
        setImgUrl(url: league[1].logoUrl!, img: imgLeague2, sizeStr: "?rule=clip-56x56")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewLeague1 {
            return firstLeagueEvents.count
        }else {
            return secLeagueEvents.count
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(identifier: "DetailVC") as! DetailsVC
        
        if tableView == tableViewLeague1 {
            vc.event = firstLeagueEvents[indexPath.row]
        }else {
            vc.event = secLeagueEvents[indexPath.row]
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tableViewLeague1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! TableViewCell1
            cell.name1.text = firstLeagueEvents[indexPath.row].homeTeam?.name
            cell.name2.text = firstLeagueEvents[indexPath.row].awayTeam?.name
            setImgUrl(url: firstLeagueEvents[indexPath.row].homeTeam!.logoUrl!, img: cell.myImage1, sizeStr: "?rule=clip-32x32")
            setImgUrl(url: firstLeagueEvents[indexPath.row].awayTeam!.logoUrl!, img: cell.myImage2, sizeStr: "?rule=clip-32x32")
            cell.lblStatusLeague.text = firstLeagueEvents[indexPath.row].status?.type
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! TableViewCell2
            cell.name1.text = secLeagueEvents[indexPath.row].homeTeam?.name
            cell.name2.text = secLeagueEvents[indexPath.row].awayTeam?.name
            setImgUrl(url: secLeagueEvents[indexPath.row].homeTeam!.logoUrl!, img: cell.myImage1, sizeStr: "?rule=clip-32x32")
            setImgUrl(url: secLeagueEvents[indexPath.row].awayTeam!.logoUrl!, img: cell.myImage2, sizeStr: "?rule=clip-32x32")
            cell.lblStatusLeague.text = secLeagueEvents[indexPath.row].status?.type
            
            return cell
        }
    }
}

// Func to convert the string Image-URL to image
extension UIViewController{
    func setImgUrl (url : String, img : UIImageView, sizeStr : String){
        let imageUrl = URL(string: url + sizeStr)
        let imageData = try! Data(contentsOf: imageUrl!)
        img.image = UIImage(data: imageData)
        
    }
}

