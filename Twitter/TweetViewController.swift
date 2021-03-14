//
//  TweetViewController.swift
//  Twitter
//
//  Created by Kyle George on 3/11/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }//end of viewDidLoad
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil) //dismissing TweetViewController
    }//end of Cancel
    
    
    @IBAction func Tweet(_ sender: Any) {
        if (!tweetTextView.text.isEmpty) {
            print("tweeted")
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
                
            })
        }
        
        else{
            print("didnt tweet")
            self.dismiss(animated: true, completion: nil)
        }
    }//end of Tweet
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}//end of TweetVIewController
