//
//  MyCollectionViewCell.swift
//  CollectionView
//
//  Created by Bruno Horta on 16/10/20.
//

import UIKit


// Protocolo da celula
protocol MyCollectionViewCellDelegate: class {
    
    func goDetailEvent(value: Evento?)
    
}

class MyCollectionViewCell: UICollectionViewCell {

    weak var delegate: MyCollectionViewCellDelegate?// tem que inserir por conta do protocolo
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    private var currentEvent: Evento?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func tappedButton(_ sender: Any) {
        
        print("MyCollectionViewCell========>TappedButton")
        self.delegate?.goDetailEvent(value: self.currentEvent)// disparando o protocolo mas tem que cadastrar no vc 
        
    }
    
    func setup(evento: Evento){
        self.currentEvent = evento
        self.titleLabel.text = evento.nome
        self.backgroundImage.image = UIImage(named: evento.backgroundNameImage ?? "")
        
        
        
    }
    
    
}
