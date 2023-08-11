//
//  GameViewController.swift
//  SMBomb
//
//  Created by Мария Селиверстова on 09.08.2023.
//

import UIKit
import Lottie

class GameViewController: UIViewController {
    
    var questionArray: [String]?
    let tasks = Tasks()
    
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
    }
    
    //MARK: - Button Actions
    @objc func pauseButtonTapped() {
        let vc = PauseScreen()
        navigationController?.pushViewController(vc, animated: true)
       
        stopGame()
        func stopGame() {
            timer.invalidate()
        }}
    
    //MARK: - View Setup
    func setUpView() {
        title = "Игра"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "pauseButton"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(pauseButtonTapped))
        
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
    
    var totalTime = 10
    var timePassed = 0
    var timePaused = 0
    var timer = Timer()
    var isPaused: Bool = false
    var isRunning: Bool = false


    func updateTimer () {
        if timePassed < totalTime {
            timePassed += 1
            bombAnimation.play()
            print(timePassed)

        } else {
            timer.invalidate()
            bombAnimation.pause()
            bombAnimation = LottieAnimationView(name:"")
            bombAnimation = LottieAnimationView(name: "explosionAnimation")
            explosionAnimation.play()
        }}

//    func setUpTimer(){
//        timer.invalidate()
//        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
//            self.updateTimer()
//            self.timer = timer
//        }}

}





