//
//  BreedImagesViewController.swift
//  dogTest
//
//  Created by Carlos Jimenez on 08-02-18.
//  Copyright © 2018 Carlos Jimenez. All rights reserved.
//

import UIKit

class BreedImagesViewController: UIViewController {

    @IBOutlet var dogsCollectionView: UICollectionView!
    private var viewModel : BreedImagesViewModel?
    
    init(viewModel : BreedImagesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: BreedImagesViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfigurations()
        fetchData()
    }
    
    private func viewConfigurations() {
        dogsCollectionView.register(UINib.init(nibName: DogCell.nibName, bundle: nil), forCellWithReuseIdentifier: DogCell.identifier)
    }
    
    private func fetchData(){
        self.viewModel?.fetchDogsList(completionHandler: { [weak self] in
            self?.dogsCollectionView.reloadData()
        })
    }

    
}

extension BreedImagesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.getDogsCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DogCell.identifier, for: indexPath) as? DogCell{
            cell.config(urlOrigin: self.viewModel?.getDog(index: indexPath.row) ?? "")
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    
}
