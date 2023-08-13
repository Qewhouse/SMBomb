//
//  RulesButtonLikeCategoryView.swift
//  SMBomb
//
//  Created by Admin on 10.08.2023.
//

import UIKit
import SnapKit

class RulesButtonLikeCategoryView: UIView {
    
    let mainImage = UIImageView()
    let nameBattonLabel = UILabel()
    let buttonView:UIView = {
        let view = UIView()
        view.backgroundColor = Theme.violetBack
        view.layer.cornerRadius = 145/4
        view.layer.borderWidth = 1
        return view
    }()
    
    let checkmarkImage:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark")
        imageView.tintColor = Theme.violetBack
        return imageView
    }()
    
    let checkmarkView:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 35/2
        view.layer.borderWidth = 1
        return view
    }()
    
    init (labelText: String, imageForButton:UIImage?) {
        super.init(frame: .zero)
        self.nameBattonLabel.text = labelText
        self.nameBattonLabel.textColor = Theme.yellowFont
        self.mainImage.image = imageForButton
        self.mainImage.tintColor = .black
        setupViews()
        addSubviewsToButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setupLabel()
        setupButton()
    }
    
    private func setupButton() {
        self.backgroundColor = .clear
        mainImage.contentMode = .scaleAspectFit
    }
    
    private func setupLabel(){
        nameBattonLabel.font = UIFont(name: Theme.appFont, size: 16)
        nameBattonLabel.textAlignment = .center
        nameBattonLabel.numberOfLines = 2
    }
    
    private func addSubviewsToButton() {
        let views: [UIView] = [buttonView,mainImage, nameBattonLabel, checkmarkView, checkmarkImage]
        views.forEach { self.addSubview($0) }
        makeConstraints()
    }
    
    private func makeConstraints() {
        buttonView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(buttonView.snp.top).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(100)
        }
        
        nameBattonLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(-10)
            make.centerX.equalToSuperview()
            make.width.equalTo(120)
        }
        
        checkmarkView.snp.makeConstraints { make in
            make.top.equalTo(buttonView.snp.top).offset(10)
            make.leading.equalTo(buttonView.snp.leading).offset(10)
            make.height.equalTo(35)
            make.width.equalTo(35)
        }
        
        checkmarkImage.snp.makeConstraints { make in
            make.center.equalTo(checkmarkView)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
    }
}

class buttonForRules :UIView {
    
    let nameButtonLabel :UILabel = {
        let element = UILabel()
        element.textColor = Theme.violetFont
        element.font = UIFont(name: Theme.appFont, size: 20)
        element.textAlignment = .center
        element.numberOfLines = 1
        return element
    }()
    
    init (labelText: String) {
        super.init(frame: .zero)
        self.nameButtonLabel.text = labelText
        self.backgroundColor = Theme.yellowBack
        self.layer.cornerRadius = 35/2
        self.layer.borderWidth = 1
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        addSubviewsToButton()
    }
    
    private func addSubviewsToButton() {
        let views: [UIView] = [nameButtonLabel]
        views.forEach { self.addSubview($0) }
        makeConstraints()
    }
    
    
    private func makeConstraints() {
        nameButtonLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
