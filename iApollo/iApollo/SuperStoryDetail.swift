//
//  SuperStoryDetail.swift
//  InfoMaxApollo
//
//  Created by Shreya Garg on 4/21/15.
//  Copyright (c) 2015 akash_kapoor. All rights reserved.
//

import Foundation
import UIKit

class SuperStoryDetail: UIViewController, UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var arrayOfTweets:[Tweet] = [Tweet]()
    var selectedStory = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedStory)
        print("super")
        // Do any additional setup after loading the view.
        UINavigationBar.appearance().backgroundColor = UIColor.lightGrayColor()
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.setUpTweets()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setUpTweets(){
        print("setting up")
        var tweet1 = Tweet(userName: "mekasa ", tweet: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took.", time: " April 21, 2015 - 12:23 pm ", imageName: "q.png")
        var tweet2 = Tweet(userName: "sukasa", tweet: "u r a tweet, we are a tweet", time: "6pm", imageName: "q.png")
        var tweet3 = Tweet(userName: "helloo", tweet: "lets tweet this world", time: "5pm", imageName: "q.png")
        var tweet4 = Tweet(userName: "abcd", tweet: "tweeting all the way", time: "3pm", imageName: "q.png")
        var tweet5 = Tweet(userName: "asdfgh", tweet: "huurayy, yayayayay", time: "5pm", imageName: "q.png")
        var tweet6 = Tweet(userName: "qwerty", tweet: "lets do this !", time: "tg", imageName: "q.png")
        
        arrayOfTweets.append(tweet1)
        arrayOfTweets.append(tweet2)
        arrayOfTweets.append(tweet3)
        arrayOfTweets.append(tweet4)
        arrayOfTweets.append(tweet5)
        arrayOfTweets.append(tweet6)
        print("done setting")
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("Entering COUNT")
        return arrayOfTweets.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println("Entering TableView")
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell1") as! CustomCell

        let tweet = arrayOfTweets[indexPath.row]
        cell.setCell(tweet.userName, tweet: tweet.tweet, time: tweet.time, imageName: tweet.imageName)
        return cell
    }
    

}
