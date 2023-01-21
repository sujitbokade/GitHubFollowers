//
//  FavoritesViewController.swift
//  GitHubFollowers
//
//  Created by Macbook on 11/01/23.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    let tableView = UITableView()
    var favorites:[Follower] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title   =  "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame  = view.bounds
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier:FavoritesTableViewCell.reuseId)
    }
    
    func getFavorites() {
        PersistenceManager.retrievFavorites { [weak self] result in
            guard let self = self else {return}
            
            switch result {
            case .success(let favorites):
                print(favorites)
                if favorites.isEmpty {
                    self.showEmptyStateView(with: "No Favorites?\nAdd ont on the Follower screen", in: self.view)
                } else {
                    self.favorites = favorites
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.view.bringSubviewToFront(self.tableView)
                    }
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something Went Wrong", message: error.rawValue, buttonTitle: "Ok")
                
            }
        }
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.reuseId) as! FavoritesTableViewCell
        let favorite = favorites[indexPath.row]
        cell.set(favorite: favorite)
        return cell
        
    }
    
    
}
