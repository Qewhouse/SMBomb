//
//  RulesView.swift
//  SMBomb
//
//  Created by Admin on 08.08.2023.
//

import UIKit

class RulesView:UIView {
    
    let textRuleLabel = UILabel()
    let rulePointLabel = UILabel()
    let buttonNameExample = UILabel()
    
    init(textForRules:String, rulePoint:Int, buttonNameExample:String?) {
        super.init(frame: CGRect.zero)
        self.textRuleLabel.text = textForRules
        self.rulePointLabel.text = String(rulePoint)
        self.buttonNameExample.text = buttonNameExample
        setupViews()
        addSubviewsToButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        setupRulePoint()
        setupTextRule()
        setupButtonNameExample()
    }
    
    private func setupRulePoint(){
        rulePointLabel.font = UIFont(name: Theme.appFont, size: 16)
        rulePointLabel.textColor = Theme.yellowFont
        rulePointLabel.textAlignment = .center
        let view: UIView = {
            let element = UIView()
            element.backgroundColor = Theme.violetBack
            element.layer.borderWidth = 1
            element.layer.borderColor = UIColor.black.cgColor
            element.layer.cornerRadius = 29/2
            return element
        }()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 29).isActive = true
        view.heightAnchor.constraint(equalToConstant: 29).isActive = true
        
        rulePointLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rulePointLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rulePointLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupTextRule(){
        textRuleLabel.font = UIFont(name: Theme.appFont, size: 16)
        textRuleLabel.textColor = Theme.blackFont
    }
    
    private func setupButtonNameExample() {
        buttonNameExample.font = UIFont(name: Theme.appFont, size: 12)
        buttonNameExample.textColor = Theme.yellowFont
        buttonNameExample.textAlignment = .center
        buttonNameExample.numberOfLines = 1
        
        let view: UIView = {
            let element = UIView()
            element.backgroundColor = Theme.violetBack
            element.layer.borderWidth = 1
            element.layer.borderColor = UIColor.black.cgColor
            element.layer.cornerRadius = 27 / 2
            return element
        }()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        
        let viewWidthConstraint = view.widthAnchor.constraint(equalToConstant: 96.17)
        let viewHeightConstraint = view.heightAnchor.constraint(equalToConstant: 27)
        
        NSLayoutConstraint.activate([viewWidthConstraint, viewHeightConstraint])
        
        buttonNameExample.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonNameExample.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonNameExample.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let buttonNameSize = buttonNameExample.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: 27))
        viewHeightConstraint.constant = buttonNameSize.width + 8
    }

    // MARK: - Layout
    
    private func addSubviewsToButton() {
        let views: [UIView] = [textRuleLabel,rulePointLabel ,buttonNameExample]
        views.forEach { self.addSubview($0) }
        makeConstraints()
    }
    
    private func makeConstraints(){
        
        textRuleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textRuleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textRuleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        rulePointLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rulePointLabel.trailingAnchor.constraint(equalTo: textRuleLabel.leadingAnchor, constant: -4),
            rulePointLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        buttonNameExample.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonNameExample.topAnchor.constraint(equalTo:textRuleLabel.bottomAnchor , constant: 8),
            buttonNameExample.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            buttonNameExample.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    
}
