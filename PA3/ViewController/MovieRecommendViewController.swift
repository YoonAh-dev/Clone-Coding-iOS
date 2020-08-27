//
//  MovieRecommendViewController.swift
//  PA3
//
//  Created by SHIN YOON AH on 2020/08/16.
//  Copyright © 2020 SHIN YOON AH. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import Toast_Swift

class MovieRecommendViewController: UIViewController {
    private var movieTableView: UITableView = UITableView(frame: CGRect(), style: .grouped)
    private let loadingIndicator = UIActivityIndicatorView()
    
    private var movieData: [Movie] = []
    private var prevMovieData: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        setUp()
    }
    
    private func setUp() {
        view.backgroundColor = .black
        
        view.addSubview(movieTableView)
        
        movieTableView.backgroundColor = .black
        movieTableView.register(MovieRecommendTableViewCell.self, forCellReuseIdentifier: "MovieRecommendTableViewCell")
        movieTableView.register(MovieRecommendTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "MovieRecommendTableHeaderView")
        movieTableView.snp.makeConstraints{  make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        loadingIndicator.style = .large
        loadingIndicator.color = .gray
        view.addSubview(loadingIndicator)
        loadingIndicator.snp.makeConstraints { maker in
             maker.center.equalToSuperview()
        }
    }
    
    func fetchSimilarMovieInfo(movieInfo: Movie) {
        loadingIndicator.startAnimating()
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieInfo.id)/similar?api_key=b2289ad94f1bf785bc9d2e08e468e7ef")!
        let request = AF.request(url, method: .get)
        
        request.responseJSON { response in
            self.loadingIndicator.stopAnimating()
            
            guard let data = response.data else {
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
        
        prevMovieData.append(movieInfo)
    }
}

extension MovieRecommendViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieRecommendTableViewCell") as! MovieRecommendTableViewCell
        cell.configure(movieInfo: movieData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                    "MovieRecommendTableHeaderView") as! MovieRecommendTableHeaderView
        view.configure(movieInfo: prevMovieData[0])
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 420
    }
}
