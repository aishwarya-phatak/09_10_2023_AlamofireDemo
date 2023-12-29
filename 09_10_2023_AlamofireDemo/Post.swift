//
//  Post.swift
//  09_10_2023_AlamofireDemo
//
//  Created by Vishal Jagtap on 28/12/23.
//

import Foundation
//model class Post
struct Post : Decodable{
    var userId : Int
    var id : Int
    var title : String
    var body : String
}
