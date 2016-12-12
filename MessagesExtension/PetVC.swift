//
//  MessagesViewController.swift
//  MessagesExtension
//
//  Created by James Rochabrun on 12/11/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

import UIKit
import Messages

class PetVC: MSMessagesAppViewController {
    
//    var dogView: UIImageView!
//    var catView: UIImageView!
//    var cancelButton: UIButton!
//    var nextButton: UIButton!
    
    var screenWidth: CGFloat = 0.0
    var imageviewSize: CGFloat = 0.0
    var numberOfViews: CGFloat = 2.0
    var numberOfInnerSpaces: CGFloat = 0.0
    var remainingWidth: CGFloat = 0.0
    var innerSpace: CGFloat = 0.0
    
    @IBOutlet weak var dogView: UIImageView!
    @IBOutlet weak var catView: UIImageView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!

        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       // screenWidth = self.view.bounds.size.width
        imageviewSize = 90
        //numberOfViews = 2.0
        //numberOfInnerSpaces = 3.0
        //remainingWidth = screenWidth - imageviewSize * numberOfViews
        innerSpace = 20//remainingWidth/numberOfInnerSpaces
        
        //dogView = UIImageView()
        dogView.clipsToBounds = true
        dogView.isUserInteractionEnabled = true
        dogView.contentMode = .scaleAspectFit
        dogView.image = UIImage.init(named: "puppy")
       // self.view.addSubview(dogView)
        let dogRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.selectDogOntap))
        dogView.addGestureRecognizer(dogRecognizer)
        dogView.layer.cornerRadius = imageviewSize/2

        
        //catView = UIImageView()
        catView.clipsToBounds = true
        catView.isUserInteractionEnabled = true
        catView.contentMode = .scaleAspectFit
        catView.image = UIImage.init(named: "kitty")
        catView.layer.cornerRadius = imageviewSize/2
      //  self.view.addSubview(catView)
        let catRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.selectCatOntap))
        catView.addGestureRecognizer(catRecognizer)
        
        //cancelButton = UIButton()
        cancelButton.setTitle("cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelSelection(_:)), for: .touchUpInside)
        cancelButton.alpha = 0
        cancelButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        //self.view.addSubview(cancelButton)
        
        //nextButton = UIButton()
        nextButton.setTitle("next", for: .normal)
       // nextButton.addTarget(self, action: #selector(cancelSelection(_:)), for: .touchUpInside)
        nextButton.alpha = 0
        nextButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        //self.view.addSubview(nextButton)

    }
//    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        
//        var frame = dogView.frame
//        frame.size.height = imageviewSize
//        frame.size.width = imageviewSize
//        frame.origin.x = innerSpace
//        frame.origin.y = (self.view.frame.size.height - frame.size.height)/2
//        dogView.frame = frame
//        
//        frame = catView.frame
//        frame.size.height = imageviewSize
//        frame.size.width = imageviewSize
//        frame.origin.x = dogView.frame.maxX + innerSpace
//        frame.origin.y = (self.view.frame.size.height - frame.size.height)/2
//        catView.frame = frame
//        
//        frame = cancelButton.frame
//        frame.size.height = 40
//        frame.size.width = 200
//        frame.origin.x = (self.view.frame.size.width - frame.size.width)/2
//        frame.origin.y = dogView.frame.maxX
//        cancelButton.frame = frame
//        
//        cancelButton.sizeToFit()
//        frame = cancelButton.frame
//        frame.origin.x = 40
//        frame.origin.y = (self.view.frame.size.height - cancelButton.frame.size.height)/2
//        cancelButton.frame = frame
//        
//        nextButton.sizeToFit()
//        frame = nextButton.frame
//        frame.origin.x = self.view.bounds.size.width - nextButton.frame.size.width - 40
//        frame.origin.y = (self.view.frame.size.height - cancelButton.frame.size.height)/2
//        nextButton.frame = frame
// 
//    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func selectDogOntap(_ sender: UIGestureRecognizer) {
        
        
        let deltaX = (self.dogView.frame.size.width - self.innerSpace)/2
        let translationX =  self.dogView.frame.size.width - deltaX
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:{ [unowned self] in
            
            let scale = CGAffineTransform(scaleX: 1.5, y: 1.5)
            var translate = CGAffineTransform(translationX: translationX, y: 0.0)
            self.dogView.transform = scale.concatenating(translate)
            self.dogView.isUserInteractionEnabled = false

            self.catView.alpha = 0
            translate = CGAffineTransform(translationX: -translationX, y: 0.0)
            self.catView.transform = translate
            
            self.cancelButton.alpha = 1
            self.nextButton.alpha = 1
            self.titleLabel.alpha = 0
            
        }, completion: nil)
    }
    
    
    func selectCatOntap(_ sender: UIGestureRecognizer) {
        
        let deltaX = (self.catView.frame.size.width - self.innerSpace)/2
        let translationX =  self.catView.frame.size.width - deltaX
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:{ [weak self] in
            
            let scale = CGAffineTransform(scaleX: 1.5, y: 1.5)
            var translate = CGAffineTransform(translationX: -translationX, y: 0.0)
            self?.catView.transform = scale.concatenating(translate)
            self?.catView.isUserInteractionEnabled = false
            
            self?.dogView.alpha = 0
            translate = CGAffineTransform(translationX: translationX, y: 0.0)
            self?.dogView.transform = translate
            
            self?.cancelButton.alpha = 1
            self?.nextButton.alpha = 1
            
            self?.titleLabel.alpha = 0
            
        }, completion: nil)
        
    }
    
    func cancelSelection(_ sender:UIButton) {
        
        let scale = CGAffineTransform.identity
        let translate = CGAffineTransform(translationX: 0.0, y: 0.0)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:{ [unowned self] in
            
            self.catView.transform = scale.concatenating(translate)
            self.dogView.transform = scale.concatenating(translate)
            self.dogView.alpha = 1
            self.catView.alpha = 1
            self.dogView.isUserInteractionEnabled = true
            self.catView.isUserInteractionEnabled = true
            self.cancelButton.alpha = 0
            self.nextButton.alpha = 0
            self.titleLabel.alpha = 1
        }, completion: nil)
    }

    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.

    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dissmises the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }

}
