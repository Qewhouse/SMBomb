//
//  Screen3.swift
//  SMBomb
//
//  Created by Мария Селиверстова on 09.08.2023.
//

import Foundation
import UIKit

class Screen3ViewController: UIViewController

{
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setConstrains()
        title = "Игра"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "pauseButton"), style: .plain, target: self, action: #selector(pauseButtonTapped))
        
      
    }
    
        lazy var backgroundImage: UIImageView = {
            let imagebackground = UIImageView()
            imagebackground.image = UIImage(named: "background")
            return imagebackground
        }()
        
        
        lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.text = "Нажмите \"Запустить\" чтобы начать игру"
            label.font = UIFont(name:"DelaGothicOne-Regular" , size: 20)
            label.textColor = Theme.violetFont
            label.numberOfLines = 0
            label.textAlignment = .center
            return label
        }()
        
        
        lazy var bombImage: UIImageView = {
            let imagebackground = UIImageView()
            imagebackground.image = UIImage(named: "smallBombLogo")
            imagebackground.contentMode = .scaleAspectFill
            return imagebackground
        }()
        
        
        lazy var startButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Запустить", for: .normal)
            button.setTitleColor(Theme.yellowFont, for: .normal)
            button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 24)
            button.backgroundColor = Theme.violetBack
            button.layer.cornerRadius = 38
            button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpOutside)
            return button
        }()
        
        @objc func startButtonTapped() {}
        @objc func pauseButtonTapped() {}
        
        
    func setUpView() {
        view.addSubview(backgroundImage)
        view.addSubview(titleLabel)
        view.addSubview(bombImage)
        view.addSubview(startButton)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bombImage.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        }
    
   
        
    
        
    func setConstrains () {
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
    
    

