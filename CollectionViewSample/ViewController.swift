//
//  ViewController.swift
//  CollectionViewSample
//
//  Created by Karthik.Kurdekar on 14/02/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gridcollectionView: UICollectionView!
    
    private let gridCollectionCellData = ["Oxygen","Temperature","Blood Pressure","Heart","Lung","Otoscope","Oxygen","Temperature","Heart","Otoscope", "Heart","Otoscope","Heart","Otoscope"]
    private let images: [String] = ["1","2","3","4","5","1","2","3","4","5","1","2","3","4"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gridcollectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")

        gridcollectionView.dataSource = self
        gridcollectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2, height: 100)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        gridcollectionView.collectionViewLayout = layout
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gridCollectionCellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        cell.titleLabel.text = gridCollectionCellData[indexPath.row]
        cell.buttonIcon.setImage(UIImage(named: images[indexPath.row]), for: .normal)
        
        
        cell.onTap = { tappedCell in
            if let tappedIndexPath = collectionView.indexPath(for: tappedCell) {
                print("Button tapped in cell at index: \(tappedIndexPath.row)")
            }
        }
        return cell
    }
}

