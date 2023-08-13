//
//  buttonView.swift
//  SMBomb
//
//  Created by Admin on 12.08.2023.
//

import UIKit
import SnapKit

class buttonView :UIButton{
    
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

class ButtonForMiniScree :UIButton{
    let nameButtonLabel :UILabel = {
        let element = UILabel()
        element.font = UIFont(name: Theme.appFont, size: 10)
        element.textColor = Theme.blackFont
        element.textAlignment = .center
        element.numberOfLines = 1
        return element
    }()
    let imageButton :UIImageView = {
        let element = UIImageView()
        element.image = UIImage(systemName: "checmark")
        element.tintColor = Theme.blackFont
        element.contentMode = .scaleAspectFit
        return element
    }()
    
    
    init (labelText: String, isActive: Bool) {
        super.init(frame: .zero)
        self.nameButtonLabel.text = labelText
        self.backgroundColor = .clear
        showCheckmark(isActive)
        addSubviewsToButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviewsToButton() {
        let views: [UIView] = [nameButtonLabel, imageButton]
        views.forEach { self.addSubview($0) }
        makeConstraints()
    }
    
    private func makeConstraints() {
        nameButtonLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.centerY.equalToSuperview()
        }
        
        imageButton.snp.makeConstraints { make in
            make.centerY.equalTo(nameButtonLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-5)
        }
    }
    func showCheckmark(_ check: Bool){
        if check{
            imageButton.image = UIImage(systemName: "checkmark")
        }
        else{
            imageButton.image = nil
        }
    }
}
