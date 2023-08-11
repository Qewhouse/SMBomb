//
//  PauseScreen.swift
//  SMBomb
//
//  Created by Мария Селиверстова on 10.08.2023.
//

import UIKit

class PauseScreen: UIViewController {
    
    // MARK: - UI elements
    
    private lazy var imageBackground: UIImageView  = {
        let imageBackground = UIImageView()
        imageBackground.image = UIImage(named: "background")
        imageBackground.translatesAutoresizingMaskIntoConstraints = false
        return imageBackground
        
    }()
    
    private lazy var pauseTitle: UILabel = {
        let label = UILabel()
        label.text = "Пауза"
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 50)
        label.textColor = Theme.violetFont
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Продолжить", for: .normal)
        button.setTitleColor(Theme.yellowFont, for: .normal)
        button.titleLabel?.font = UIFont(name: Theme.appFont, size: 24)
        button.backgroundColor = Theme.violetBack
        button.layer.cornerRadius = 38
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    private lazy var returnToMainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("На главную", for: .normal)
        button.setTitleColor(Theme.yellowFont, for: .normal)
        button.titleLabel?.font = UIFont(name: Theme.appFont, size: 24)
        button.backgroundColor = Theme.violetBack
        button.layer.cornerRadius = 38
        button.addTarget(self, action: #selector(returnToMainButtonTapped), for: .touchUpInside)
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
    @objc func continueButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func returnToMainButtonTapped() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
        //MARK: - View Set up
        private func setUpView() {
            
            view.addSubview(imageBackground)
            view.addSubview(pauseTitle)
            view.addSubview(continueButton)
            view.addSubview(returnToMainButton)
        }
        
        
        //MARK: - Constraints
        private func setConstrains() {
            NSLayoutConstraint.activate([
                imageBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                imageBackground.topAnchor.constraint(equalTo: view.topAnchor),
                imageBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                imageBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                
                pauseTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                pauseTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 127),
                pauseTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
                pauseTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
                
                continueButton.widthAnchor.constraint(equalToConstant: 274),
                continueButton.heightAnchor.constraint(equalToConstant: 79),
                continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                continueButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
                
                
                returnToMainButton.widthAnchor.constraint(equalToConstant: 274),
                returnToMainButton.heightAnchor.constraint(equalToConstant: 79),
                returnToMainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                returnToMainButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 550)
            ])
            
        }}



    
    
    
    
    

        
        
        
        
        
    

