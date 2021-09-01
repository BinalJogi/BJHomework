//
//  MovieListViewController.swift
//  BJHomework
//
//  Created by Binal on 31/08/2021.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var barSearch: UISearchBar!
    
    var selectedIndex = 0
    
    private let viewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barSearch.delegate = self
//        tableView.delegate = self
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
    
    @IBAction func segment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            selectedIndex = 0
        }
        else if sender.selectedSegmentIndex == 1{
            selectedIndex = 1
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
        if selectedIndex == 0 {
            return viewModel.count
        }
        else {
            return viewModel.favArrayMovies.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell
            else {
            return UITableViewCell()
        }
        let row = indexPath.row
        var title = ""
        var overview = ""
        if selectedIndex == 0 {
             title = viewModel.getTitle(at: row)
             overview = viewModel.getOverview(at: row)
        }else{
            title = viewModel.favArrayMovies[row].originalTitle
            overview = viewModel.favArrayMovies[row].overview
        }
        
        cell.btnStar.tintColor = viewModel.movies[row].isFavourite ? UIColor.red : .lightGray
        
        cell.configureCell(title: title, overview: overview, imageData: nil)
        cell.link = self
        return cell
    }
    
    func favourite(cell : MovieCell){
        let indexPathTapped = tableView.indexPath(for: cell)
        let favourites = viewModel.filteredData[indexPathTapped!.row].isFavourite
        let movie = viewModel.filteredData[indexPathTapped!.row]
        print(movie)
        if favourites {
            viewModel.favArrayMovies.remove(object: movie)
        }else{
            viewModel.favArrayMovies.append(movie)
        }
        viewModel.filteredData[indexPathTapped!.row].isFavourite = !favourites
        
        tableView.reloadRows(at: [indexPathTapped!], with: .fade)
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
    }
}

//extension MovieListViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100.0
//    }
//}

extension MovieListViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        viewModel.filteredData = []
        if searchText == ""{
            viewModel.filteredData = viewModel.movies
        }
        else{
            for movie in viewModel.movies {
                if movie.overview.lowercased().contains(searchText.lowercased()) || movie.originalTitle.lowercased().contains(searchText.lowercased()){
                    viewModel.filteredData.append(movie)
                }
        }
        
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
}

extension Array where Element: Equatable {

    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
    }

}









