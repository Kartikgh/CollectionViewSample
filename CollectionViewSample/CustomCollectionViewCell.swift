//
//  CustomCollectionViewCell.swift
//  CollectionViewSample
//
//  Created by Karthik.Kurdekar on 14/02/25.
//

import Foundation
import UIKit

class CustomCollectionViewCell: UICollectionViewCell, CAAnimationDelegate {
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var buttonIcon: UIButton!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var onTap: ((CustomCollectionViewCell) -> Void)?
    
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
    
    @objc func buttonTapped(_ sender: UIButton) {
        showRippleEffect(sender)
        onTap?(self)
    }
    
    private func showRippleEffect(_ sender: UIButton) {
        let rippleLayer = CALayer()
        rippleLayer.frame = sender.bounds
        rippleLayer.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
        rippleLayer.cornerRadius = sender.bounds.height / 2
        sender.layer.insertSublayer(rippleLayer, below: sender.imageView?.layer)
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 0.5
        scaleAnimation.toValue = 1.5
        scaleAnimation.duration = 0.3
        
        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.fromValue = 1.0
        fadeAnimation.toValue = 0.0
        fadeAnimation.duration = 0.3
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [scaleAnimation, fadeAnimation]
        animationGroup.duration = 0.3
        animationGroup.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animationGroup.delegate = self
        
        rippleLayer.add(animationGroup, forKey: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            rippleLayer.removeFromSuperlayer()
        }
    }
}
