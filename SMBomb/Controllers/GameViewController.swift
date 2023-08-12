//
//  GameViewController.swift
//  SMBomb
//
//  Created by Мария Селиверстова on 09.08.2023.
//

import UIKit
import Lottie
import AVFoundation

class GameViewController: UIViewController, PauseScreenDelegate {
    
    var questionArray: [String]?
    let tasks = Tasks()
    var player: AVAudioPlayer!
    
    //MARK: - UI Elements
    private lazy var backgroundImage: UIImageView = {
        let imagebackground = UIImageView()
        imagebackground.image = UIImage(named: "background")
        imagebackground.translatesAutoresizingMaskIntoConstraints = false
        return imagebackground
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Назовите вид зимнего спорта"
        label.font = UIFont(name:"DelaGothicOne-Regular" , size: 32)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.textColor = Theme.violetFont
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bombAnimation: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "bombAnimation")
        animationView.loopMode = .loop
        animationView.translatesAutoresizingMaskIntoConstraints = false
        return animationView
    }()
    
    private lazy var explosionAnimation: LottieAnimationView = {
        let animation = LottieAnimationView(name: "explosionAnimation")
        animation.loopMode = .repeatBackwards(3)
        animation.translatesAutoresizingMaskIntoConstraints = false
        return animation
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setConstrains()
        resumeTimer()
        
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        togglePause()
    ////        resumeTimer()
    //    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer?.invalidate()
        
    }
    
    
    
    //MARK: - Button Actions
    @objc func pauseButtonTapped() {
        let vc = PauseScreen()
        navigationController?.pushViewController(vc, animated: true)
        
        //        stopGame()
        //        func stopGame() {
        //            timer.invalidate()
        //    }
    }
    
    //MARK: - View Setup
    func setUpView() {
        title = "Игра"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "pauseButton"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(pauseActionTapped))
        
        view.addSubview(backgroundImage)
        view.addSubview(titleLabel)
        view.addSubview(explosionAnimation)
        view.addSubview(bombAnimation)
        
        if let questionArray = questionArray {
            titleLabel.text = questionArray[0]
        } else {
            titleLabel.text = tasks.tasksGeography[0]
        }
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Constraints
    func setConstrains () {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 127),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            titleLabel.heightAnchor.constraint(equalToConstant: 150),
            
            bombAnimation.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            bombAnimation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bombAnimation.widthAnchor.constraint(equalToConstant: 312),
            bombAnimation.heightAnchor.constraint(equalToConstant: 352),
            
            explosionAnimation.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            explosionAnimation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            explosionAnimation.widthAnchor.constraint(equalToConstant: 450),
            explosionAnimation.heightAnchor.constraint(equalToConstant: 450),
            
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
    
    //MARK: - Timer
    
    private var timer: Timer?
    private var gameTime = 30
    private var counter = 0
    private var counterForNextScreen = 0
    private var isPaused: Bool = false
    private var isRunning: Bool = false
    
    // MARK: - pause
    func togglePause() {
        if isPaused {
            setupTimer()
        } else {
            pauseTimer()
        }
        isPaused = !isPaused
    }
    
    private func setupTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(timerTick),
                                     userInfo: nil,
                                     repeats: true)
        isRunning = true
    }
    
    private func setupTimerForNextScreen(){
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(timerTickForNextScreen),
                                         userInfo: nil,
                                         repeats: true)
        }
    
    private func pauseTimer() {
        timer?.invalidate()
        isRunning = false
    }
    
    @objc private func timerTick() {
        if counter < gameTime {
            counter += 1
            tickSound()
            bombAnimation.play()
            print(counter)
        } else {
            player.stop()
            explosionSound()
            bombAnimation.pause()
            bombAnimation.isHidden = true
            explosionAnimation.play()
            pauseTimer()
            setupTimerForNextScreen()
        }
    }
    
    @objc private func timerTickForNextScreen(){
            if counterForNextScreen < 2{
                counterForNextScreen += 1
            }
            else{
                finalScreen()
            }
        }
    
    @objc private func pauseActionTapped() {
        guard isRunning else { return }
        pauseTimer()
        player.stop()
        
        
        let vc = PauseScreen()
        vc.pausedCounter = counter
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func finalScreen() {
        let vc = FinalScreenViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private func resumeTimer() {
        if !isRunning {
            setupTimer()
        }
    }
    func didResumeCounter(_ counter: Int) {
        self.counter = counter
        setupTimer()
    }
    //MARK: - Animation
    
    
    
    //MARK: - Audio
    
    func tickSound() {
        let url = Bundle.main.url(forResource: "tikane-taymera-bombyi", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
    func explosionSound() {
        let url = Bundle.main.url(forResource: "explosionSound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
}


