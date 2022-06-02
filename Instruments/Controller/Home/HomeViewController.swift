//
//  HomeViewController.swift
//  Instruments
//
//  Created by Ivan Dario Quintero Vallesteros on 23/05/22.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    
    // MARK: - Constantes
    
    private let nameInstrumentList = ["Acordeon", "Armonica", "Bajo", "Bateria","Bongo","Campana", "Congas", "Guiro", "Guitarra", "Maracas", "Piano", "Platillos", "Saxofon", "Tambores","Trombon", "Trompeta", "Ukelele", "Violin"]
    
    private let myCustomcellWidth = UIScreen.main.bounds.width / 2
    
    // MARK: - Outlets
  
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Initialization
    
    let sHelper = SoundHelper()
    
    
    
    init (){
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "MyCustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCellCustom")
       
    }
       
}

    // MARK: - Delegado UITableViewDataSource

extension HomeViewController:UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameInstrumentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellCustom = collectionView.dequeueReusableCell(withReuseIdentifier: "myCellCustom", for: indexPath) as? MyCustomCollectionViewCell
        
        cellCustom!.instrumentLabel.text = nameInstrumentList[indexPath.row]
        cellCustom!.instrumentImage.image = UIImage(named: nameInstrumentList[indexPath.row])
        
        
        return cellCustom!
    }
    
}

    //MARK: - Delegado UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        sHelper.playSound(soundName: "nameInstrumentList")
        
    }
    
}

    //MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: myCustomcellWidth, height: myCustomcellWidth)
    }
    
}
