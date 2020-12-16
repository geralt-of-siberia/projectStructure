//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Богдан Киселев on 15.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(photoTap))
    
    let headerView = ProfileHeaderView()
    
    lazy var crossTapGesture = UITapGestureRecognizer(target: self, action: #selector(crossTap))
    
    private lazy var shadeView: UIView = {
        let shade = UIView()
        shade.backgroundColor = .black
        shade.toLayout()
        return shade
    }()
    
    private lazy var cross : UIImageView = {
      let image = UIImageView()
        image.image = #imageLiteral(resourceName: "cross")
        image.toLayout()
        image.addGestureRecognizer(crossTapGesture)
        image.isUserInteractionEnabled = true
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: String(describing: FeedTableViewCell.self))
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: String(describing:PhotosTableViewCell.self ))
        tableView.toLayout()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        title = "Profile"
        view.backgroundColor = .white
        headerView.avatar.addGestureRecognizer(tapGesture)
        print(type(of: self), #function)
    }
    
    @objc func photoTap() {
        
        self.headerView.avatar.removeFromSuperview()
        self.animationLayout(true)
        self.headerView.avatar.addSubview(self.cross)
        self.cross.topAnchor.constraint(equalTo: self.headerView.avatar.topAnchor).isActive = true
        self.cross.trailingAnchor.constraint(equalTo: self.headerView.avatar.trailingAnchor).isActive = true
        self.cross.widthAnchor.constraint(equalToConstant: 20).isActive = true
        self.cross.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.cross.alpha = 0
        
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
            self.headerView.avatar.layer.cornerRadius = 0
            self.headerView.avatar.layer.borderWidth = 0
            self.shadeView.alpha = 0.9
            
        }) { finished in

            UIView.animate(withDuration: 0.3, animations: {
                self.view.setNeedsLayout()
                self.view.layoutIfNeeded()
                self.cross.alpha = 1
                
                
            })
            
        }
    
    }
    
    @objc func crossTap() {
        
        self.animationLayout(false)
        UIView.animate(withDuration: 0.5, animations: {
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
            self.headerView.avatar.layer.cornerRadius = 60
            self.headerView.avatar.layer.borderWidth = 3
            
            
        }) {finished in
            self.cross.removeFromSuperview()
            self.shadeView.removeFromSuperview()
            self.headerView.avatar.removeFromSuperview()
            self.headerView.addHeaderConstraints()
            
        }
        
        
        
    }
    
    private func animationLayout(_ isTapped : Bool) {
        
        let animatedConstraints = [
            shadeView.topAnchor.constraint(equalTo: view.topAnchor),
            shadeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            shadeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shadeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.avatar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            headerView.avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerView.avatar.widthAnchor.constraint(equalTo: view.widthAnchor),
            headerView.avatar.heightAnchor.constraint(equalTo: view.widthAnchor),
        ]
        
        if isTapped == true {
            
            view.addSubview(shadeView)
            view.addSubview(headerView.avatar)
            NSLayoutConstraint.activate(animatedConstraints)
        } else {
            
            NSLayoutConstraint.deactivate(animatedConstraints)
            headerView.addHeaderConstraints()
        }
        
    }
    
    private func setUpLayout() {
        
        view.addSubview(tableView)
        
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

}

extension ProfileViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard indexPath.section == 0 else { return tableView.deselectRow(at: indexPath, animated: true) }
        let photos = PhotosViewController()
        navigationController?.pushViewController(photos, animated: true)
        
        
}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard section == 1 else {return 1}
        
        return Storage.posts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell2 = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath)
        
        guard indexPath.section == 1 else {return cell2}
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedTableViewCell.self), for: indexPath) as? FeedTableViewCell {
            cell.post = Storage.posts[indexPath.row]
            return cell
}
            
        
        return UITableViewCell()
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        return headerView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(type(of: self), #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(type(of: self), #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(type(of: self), #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(type(of: self), #function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(type(of: self), #function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(type(of: self), #function)
    }
    
}

