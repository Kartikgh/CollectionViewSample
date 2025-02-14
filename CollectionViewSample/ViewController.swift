//
//  ViewController.swift
//  CollectionViewSample
//
//  Created by Karthik.Kurdekar on 14/02/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gridcollectionView: UICollectionView!
    
    private let gridCollectionCellData: [GridData] = [
        GridData(title: "Oxygen", imageName: "1"),
        GridData(title: "Temperature", imageName: "2"),
        GridData(title: "Blood Pressure", imageName: "3"),
        GridData(title: "Heart", imageName: "4"),
        GridData(title: "Lung", imageName: "5"),
        GridData(title: "Otoscope", imageName: "1"),
        GridData(title: "Oxygen", imageName: "2"),
        GridData(title: "Temperature", imageName: "3"),
        GridData(title: "Heart", imageName: "4"),
        GridData(title: "Otoscope", imageName: "5"),
        GridData(title: "Heart", imageName: "1"),
        GridData(title: "Otoscope", imageName: "2"),
        GridData(title: "Heart", imageName: "3"),
        GridData(title: "Otoscope", imageName: "4")
    ]

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
        
        let cellData = gridCollectionCellData[indexPath.row]
        cell.configure(with: cellData)
        
        cell.onTap = { tappedCell in
            if let tappedIndexPath = collectionView.indexPath(for: tappedCell) {
                print("Button tapped in cell at index: \(tappedIndexPath.row)")
            }
        }
        return cell
    }
}

