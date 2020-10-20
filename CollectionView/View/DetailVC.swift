//
//  DetailVC.swift
//  CollectionView
//
//  Created by Bruno Horta on 19/10/20.
//

import UIKit

class DetailVC: UIViewController {

    
    var evento: Evento?
    
    @IBOutlet weak var eventoImageView: UIImageView!
    @IBOutlet weak var eventoDetailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.eventoImageView.image = UIImage(named: self.evento?.backgroundNameImage ?? "")
        self.eventoDetailLabel.text = self.evento?.nome
    
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
