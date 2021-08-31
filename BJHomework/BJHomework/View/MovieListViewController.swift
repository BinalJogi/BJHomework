//
//  MovieListViewController.swift
//  BJHomework
//
//  Created by Binal on 31/08/2021.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private let viewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        setUpBinding()
    }
    
    private func setUpBinding(){
        
        viewModel.delegate = self
        viewModel.fetchMovies()
    }
    
    @IBAction func btnEdit(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


extension MovieListViewController: MovieViewModelDelegate {
    func displayMovies() {
        DispatchQueue.main.async { [ unowned self] in
            self.tableView.reloadData()
        }
    }
    
    func displayError(message: String) {
        DispatchQueue.main.async { [ unowned self] in
            self.displayError(message: message)
        }
    }
}


extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell
        else { return UITableViewCell() }
        
        let row = indexPath.row
        let title = viewModel.getTitle(at: row)
        let overview = viewModel.getOverview(at: row)
        cell.configureCell(title: title, overview: overview, imageData: nil)
        
        return cell
    }
}

extension MovieListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}









