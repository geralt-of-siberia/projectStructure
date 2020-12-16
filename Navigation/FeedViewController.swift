//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

final class FeedViewController: UIViewController {
    
    lazy var buttonStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var firstButton : UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.setTitle("Touch ME", for: .normal)
        button.backgroundColor = .black
        button.layer.shadowPath = UIBezierPath(rect: button.bounds).cgPath
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = false
        return button
    }()
    
    lazy var secondButton : UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.setTitle("Touch ME", for: .normal)
        button.backgroundColor = .white
        button.layer.shadowPath = UIBezierPath(rect: button.bounds).cgPath
        button.layer.cornerRadius = 10
        button.setTitleColor(.black, for: .normal)
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = false
        return button
    }()
    

    func addLayout() {
        
        view.addSubview(buttonStack)
        buttonStack.addSubview(firstButton)
        buttonStack.addSubview(secondButton)
        
        let constraints = [
            buttonStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            buttonStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttonStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            buttonStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            firstButton.topAnchor.constraint(equalTo: buttonStack.topAnchor, constant: 50),
            firstButton.leadingAnchor.constraint(equalTo: buttonStack.leadingAnchor, constant: 50),
            firstButton.trailingAnchor.constraint(equalTo: buttonStack.trailingAnchor, constant: -50),
            firstButton.heightAnchor.constraint(equalToConstant: 40),
            secondButton.bottomAnchor.constraint(equalTo: buttonStack.bottomAnchor, constant: -50),
            secondButton.leadingAnchor.constraint(equalTo: buttonStack.leadingAnchor, constant: 50),
            secondButton.trailingAnchor.constraint(equalTo: buttonStack.trailingAnchor, constant: -50),
            secondButton.heightAnchor.constraint(equalToConstant: 40),


        ]
        
        NSLayoutConstraint.activate(constraints)
        
        
    }
    
    
    
    
   // let post: Post = Post(title: "Пост")
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print(type(of: self), #function)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonStack.backgroundColor = .blue
        
        addLayout()

        print(type(of: self), #function)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "post" else {
            return
        }
     //   guard let postViewController = segue.destination as? PostViewController else {
            return
        }
      //  postViewController.post = post
    }

