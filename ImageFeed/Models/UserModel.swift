//
//  UserModel.swift
//  ImageFeed
//
//  Created by Даниил Азевич on 17/10/2024.
//

import Foundation

final class UserModel {
    var userName : String
    var userNickname : String
    var userStatus : String
    var userImage : String?
    
    init(userName: String, userNickname: String, userStatus: String, userImage: String?) {
        self.userName = userName
        self.userNickname = userNickname
        self.userStatus = userStatus
        self.userImage = userImage
    }
}
