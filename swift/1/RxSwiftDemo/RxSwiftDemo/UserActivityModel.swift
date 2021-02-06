//
//  UserActivityModel.swift
//  RxSwiftDemo
//
//  Created by harsons on 2020/11/24.
//  Copyright © 2020 harsons. All rights reserved.
//

import Foundation
import CoreGraphics

// MARK: model
private struct UserActivityWrapped: Decodable {
    var userActivity: UserActivity
}

struct UserActivity: Decodable {
    private var id: String
    private var pins: [Pin]
}

private struct Pin: Decodable {
    var id: String
    var content: String
    var likeCount: Int
    var createdAt: String
    var commentCount: String
    var viewerHasLiked: Bool
    var pictures: [PictureItem]
    var topic: Topic?
    var user: User
}

struct PictureItem: Decodable {
    var width: CGFloat
    var height: CGFloat
    var localName: String   //本队存储的名称
    var url: String     //图片浏览界面使用原图
    var actUrl: String  //列表界面使用小图片

    enum DecodeKey: String, CodingKey {
        case width, loaclName, height
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DecodeKey.self)
        do {
            width = try container.decode(CGFloat.self, forKey: .width)
            height = try container.decode(CGFloat.self, forKey: .height)
            localName = try container.decode(String.self, forKey: .loaclName)
            actUrl = localName
            url = "act_" + localName
        } catch {
            throw error
        }
    }
}

private struct User: Decodable {
    var id: String
    var username: String
    var selfDescription: String?
    var avatarLarge: String
    var jobTitle: String?
    var company: String?
    var viewerIsFollowing: Bool
    var level: Int
    var juejinPower: Int
}

private struct Topic: Decodable {
    var id: String
    var title: String
}

// MARK: public func
extension UserActivity {
    static func modelFromLocal() -> [UserActivity] {
        let data = loadMainBundleFile("local.json")
        do {
            let activityArray = try JSONDecoder().decode([UserActivityWrapped].self, from: data)
            return activityArray.map { $0.userActivity}
        } catch {
            fatalError("解析Model失败!error:\n\(error) ____#")
        }
    }
}

// MARK: private func
private func loadMainBundleFile(_ name: String) -> Data {
    guard let file = Bundle.main.url(forResource: name, withExtension: nil) else {
        fatalError("Couldn't find \(name) in main  bundle.")
    }
    
    do {
        return try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(name) from main bundle:\n\(error)")
    }
}
