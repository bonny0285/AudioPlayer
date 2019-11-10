//
//  ViewController.swift
//  MBQRScanCode
//
//  Created by Massimiliano on 09/11/2019.
//  Copyright © 2019 Massimiliano Bonafede. All rights reserved.
//

import UIKit
import AVFoundation


class MBTunes: UIViewController{
    
    
    @IBOutlet var songImage: UIImageView!
    @IBOutlet var pauseBtn: UIButton!
    @IBOutlet var playBtn: UIButton!
    @IBOutlet var stopBtn: UIButton!
    
    
    
    
    
    
    
    var songPlayer = AVAudioPlayer()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songImage.image = UIImage(named: "dua_lipa")
        playBtn.setImage(UIImage(systemName: PLAY), for: .normal)
        pauseBtn.setImage(UIImage(systemName: PAUSE), for: .normal)
        stopBtn.setImage(UIImage(systemName: STOP), for: .normal)
        prepareSong()
    }
    
    
    
    
    func prepareSong (){
        do {
            songPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Don't Start Now", ofType: "mp3")!))
            songPlayer.prepareToPlay()
            
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSession.Category.playback)
            } catch let sessionError {
                print(sessionError)
            }
        } catch let songPlayError {
            print(songPlayError)
        }
    }
    
    
    
    
    
    @IBAction func playBtnWasPressed(_ sender: Any) {
        
        let image = UIImage(systemName: PLAY)
        let image1 = UIImage(systemName: PLAY_MARK)
        if !setImageBtn(forFirt: image!, image2: image1!, button: playBtn){
            pauseBtn.setImage(UIImage(systemName: PAUSE), for: .normal)
            stopBtn.setImage(UIImage(systemName: STOP), for: .normal)
            songPlayer.play()
        }
        
    }
    
    @IBAction func pauseBtnWasPressed(_ sender: Any) {
        
        let image = UIImage(systemName: PAUSE)
        let image1 = UIImage(systemName: PAUSE_MARK)
        if !setImageBtn(forFirt: image!, image2: image1!, button: pauseBtn) {
            playBtn.setImage(UIImage(systemName: PLAY), for: .normal)
            stopBtn.setImage(UIImage(systemName: STOP), for: .normal)
            songPlayer.pause()
        }
    }
    
    @IBAction func stopBtnWasPressed(_ sender: Any) {
        
        let image = UIImage(systemName: STOP)
        let image1 = UIImage(systemName: STOP_MARK)
        if !setImageBtn(forFirt: image!, image2: image1!, button: stopBtn) {
            playBtn.setImage(UIImage(systemName: PLAY), for: .normal)
            pauseBtn.setImage(UIImage(systemName: PAUSE), for: .normal)
            songPlayer.stop()
            songPlayer.currentTime = 0
        }
    }
    
    
    
    func setImageBtn(forFirt image1 : UIImage, image2 : UIImage, button : UIButton) -> Bool{
        
        var check : Bool?
        if button.currentImage == image1 {
            button.setImage(image2, for: .normal)
            check = false
            return check!
        } else {
            button.setImage(image1, for: .normal)
            check = true
            return check!
        }
    }
    
    
    
    
    
}




