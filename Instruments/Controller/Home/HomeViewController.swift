//
//  HomeViewController.swift
//  Instruments
//
//  Created by Ivan Dario Quintero Vallesteros on 23/05/22.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    
    // Try to write all the code and comments in english.
    
    // MARK: - Constantes
    /*
    private let nameInstrumentList = ["Acordeon", "Armonica", "Bajo", "Bateria","Bongo","Campana", "Congas", "Guiro", "Guitarra", "Maracas", "Piano", "Platillos", "Saxofon", "Tambores","Trombon", "Trompeta", "Ukelele", "Violin"]
     */
    
    // The enum way.
    private let nameInstrumentList: [Instrument] = [.acordeon,
                                                    .armonica,
                                                    .bajo,
                                                    .guitarra]
    
    // // The Struct way.
    private let instruments: [InstrumentModel]!
    
    private let myCustomcellWidth = UIScreen.main.bounds.width / 2
    
    // MARK: - Outlets
    // A good practice is to keep all the UI private
    @IBOutlet weak private var collectionView: UICollectionView!
    
    // MARK: - Initialization
    
    private let sHelper = SoundHelper()
    
    
    
    init (){
        instruments = [InstrumentModel(name: "Guitarra",
                                       image: UIImage(named: "Guitarra"))]
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "MyCustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCellCustom")
       
    }
       
}

    // MARK: - Delegado UITableViewDataSource

extension HomeViewController:UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // The enum way
        return nameInstrumentList.count
        
        // The struct way.
//        return instruments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellCustom = collectionView.dequeueReusableCell(withReuseIdentifier: "myCellCustom", for: indexPath) as? MyCustomCollectionViewCell
        
        // The enum way.
        cellCustom?.setupWithInstrument(nameInstrumentList[indexPath.row])
        
        // The struct way.
//        cellCustom?.setupWithInstrumentModels(instruments[indexPath.row])
        
        // Try to avoid forcewraping "!"
        return cellCustom!
    }
    
}

    //MARK: - Delegado UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        sHelper.playSound(soundName: nameInstrumentList[indexPath.row].name)
        collectionView.cellForItem(at: indexPath)?.shine()
    }
    
}

    //MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: myCustomcellWidth, height: myCustomcellWidth)
    }
    
}
