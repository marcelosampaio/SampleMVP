//
//  ItemListViewProtocol.swift
//  SampleMVP
//
//  Created by Marcelo Sampaio on 04/12/24.
//

protocol ItemListViewProtocol: AnyObject {
    func reloadData()
    func navigateToDetail(with item: Item)
}
