//
//  TableauController.swift
//  Lecteur Youtube
//
//  Created by Jean-Paul Berthelot on 06/08/2019.
//  Copyright © 2019 Jean-Paul Berthelot. All rights reserved.
//

import UIKit

class TableauController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var TableView: UITableView!
    var chansons = [Chanson]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self // cad UITableViewDelegate
        TableView.dataSource = self // idem
        ajouterChanson()
        
    }
    
    // ces 2 fonctions sont nécessaires pour être conformes aux protocoles du delegate et du datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chansons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell() // temporaire : on retourne une vide pour l'instant
    }
    
    func ajouterChanson() {
        chansons = [Chanson]()
        let cool = Chanson(artiste: "Casseurs Flowters", titre: "Ils sont cools", code: "_DT-4-jJTZc")
        chansons.append(cool)
        let bien  = Chanson(artiste: "Orelsan", titre: "tout va bien", code: "dq6G2YWoRqA")
        chansons.append(bien)
        let basique = Chanson(artiste: "Orelsan", titre: "Basique", code: "2bjk26RwjyU")
        chansons.append(basique)
        let ronde = Chanson(artiste: "Orelsan", titre: "La terre est ronde", code: "oGdhZyS2ozo")
        chansons.append(ronde)
        let san = Chanson(artiste: "Orelsan", titre: "San", code: "PejyoeG_TmA")
        chansons.append(san)
        let seul = Chanson(artiste: "Orelsan", titre: "Si seul", code: "cz-PLtXh7Lo")
        chansons.append(seul)
        let inacheves = Chanson(artiste: "Casseurs Flowteurs", titre: "Inachevés", code: "MW1eQZ_PEb4")
        chansons.append(inacheves)
        
        //ReloadData
        TableView.reloadData()
    }

}

