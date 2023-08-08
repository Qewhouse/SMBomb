//
//  FinalScreen.swift
//  SMBomb
//
//  Created by Maria on 08.08.2023.
//


import Foundation
import UIKit
import SnapKit

class FinalScreenViewController: UIViewController

{
    lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "Игра"
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 40)
        label.textColor = UIColor(named: "VioletFont")
        return label
    }()
    
    lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Проигравший выполняет задание"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 28)
        label.textColor = .black
        return label
    }()
    lazy var ladoshiLabel: UILabel = {
        let label = UILabel()
        label.text = "В следующем раунде после каждого ответа хлопать в ладоши"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 24)
        label.textColor = UIColor(named: "VioletFont")
        return label
    }()
    
    lazy var backgroundImage: UIImageView = {
        let imagebackground = UIImageView()
        imagebackground.image = UIImage(named: "background")
        return imagebackground
    }()
    
    lazy var bombaImage: UIImageView = {
        let imagebackground = UIImageView()
        imagebackground.image = UIImage(named: "bombResults")
        return imagebackground
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Другое задание", for: .normal)
        button.setTitleColor(Theme.yellowFont, for: .normal)
        button.backgroundColor = Theme.violetBack
        button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 24)
        button.layer.cornerRadius = 38
        button.addTarget(self, action: #selector(anotherGameButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var categoryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Играть заново", for: .normal)
        button.setTitleColor(Theme.yellowFont, for: .normal)
        button.backgroundColor = Theme.violetBack
        button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 24)
        button.layer.cornerRadius = 38
        button.addTarget(self, action: #selector(newGameButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var pauseButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "pauseButton"), for: .normal)
        button.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        makeConstraint()
    }
    
    
    func setupView() {
        view.addSubview(backgroundImage)
        backgroundImage.addSubview(pauseButton)
        backgroundImage.addSubview(firstLabel)
        backgroundImage.addSubview(secondLabel)
        backgroundImage.addSubview(bombaImage)
        backgroundImage.addSubview(startButton)
        backgroundImage.addSubview(categoryButton)
        backgroundImage.addSubview(ladoshiLabel)
    }
    
    
    func makeConstraint(){
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        bombaImage.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(-10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-15)
        }
        
        firstLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
        }
        ladoshiLabel.snp.makeConstraints { make in
            make.top.equalTo (bombaImage.snp.bottom).offset(0)
            make.trailing.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
        }
        startButton.snp.makeConstraints { make in
            make.top.equalTo (ladoshiLabel.snp.bottom).offset(10)
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
        pauseButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(62)
            make.width.equalTo(62)
        }
        
    }
}

extension FinalScreenViewController {
    @objc func anotherGameButtonTapped() {
        
    }
    @objc func newGameButtonTapped(){
        
    }
    @objc func pauseButtonTapped() {
        
    }
}

