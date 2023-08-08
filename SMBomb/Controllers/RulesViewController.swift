//
//  RulesViewController.swift
//  SMBomb
//
//  Created by Admin on 07.08.2023.
//

import UIKit

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
    
    let rulesLabel:UILabel = {
        let label = UILabel()
        label.text = "1.Все игроки становятся в круг.\n2.Первый игрок берет телефон и нажимает кнопку:\n3.На экране появляется вопрос “Назовите Фрукт”.\n4.Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку (правильность ответа определяют другие участники).\n5.Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба.\n6.Проигравшим считается тот, в чьих руках взорвалась бомба.\n7.Если в настройках выбран режим игры “С Заданиями”, то проигравший выполняет задание."
        label.font = UIFont(name: Theme.appFont, size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    let ruleView1 = RulesView(textForRules: "Все игроки становятся в круг.", rulePoint: 1, buttonNameExample: nil)
    
    
    
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
        bacgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        bacgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bacgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bacgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bacgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    func setupView() {
        view.addSubview(bacgroundImageView)
        view.addSubview(scrollView)
        makeConstraints()
        setupScrollView()
    }
    
    func setupScrollView() {
        scrollView.addSubview(rulesTitleLabel)
        scrollView.addSubview(rulesLabel)
        scrollView.addSubview(titleCategoriaLabel)
        scrollView.addSubview(ruleView1)
        
        
        rulesTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        titleCategoriaLabel.translatesAutoresizingMaskIntoConstraints = false
        ruleView1.translatesAutoresizingMaskIntoConstraints = false
        
        

        rulesTitleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        rulesTitleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        rulesTitleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        rulesTitleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true

        rulesLabel.topAnchor.constraint(equalTo: rulesTitleLabel.bottomAnchor, constant: 20).isActive = true
        rulesLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        rulesLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        rulesLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true

        titleCategoriaLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 20).isActive = true
        titleCategoriaLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        titleCategoriaLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        titleCategoriaLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
        
        ruleView1.topAnchor.constraint(equalTo: titleCategoriaLabel.bottomAnchor, constant: 20).isActive = true
        ruleView1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        ruleView1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        ruleView1.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
        ruleView1.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20).isActive = true
        
        rulesTitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        

        rulesTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        rulesLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 200).isActive = true
        titleCategoriaLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: rulesLabel.frame.maxY + 20)
    }
}

