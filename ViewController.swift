//
//  ViewController.swift
//  Trap Beauty Bar
//
//  Created by Toussaint Turnier on 1/9/24.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    @IBOutlet weak var videoPlayerView: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()
        playBackgroundVideo()
    }
    
    func playBackgroundVideo(){
        // Assuming you have a video named 'video.mp4' in your project
        let path = Bundle.main.path(forResource: "bg_splash_screen", ofType: "mp4")
            player = AVPlayer(url: URL(fileURLWithPath: path!))
            player!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = self.view.frame
            playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            self.view.layer.insertSublayer(playerLayer, at: 0)
            
            // Loop video
            NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
        player!.seek(to: CMTime.zero)
        player!.play()
        self.player?.isMuted = true
            }
    @objc func playerItemDidReachEnd(){
        player!.seek(to: CMTime.zero)
        }
    
    
    }


