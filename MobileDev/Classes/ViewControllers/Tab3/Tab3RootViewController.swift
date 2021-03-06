//
//  Tab3RootViewController.swift
//  MobileDev
//
//  Created by Denys Danyliuk on 11.02.2021.
//

import UIKit
import TableKit

final class Tab3RootViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableDirector = TableDirector(tableView: tableView)
        }
    }
    
    // MARK: - Private properties
    
    private var tableDirector: TableDirector!
    private var movieManager = MoviesManager.shared
    private var movies: [Movie] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movies = movieManager.fetchMovies()
        setupTableView()
    }
    
    private func setupTableView() {
        
        tableView.tableFooterView = UIView()
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        tableView.separatorStyle = .none
        updateTableView()
    }
    
    private func updateTableView() {
        
        tableDirector.clear()
        
        movies.forEach { movie in
            
            let section = TableSection(headerView: nil, footerView: nil)
            section += TableRow<MovieTableViewCell>(item: movie)
            tableDirector += section
        }
        
        tableDirector.reload()
    }
}
