//
//  RulesView.swift
//  SMBomb
//
//  Created by Admin on 08.08.2023.
//

import UIKit
import SnapKit

class RulesView: UIView {
    
    // MARK: - Properties
    
    private let textRuleLabel = UILabel()
    private let rulePointLabel = UILabel()
    private let buttonNameExample = UILabel()
    
    // MARK: - Initializers
    
    init(textForRules: String, rulePoint: Int, buttonNameExample: String?) {
        super.init(frame: .zero)
        
        setupViews()
        setTextForRules(textForRules)
        setRulePoint(rulePoint)
        setButtonNameExample(buttonNameExample)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    
    private func setupViews() {
        setupLabel(textRuleLabel, withFont: 16, textColor: Theme.blackFont)
        setupLabel(rulePointLabel, withFont: 16, textColor: Theme.yellowFont)
        setupLabel(buttonNameExample, withFont: 12, textColor: Theme.yellowFont)
        
        setupRoundedBackground(for: rulePointLabel, size: 29)
        setupRoundedBackground(for: buttonNameExample, size: 20)
    }
    
    private func setupLabel(_ label: UILabel, withFont fontSize: CGFloat, textColor: UIColor) {
        label.font = UIFont(name: Theme.appFont, size: fontSize)
        label.textColor = textColor
        label.textAlignment = .center
    }
    
    private func setupRoundedBackground(for view: UIView, size: CGFloat) {
        let backgroundView = UIView()
        backgroundView.backgroundColor = Theme.violetBack
        backgroundView.layer.borderWidth = 1
        backgroundView.layer.borderColor = UIColor.black.cgColor
        backgroundView.layer.cornerRadius = size / 2
        
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
        }
    }
    
    // MARK: - Set Content
    
    private func setTextForRules(_ text: String) {
        textRuleLabel.text = text
    }
    
    private func setRulePoint(_ point: Int) {
        rulePointLabel.text = String(point)
    }
    
    private func setButtonNameExample(_ example: String?) {
        buttonNameExample.text = example
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        addSubview(textRuleLabel)
        addSubview(rulePointLabel)
        addSubview(buttonNameExample)
        
        textRuleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.top.equalToSuperview().offset(10)
        }
        
        rulePointLabel.snp.makeConstraints { make in
            make.left.equalTo(textRuleLabel.snp.right).offset(10)
            make.centerY.equalTo(textRuleLabel)
            make.width.height.equalTo(29)
        }
        
        buttonNameExample.snp.makeConstraints { make in
            make.top.equalTo(textRuleLabel.snp.bottom).offset(10)
            make.centerX.equalTo(textRuleLabel)
            make.bottom.lessThanOrEqualToSuperview().offset(-10)
        }
    }
}
