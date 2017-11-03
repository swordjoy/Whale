//
//  SearchVC.swift
//  Whale
//
//  Created by swordjoy on 2017/11/3.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import UIKit

class SearchVC: UITableViewController {

    lazy var searchController: UISearchController = lazySearchController()
    
    lazy var tapRecognizer: UITapGestureRecognizer = {
        var recognizer = UITapGestureRecognizer(target:self, action: #selector(dismissKeyboard))
        return recognizer
    }()
    
    var searchResults: [Song] = []
    let requestHelper = RequestHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
}

extension SearchVC: UISearchControllerDelegate {
    
}

// MARK: - config
extension SearchVC {
    
    private func lazySearchController() -> UISearchController {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }
    
    private func config() {
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.title = "歌单"
        navigationItem.searchController = searchController
        tableView.tableFooterView = UIView()
    }
    
}

// MARK: - tableView delegate
extension SearchVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SongCell = tableView.dequeueReusableCell(for: indexPath)
        let song = searchResults[indexPath.row]
        cell.songInfo = song
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



