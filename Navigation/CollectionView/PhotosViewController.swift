//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Богдан Киселев on 22.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    let layout = UICollectionViewFlowLayout()
    
    private lazy var photosCollection : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PhotosCollectionViewCell.self))
        cv.toLayout()
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = true
        view.backgroundColor = .systemGray
        setupLayout()
    }
    override func viewWillDisappear (_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = photosCollection.cellForItem(at: indexPath)  as? PhotosCollectionViewCell
        photosCollection.bringSubviewToFront(selectedCell!)

        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 0, options: [], animations: {
            selectedCell?.transform = CGAffineTransform(scaleX: 2, y: 2)
            })
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let unselectedCell = photosCollection.cellForItem(at: indexPath)  as? PhotosCollectionViewCell
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 0, options: [], animations: {
                unselectedCell?.transform = .identity
            })
    }
}

extension PhotosViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (photosCollection.bounds.width-16)/3
        
        return .init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
}


extension PhotosViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        PhotoStorage.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PhotosCollectionViewCell = photosCollection.dequeueReusableCell(withReuseIdentifier: String(describing: PhotosCollectionViewCell.self), for: indexPath) as! PhotosCollectionViewCell
        cell.backgroundColor = .black
        cell.photos = PhotoStorage.photos[indexPath.row]
        return cell
    }
    
    
    
    
}

private extension PhotosViewController {
    
    func setupLayout (){
        view.addSubview(photosCollection)
        let constraints = [
        
            photosCollection.topAnchor.constraint(equalTo: view.topAnchor),
            photosCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            photosCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            photosCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -8)
        ]
        NSLayoutConstraint.activate(constraints)
        
        
    }
}
