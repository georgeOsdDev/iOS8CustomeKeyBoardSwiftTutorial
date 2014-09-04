//
//  KeyboardViewController.swift
//  OshidaKeyBoard
//
//  Created by Oshida Takeharu on 9/4/14.
//  Copyright (c) 2014 Oshida Takeharu. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    /**        Remove boilerplate
    @IBOutlet weak var nextKeyboardButton: UIButton!
    **/

    var mainView: UIView!
    var nextKeyboardButton: UIButton!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        var xibViews = NSBundle.mainBundle().loadNibNamed("CustomeKeyboard", owner:self, options: nil)
        self.mainView = xibViews[0] as UIView
        self.view.addSubview(mainView)

        for v in self.mainView.subviews as [UIButton] {
            v.addTarget(self, action: "btnTapped:", forControlEvents: .TouchUpInside)
        }

        self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton

        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)

        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)

        self.mainView.addSubview(self.nextKeyboardButton)

/**        Remove boilerplate
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
    
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
    
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
    
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
**/

    }

    func btnTapped(sender: AnyObject){
        var btn = sender as UIButton
        var stringToInsert = ""
        let proxy = self.textDocumentProxy as UIKeyInput

        switch (btn.tag) {
            case 0:
                stringToInsert = "whale"
            case 5:
                stringToInsert = "xitrum"
            default:
                stringToInsert = "!!"

        }
        proxy.insertText(stringToInsert)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }

}
