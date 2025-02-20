//
//  ViewController.swift
//  CollectionViewSample
//
//  Created by Karthik.Kurdekar on 14/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
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
        GridData(title: "Otoscope", imageName: "4"),
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
        
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        populateStackView()
    }
    
    private func populateStackView() {
        var rowStackView: UIStackView?
        
        for (index, data) in gridCollectionCellData.enumerated() {
            if index % 2 == 0 {
                rowStackView = UIStackView()
                rowStackView?.axis = .horizontal
                rowStackView?.alignment = .fill
                rowStackView?.distribution = .fillEqually
                rowStackView?.spacing = 16
                rowStackView?.translatesAutoresizingMaskIntoConstraints = false
                stackView.addArrangedSubview(rowStackView!)
            }
            
            let button = CustomStackViewButton()
            button.configure(with: data)
            button.tag = index
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            rowStackView?.addArrangedSubview(button)
        }
        
       /* for (index, data) in gridCollectionCellData.enumerated() {
            if index % 2 == 0 {
                rowStackView = UIStackView()
                rowStackView?.axis = .horizontal
                rowStackView?.alignment = .fill
                rowStackView?.distribution = .fillEqually
                rowStackView?.spacing = 16
                rowStackView?.translatesAutoresizingMaskIntoConstraints = false
                stackView.addArrangedSubview(rowStackView!)
            }
            
            let cellView = CustomStackViewCell()
            cellView.configure(with: data)
            cellView.tag = index
            cellView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cellTapped(_:))))
            rowStackView?.addArrangedSubview(cellView)
        }*/
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        print("Button tapped at index: \(sender.tag)")
    }
    
    /* @objc private func cellTapped(_ sender: UITapGestureRecognizer) {
        guard let cellView = sender.view as? CustomStackViewCell else { return }
        let index = cellView.tag
        print("Tapped on index: \(index), Title: \(cellView.getTitle())")
    }*/
}
