//
//  TabBarViewController.swift
//  Navigation
//
//  Created by Богдан Киселев on 13.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    // scrollView
        private lazy var scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        // contentView, которое будет растягивать scrollView
        private lazy var contentView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        // imageView с картинкой логотипа
        private lazy var logoImageView: UIImageView = {
            let logo = UIImageView()
            logo.translatesAutoresizingMaskIntoConstraints = false
            logo.image = UIImage(named: "logo")
            return logo
        }()
        // общий контейнер для texField'ов с логином и паролем и разделителем этих полей
        private lazy var emailAndPassCommonContainer: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.borderColor = UIColor.lightGray.cgColor
            view.layer.borderWidth = 0.5
            view.layer.cornerRadius = 10
            view.backgroundColor = .systemGray6
            return view
        }()
        // разедитель полей логина и пароля
        private lazy var separator: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .lightGray
            return view
        }()
        // UIView контайнер для TextField логина
        private lazy var loginContainer: UIView = {
            let container = UIView()
            container.translatesAutoresizingMaskIntoConstraints = false
    //        container.backgroundColor = .red
            return container
        }()
        // поле для ввода логина
        private lazy var loginTextField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            textField.textColor = .black
            textField.placeholder = "Email or phone"
            return textField
        }()
        override func viewDidLoad() {
            super.viewDidLoad()
            // задаем цвет фона и скрываем navigation bar
            view.backgroundColor = .white
            navigationController?.navigationBar.isHidden = true
            // добавляем все вьюхи на родительскую вью
            view.addSubview(scrollView)
            scrollView.addSubview(contentView)
            contentView.addSubview(logoImageView)
            contentView.addSubview(emailAndPassCommonContainer)
            emailAndPassCommonContainer.addSubview(separator)
            emailAndPassCommonContainer.addSubview(loginContainer)
            loginContainer.addSubview(loginTextField)
            /// Keyboard observers
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
            // задаем констрейнты для всех вью
            let constraints = [
                // scrollView
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                // contentView со всеми элементами, которое будет растягивать scrollView
                contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                // картинка с лого
                logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
                logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                logoImageView.widthAnchor.constraint(equalToConstant: 100),
                logoImageView.heightAnchor.constraint(equalToConstant: 100),
                // общий контейнер для логина и пароля
                emailAndPassCommonContainer.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
                emailAndPassCommonContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                emailAndPassCommonContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                emailAndPassCommonContainer.heightAnchor.constraint(equalToConstant: 100),
                // разделитель для общего контейрера с логином и паролем
                separator.centerYAnchor.constraint(equalTo: emailAndPassCommonContainer.centerYAnchor),
                separator.centerXAnchor.constraint(equalTo: emailAndPassCommonContainer.centerXAnchor),
                separator.heightAnchor.constraint(equalToConstant: 0.5),
                separator.widthAnchor.constraint(equalTo: emailAndPassCommonContainer.widthAnchor),
                // контайнер для TextField логина
                loginContainer.topAnchor.constraint(equalTo: emailAndPassCommonContainer.topAnchor, constant: 12),
                loginContainer.leadingAnchor.constraint(equalTo: emailAndPassCommonContainer.leadingAnchor, constant: 16),
                loginContainer.trailingAnchor.constraint(equalTo: emailAndPassCommonContainer.trailingAnchor, constant: -16),
                loginContainer.heightAnchor.constraint(equalToConstant: 26),
                // текстовое поле для ввода логина
                loginTextField.centerYAnchor.constraint(equalTo: loginContainer.centerYAnchor),
                loginTextField.centerXAnchor.constraint(equalTo: loginContainer.centerXAnchor),
                loginTextField.heightAnchor.constraint(equalToConstant: 26),
                loginTextField.widthAnchor.constraint(equalTo: loginContainer.widthAnchor)
            ]
            NSLayoutConstraint.activate(constraints)
        }
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        // MARK: Keyboard actions
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
}
