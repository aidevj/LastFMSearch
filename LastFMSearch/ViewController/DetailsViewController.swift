//
//  AlbumViewController.swift
//  LastFMSearch
//
//  Created by Consultant on 1/8/20.
//  Copyright © 2020 MAC. All rights reserved.
//
//  View Controller class for detail view of selected Album, displaying associated songs
//      from Main VC or Artist VC

import UIKit

class DetailsViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var detailsTableView: UITableView!
    
    //MARK: Properties
    
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetails()
    }
    
    //Helper function
    private func setupDetails() {
        title = "Information"
        viewModel.detailsDelegate = self
        
        detailsTableView.register(UINib(nibName: DetailsTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: DetailsTableCell.identifier)
        detailsTableView.tableFooterView = UIView(frame: .zero)
        detailsTableView.backgroundColor = .white
        detailsTableView.separatorStyle = .none
    }

}

//MARK: - Table Extensions
extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailsTableCell.identifier, for: indexPath) as! DetailsTableCell
        let selectedAlbum = viewModel.currentAlbum
        
        cell.detailTitle.text = selectedAlbum?.name
        cell.detailLink.text = selectedAlbum?.url
//        if let detailImageUrl = URL(string: (selectedAlbum?.image[0].url)!) { // bad
//            detailImageUrl.getImage { img in
//                if let image = img {
//                    cell.detailImage.image = image
//                }
//            }
//        }
        return cell
    }
    
    
}

extension DetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - Details Delegate
extension DetailsViewController: DetailsDelegate {

    func update() {
        DispatchQueue.main.async {
            self.detailsTableView.reloadData()
        }
    }
}


