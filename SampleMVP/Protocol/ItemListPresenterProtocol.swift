//
//  ItemListPresenterProtocol.swift
//  SampleMVP
//
//  Created by Marcelo Sampaio on 04/12/24.
//

protocol ItemListPresenterProtocol {
    var items: [Item] { get }
    func didSelectItem(at index: Int)
}
