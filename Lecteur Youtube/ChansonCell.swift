//
//  ChansonCell.swift
//  Lecteur Youtube
//
//  Created by Jean-Paul Berthelot on 07/08/2019.
//  Copyright © 2019 Jean-Paul Berthelot. All rights reserved.
//

import UIKit

class ChansonCell: UITableViewCell {

    @IBOutlet weak var miniature: UIImageView!
    @IBOutlet weak var artisteEtTitreLabel: UILabel!
    
    var chanson: Chanson! // ! donc non optionnel
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func creerCell(_ chanson: Chanson){
        self.chanson = chanson
        telechargerImage()
        // il y a l'erreur suivante car on accepte les https mais pas les http :
        // 2019-08-07 18:29:00.324444+0200 Lecteur Youtube[8049:712662] App Transport Security has blocked a cleartext HTTP (http://) resource load since it is insecure. Temporary exceptions can be configured via your app's Info.plist file.
        // on va donc modifier temporairement dans info.plist
        let attributed = NSMutableAttributedString(string: self.chanson.titre,attributes: [.font: UIFont.boldSystemFont(ofSize: 20),.foregroundColor: UIColor.black])
        let secondeLigne = NSAttributedString(string: "\n" + self.chanson.artiste,attributes: [.font: UIFont.italicSystemFont(ofSize: 20),.foregroundColor: UIColor.darkGray])
        attributed.append(secondeLigne)
        artisteEtTitreLabel.attributedText = attributed
    }
    
    func telechargerImage() {
        miniature.image = UIImage(named: "logo")
        
        if let url = URL(string: self.chanson.miniatureURL) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                if let imageData = data, let image = UIImage(data: imageData) {
                    // on est en asynchrone, donc on revient au main par cet artifice
                    // DispatchQueue affiche toutes les queus en cours (en choisissant main, on passe sur la principale)
                    DispatchQueue.main.async {
                        self.miniature.image = image
                    }
                }
            }
            task.resume()
        }
    }
    
//    func telechargerImage(){
//
//        miniature.image = UIImage(named: "logo")
//
//        let url = URL(string: self.chanson.miniatureURL)
//        let session = URLSession.shared
//        // attend la complétion du handler
//
//        let task = session.dataTask(with: url!) { (data, response, error) in
//            // on vérifie 2 choses dans le if
//            // que data soit pas nil et que c'est une image car on peut créer une image à partir de
//            // image data
//            if let imageData = data, let image = UIImage(data: imageData) {
//                // on est en asynchrone, donc on revient au main par cet artifice
//                DispatchQueue.main.async {
//                    self.miniature.image = image
//                }
//            print(error)
//            }
//
//        }
//        task.resume() // nécessaire pour revenir sur le main car les ouvertures de session se font en background ..
//
//    }
    
}

