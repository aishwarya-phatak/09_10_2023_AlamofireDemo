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
        AF.request(urlString)
            .response{ response in
            print(response.response)
            print(response.data)
            print(response.error)
            
            print(response.result)
            
            switch response.result{
                case .success(let data):
                    self.posts = try! JSONDecoder().decode([Post].self, from: data!)
                    print(self.posts)
                break
                
                case .failure(let error):
                    print(error.localizedDescription)
                break
            }
        }
            
        DispatchQueue.main.async {
            self.postTableView.reloadData()
            }
        }
    }
