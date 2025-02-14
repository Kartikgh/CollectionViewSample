//
//  CustomCollectionViewCell.swift
//  CollectionViewSample
//
//  Created by Karthik.Kurdekar on 14/02/25.
//

import Foundation
import UIKit


protocol MyCustomCellDelegate: AnyObject {
    func didTapButton(in cell: CustomCollectionViewCell)
}

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var buttonView: UIButton!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    weak var delegate: MyCustomCellDelegate?
    
    override func awakeFromNib() {
         super.awakeFromNib()
        
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 12
        bgView.layer.shadowColor = UIColor.black.cgColor
        bgView.layer.shadowOpacity = 0.2
        bgView.layer.shadowOffset = CGSize(width: 0, height: 4)
        bgView.layer.shadowRadius = 6
        
        actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        delegate?.didTapButton(in: self)
    }
}
