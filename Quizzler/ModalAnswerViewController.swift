//
//  modalAnswerViewController.swift
//  Quizzler
//
//  Created by Tom Dobson on 8/14/17.
//  Copyright © 2017 Dobson Studios. All rights reserved.
//

import UIKit

class ModalAnswerViewController: UIViewController {
    
    @IBOutlet weak var answerImage: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!

    var answerLabelStore: String?
    var answerImageStore: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerImage.image = answerImageStore
        answerLabel.text = answerLabelStore
        
        providesPresentationContextTransitionStyle = true
        definesPresentationContext = true
        modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        
    }

    @IBAction func dismissButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "modalDismiss"), object: self)

        
    }
    
}
