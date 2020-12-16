//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Богдан Киселев on 22.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var photosTitle : UILabel = {
       let label = UILabel()
        label.text = "Photos"
        label.font = .boldSystemFont(ofSize: 24)
        label.toLayout()
        return label
    }()
    
    private lazy var firstPhoto : UIImageView = {
        let photo = UIImageView()
        photo.toLayout()
        photo.layer.masksToBounds = true
        photo.layer.cornerRadius = 6
        photo.contentMode = .scaleAspectFill
        photo.image = #imageLiteral(resourceName: "col9")
        return photo
    }()
    
    private lazy var secondPhoto : UIImageView = {
        let photo = UIImageView()
        photo.toLayout()
        photo.contentMode = .scaleAspectFill
        photo.layer.masksToBounds = true
        photo.layer.cornerRadius = 6
        photo.image = #imageLiteral(resourceName: "col8")
        return photo
    }()
    
    private lazy var thirdPhoto : UIImageView = {
        let photo = UIImageView()
        photo.toLayout()
        photo.layer.cornerRadius = 6
        photo.layer.masksToBounds = true
        photo.contentMode = .scaleAspectFill
        photo.image = #imageLiteral(resourceName: "col4")
        return photo
    }()
    
    private lazy var fourthPhoto : UIImageView = {
        let photo = UIImageView()
        photo.toLayout()
        photo.layer.cornerRadius = 6
        photo.layer.masksToBounds = true
        photo.contentMode = .scaleAspectFill
        photo.image = #imageLiteral(resourceName: "col15")
        return photo
    }()
    
    private lazy var arrowSign : UIImageView = {
        let photo = UIImageView()
        photo.toLayout()
        photo.image = #imageLiteral(resourceName: "arrowSign")
        return photo
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
   
}

// MARK: Layout
private extension PhotosTableViewCell {
    func setupLayout() {
        
        
        
        contentView.addSubview(photosTitle)
        contentView.addSubview(arrowSign)
        contentView.addSubview(firstPhoto)
        contentView.addSubview(secondPhoto)
        contentView.addSubview(thirdPhoto)
        contentView.addSubview(fourthPhoto)
        
        let constraints = [
            photosTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            arrowSign.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrowSign.widthAnchor.constraint(equalToConstant: 12),
            arrowSign.heightAnchor.constraint(equalToConstant: 12),
            arrowSign.centerYAnchor.constraint(equalTo: photosTitle.centerYAnchor),
            firstPhoto.topAnchor.constraint(equalTo: photosTitle.bottomAnchor, constant: 12),
            firstPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            firstPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            firstPhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            secondPhoto.centerYAnchor.constraint(equalTo: firstPhoto.centerYAnchor),
            secondPhoto.leadingAnchor.constraint(equalTo: firstPhoto.trailingAnchor, constant: 8),
            thirdPhoto.centerYAnchor.constraint(equalTo: secondPhoto.centerYAnchor),
            thirdPhoto.leadingAnchor.constraint(equalTo: secondPhoto.trailingAnchor, constant: 8),
            fourthPhoto.centerYAnchor.constraint(equalTo: thirdPhoto.centerYAnchor),
            fourthPhoto.leadingAnchor.constraint(equalTo: thirdPhoto.trailingAnchor, constant: 8),
            //fourthPhoto.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            firstPhoto.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25, constant: -12),
            secondPhoto.widthAnchor.constraint(equalTo: firstPhoto.widthAnchor),
            thirdPhoto.widthAnchor.constraint(equalTo: firstPhoto.widthAnchor),
            fourthPhoto.widthAnchor.constraint(equalTo: firstPhoto.widthAnchor),
            secondPhoto.heightAnchor.constraint(equalTo: firstPhoto.widthAnchor),
            thirdPhoto.heightAnchor.constraint(equalTo: firstPhoto.widthAnchor),
            fourthPhoto.heightAnchor.constraint(equalTo: firstPhoto.widthAnchor),
            firstPhoto.heightAnchor.constraint(equalTo: firstPhoto.widthAnchor)



        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
