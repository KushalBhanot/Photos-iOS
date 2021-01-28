//
//  CoverArtCollectionViewCell.swift
//  Photos
//
//  Created by kushal on 28/01/21.
//

import UIKit

class CoverArtCollectionViewCell: UICollectionViewCell {
    
    var coverArtImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        coverArtImageView = UIImageView()
        coverArtImageView.contentMode = .scaleAspectFill
        coverArtImageView.layer.masksToBounds = true
        coverArtImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coverArtImageView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            coverArtImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            coverArtImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            coverArtImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            coverArtImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
    
    func configure(coverArt: CoverArt) {
        coverArtImageView.image = UIImage(named: coverArt.imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
