//
//  SearchListCollectionViewCell.swift
//  iTunesSearchText
//
//  Created by Yasin Dalkilic on 3.06.2022.
//

import UIKit
import Foundation
import AlamofireImage
import Alamofire

class SearchListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewTopView: UIView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageArtist: UIImageView!
    @IBOutlet weak var labelCollectionPrice: UILabel!
    @IBOutlet weak var labelReleaseDate: UILabel!
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.viewTopView.layer.cornerRadius = 10
    
    }

}
