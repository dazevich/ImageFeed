//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Даниил Азевич on 17/10/2024.
//

import Foundation
import UIKit

class ProfileViewController : UIViewController {
    
    static private let mockUser = UserModel(userName: "Екатерина Новикова", userNickname: "ekaterina_nov", userStatus: "Hello, world!!!", userImage: "0")
    
    private let userNameLabel = UILabel()
    private let userNicknameLabel = UILabel()
    private let userStatusLabel = UILabel()
    private let userImageView = UIImageView()
    private let exitButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        buildProfileView(userModel: Self.mockUser)
    }
    
    private func configureView() {
        view.backgroundColor = .ypBlack;
    }
    

    
    private func buildProfileView(userModel : UserModel) {
        configureText(for: userNameLabel, text: userModel.userName, fontSize: 23, fontWeight: UIFont.Weight.black, textColor: .ypWhite, letterSpacing: 0.3)
        configureText(for: userNicknameLabel, text: userModel.userNickname, fontSize: 13, fontWeight: UIFont.Weight.regular, textColor: .ypGray, prefix: "@")
        configureText(for: userStatusLabel, text: userModel.userStatus, fontSize: 13, fontWeight: UIFont.Weight.semibold, textColor: .ypWhite)
        
        userImageView.image = userModel.userImage != nil ? UIImage(named: userModel.userImage!) : UIImage(resource: .userStub)
        userImageView.layer.cornerRadius = 35
        userImageView.layer.masksToBounds = true
        exitButton.setImage(.exit, for: [])
        
        builTopSection()
        buildUserInfo()
    }
    
    private func configureText(for label: UILabel, text: String, fontSize: CGFloat, fontWeight: UIFont.Weight, textColor: UIColor) {
        label.text = text
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: fontSize)
    }
    
    private func configureText(for label: UILabel, text: String, fontSize: CGFloat, fontWeight: UIFont.Weight, textColor: UIColor, prefix: String) {
        label.text = "\(prefix)\(text)"
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
    }
    
    private func configureText(for label: UILabel, text: String, fontSize: CGFloat, fontWeight: UIFont.Weight, textColor: UIColor, letterSpacing: Double) {
        let style = [NSAttributedString.Key.kern: letterSpacing]
        let attriburedString = NSAttributedString(string: text, attributes: style)
        label.attributedText = attriburedString
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
    }
    
    private func builTopSection() {
        disableAutoresizingMask(for: [userImageView, exitButton])
        view.addSubview(userImageView)
        view.addSubview(exitButton)
        
        NSLayoutConstraint.activate([
            // user image
            userImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            userImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            userImageView.heightAnchor.constraint(equalToConstant: 70),
            userImageView.widthAnchor.constraint(equalToConstant: 70),
            // exit button
            exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45),
            exitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            exitButton.heightAnchor.constraint(equalToConstant: 44),
            exitButton.widthAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    private func buildUserInfo() {
        let stack = UIStackView(arrangedSubviews: [userNameLabel, userNicknameLabel, userStatusLabel])
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .equalSpacing
        disableAutoresizingMask(for: [stack, userNameLabel, userNicknameLabel, userStatusLabel])
        
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 8),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    private func disableAutoresizingMask(for views : [UIView]) {
        views.forEach() {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
