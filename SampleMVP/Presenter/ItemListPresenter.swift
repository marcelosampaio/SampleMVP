//
//  ItemListPresenter.swift
//  SampleMVP
//
//  Created by Marcelo Sampaio on 04/12/24.
//

class ItemListPresenter: ItemListPresenterProtocol {
    private weak var view: ItemListViewProtocol?
    var items: [Item] = [
        Item(id: 1, title: "Item 1", description: "This is the first item."),
        Item(id: 2, title: "Item 2", description: "This is the second item."),
        Item(id: 3, title: "Item 3", description: "This is the third item.")
    ]
    
    init(view: ItemListViewProtocol) {
        self.view = view
    }
    
    func didSelectItem(at index: Int) {
        guard index >= 0 && index < items.count else { return }
        let item = items[index]
        view?.navigateToDetail(with: item)
    }
}

