//
//  VideoController.swift
//  Lecteur Youtube
//
//  Created by Jean-Paul Berthelot on 08/08/2019.
//  Copyright © 2019 Jean-Paul Berthelot. All rights reserved.
//

import UIKit
import WebKit

class VideoController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    
    var chanson: Chanson?
    
    //@IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor.blue
        if chanson != nil {
            //title = chanson?.titre //(fait avant)
            chargerVideo(chanson: chanson!)
        }

    }
    
    func chargerVideo(chanson: Chanson){
      if let url = URL(string: chanson.videoUrl){
        let requete = URLRequest(url: url)
          webView.load(requete)
        }
    }
    


}
