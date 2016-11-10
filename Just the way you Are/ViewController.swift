//
//  ViewController.swift
//  Just the way you Are
//
//  Created by Adhita Selvaraj on 08/08/16.
//  Copyright (c) 2016 DreamCatcher. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var sliderValue: UISlider!
    
    @IBOutlet var button: UIButton!
    var state = 1
    var player: AVAudioPlayer = AVAudioPlayer()
    var image = UIImage(named: "play.png")!
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        
        if state == 1 {
            state = 2
            image = UIImage(named: "pause.png")!
            player.play()
        }
        
        else {
            image = UIImage(named: "play.png")!
            state = 1
            player.pause()
        }
        
        
            sender.setImage(image, forState: .Normal)
        
        
    }
    
    @IBAction func sliderChanged(sender: AnyObject) {
        
        player.volume = sliderValue.value
        
    }
    
    @IBAction func stopButton(sender: AnyObject) {
    
        player.stop()
        player.currentTime = 0
        state = 1
        if state == 1 {
            image = UIImage(named: "play.png")!
        }
        else {
            image = UIImage(named: "pause.png")!
        }
        button.setImage(image, forState: .Normal)
    
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("JY", ofType: "mp3")!)
        
        var error: NSError? = nil
        
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        
        player = AVAudioPlayer(contentsOfURL: audioPath, error: &error)
        
        button.setImage(image, forState: .Normal)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

