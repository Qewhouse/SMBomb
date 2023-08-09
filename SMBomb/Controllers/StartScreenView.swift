//
//  StartScreenView.swift
//  SMBomb
//
//  Created by Maria on 08.08.2023.
//

import Foundation
import UIKit
import SnapKit

class StartScreenviewController: UIViewController

{
    lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "Игра для компании"
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 32)
        label.textColor = .black
        return label
    }()
    
    lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "БОМБА"
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 60)
        label.textColor = .purple
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
        button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 24)
        button.layer.cornerRadius = 38
        button.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var categoryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Категории", for: .normal)
        button.setTitleColor(Theme.yellowFont, for: .normal)
        button.backgroundColor = Theme.violetBack
        button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 24)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        makeConstraint()
    }
    
    func setupView() {
        view.addSubview(backgroundImage)
        backgroundImage.addSubview(firstLabel)
        backgroundImage.addSubview(secondLabel)
        backgroundImage.addSubview(bombaImage)
        backgroundImage.addSubview(startButton)
        backgroundImage.addSubview(categoryButton)
        backgroundImage.addSubview(rulesButton)
    }
    
    
    func makeConstraint(){
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
    }
}

extension StartScreenviewController {
    @objc func startGameButtonTapped() {
        
    }
    @objc func categoryButtonTapped(){
        
    }
    @objc func rulesButtonTapped() {
        
    }
}
