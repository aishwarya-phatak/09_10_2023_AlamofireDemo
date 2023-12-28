//
//  ViewController.swift
//  09_10_2023_AlamofireDemo
//
//  Created by Vishal Jagtap on 28/12/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var postTableView: UITableView!
    let urlString = "https://jsonplaceholder.typicode.com/posts"
    var posts : [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       httpNetworkingByAlamorfire()
    }
    
    func httpNetworkingByAlamorfire(){
        AF.request(urlString).responseJSON{ response in
            print(response.response)
            print(response.data)
            print(response.error)
            print(response.result)
            
//            let postSerializedResponse = JSONDecoder()
            
            for eachPostResponse in postSerializedResponse{
                let eachPost = eachPostResponse as! [String:Any]
                let eachPostUserID = eachPost["userId"] as! Int
                let eachPostId = eachPost["id"] as! Int
                let eachPostTitle = eachPost["title"] as! String
                let eachPostDescription = eachPost["description"] as! String
                
                let newPostObject = Post(
                    userId: eachPostUserID,
                    id: eachPostId,
                    title: eachPostTitle,
                    description: eachPostDescription)
                
                self.posts.append(newPostObject)
            }
            
            DispatchQueue.main.async {
                self.postTableView.reloadData()
            }
        }
    }
}
