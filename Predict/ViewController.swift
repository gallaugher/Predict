//
//  ViewController.swift
//  Predict
//
//  Created by John Gallaugher on 10/27/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var audioPlayer: AVAudioPlayer!
    
    var images = ["bat", "corona", "vampire","david", "house", "skull", "pumpkin", "ghost", "spider", "witch"]
    var predictions = ["It is certain",
                       "It is decidedly so",
                       "Without a doubt",
                       "Yes, definitely",
                       "You may rely on it",
                       "As I see it, yes",
                       "Most likely",
                       "Outlook good",
                       "Yes",
                       "Signs point to yes",
                       "Reply hazy try again",
                       "Ask again later",
                       "Better not tell you now",
                       "Cannot predict now",
                       "Concentrate and ask again",
                       "Don't count on it",
                       "My reply is no",
                       "My sources say no",
                       "Outlook not so good",
                       "Very doubtful"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        predictionLabel.text = ""
        imageView.image = UIImage(named: "")
    }

    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("😡 ERROR: \(error.localizedDescription). Could not initialize AVAudioPlayer object")
            }
        } else {
            print("😡 ERROR: Could not read data from file \(name)")
        }
    }

    @IBAction func predictButtonPressed(_ sender: UIButton) {
        predictionLabel.alpha = 0.0
        imageView.alpha = 0.0
        
        let randomPrediction = predictions.randomElement()!
        predictionLabel.text = randomPrediction
        let randomItem = images.randomElement()!
        imageView.image = UIImage(named: randomItem)
        
        playSound(name: randomItem + "_sound")
        UIView.animate(withDuration: 1.0, animations: {self.predictionLabel.alpha = 1.0})
        UIView.animate(withDuration: 1.0, animations: {self.imageView.alpha = 1.0})
        
    }
    
    @IBAction func winLogoPressed(_ sender: UIButton) {
        playSound(name: "theme")
        UIView.animate(withDuration: 1.0, animations: {self.predictionLabel.alpha = 1.0})
        imageView.image = UIImage(named: "we_can_do_it")
        predictionLabel.text = "You Got This!"
        UIView.animate(withDuration: 1.0, animations: {self.imageView.alpha = 1.0})
    }
    
}

