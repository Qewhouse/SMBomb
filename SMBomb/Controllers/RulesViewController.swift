//
//  RulesViewController.swift
//  SMBomb
//
//  Created by Admin on 07.08.2023.
//

import UIKit
import SnapKit

class RulesViewController: UIViewController {
    
    let bacgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    let rulesTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Правила игры"
        label.font = UIFont(name: Theme.appFont, size: 30)
        label.textColor = Theme.violetFont
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    let titleCategoriaLabel:UILabel = {
        let label = UILabel()
        label.text = "Категории"
        label.font = UIFont(name: Theme.appFont, size: 30)
        label.textColor = Theme.violetFont
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    
    let ruleTextForPoint:UILabel = {
       let label = UILabel()
        label.text = "Все игроки становятся в круг."
        label.font = UIFont(name: Theme.appFont, size: 20)
        label.textColor = Theme.blackFont
        label.numberOfLines = 0
        return label
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Помощь"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: Theme.violetFont,
            NSAttributedString.Key.font: UIFont(name: Theme.appFont, size: 30)
        ]
        setupView()
    }
    
    func makeConstraints() {
            bacgroundImageView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            scrollView.snp.makeConstraints { make in
                make.edges.equalTo(view.safeAreaLayoutGuide)
            }
        }
    
    func setupView() {
        view.addSubview(bacgroundImageView)
        view.addSubview(scrollView)
        makeConstraints()
        setupScrollView()
    }
    
    func setupTextRule(){
        scrollView.addSubview(ruleTextForPoint)
        let viewRound = viewForPoint(1)
        scrollView.addSubview(viewRound)
        
        ruleTextForPoint.snp.makeConstraints { make in
            make.top.equalTo(rulesTitleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(scrollView).inset(40)
        }
        viewRound.snp.makeConstraints { make in
            make.centerY.equalTo(ruleTextForPoint.snp.centerY)
            make.trailing.equalTo(ruleTextForPoint.snp.leading).offset(-20)
        }
        
    }
    
    func viewForPoint(_ naumber:Int) ->UIView{
        let view = UIView()
        view.backgroundColor = Theme.violetBack
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 29 / 2
        view.snp.makeConstraints { make in
            make.height.width.equalTo(29)
        }
        
        let label = UILabel()
        label.text = "\(naumber)"
        label.font = UIFont(name: Theme.appFont, size: 16)
        label.textColor = Theme.yellowFont
        label.textAlignment = .center
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        return view
    }
    
    func setupScrollView() {
            scrollView.addSubview(rulesTitleLabel)
            
            rulesTitleLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(20)
                make.centerX.equalToSuperview()
            }
        
        setupTextRule()
            
            scrollView.contentSize = CGSize(width: view.frame.width, height: ruleTextForPoint.frame.maxY + 20)
        }
}

