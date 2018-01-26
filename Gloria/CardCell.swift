//
//  CardCell.swift
//  Gloria
//
//  Created by TriNgo on 1/26/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var ivBack: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    private var isOpen = false
    
    override func awakeFromNib() {
        super.awakeFromNib()

        cardView.layer.cornerRadius = 10.0
        cardView.clipsToBounds = true
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowRadius = 8.0
        cardView.layer.shadowOffset = .zero
        cardView.layer.shadowOpacity = 0.6
        cardView.layer.masksToBounds = false
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapCardView(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    var image: UIImage? {
        didSet {
            renderBack()
        }
    }
    
    var name: String?
    
    @objc func tapCardView(_ sender: UITapGestureRecognizer) {
        if isOpen {
            isOpen = false
            renderBack()
        } else {
            isOpen = true
            renderFront()
        }
    }
    
    private func renderBack() {
        lbName.isHidden = true
        ivBack.isHidden = false
        ivBack.image = image
        UIView.transition(with: cardView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    private func renderFront() {
        lbName.isHidden = false
        ivBack.isHidden = true
        lbName.text = name!
        UIView.transition(with: cardView, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
    }
}
