//
//  BreedsListViewController.swift
//  dogTest
//
//  Created by Carlos Jimenez on 08-02-18.
//  Copyright © 2018 Carlos Jimenez. All rights reserved.
//

import UIKit

protocol BreedListProtocol{
    func selectBreed(name: String)
}

class BreedsListViewController: UIViewController {

    @IBOutlet var breedsTableView: UITableView!
    private var viewModel : BreedsListViewModel?
    
    
    var delegate: BreedListProtocol?
    
    init(viewModel : BreedsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: BreedsListViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfigurations()
        fetchData()
    }
    
    private func viewConfigurations() {
        self.title = self.viewModel?.title ?? ""
        breedsTableView.register(UINib.init(nibName: BreedsCell.nibName, bundle: nil), forCellReuseIdentifier: BreedsCell.identifier)
    }
    
    private func fetchData(){
        self.viewModel?.fetchBreedsList(completionHandler: { [weak self] in
            self?.breedsTableView.reloadData()
        })
    }

}

extension BreedsListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.getBreedsCount() ?? 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: BreedsCell.identifier, for: indexPath) as? BreedsCell{
            cell.config(breedName: self.viewModel?.getBreed(index: indexPath.row) ?? "")
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectBreed(name: self.viewModel?.getBreed(index: indexPath.row) ?? "")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.viewModel?.getHeightRow() ?? 50
    }
}


