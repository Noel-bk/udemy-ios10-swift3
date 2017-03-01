//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Noel Nolan Masters on 2/26/17.
//  Copyright © 2017 Noel. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "https://i.ytimg.com/i/ikFwyFOljUy1SlljiTrZYA/1.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/bTFQUMZG8Q8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Nothing is Gonna Change My Love for You")
        
        let p2 = PartyRock(imageURL: "http://www.joeleader.com/wp-content/uploads/2013/03/IMG_5555%20-%20what%20light%20from%20yonder%20window%20breaks-150x150.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/6RrwDpDrE04\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Joe Leader - Caruso (LIVE SAX, London 2013)")
        
        let p3 = PartyRock(imageURL: "http://placehold.it/150x150", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/s1dWgVlJskY\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Kotaro Oshio - wind song")
        
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
    
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath as IndexPath) as? PartyCell {
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }

}

