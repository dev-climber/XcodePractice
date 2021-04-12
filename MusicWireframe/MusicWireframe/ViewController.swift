//
//  ViewController.swift
//  MusicWireframe
//
//  Created by Jungsang Lim on 2021/04/12.
//

import UIKit

class ViewController: UIViewController {
    
    // play 여부를 프로퍼티 옵저버를 통해 추적하고 코드 실행
    var isPlaying : Bool = true {
        didSet {
            if isPlaying {
                playPauseButton.setImage(UIImage(named: "pause")!, for: .normal)
                // 플레이 중이면 pause 이미지 출력
            } else {
                playPauseButton.setImage(UIImage(named: "play")!, for: .normal)
                // 플레이 중이 아니면 play 이미지 출력
            }
        }
    }
    

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var reverseBackground: UIView!
    @IBOutlet weak var playPauseBackground: UIView!
    @IBOutlet weak var forwardBackground: UIView!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize Views
        reverseBackground.layer.cornerRadius = 35.0
        reverseBackground.clipsToBounds = true
        reverseBackground.alpha = 0.0
        
        playPauseBackground.layer.cornerRadius = 35.0
        playPauseBackground.clipsToBounds = true
        playPauseBackground.alpha = 0.0
        
        forwardBackground.layer.cornerRadius = 35.0
        forwardBackground.clipsToBounds = true
        forwardBackground.alpha = 0.0
        
    }

    // 앨범 이미지를 재생 여부에 따라 크기를 조절하는 애니메이션 액션 메소드
    @IBAction func playPauseButtonTapped(_ sender: Any) {
        if isPlaying {
            UIView.animate(withDuration: 0.5){
                self.albumImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            } // 뷰 사이즈 축소
        } else {
            UIView.animate(withDuration: 0.5){
                self.albumImageView.transform = CGAffineTransform.identity
            }
        }
        isPlaying.toggle()
        // 현재와 반대 값을 가지도록 함
        // 맨 위의 var isPlaying이 실행되면서 버튼 이미지가 바뀜
    }
    
    
    @IBAction func touchedUpInside(_ sender: UIButton) {
        let buttonBackground: UIView
        
        switch sender {
        case reverseButton:
            buttonBackground = reverseBackground
        case playPauseButton:
            buttonBackground = playPauseBackground
        case forwardButton:
            buttonBackground = forwardBackground
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25, animations: {
            buttonBackground.alpha = 0.0
            buttonBackground.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            sender.transform = CGAffineTransform.identity
        }) { (_) in
            buttonBackground.transform = CGAffineTransform.identity
        // 손가락이 화면에 닿는 순간 1.2로 커지고 알파값은 0.0을 가진다
        // 끝나고 나면 핸들러로 다시 identity로 돌아가게 한다
        }
        
    }
    
    @IBAction func touchedDown(_ sender: UIButton) {
        let buttonBackground: UIView
        
        switch sender {
        case reverseButton:
            buttonBackground = reverseBackground
        case playPauseButton:
            buttonBackground = playPauseBackground
        case forwardButton:
            buttonBackground = forwardBackground
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            buttonBackground.alpha = 0.3
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            // 손가락이 화면에서 떼지는 순간 0.8로 작아지고 알파값을 0.3 가진다
        }
        
        
    }
    
    
    
}

