//
//  LoginViewController.swift
//  Navigation
//
//  Created by Богдан Киселев on 13.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let colorSet = UIColor(hex: "#4885CC")
    var loginText = ""
    
    private lazy var logoVK: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "VKLogo")
        image.toLayout()
        return image
    }()
    
   private lazy var bluePixel: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "blue_pixel")
        return image
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.toLayout()
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.toLayout()
        return view
    }()
    
    private lazy var autorisationField: UIView = {
        let view = UIView()
        view.toLayout()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemGray
        return view
    }()
    
    private lazy var separator: UIView = {
        let view = UIView()
        view.toLayout()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var loginField : UITextField = {
        let login = UITextField()
        login.font = .systemFont(ofSize: 16)
        login.placeholder = "Print Email or Phone Number"
        login.addTarget(self, action: #selector(loginEdited), for: .editingChanged)
        login.delegate = self
        login.clearButtonMode = .whileEditing
        login.toLayout()
        return login
    }()
    
    private lazy var passwordField : UITextField = {
        let password = UITextField()
        password.font = .systemFont(ofSize: 16)
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.clearButtonMode = .whileEditing
        password.toLayout()
        return password
    }()
    
    private lazy var logInButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(bluePixel.image?.alpha(1), for: .normal)
        button.setBackgroundImage(bluePixel.image?.alpha(0.8), for: .highlighted)
        button.setBackgroundImage(bluePixel.image?.alpha(0.8), for: .selected)
        button.setBackgroundImage(bluePixel.image?.alpha(0.8), for: .disabled)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
        button.toLayout()
        view.endEditing(true)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        addLoginElements()
        addConstraints()
        addObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
       addObservers()
    }
    
    @objc func loginEdited () {
        loginText = loginField.text ?? ""
    }

    func addLoginElements () {
     
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoVK)
        contentView.addSubview(autorisationField)
        autorisationField.addSubview(separator)
        autorisationField.addSubview(loginField)
        autorisationField.addSubview(passwordField)
        contentView.addSubview(logInButton)
        
    }
    
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func addConstraints () {
        
        let loginConstraints = [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoVK.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoVK.widthAnchor.constraint(equalToConstant: 100),
            logoVK.heightAnchor.constraint(equalToConstant: 100),
            logoVK.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            autorisationField.topAnchor.constraint(equalTo: logoVK.bottomAnchor, constant: 120),
            autorisationField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            autorisationField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            autorisationField.heightAnchor.constraint(equalToConstant: 100),
            separator.centerYAnchor.constraint(equalTo: autorisationField.centerYAnchor),
            separator.centerXAnchor.constraint(equalTo: autorisationField.centerXAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5),
            separator.widthAnchor.constraint(equalTo: autorisationField.widthAnchor),
            loginField.centerYAnchor.constraint(equalTo: autorisationField.centerYAnchor, constant: -25),
            loginField.leadingAnchor.constraint(equalTo: autorisationField.leadingAnchor, constant: 16),
            loginField.trailingAnchor.constraint(equalTo: autorisationField.trailingAnchor, constant: -16),
            passwordField.heightAnchor.constraint(equalToConstant: 20),
            passwordField.centerYAnchor.constraint(equalTo: autorisationField.centerYAnchor, constant: 25),
            passwordField.leadingAnchor.constraint(equalTo: autorisationField.leadingAnchor, constant: 16),
            passwordField.trailingAnchor.constraint(equalTo: autorisationField.trailingAnchor, constant: -16),
            passwordField.heightAnchor.constraint(equalToConstant: 20),
            logInButton.topAnchor.constraint(equalTo: autorisationField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ]

        NSLayoutConstraint.activate(loginConstraints)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    
    @objc func touchDown() {
        
        logInButton.setBackgroundImage(bluePixel.image?.alpha(0.8), for: .normal)
        logInButton.setTitle(logInButton.title(for: .normal), for: .normal)
        logInButton.setTitle(logInButton.title(for: .normal), for: .normal)
  let tab = MyTabBarViewController()
      //  present(tab, animated: true, completion: nil)
       // navigationController?.pushViewController(ProfileViewController(), animated: true)
       // navigationController?.pushViewController(tab, animated: true)
        print("PUSH")
        self.navigationController?.pushViewController(tab, animated: true)
     
        
    }
}

extension UIView {
    
    func toLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

extension LoginViewController : UIScrollViewDelegate, UITextFieldDelegate {
    
}

extension UIImage {
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
