//
//  StoryDetailViewController.swift
//  InfoMaxApollo
//
//  Created by Shreya Garg on 4/19/15.
//  Copyright (c) 2015 akash_kapoor. All rights reserved.
//

import UIKit
import SwiftNDN

class StoryDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, InfoMaxConsumerDelegate {
    @IBOutlet weak var tableView: UITableView!
    var arrayOfTweets:[Tweet] = [Tweet]()
    var selectedStory = ""
    
    var consumer: InfoMaxConsumer!
    var prefix: String!
    
    var getCount = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var nextBut = UIBarButtonItem(title: "More", style: UIBarButtonItemStyle.Plain, target: self, action: "buttonAction:" )
        self.navigationItem.setRightBarButtonItem(nextBut, animated: true)
        
        // Do any additional setup after loading the view.
        UINavigationBar.appearance().backgroundColor = UIColor.lightGrayColor()
        self.automaticallyAdjustsScrollViewInsets = false
        
        // InfoMax & NDN
        dispatch_async(dispatch_get_main_queue()) {
            self.prefix = "/test" //"/ndn/apollo/stories"
            self.consumer = InfoMaxConsumer(delegate: self, prefix: self.prefix, forwarderIP: "72.36.112.82", forwarderPort: 6363)
        }
        
        
        //self.setUpTweets()
    }

    func buttonAction(sender:UIButton!)
    {
        getNextTweetSet()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: InfoMaxDelegate
    
    func onData(d: Data) {
        var rawContent = d.getContent()
        var tweetText = NSString(bytes: rawContent, length: rawContent.count, encoding: NSUTF8StringEncoding)
        var tweetStr = String(tweetText!)
        println(tweetStr)
        var twe = Tweet(userName: "John Bob ", tweet: tweetStr, time: "April 21, 2015 - 12:23 pm", imageName: "q.png")
        arrayOfTweets.append(twe)
        
        var fb = NSIndexPath(forRow: arrayOfTweets.count-1, inSection: 0)
        tableView.insertRowsAtIndexPaths([fb], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
    func getNextTweetSet() {
        self.consumer.get(getCount)
        getCount = getCount + 1
    }
    
    func onOpen() {
        getNextTweetSet()
    }
    
    func onError(reason: String) {
    }
    
    func onClose() {
    }
    
    


    /*func setUpTweets(){
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

    }*/

     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arrayOfTweets.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as? CustomCell
        
        //cell.backgroundColor = UIColor(red: 104.0/255, green: 117.0/255, blue: 134.0/255, alpha: 1)
     
        //navigationController?.navigationBar.barTintColor = UIColor(red: 104.0/255, green: 117.0/255, blue: 134.0/255, alpha: 1)

        let tweet = arrayOfTweets[indexPath.row]
        cell!.setCell(tweet.userName, tweet: tweet.tweet, time: tweet.time, imageName: tweet.imageName)
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //self.performSegueWithIdentifier("SuperStoryDetailSegue", sender: tableView)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "SuperStoryDetailSegue" {
            if let destinationVC = segue.destinationViewController as? SuperStoryDetail{
                let indexPath = self.tableView.indexPathForSelectedRow()?.row
                var destinationTitle = self.arrayOfTweets[indexPath!]
                print(destinationTitle.tweet)
                destinationVC.title = destinationTitle.tweet
                //destinationVC.selectedStory = destinationTitle
            }
            
        }
    }}
