//
//  AppSearchController.swift
//  AppStoreJsonApi
//
//  Created by Ömer Faruk Kılıçaslan on 20.06.2022.
//

import UIKit


class AppsSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .systemBackground
        
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        
        fetchITunesApps()
    }
    

    
    fileprivate func fetchITunesApps() {
        
        let urlString = "https://itunes.apple.com/search?term=Instagram&entity=software"
        
        guard let url = URL(string: urlString) else {return}
        
        //fetch data from internet
        
        URLSession.shared.dataTask(with: url) { data, resp, err in
            
            if let err = err {
                //means there is an error occured
                print("Failed to fetch apps", err)
                return
            }
            
            //success
            
            guard let data = data else {return}
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                searchResult.results.forEach({print($0.trackName, $0.primaryGenreName)})
            } catch let jsonErr {
                print("Failed to decode JSON : ", jsonErr)
            }
            
            

            
            
        }.resume() //fires off the request
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        
        cell.nameLabel.text = "Here is my app name"
        
        return cell
    }

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
