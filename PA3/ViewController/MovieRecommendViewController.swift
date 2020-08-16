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

class MovieRecommendViewController: UIViewController {
    private var movieTableView: UITableView = UITableView(frame: CGRect(), style: .grouped)
    private let dismissButton = UIButton(type: .close)
    
    private var movieData: [Movie] = []
    private var prevMovieData: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieTableView.backgroundColor = .black
                
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        setUp()
    }
    
    private func setUp(){
        view.backgroundColor = .black
        
        view.addSubview(movieTableView)
        view.addSubview(dismissButton)
        
        movieTableView.register(MovieRecommendTableViewCell.self, forCellReuseIdentifier: "MovieRecommendTableViewCell")
        movieTableView.register(MovieHeaderView.self, forHeaderFooterViewReuseIdentifier: "MovieHeaderView")
        movieTableView.snp.makeConstraints{  make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        dismissButton.addTarget(self, action: #selector(didTapDismissButton), for: .touchUpInside)
        dismissButton.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
    }
    
    func fetchSimilarMovieInfo(movieInfo: Movie) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieInfo.id)/similar?api_key=b2289ad94f1bf785bc9d2e08e468e7ef")!
        let request = AF.request(url, method: .get)
        
        request.responseJSON { (jsonData) in
            let movieResponse = try! JSONDecoder().decode(MovieResponse.self, from: jsonData.data!)
            
            self.movieData = movieResponse.results
            
            self.movieTableView.reloadData()
        }
        
        prevMovieData.append(movieInfo)
    }
    
    @objc func didTapDismissButton() {
        dismiss(animated: true, completion: nil)
    }
}

extension MovieRecommendViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieRecommendTableViewCell") as! MovieRecommendTableViewCell
        cell.configure(movieInfo: movieData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                    "MovieHeaderView") as! MovieHeaderView
        view.configure(movieInfo: prevMovieData[0])
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 420
    }
}
