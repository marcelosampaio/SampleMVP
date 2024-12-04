//
//  ItemListViewController.swift
//  SampleMVP
//
//  Created by Marcelo Sampaio on 04/12/24.
//

import UIKit

class ItemListViewController: UIViewController, ItemListViewProtocol {
    private var tableView: UITableView!
    private var presenter: ItemListPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter = ItemListPresenter(view: self)
        reloadData()
    }
    
    private func setupUI() {
        title = "Items"
        view.backgroundColor = .white
        tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func navigateToDetail(with item: Item) {
        let detailVC = ItemDetailViewController()
        detailVC.configure(with: item)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let item = presenter.items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.description
        return cell
    }
}

extension ItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath.row)
    }
}
