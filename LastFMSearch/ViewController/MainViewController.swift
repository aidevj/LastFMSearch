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
    let searchController = UISearchController(searchResultsController: nil)
    
    var isFiltering: Bool {
        return !searchController.searchBar.text!.isEmpty && searchController.isActive   // for update with typing
    }
    
    //MARK: - App Life Cycle Functionality
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        setUpSearch()
    }
    
    // Helper function for setting up the main table
    private func setUpTable() {
        mainTableView.register(UINib(nibName: AlbumTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: AlbumTableCell.identifier)
        mainTableView.register(UINib(nibName: ArtistTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: ArtistTableCell.identifier)
        mainTableView.register(UINib(nibName: TrackTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: TrackTableCell.identifier)
        
        mainTableView.tableFooterView = UIView(frame: .zero)
        mainTableView.backgroundColor = .white
        
        viewModel.delegate = self
        
        // MANUAL TEST:
//        viewModel.getAlbums("Believe")
//        viewModel.getArtists("Cher")
//        viewModel.getTracks("Believe")
    }
    
    // Helper function to set up Search Controller
    private func setUpSearch() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
    
    private func filter(with search: String) {
        viewModel.filteredAlbums = []
        viewModel.filteredArtists = []
        viewModel.filteredTracks = []
        
//        viewModel.filteredAlbums = viewModel.albums({
//
//        })
    }

}

//MARK: Main Table View Extension
    // Case 0 - Albums
    // Case 1 - Artists
    // Case 2 - Tracks
extension MainViewController: UITableViewDataSource {
    
    // Set up 3 sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // Set up rows in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return viewModel.albums.count
        case 1:
            return viewModel.artists.count
        case 2:
            return viewModel.tracks.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableCell.identifier, for: indexPath) as! AlbumTableCell
            let album = viewModel.albums[indexPath.row]
            cell.album = album
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: ArtistTableCell.identifier, for: indexPath) as! ArtistTableCell
            let artist = viewModel.artists[indexPath.row]
            cell.artist = artist
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: TrackTableCell.identifier, for: indexPath) as! TrackTableCell
            let track = viewModel.tracks[indexPath.row]
            cell.track = track
            return cell
        default:
            return UITableViewCell.init()
        }
    }
    
    // Section headers
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Albums"
        case 1:
            return "Artists"
        case 2:
            return "Tracks"
        default:
            return ""
        }
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
        case 0:
            let album = viewModel.albums[indexPath.row]
            viewModel.currentAlbum = album      // will retain after leaving that storyboard?
        case 1:
            let artist = viewModel.artists[indexPath.row]
            viewModel.currentArtist = artist
        case 2:
            let track = viewModel.tracks[indexPath.row]
            viewModel.currentTrack = track
        default:
            break
        }

        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsVC.viewModel = viewModel
        detailsVC.hidesBottomBarWhenPushed = true
        navigationController?.view.backgroundColor = .white
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension MainViewController: ViewModelDelegate {
    
    func update() {
        DispatchQueue.main.async{
            self.mainTableView.reloadData()
        }
    }
}

//MARK: - Search Bar Delegate
extension MainViewController: UISearchBarDelegate, UISearchResultsUpdating {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let search = searchBar.text,
            let sanitized = search.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        
        viewModel.getAlbums(sanitized)
        viewModel.getArtists(sanitized)
        viewModel.getTracks(sanitized)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let search = searchController.searchBar.text,
            let sanitized = search.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        
        viewModel.getAlbums(sanitized)
        viewModel.getArtists(sanitized)
        viewModel.getTracks(sanitized)
    }
}
