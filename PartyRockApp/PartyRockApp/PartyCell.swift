//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Noel Nolan Masters on 2/28/17.
//  Copyright © 2017 Noel. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateUI(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle
        // TODO: set image from url
    }
    
}
