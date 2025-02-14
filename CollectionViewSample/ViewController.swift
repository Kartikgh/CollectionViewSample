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
        
        gridcollectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")

        gridcollectionView.dataSource = self
        gridcollectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2, height: 100) // Adjust height as needed
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10

        gridcollectionView.collectionViewLayout = layout
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, MyCustomCellDelegate {
    func didTapButton(in cell: CustomCollectionViewCell) {
        if let indexPath = gridcollectionView.indexPath(for: cell) {
            print("Button tapped in cell at index: \(indexPath.row)")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gridCollectionCellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.delegate = self
        cell.titleLabel.text = gridCollectionCellData[indexPath.row]
        cell.buttonView.setImage(UIImage(named: images[indexPath.row]), for: .normal)
        return cell
    }
}

