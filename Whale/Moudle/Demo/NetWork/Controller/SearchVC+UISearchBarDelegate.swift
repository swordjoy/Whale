//
//  SearchVC+UISearchBarDelegate.swift
//  Whale
//
//  Created by swordjoy on 2017/11/3.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import Foundation
import UIKit

extension SearchVC: UISearchBarDelegate {
    
    @objc func dismissKeyboard() {
        searchController.searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        requestHelper.getSearchResult(searchKey: searchText) { (songs, error) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if error == "" {
                self.searchResults = songs
                self.tableView.reloadData()
            }
            else {
                print(error)
            }
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        view.addGestureRecognizer(tapRecognizer)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        view.removeGestureRecognizer(tapRecognizer)
    }
}
