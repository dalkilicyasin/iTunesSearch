//
//  LoginView.swift
//  WeatherExample
//
//  Created by Yasin Dalkilic on 26.05.2022.
//
import Foundation
import UIKit


class MainView : UIView {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.searchBar.setImage(UIImage(named: "search"), for: .search, state: .normal)
        self.searchBar.layer.cornerRadius = 10
        self.searchBar.compatibleSearchTextField.textColor = UIColor.black
        self.searchBar.compatibleSearchTextField.backgroundColor = UIColor.white
        self.searchBar.barTintColor = UIColor.darkGray
    }
    
    override func layoutSubviews() {
      /*  self.collectionView.layer.cornerRadius = 20
        self.collectionView.layer.masksToBounds = true */
    }
    
    
    required init(customParamArg: String) {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
}
