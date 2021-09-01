//
//  MovieCell.swift
//  BJHomework
//
//  Created by Binal on 31/08/2021.
//

import Foundation
import UIKit

class MovieCell: UITableViewCell {

    static let identifier = "MovieCell"
    var link : MovieListViewController?

    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblOverview: UILabel!
    @IBOutlet private weak var imgImageView: UIImageView!
    @IBOutlet weak var btnStar: UIButton!
    
    func configureCell(title: String?, overview: String?, imageData: Data? ){
        
        lblTitle.text = title
        lblOverview.text = overview
        imgImageView.image = nil
        if let data = imageData {
            imgImageView.image = UIImage(data: data)
        }
    }
    
    @IBAction func btnShowDeatils(_ sender: Any) {
    }
    @IBAction func btnStar(_ sender: Any) {
        btnStar.addTarget(self, action: #selector(markAsFavourite), for: .touchUpInside)
    }
    @objc func markAsFavourite(){
        print("Mark as Fav")
        link?.favourite(cell: self)
    }
    
}
