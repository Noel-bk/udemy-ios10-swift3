//
//  PartyRock.swift
//  PartyRockApp
//
//  Created by Noel Nolan Masters on 2/28/17.
//  Copyright © 2017 Noel. All rights reserved.
//

import Foundation

class PartyRock {
    private var _imageURL: String!
    private var _videoURL: String!
    private var _videoTitle: String!
    
    var imageURL: String {
        return self._imageURL
    }
    
    var videoUrl: String {
        return self._videoURL
    }
    
    var videoTitle: String {
        return self._videoTitle
    }
    
    init(imageURL: String, videoURL: String, videoTitle: String) {
        self._imageURL = imageURL
        self._videoURL = videoURL
        self._videoTitle = videoTitle
    }
    
}
