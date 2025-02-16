//
//  ViewController.swift
//  CollectionViewSample
//
//  Created by Karthik.Kurdekar on 14/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
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
        
        setupViews()
        setupConstraints()
        populateStackView()
    }
    
    private func setupViews() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
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
            
            let cellView = CustomStackViewCell()
            cellView.configure(with: data)
            cellView.tag = index
            cellView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cellTapped(_:))))
            rowStackView?.addArrangedSubview(cellView)
        }
    }
    
    @objc private func cellTapped(_ sender: UITapGestureRecognizer) {
        guard let cellView = sender.view as? CustomStackViewCell else { return }
        let index = cellView.tag
        print("Tapped on index: \(index), Title: \(cellView.getTitle())")
    }
}

class CustomStackViewCell: UIView {
    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 4
        layer.masksToBounds = false
        
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        imageView.contentMode = .scaleAspectFit
        
        let stack = UIStackView(arrangedSubviews: [imageView, titleLabel])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configure(with data: GridData) {
        titleLabel.text = data.title
        imageView.image = UIImage(named: data.imageName)
    }
    
    func getTitle() -> String {
        return titleLabel.text ?? ""
    }
}
