//
//  FeedTableViewCell.swift
//  Navigation
//
//  Created by Богдан Киселев on 19.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    var post: Post? {
        didSet {
            guard let post = post else { return }
            
            postImageView.image = post.image
            postAuthor.text = post.author
            postLikes.text = "Likes \(post.likes)"
            postViews.text = "Views \(post.views)"
            descriptionPost.text = post.description
        }
    }
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.toLayout()
        return imageView
    }()
    
    private let postAuthor: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 2
        label.toLayout()
        return label
    }()

    private let postLikes: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.toLayout()
        return label
    }()
    
    private let postViews: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.toLayout()
        return label
    }()
    
    private let descriptionPost: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.toLayout()
        return label
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
private extension FeedTableViewCell {
    func setupLayout() {
        
        contentView.addSubview(postImageView)
        contentView.addSubview(postAuthor)
        contentView.addSubview(descriptionPost)
        contentView.addSubview(postLikes)
        contentView.addSubview(postViews)
        
        let constraints = [
            postAuthor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            postAuthor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postAuthor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postImageView.topAnchor.constraint(equalTo: postAuthor.bottomAnchor, constant: 16),
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionPost.topAnchor.constraint(equalTo: postImageView.bottomAnchor),
            descriptionPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postLikes.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: 16),
            postLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postLikes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            postViews.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: 16),
            postViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)

        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
