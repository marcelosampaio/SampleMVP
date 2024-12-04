//
//  ItemDetailViewController.swift
//  SampleMVP
//
//  Created by Marcelo Sampaio on 04/12/24.
//
import UIKit

class ItemDetailViewController: UIViewController {
    private var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func configure(with item: Item) {
        self.item = item
    }
    
    private func setupUI() {
        // Use optional binding to avoid force unwrapping
        if let item = item {
            title = item.title
            
            let label = UILabel(frame: view.bounds)
            label.text = item.description
            label.textAlignment = .center
            label.numberOfLines = 0
            
            view.addSubview(label)
        } else {
            title = "Unknown Item"
            
            let label = UILabel(frame: view.bounds)
            label.text = "Item details not available."
            label.textAlignment = .center
            label.numberOfLines = 0
            
            view.addSubview(label)
        }
    }
}

