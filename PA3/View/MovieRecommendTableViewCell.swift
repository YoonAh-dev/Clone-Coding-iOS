//
//  MovieRecommendTableViewCell.swift
//  PA3
//
//  Created by SHIN YOON AH on 2020/08/16.
//  Copyright © 2020 SHIN YOON AH. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class MovieRecommendTableViewCell: UITableViewCell {
    private var posterImage = UIImageView()
    private var titleLabel = UILabel()
    private var overviewLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        contentView.backgroundColor = .black
        
        contentView.addSubview(posterImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(overviewLabel)
        
        posterImage.snp.makeConstraints{ make in
            make.leading.top.bottom.equalToSuperview().inset(10)
            make.width.equalTo(UIScreen.main.bounds.width/3)
            make.height.equalTo(150)
        }
        
        titleLabel.font = UIFont.defaultXXLargeBold
        titleLabel.textColor = .white
        titleLabel.snp.makeConstraints{ make in
            make.leading.equalTo(posterImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(10)
        }
        
        overviewLabel.font = UIFont.defaultLargeFont
        overviewLabel.textColor = .white
        overviewLabel.numberOfLines = 6
        overviewLabel.snp.makeConstraints{ make in
            make.leading.equalTo(posterImage.snp.trailing).offset(10)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    func configure(movieInfo: Movie) {
        guard let moviePosterPath = movieInfo.posterPath else {
            return
        }
        let string = "https://image.tmdb.org/t/p/w500/\(moviePosterPath)"
        let url = URL(string: string)!
        posterImage.kf.setImage(with: url)
        
        if movieInfo.title != nil {
           titleLabel.text = movieInfo.title
        } else {
            titleLabel.text = "UNKNOWN"
        }
        
        if movieInfo.overview != nil {
            overviewLabel.text = movieInfo.overview
        } else {
            overviewLabel.text = ""
        }
    }
}
