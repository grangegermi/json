//
//  ViewController.swift
//  json
//
//  Created by Даша Волошина on 2.11.22.

import UIKit
//MARK: - First method

//struct Information:Decodable{
//    
//    let comments: [Comments]
//    let total: Int
//    let skip: Int
//    let limit: Int
//}
//
//struct Comments: Decodable {
//    
//    let id: Int
//    let body: String
//    let postId: Int
//    let user:User
//}
//
//struct User: Decodable {
//    let id:Int
//    let username: String
//
//}
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let mainUrl = Bundle.main.url(forResource: "extension", withExtension: "json")!
//        let data = try! Data(contentsOf: mainUrl)
//
//        let json = try! JSONSerialization.jsonObject(with: data) as? [String:Any]
//
//        do {
//          
//            let jsonDecoder = JSONDecoder()
//            let finalData = try jsonDecoder.decode(Information.self, from: data)
//            print(finalData.comments.first?.body)
//            print(finalData.comments.first?.user.id)
//
//        } catch let error {
//            print(error)
//        }
//    }
//    }

//MARK: - Second method

// MARK: - Comments

struct Comments: Decodable {
    
    let comments: [Comment]
    let total, skip, limit: Int
}

// MARK: - Comments

struct Comment: Decodable {
    
    let id: Int
    let body: String
    let postID: Int
    let user: User

    enum CodingKeys: String, CodingKey {
        case id, body
        case postID = "postId"
        case user
    }
}

// MARK: - Comments

struct User: Decodable {
    let id: Int
    let username: String
}

class ViewController:UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let mainUrl = Bundle.main.url(forResource: "extension", withExtension: "json")!
        let data = try! Data(contentsOf: mainUrl)
        
        do {
            
            let jsonDecoder = JSONDecoder()
            let finalData = try jsonDecoder.decode(Comments.self, from: data)
            print(finalData.comments.first?.user.id)
            
            
        } catch let error {
            print(error)
        }
    }
}




