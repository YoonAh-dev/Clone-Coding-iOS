//
//  MovieHeaderView.swift
//  PA3
//
//  Created by SHIN YOON AH on 2020/08/16.
//  Copyright © 2020 SHIN YOON AH. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class MovieHeaderView: UITableViewHeaderFooterView {
    private let headerImage = UIImageView()
    private let headerBackgroundImage = UIImageView()
    private let movieplayButton = UIButton()
    private let titleLabel = UILabel()
    private let overviewLabel = UILabel()
    private let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        contentView.addSubview(headerBackgroundImage)
        contentView.addSubview(headerImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(overviewLabel)
        contentView.addSubview(movieplayButton)
        headerBackgroundImage.addSubview(blurEffectView)
        
        blurEffectView.frame = headerBackgroundImage.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        headerBackgroundImage.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        headerImage.snp.makeConstraints{ make in
            make.size.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(contentView.safeAreaLayoutGuide).inset(10)
        }
        
        titleLabel.font = UIFont.defaultXXLargeBold
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(headerImage.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        overviewLabel.font = UIFont.defaultLargeFont
        overviewLabel.numberOfLines = 6
        overviewLabel.textColor = .white
        overviewLabel.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        
        movieplayButton.setTitle("▶︎ 재생", for: .normal)
        movieplayButton.titleLabel?.font = UIFont.defaultLargeBold
        movieplayButton.titleLabel?.textColor = .white
        movieplayButton.backgroundColor = .red
        movieplayButton.layer.cornerRadius = 10
        movieplayButton.layer.masksToBounds = true
        movieplayButton.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(overviewLabel.snp.bottom).offset(15)
            make.bottom.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
    }
    
    func configure(movieInfo: Movie) {
        let string = "https://image.tmdb.org/t/p/w500/\(movieInfo.posterPath)"
        let url = URL(string: string)!
        headerImage.kf.setImage(with: url)
        headerBackgroundImage.kf.setImage(with: url)
        
        titleLabel.text = movieInfo.title
        
        overviewLabel.text = movieInfo.overview
    }
}
