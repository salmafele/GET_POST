//
//  ViewController.swift
//  GET_POST
//
//  Created by Salma on 12/1/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
@IBOutlet weak var usernameTextField: UITextField!
@IBOutlet weak var passwordTextField: UITextField!
    
@IBAction func onGetTapped(_ sender: Any) {
    guard let url = URL(string: "https://itunes.apple.com/lookup?") else { return }
    let session =  URLSession.shared
    session.dataTask(with: url) { (data, response, error) in
        if let response = response {
            print(response)
        }
        if let data = data {
            print(data)
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
        }
    }.resume()
}
    
@IBAction func onPostTapped(_ sender: Any) {
        
    func postFunc(){
        let param = ["usernamer": "Salma", "tweets": "Hi" ]
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
                
        var request = URLRequest(url: url)
            request.httpMethod = "POST"
                
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    
                do{
                    let data = try JSONSerialization.data(withJSONObject: param, options: [])
                        request.httpBody = data
                        
                } catch {
                    print(error)
                }
                
                let task = URLSession.shared.dataTask(with: request, completionHandler: {data, response, error  in
                    if let response = response{
                        print(response)
                        }
                        if let data = data {
                            do{
                                let json = try JSONSerialization.jsonObject(with: data, options: [])
                                print(json)
                            }
                            catch {
                                print(error)
                            }
                        }
        //                print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue))
                        //print(response)
                    })
                    task.resume()
            }
            
        func viewDidLoad() {
                super.viewDidLoad()
                // Do any additional setup after loading the view.
            }
            
        }
}
