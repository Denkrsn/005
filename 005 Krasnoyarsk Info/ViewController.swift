//
//  ViewController.swift
//  005 Krasnoyarsk Info
//
//  Created by Denis Ganevitch on 14/11/2017.
//  Copyright © 2017 Denis Ganevitch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    @IBAction func getButton(_ sender: UIButton) {
        guard let testURL = URL(string: "http://93.92.65.26/aspx/ShemHtml5RayonsFurSite.aspx?x_KodRayon=4") else {return}
        
        let session = URLSession.shared
        session.dataTask(with: testURL) {(data, response, error) in
            if let response = response{
                print (response)
                
            }
            guard let data=data  else {return}
            print(data)
            
            do {let json = try JSONSerialization.jsonObject(with: data, options: [])
                print (json)
            } catch{
                print(error)
            }
                
           
        }.resume()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
   //тут используем скрипт с сайта Администрации Красноярска
        
        if let search = URL (string:"http://93.92.65.26/aspx/ShemHtml5RayonsFurSite.aspx")
        {
        let field = URLRequest(url: search)
            webView.loadRequest (field)
            
    
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

