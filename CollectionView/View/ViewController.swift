//
//  ViewController.swift
//  CollectionView
//
//  Created by Felipe Miranda on 16/10/20.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var arrayEventos: [Evento] = [Evento(nome: "Evento1", backgroundNameImage: "image1.jpg"),Evento(nome: "Evento2", backgroundNameImage: "image2.jpg"),Evento(nome: "Evento3", backgroundNameImage: "image3.jpg"),Evento(nome: "Evento4", backgroundNameImage: "image4.jpg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myCollectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCollectionViewCell")
    
        self.myCollectionView.dataSource = self
        self.myCollectionView.delegate = self
        
        
    }

    
    
    
}





extension ViewController:  UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayEventos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: MyCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as? MyCollectionViewCell
        
        cell?.setup(evento: self.arrayEventos[indexPath.row])
        cell?.delegate = self
        return cell ?? UICollectionViewCell()
    }
    
    
    // ======= didSelectItemAt =========
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(self.arrayEventos[indexPath.row].nome)
        
//        self.performSegue(withIdentifier: "DetailVC", sender: self.arrayEventos[indexPath.row])//o sender é o que posso jogar pelo prepare for segue
        
    }
    // =================================
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let evento: Evento? = sender as! Evento
        
        let vc = segue.destination as? DetailVC
        vc?.evento = evento
        
    }
    
    
}

extension ViewController: MyCollectionViewCellDelegate {
    func goDetailEvent(value: Evento?) {
        print("ViewController====>MyCollectionView====>goDetailEvent===========")
        
        self.performSegue(withIdentifier: "DetailVC", sender: value)
    }
    
    
}
