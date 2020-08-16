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
    private let titleLabel = UILabel()
    private let overviewLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        contentView.backgroundColor = .black

        contentView.addSubview(headerImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(overviewLabel)
        
        headerImage.snp.makeConstraints{ make in
            make.size.equalTo(200)
            make.centerX.equalToSuperview()
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
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    func configure(movieInfo: Movie) {
        let string = "https://image.tmdb.org/t/p/w500/\(movieInfo.posterPath)"
        let url = URL(string: string)!
        headerImage.kf.setImage(with: url)
        
        titleLabel.text = movieInfo.title
        
        overviewLabel.text = movieInfo.overview
    }
}
