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
    
    // on doit aussi ajouter ce identifiant cell dans le champs identifier de "ChansonCell" sur mainstory board
    
    let identifiantCell = "ChansonCell"
    let identifiantSegue = "VersVideo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self // cad UITableViewDelegate
        TableView.dataSource = self // idem
        ajouterChanson()
        //navigationController?.title = "Mes vidéos préférées"
        title = "Vidéos bien nulles"
        
    }
    
    // ces 2 fonctions sont nécessaires pour être conformes aux protocoles du delegate et du datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chansons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cette fonction crée une boucle sur toutes les cellules de la table (de 0 à count - 1)
        let chanson = chansons[indexPath.row]
        print(indexPath.row)
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifiantCell) as? ChansonCell {
            cell.creerCell(chanson)
            return cell
        }
        
        // ce return la si cela ne fonctionne pas
        return UITableViewCell()
        
        
        // ancienne version avant la création de chansonCell Swift :
//        let cell = UITableViewCell()
//        cell.textLabel?.text = chanson.titre
//        return cell
        //return UITableViewCell() // temporaire : on retourne une vide pour l'instant (écran avec que des lignes sur l'iphone) --> c'était avant d'implémenter cell
    }
    
    // permet de définir une hauteur fixe de 150 à chacune des cellules de la tableview
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    // fonction qui se lance quand on sélectionne la ligne : d'ou didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // ligne sur laquelle on
        let chanson = chansons[indexPath.row]
        // le perform est appelé en premier
        performSegue(withIdentifier: identifiantSegue, sender: chanson)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifiantSegue {
            if let nouveauController = segue.destination as? VideoController {
                nouveauController.chanson = sender as? Chanson
            }
        }
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

