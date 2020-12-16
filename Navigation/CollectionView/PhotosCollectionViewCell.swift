//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Богдан Киселев on 22.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    var photos: Photos? {
        didSet {
            guard let photos = photos else { return }
            collectionPhoto.image = photos.image
        }
    }
    
    private lazy var collectionPhoto : UIImageView = {
      let photo = UIImageView()
        photo.toLayout()
        photo.layer.masksToBounds = true
        photo.contentMode = .scaleAspectFill
        return photo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

private extension PhotosCollectionViewCell {
    
    func setupLayout() {
        
        contentView.addSubview(collectionPhoto)
        
        let constraints = [
            collectionPhoto.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionPhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionPhoto.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    
}
}
