//
//  ViewController.swift
//  Valentine
//
//  Created by 吉腾蛟 on 2020/2/14.
//  Copyright © 2020 JY. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var name_label: UILabel!
    
    @IBOutlet weak var i_label: UILabel!
    @IBOutlet weak var love_label: UILabel!
    @IBOutlet weak var you_label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        name_label.alpha=0.01
        i_label.alpha=0.01
        love_label.alpha=0.01
        you_label.alpha=0.01
        
        UIView.animate(withDuration: 2.0) {
            self.name_label.alpha=1.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            
            let heartAniamtion = AnimationView(name: "5756-like-5x")
            heartAniamtion.frame=CGRect(x: 0, y: 0, width: 414, height: 896)
            heartAniamtion.animationSpeed=1.0
            heartAniamtion.contentMode = .scaleAspectFit
            self.view.addSubview(heartAniamtion)
            heartAniamtion.play()
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+4) {
            UIView.animate(withDuration: 1.0) {
                self.i_label.alpha=1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+5) {
            UIView.animate(withDuration: 1.0) {
                self.love_label.alpha=1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+6) {
            UIView.animate(withDuration: 1.0) {
                self.you_label.alpha=1.0
            }
        }
    }
}

