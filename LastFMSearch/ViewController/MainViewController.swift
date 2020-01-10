//
//  ViewController.swift
//  LastFMSearch
//
//  Created by Consultant on 1/8/20.
//  Copyright © 2020 MAC. All rights reserved.
//
//  View Controller class for main home view - searched for albums/songs/artists are displayed on table

import UIKit

class MainViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var mainTableView: UITableView!
    
    //MARK: - Properties
    let viewModel = ViewModel()
    //TODO: search controller
    
    //MARK: - App Life Cycle Functionality
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
    }
    
    // Helper function for setting up the main table
    private func setUpTable() {
        mainTableView.register(UINib(nibName: AlbumTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: AlbumTableCell.identifier)
        
        //TODO: Register other table cells for songs and artists
        mainTableView.tableFooterView = UIView(frame: .zero)
        mainTableView.backgroundColor = .white
        
        // Set ViewModel Delegate
        viewModel.delegate = self
    }
    
    //MARK: - Functionality


}

//MARK: Main Table View Extension
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return viewModel.albums.count
        return 5    // temp test
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableCell.identifier, for: indexPath) as! AlbumTableCell
//        let album = viewModel.albums[indexPath.row]
//        cell.album = album
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //TODO: set viewmodel and other stuff on click
    }
}

extension MainViewController: ViewModelDelegate {
    
    func update() {
        DispatchQueue.main.async{
            self.mainTableView.reloadData()
        }
    }
}

//TODO: Searchbar delegate
