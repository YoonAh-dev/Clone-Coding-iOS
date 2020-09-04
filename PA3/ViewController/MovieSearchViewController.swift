//
//  MovieSearchViewController.swift
//  PA3
//
//  Created by SHIN YOON AH on 2020/08/23.
//  Copyright © 2020 SHIN YOON AH. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import Kingfisher

class MovieSearchViewController: UIViewController {
    private var movieSearchTableView: UITableView = UITableView()
    private let loadingIndicator = UIActivityIndicatorView()
    private var movieSearchBar = UISearchBar()
    
    private var movieData: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.title = "영화 검색"
        
        movieSearchBar.delegate = self
        movieSearchTableView.delegate =  self
        movieSearchTableView.dataSource = self
        
        setUp()
    }
    
    private func setUp(){
        view.addSubview(movieSearchBar)
        view.addSubview(movieSearchTableView)
        
        movieSearchBar.placeholder = "검색"
        movieSearchBar.snp.makeConstraints{ make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        
        movieSearchTableView.backgroundColor = .white
        movieSearchTableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieTableViewCell")
        movieSearchTableView.snp.makeConstraints{  make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(movieSearchBar.snp.bottom)
        }
        
        loadingIndicator.style = .large
        loadingIndicator.color = .gray
        view.addSubview(loadingIndicator)
        loadingIndicator.snp.makeConstraints { maker in
             maker.center.equalToSuperview()
        }
    }
    
    func fetchData(searchMovie: String) {
        loadingIndicator.startAnimating()
        
        let request = AF.request(URL(string: "https://api.themoviedb.org/3/search/movie?api_key=b2289ad94f1bf785bc9d2e08e468e7ef&query=\(searchMovie)")!, method: .get)
            
        request.responseJSON { response in
            self.loadingIndicator.stopAnimating()
                
            guard let _ = response.value, let data = response.data else {
                self.view.makeToast("네트워크 에러")
                return
            }
                
            do {
                let jsonData = try JSONDecoder().decode(MovieResponse.self, from: data)
                    
                self.movieData = jsonData.results
                self.movieSearchTableView.reloadData()
            } catch {
                self.view.makeToast("디코딩 에러")
            }
        }
    }
}

extension MovieSearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as! MovieTableViewCell
        cell.configure(movieInfo: movieData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MovieRecommendViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.fetchSimilarMovieInfo(movieInfo: movieData[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MovieSearchViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            movieData.removeAll()
            movieSearchTableView.reloadData()
        } else {
            fetchData(searchMovie: searchText)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        movieSearchBar.text = nil
    }
}

