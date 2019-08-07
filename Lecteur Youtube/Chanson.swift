//
//  Chanson.swift
//  Lecteur Youtube
//
//  Created by Jean-Paul Berthelot on 07/08/2019.
//  Copyright © 2019 Jean-Paul Berthelot. All rights reserved.
//

import Foundation

class Chanson {
    
    private var _artiste: String
    var artiste: String {return _artiste}
    
    private var _titre: String
    var titre: String {return _titre}
    
    private var _code: String


    
    private var _baseUrlVideo = "https://www.youtube.com/embed/" // logo flèche blanche sur fond rouge
    var videoUrl:String {
        return _baseUrlVideo + _code
    }
    
    
    private var _baseUrlMiniature = "http://i.ytime.com/vi"
    private var _finUrlMiniature = "/maxresdefault.jpg"
    
    var miniatureURL: String {
        return _baseUrlMiniature + _code + _finUrlMiniature
    }

    init(artiste: String,titre: String,code: String) {
        self._artiste = artiste
        self._titre = titre
        self._code  = code
    }


}
