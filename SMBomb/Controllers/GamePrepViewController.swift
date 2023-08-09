//
//  GamePrepViewController.swift
//  SMBomb
//
//  Created by Мария Селиверстова on 09.08.2023.
//

import UIKit

class GamePrepViewController: UIViewController {
    
    //MARK: - UI Elements
    private lazy var backgroundImage: UIImageView = {
        let imagebackground = UIImageView()
        imagebackground.image = UIImage(named: "background")
        imagebackground.translatesAutoresizingMaskIntoConstraints = false
        return imagebackground
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Нажмите \"Запустить\" чтобы начать игру"
        label.font = UIFont(name:Theme.appFont , size: 20)
        label.textColor = Theme.violetFont
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bombImage: UIImageView = {
        let imagebackground = UIImageView()
        imagebackground.image = UIImage(named: "smallBombLogo")
        imagebackground.contentMode = .scaleAspectFill
        imagebackground.translatesAutoresizingMaskIntoConstraints = false
        return imagebackground
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Запустить", for: .normal)
        button.setTitleColor(Theme.yellowFont, for: .normal)
        button.titleLabel?.font = UIFont(name: Theme.appFont, size: 24)
        button.backgroundColor = Theme.violetBack
        button.layer.cornerRadius = 38
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpOutside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setConstrains()
    }
    
    //MARK: - Buttons Actions
    @objc func startButtonTapped() {
        
    }
    
    @objc func pauseButtonTapped() {
        
    }
}

extension GamePrepViewController {
    
    //MARK: - View Set up
    private func setUpView() {
        title = "Игра"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "pauseButton"), style: .plain, target: self, action: #selector(pauseButtonTapped))
        
        view.addSubview(backgroundImage)
        view.addSubview(titleLabel)
        view.addSubview(bombImage)
        view.addSubview(startButton)
        }
    
       //MARK: - Constraints
    private func setConstrains () {
            NSLayoutConstraint.activate([
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 127),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
                
                bombImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 223),
                bombImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 74),
                bombImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 11),
                bombImage.widthAnchor.constraint(equalToConstant: 312),
                bombImage.heightAnchor.constraint(equalToConstant: 352),
                
                startButton.widthAnchor.constraint(equalToConstant: 274),
                startButton.heightAnchor.constraint(equalToConstant: 79),
                startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                startButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 750),
                
                backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
                backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                
            ])
        }
    }
