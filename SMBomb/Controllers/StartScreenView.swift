//
//  StartScreenView.swift
//  SMBomb
//
//  Created by Maria on 08.08.2023.
//

import UIKit
import SnapKit
import AVFoundation

class StartScreenviewController: UIViewController {
    var audioPlayer: AVAudioPlayer?
    //MARK: - UI Elements
    lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "Игра для компании"
        label.font = UIFont(name: Theme.appFont, size: 32)
        label.textColor = Theme.blackFont
        return label
    }()
    
    lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "БОМБА"
        label.font = UIFont(name: Theme.appFont, size: 60)
        label.textColor = Theme.violetFont
        return label
    }()
    
    lazy var backgroundImage: UIImageView = {
        let imagebackground = UIImageView()
        imagebackground.image = UIImage(named: "background")
        return imagebackground
    }()
    
    lazy var bombaImage: UIImageView = {
        let imagebackground = UIImageView()
        imagebackground.image = UIImage(named: "bombLogo")
        return imagebackground
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Старт игры", for: .normal)
        button.setTitleColor(Theme.yellowFont, for: .normal)
        button.backgroundColor = Theme.violetBack
        button.titleLabel?.font = UIFont(name: Theme.appFont, size: 24)
        button.layer.cornerRadius = 38
        button.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var categoryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Категории", for: .normal)
        button.setTitleColor(Theme.yellowFont, for: .normal)
        button.backgroundColor = Theme.violetBack
        button.titleLabel?.font = UIFont(name: Theme.appFont, size: 24)
        button.layer.cornerRadius = 38
        button.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var rulesButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "rulesButton"), for: .normal)
        button.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var settingsButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "rulesButton"), for: .normal)
        button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAudioFile("firstBackgroundMusic")
        prepareAudioPlayer()
        playAudio()
        setupView()
        makeConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadAudioFile("firstBackgroundMusic")
        prepareAudioPlayer()
        playAudio()
    }
    
    //MARK: - Methods
    private func setupView() {
        
        view.addSubview(backgroundImage)
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(bombaImage)
        view.addSubview(startButton)
        view.addSubview(categoryButton)
        view.addSubview(rulesButton)
        view.addSubview(settingsButton)
    }
}
//MARK: - Constraints
extension StartScreenviewController {
    private func makeConstraint(){
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        bombaImage.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom).offset(0)
            make.centerX.equalToSuperview()
        }
        
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(-10)
            make.centerX.equalToSuperview()
        }
        
        firstLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(85)
            make.centerX.equalToSuperview()
        }
        startButton.snp.makeConstraints { make in
            make.top.equalTo (bombaImage.snp.bottom).offset(10)
            make.height.equalTo(79)
            make.width.equalTo(274)
            make.centerX.equalToSuperview()
        }
        categoryButton.snp.makeConstraints { make in
            make.top.equalTo (startButton.snp.bottom).offset(15)
            make.height.equalTo(79)
            make.width.equalTo(274)
            make.centerX.equalToSuperview()
        }
        rulesButton.snp.makeConstraints { make in
            make.top.equalTo (categoryButton.snp.bottom).offset(0)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(62)
            make.width.equalTo(62)
        }
        settingsButton.snp.makeConstraints { make in
            make.top.equalTo (categoryButton.snp.bottom).offset(0)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(62)
            make.width.equalTo(62)
        }
    
    }
    //MARK: - Audio
    
    func loadAudioFile(_ musicName:String) {
        if let audioFilePath = Bundle.main.path(forResource: musicName, ofType: "mp3") {
            let audioFileURL = URL(fileURLWithPath: audioFilePath)
            
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL, fileTypeHint: AVFileType.mp3.rawValue)
                
                guard let audioPlayer = audioPlayer else { return }
            } catch {
                print("Error loading audio file: \(error)")
            }
        }
    }
    
    func prepareAudioPlayer() {
        audioPlayer?.numberOfLoops = -1
        audioPlayer?.prepareToPlay()
    }
    
    func playAudio() {
        if SettingsSwitcherFlag.backgroundMusicFlag{
            if let player = audioPlayer {
                if !player.isPlaying {
                    player.play()
                }
            }
        }
        else{
            if let player = audioPlayer {
                if player.isPlaying {
                    player.stop()
                }
            }
        }
    }
    


}

//MARK: - Button Actions
extension StartScreenviewController {
    @objc func startGameButtonTapped() {
        print("tap-tap start")
        let vc = GamePrepViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func categoryButtonTapped() {
        print("tap-tap category")
        let vc = CategoryViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func rulesButtonTapped() {
        print("tap-tap rules")
        let vc = RulesViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func settingsButtonTapped() {
        print("tap-tap settings")
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
