//
//  ViewController.swift
//  InfoMaxApollo
//
//  Copyright (c) 2015 akash_kapoor. All rights reserved.
//

import UIKit


class StoriesController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    let swiftBlogs = ["apple ", "smasung", "iOS Developer Tips", "tim cook", "ios", "android", "That Thing In Swift", "akash kapoor", "stories"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 70
        //self.tableView.backgroundView = UIImageView(image: UIImage(named: "light-background"))
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    // MARK:  UITextFieldDelegate Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return swiftBlogs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("StoryCell", forIndexPath: indexPath) as! UITableViewCell
       /* if (indexPath.row%2 == 0) {
            cell.backgroundColor = UIColor.clearColor()
        }
        else{
            cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.2)
            cell.textLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
        }*/
        let row = indexPath.row
        cell.textLabel?.text = swiftBlogs[row]
        
        return cell
    }
    // MARK:  UITableViewDelegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("StoryDetailSegue", sender: tableView)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "StoryDetailSegue" {
            if let destinationVC = segue.destinationViewController as? StoryDetailViewController{
                let indexPath = self.tableView.indexPathForSelectedRow()?.row
                var destinationTitle = self.swiftBlogs[indexPath!]
                destinationVC.title = destinationTitle
                destinationVC.selectedStory = destinationTitle
            }
            
        }
    }
}

