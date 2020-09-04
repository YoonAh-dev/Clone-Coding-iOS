//
//  MovieViewController.swift
//  PA3
//
//  Created by SHIN YOON AH on 2020/08/16.
//  Copyright © 2020 SHIN YOON AH. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import Toast_Swift

class MovieViewController: UIViewController {
    private var movieTableView: UITableView = UITableView()
    private let loadingIndicator = UIActivityIndicatorView()
    
    private var movieData: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.title = "영화 목록"
        
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        fetchTopRatedMovies()
        
        setUp()
    }
    
    private func setUp() {
        view.addSubview(movieTableView)
        
        movieTableView.backgroundColor = .black
        movieTableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieTableViewCell")
        movieTableView.snp.makeConstraints{  make in
            make.edges.equalToSuperview()
        }
        
        loadingIndicator.style = .large
        loadingIndicator.color = .gray
        view.addSubview(loadingIndicator)
        loadingIndicator.snp.makeConstraints { maker in
             maker.center.equalToSuperview()
        }
    }
    
    func fetchTopRatedMovies() {
        loadingIndicator.startAnimating()
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=b2289ad94f1bf785bc9d2e08e468e7ef")!
        let request = AF.request(url, method: .get)
        
        request.responseJSON { response in
            self.loadingIndicator.stopAnimating()
                   
            guard let _ = response.value, let data = response.data else {
                self.view.makeToast("네트워크 에러")
                return
            }
                   
            do {
                let jsonData = try JSONDecoder().decode(MovieResponse.self, from: data)
                        
                self.movieData = jsonData.results
                self.movieTableView.reloadData()
            } catch {
                self.view.makeToast("디코딩 에러")
            }
        }
    }
}

extension MovieViewController: UITableViewDataSource, UITableViewDelegate {
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
