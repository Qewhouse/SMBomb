//
//  RulesView.swift
//  SMBomb
//
//  Created by Admin on 08.08.2023.
//

import UIKit
import SnapKit

class CustomTextView: UIView {
    private let textLabel = UILabel()
    private let circleView = UIView()
    private let numberLabel = UILabel()
    private let buttonLabel = UILabel()
    private let buttonView = UIView()
    
    // Переменные для настройки данных
    var labelText: String = "" {
        didSet {
            textLabel.text = labelText
        }
    }
    
    var number: Int = 0 {
        didSet {
            numberLabel.text = "\(number)"
        }
    }
    
    var buttonLabelText: String? = "" {
        didSet {
            buttonLabel.text = buttonLabelText
        }
    }
    
    // MARK: - Инициализация
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
        setupConstraints()
    }
    
    // MARK: - Настройка элементов интерфейса
    
    func setupViews() {
        textLabel.textAlignment = .center
        textLabel.textColor = Theme.grayFont
        textLabel.font = UIFont(name: Theme.appFont, size: 16)
        textLabel.numberOfLines = 0
        addSubview(textLabel)
        
        circleView.backgroundColor = Theme.violetBack
        circleView.layer.cornerRadius = 27/2
        circleView.layer.borderWidth = 1
        addSubview(circleView)
        
        numberLabel.textAlignment = .center
        numberLabel.textColor = Theme.yellowFont
        numberLabel.font = UIFont(name: Theme.appFont, size: 16)
        
        circleView.addSubview(numberLabel)
        
        if buttonLabelText != nil||buttonLabelText != "" {
            setupButton()
        }
        
        func setupButton() {
            buttonView.backgroundColor = Theme.violetBack
            circleView.layer.cornerRadius = 27/2
            circleView.layer.borderWidth = 1
            addSubview(buttonView)
            
            buttonLabel.textAlignment = .center
            buttonLabel.textColor = Theme.yellowFont
            buttonLabel.font = UIFont(name: Theme.appFont, size: 12)
            
            buttonView.addSubview(buttonLabel)
        }
    }
    
    // MARK: - Настройка констрейнтов
    
    func setupConstraints() {
        textLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(35)
            make.trailing.equalToSuperview().offset(10)
            make.width.equalTo(300)
        }
        
        circleView.snp.makeConstraints { make in
            make.trailing.equalTo(textLabel.snp.leading).offset(-10)
            make.width.height.equalTo(27)
            make.top.equalTo(textLabel.snp.top)
        }
        
        numberLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        buttonLabel.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        buttonView.snp.makeConstraints { make in
            make.edges.equalTo(buttonLabel)
            make.height.equalTo(27)
        }
    }
}
