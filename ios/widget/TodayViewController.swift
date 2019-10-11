//
//  TodayViewController.swift
//  widget
//
//  Created by rubén romero díaz on 10/10/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

import UIKit
import NotificationCenter
import os.log

class TodayViewController: UIViewController, NCWidgetProviding {
        
  override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = UIColor.gray
      let fileManager = FileManager.default
      guard let bundleURL = Bundle.main.url(forResource: "Pictures", withExtension: "bundle") else {
        return
      }
      guard let bundle = Bundle(url: bundleURL) else { return }
    
      guard let imageURL = bundle.url(forResource: "bike-frame", withExtension: "svg") else { return }
    
      let contents = try! fileManager.contentsOfDirectory(at: bundleURL, includingPropertiesForKeys: [URLResourceKey.nameKey, URLResourceKey.isDirectoryKey], options: .skipsHiddenFiles)
    
      os_log("this is contents %@", contents)
    
      for item in contents
      {
        os_log("this is lastPathComponent %@",item.lastPathComponent)
      }
    
    
      os_log("this is bundle %@", bundle)
    
      os_log("this is imageURL %@", imageURL.absoluteString)
    
    
    
    
      //let svgURL = Bundle.main.url(forResource: "bike-frame", withExtension: "svg")!
      CALayer(SVGURL: imageURL, completion: { (svgLayer) in
        os_log("this is svgLayer %@", svgLayer)
        svgLayer.fillColor = UIColor(red:0.94, green:0.37, blue:0.00, alpha:1.00).cgColor
        // Aspect fit the layer to self.view
        svgLayer.resizeToFit(self.view.bounds)
      
        // Add the layer to self.view's sublayers
        self.view.layer.addSublayer(svgLayer)
      })
      /*let fistBump = CALayer(SVGNamed: "bike-frame"){ (svgLayer) in
        print(svgLayer)
      }*/
    
    
      /*let svgStatic = UIView(SVGNamed: "bike-frame") { (SVGLayer) in
        
        os_log("this is svgStatic %@", SVGLayer)
      }*/
      //view.addSubview(svgStatic)
      // Do any additional setup after loading the view.
  }
  
  func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
      // Perform any setup necessary in order to update the view.
    
      // If an error is encountered, use NCUpdateResult.Failed
      // If there's no update required, use NCUpdateResult.NoData
      // If there's an update, use NCUpdateResult.NewData
    
      completionHandler(NCUpdateResult.newData)
  }
    
}
