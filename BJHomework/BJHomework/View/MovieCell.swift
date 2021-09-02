//
//  MovieCell.swift
//  BJHomework
//
//  Created by Binal on 31/08/2021.
//

import Foundation
import UIKit

protocol MovieCellDelegate: AnyObject {
    func favourite(row: Int)
    func showDetail(row: Int)
}

class MovieCell: UITableViewCell {

    static let identifier = "MovieCell"
    weak var delegate: MovieCellDelegate?

    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblOverview: UILabel!
    @IBOutlet weak var imgImageView: UIImageView!
    @IBOutlet weak var btnStar: UIButton!
    private var row = 0
    
    func configureCell(title: String?,
                       overview: String?,
                       imageData: Data?,
                       row: Int){
        
        lblTitle.text = title
        lblOverview.text = overview
        imgImageView.image = nil
        
        if let data = imageData {
            imgImageView.image = UIImage(data: data)
        }
        self.row = row
    }
    
    @IBAction func btnShowDeatils(_ sender: Any) {
        delegate?.showDetail(row: row)
    }
    @IBAction func btnStar(_ sender: Any) {
        delegate?.favourite(row: row)
    }
}
