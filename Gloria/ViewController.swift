//
//  ViewController.swift
//  Gloria
//
//  Created by TriNgo on 1/26/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let CardCellReuseIdentifier = "CardCellReuseIdentifier"
    private let dataSources = [UIImage(named: "2_of_clubs"), UIImage(named: "2_of_diamonds"),
                               UIImage(named: "2_of_hearts"), UIImage(named: "2_of_spades")]
    private let names = ["2 of clubs", "2 of diamonds", "2 of hearts", "2 of spades"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        registerCell()
    }
    
    private func registerCell() {
        collectionView.register(UINib(nibName: "CardCell", bundle: nil), forCellWithReuseIdentifier: CardCellReuseIdentifier)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCellReuseIdentifier, for: indexPath) as? CardCell {
            cardCell.image = dataSources[indexPath.item]
            cardCell.name = names[indexPath.item]
            return cardCell
        }
        return UICollectionViewCell()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 375.0, height: view.frame.height)
    }
}
