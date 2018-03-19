
import UIKit
import AVFoundation

class VC6_1: UIViewController {
    var playButton : UIButton!
    var pauseButton : UIButton!
    var player = AVAudioPlayer()
    var slider : UISlider!
    var volumeSlider : UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setSwipe()
        
        do {
            if let audioPath = Bundle.main.path(forResource: "Nezhnost", ofType: "mp3"){
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
 //           slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("error")
        }
        setPlayButton()
        setPauseButton()
        setSlider()
        setVolumeSlider()
        setLabel()

//        self.player.play()
    }
    
    func setPlayButton(){
        
        currentButton = UIButton()
        
        currentButton.frame = CGRect(x: view.bounds.width * 0.25, y: view.bounds.height * 0.85, width: view.bounds.width * 0.45, height: view.bounds.height * 0.1)
        currentButton.center = CGPoint(x: view.bounds.width * 0.25, y: view.bounds.height * 0.85)
        currentButton.setTitle("Play", for: .normal)
        currentButton.backgroundColor = .magenta
        currentButton.setTitleColor(UIColor.white, for: .normal)
        currentButton.titleLabel?.adjustsFontSizeToFitWidth = true
        currentButton.addTarget(self, action: #selector(VC6_1.playButtonPressed(sender:)), for: UIControlEvents.touchUpInside)
        playButton = currentButton
        view.addSubview(playButton)
    }
    @objc func playButtonPressed(sender: UIButton){
     self.player.play()
        
    }
    func setPauseButton(){
        
        currentButton = UIButton()
        
        currentButton.frame = CGRect(x: view.bounds.width * 0.25, y: view.bounds.height * 0.85, width: view.bounds.width * 0.45, height: view.bounds.height * 0.1)
        currentButton.center = CGPoint(x: view.bounds.width * 0.75, y: view.bounds.height * 0.85)
        currentButton.setTitle("Pause", for: .normal)
        currentButton.backgroundColor = UIColor.magenta
        currentButton.setTitleColor(UIColor.white, for: .normal)
        currentButton.titleLabel?.adjustsFontSizeToFitWidth = true
        currentButton.addTarget(self, action: #selector(VC6_1.pauseButtonPressed(sender:)), for: UIControlEvents.touchUpInside)
        pauseButton = currentButton
        view.addSubview(pauseButton)
    }
    @objc func pauseButtonPressed(sender: UIButton){
        self.player.pause()
        
    }

    func setSlider(){
     slider = UISlider()
        slider.frame = CGRect(x: 0, y: 0, width: view.bounds.width * 0.8, height: view.bounds.height * 0.1)
        slider.center = CGPoint(x: view.bounds.width * 0.5, y: view.bounds.height * 0.7)
        slider.minimumValue = 0.0
        slider.maximumValue = Float(player.duration)
        slider.addTarget(self, action: #selector(VC6_1.changeSliderValue(sender:)), for: .valueChanged)
        

        
        view.addSubview(slider)
        
    }
    @objc func changeSliderValue(sender: UISlider){
        if sender == slider{
            player.currentTime = TimeInterval(sender.value)
        }
    }
    
    func setVolumeSlider(){
        volumeSlider = UISlider()
        volumeSlider.frame = CGRect(x: 0, y: 0, width: view.bounds.width * 0.8, height: view.bounds.height * 0.1)
        volumeSlider.center = CGPoint(x: view.bounds.width * 0.5, y: view.bounds.height * 0.5)
        volumeSlider.minimumValue = 0.0
        volumeSlider.maximumValue = 1.0
        volumeSlider.addTarget(self, action: #selector(VC6_1.changeVolumeSliderValue(sender:)), for: .valueChanged)



        view.addSubview(volumeSlider)

    }
    @objc func changeVolumeSliderValue(sender: UISlider){
        if sender == volumeSlider{

            self.player.volume = self.volumeSlider.value
            print(volumeSlider.value)
        }
    }
    
    func setLabel() {
        currentLabel = UILabel()

            currentLabel.text = "Valume"
        
        currentLabel.textAlignment = .center
        currentLabel.frame = CGRect(x: view.bounds.width * 0.25, y: view.bounds.height * 0.05, width: view.bounds.width * 0.5, height: view.bounds.height * 0.1)
        currentLabel.center = CGPoint(x: view.bounds.width * 0.5, y: view.bounds.height * 0.45)
        currentLabel.adjustsFontSizeToFitWidth = true
        currentLabel.minimumScaleFactor = 0.5
        titleLabel = currentLabel
        view.addSubview(titleLabel)
    }
  
}
