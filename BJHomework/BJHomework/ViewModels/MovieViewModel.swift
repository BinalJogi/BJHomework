//
//  MovieViewModel.swift
//  BJHomework
//
//  Created by Binal on 31/08/2021.
//

import Foundation

protocol MovieViewModelDelegate: AnyObject {
    func displayMovies()
    func displayError(message: String)
}


class MovieViewModel{
    
    //communication between ViewModel and View = Can be done by using closure, delegate and protocol
    
    //MARK:- internal properties
    weak var delegate: MovieViewModelDelegate? //Assigning a nil value so we are uisng optional(?)
    var count: Int { filteredData.count }
    func getTitle(at row: Int)-> String { filteredData[row].originalTitle }
    func getOverview(at row: Int)-> String { filteredData[row].overview}
    
    
    //MARK:- private properties
     var movies = [Movie]()
     var filteredData = [Movie]()
     var favArrayMovies = [Movie]()
     private let networkManager = NetworkManager()
    
    //MARK:- internal properties
    
     func fetchMovies(){
        let urlS = "https://api.themoviedb.org/3/movie/popular?api_key=01fd812f917a955c75e8fcf4d8278bbb&language=en-US"
        networkManager.getMovies(from: urlS) { [weak self]result in
            switch result {
            case .success(let movies):
                self?.movies = movies
                self?.filteredData = movies
                self?.delegate?.displayMovies()
            case .failure(let error):
                self?.delegate?.displayError(message: error.localizedDescription)
            }
        }
            
        }
    
}
