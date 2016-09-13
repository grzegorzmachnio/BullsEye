//
//  AboutTheGameViewController.swift
//  BullsEye
//
//  Created by skoty on 22/08/16.
//  Copyright © 2016 skoty. All rights reserved.
//

import UIKit

class AboutTheGameViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() { super.viewDidLoad()
        if let htmlFile = NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html") {
        if let htmlData = NSData(contentsOfFile: htmlFile) { let baseURL = NSURL(fileURLWithPath:
        NSBundle.mainBundle().bundlePath); webView.loadData(htmlData, MIMEType: "text/html",
        textEncodingName: "UTF-8", baseURL: baseURL)
        } }
    }
    
    
    @IBAction func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    

}
