//
//  GameViewController.swift
//  SMBomb
//
//  Created by Мария Селиверстова on 09.08.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    //MARK: - UI Elements
    lazy var backgroundImage: UIImageView = {
        let imagebackground = UIImageView()
        imagebackground.image = UIImage(named: "background")
        imagebackground.translatesAutoresizingMaskIntoConstraints = false
        return imagebackground
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Назовите вид зимнего спорта"
        label.font = UIFont(name:"DelaGothicOne-Regular" , size: 32)
        label.textColor = Theme.violetFont
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var bombImage: UIImageView = {
        let imagebackground = UIImageView()
        imagebackground.image = UIImage(named: "smallBombLogo")
        imagebackground.contentMode = .scaleAspectFill
        imagebackground.translatesAutoresizingMaskIntoConstraints = false
        return imagebackground
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setConstrains()
    }
    
    //MARK: - Button Methods
    @objc func pauseButtonTapped() {}
}

extension GameViewController {
    //MARK: - Set up Views
    func setUpView() {
        title = "Игра"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "pauseButton"), style: .plain, target: self, action: #selector(pauseButtonTapped))
        
        view.addSubview(backgroundImage)
        view.addSubview(titleLabel)
        view.addSubview(bombImage)
    }
    
    //MARK: - Set Constraints
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
            
            
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
        ])
    }
}
