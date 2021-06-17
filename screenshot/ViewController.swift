//
//  ViewController.swift
//  screenshot
//
//  Created by Tommy on 2021/06/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var targetView: UIView!
    @IBOutlet var resultImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func takeScreenshot() {
        let result = targetView.takeScreenshot()
        resultImageView.image = result
    }
}

extension UIView {

    func takeScreenshot() -> UIImage {

        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)

        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)

        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        if (image != nil)
        {
            return image!
        }
        return UIImage()
    }
}
