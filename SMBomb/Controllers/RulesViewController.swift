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
        scrollView.backgroundColor = .clear
        scrollView.isScrollEnabled = true
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
    
    let ruleText1: CustomTextView = {
        let view = CustomTextView()
        view.labelText = "Все игроки становятся в круг."
        view.number = 1
        return view
    }()
    
    let ruleText2: CustomTextView = {
        let view = CustomTextView()
        view.labelText = "Первый игрок берет телефон и нажимает кнопку:"
        view.number = 2
        return view
    }()
    
    let buttonView: UIView = {
        let view = UIView()
        view.backgroundColor = Theme.violetBack
        view.layer.cornerRadius = 27/2
        return view
    }()
    
    let buttonLabel: UILabel = {
        let label = UILabel()
        label.text = "Начать игру"
        label.textColor = Theme.yellowFont
        label.font = UIFont(name: Theme.appFont, size: 12)
        label.textAlignment = .center
        return label
    }()
    
    
    let ruleText3: CustomTextView = {
        let view = CustomTextView()
        view.labelText = "На экране появляется вопрос “Назовите Фрукт”."
        view.number = 3
        return view
    }()
    
    let ruleText4: CustomTextView = {
        let view = CustomTextView()
        view.labelText = "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку (правильность ответа определяют другие участники)."
        view.number = 4
        return view
    }()
    
    let ruleText5: CustomTextView = {
        let view = CustomTextView()
        view.labelText = "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба."
        view.number = 5
        return view
    }()
    
    let ruleText6: CustomTextView = {
        let view = CustomTextView()
        view.labelText = "Проигравшим считается тот, в чьих руках взорвалась бомба."
        view.number = 6
        return view
    }()
    
    let ruleText7: CustomTextView = {
        let view = CustomTextView()
        view.labelText = "Если в настройках выбран режим игры “С Заданиями”, то проигравший выполняет задание."
        view.number = 7
        return view
    }()
    
    let rulesTitleLabel2: UILabel = {
        let label = UILabel()
        label.text = "Категории"
        label.font = UIFont(name: Theme.appFont, size: 30)
        label.textColor = Theme.violetFont
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    let rulesTextBehindTitle1:UILabel = {
        let label = UILabel()
        label.text = "В игре доступно 6 категорий и более 90 вопросов."
        label.font = UIFont(name: Theme.appFont, size: 30)
        label.textColor = Theme.grayFont
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let rulesTextBehindTitle2:UILabel = {
        let label = UILabel()
        label.text = "Можно выбрать сразу несколько категорий для игры."
        label.font = UIFont(name: Theme.appFont, size: 30)
        label.textColor = Theme.grayFont
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let buttonStackHorizontal1: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 8
        element.alignment = .center
        element.distribution = .fillEqually
        return element
    }()
    private let buttonStackHorizontal2: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 8
        element.alignment = .center
        element.distribution = .fillEqually
        return element
    }()
    
    let viewCategoryButtonNature = RulesButtonLikeCategoryView(labelText: "Природа", imageForButton: UIImage(named: "natureLogo"))
    let viewCategoryButtonCinema = RulesButtonLikeCategoryView(labelText: "Искусство и Кино", imageForButton: UIImage(named: "movieLogo"))
    let viewCategoryButtonMiscellaneous = RulesButtonLikeCategoryView(labelText: "О Разном", imageForButton: UIImage(named: "miscLogo"))
    let viewCategoryButtonSport = RulesButtonLikeCategoryView(labelText: "Спорт и Хобби", imageForButton: UIImage(named: "hobbyLogo"))
    
    
    
    
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
    
    
    
    
    func setupScrollView() {
        scrollView.addSubview(rulesTitleLabel)
        scrollView.addSubview(ruleText1)
        scrollView.addSubview(ruleText2)
        scrollView.addSubview(buttonView)
        scrollView.addSubview(buttonLabel)
        scrollView.addSubview(ruleText3)
        scrollView.addSubview(ruleText4)
        scrollView.addSubview(ruleText5)
        scrollView.addSubview(ruleText6)
        scrollView.addSubview(ruleText7)
        scrollView.addSubview(rulesTitleLabel2)
        scrollView.addSubview(rulesTextBehindTitle1)
        scrollView.addSubview(rulesTextBehindTitle2)
        scrollView.addSubview(buttonStackHorizontal1)
        scrollView.addSubview(buttonStackHorizontal2)
        
        buttonStackHorizontal1.addArrangedSubview(viewCategoryButtonNature)
        buttonStackHorizontal1.addArrangedSubview(viewCategoryButtonCinema)
        
        buttonStackHorizontal2.addArrangedSubview(viewCategoryButtonMiscellaneous)
        buttonStackHorizontal2.addArrangedSubview(viewCategoryButtonSport)
        
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
            make.bottom.equalTo(buttonStackHorizontal2.snp.bottom).offset(100)
        }
        
        rulesTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        
        ruleText1.snp.makeConstraints { make in
            make.top.equalTo(rulesTitleLabel.snp.bottom).offset(20)
            make.leading.equalTo(scrollView.snp.leading).offset(10)
            make.trailing.equalTo(scrollView.snp.trailing).offset(-10)
            make.height.equalTo(40)
        }
        
        ruleText2.snp.makeConstraints { make in
            make.top.equalTo(ruleText1.snp.bottom).offset(20)
            make.leading.equalTo(scrollView.snp.leading).offset(10)
            make.trailing.equalTo(scrollView.snp.trailing).offset(-10)
            make.height.equalTo(50)
        }
        
        buttonView.snp.makeConstraints { make in
            make.top.equalTo(ruleText2.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(110)
            make.height.equalTo(27)
        }
        
        buttonLabel.snp.makeConstraints { make in
            make.center.equalTo(buttonView)
        }
        
        
        ruleText3.snp.makeConstraints { make in
            make.top.equalTo(buttonView.snp.bottom).offset(20)
            make.leading.equalTo(scrollView.snp.leading).offset(10)
            make.trailing.equalTo(scrollView.snp.trailing).offset(-10)
            make.height.equalTo(40)
        }
        
        ruleText4.snp.makeConstraints { make in
            make.top.equalTo(ruleText3.snp.bottom).offset(20)
            make.leading.equalTo(scrollView.snp.leading).offset(10)
            make.trailing.equalTo(scrollView.snp.trailing).offset(-10)
            make.height.equalTo(120)
        }
        
        ruleText5.snp.makeConstraints { make in
            make.top.equalTo(ruleText4.snp.bottom).offset(20)
            make.leading.equalTo(scrollView.snp.leading).offset(10)
            make.trailing.equalTo(scrollView.snp.trailing).offset(-10)
            make.height.equalTo(55)
        }
        
        ruleText6.snp.makeConstraints { make in
            make.top.equalTo(ruleText5.snp.bottom).offset(20)
            make.leading.equalTo(scrollView.snp.leading).offset(10)
            make.trailing.equalTo(scrollView.snp.trailing).offset(-10)
            make.height.equalTo(40)
        }
        
        ruleText7.snp.makeConstraints { make in
            make.top.equalTo(ruleText6.snp.bottom).offset(20)
            make.leading.equalTo(scrollView.snp.leading).offset(10)
            make.trailing.equalTo(scrollView.snp.trailing).offset(-10)
            make.height.equalTo(90)
        }
        
        rulesTitleLabel2.snp.makeConstraints { make in
            make.top.equalTo(ruleText7.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        rulesTextBehindTitle1.snp.makeConstraints { make in
            make.top.equalTo(rulesTitleLabel2.snp.bottom).offset(20)
            make.width.equalTo(300)
            make.centerX.equalToSuperview()
        }
        
        rulesTextBehindTitle2.snp.makeConstraints { make in
            make.top.equalTo(rulesTextBehindTitle1.snp.bottom).offset(20)
            make.width.equalTo(300)
            make.centerX.equalToSuperview()
        }
        
        viewCategoryButtonNature.snp.makeConstraints { make in
            make.width.height.equalTo(145)
        }
        
        viewCategoryButtonCinema.snp.makeConstraints { make in
            make.width.height.equalTo(145)
        }
        
        viewCategoryButtonMiscellaneous.snp.makeConstraints { make in
            make.width.height.equalTo(145)
        }
        
        viewCategoryButtonSport.snp.makeConstraints { make in
            make.width.height.equalTo(145)
        }
        
        buttonStackHorizontal1.snp.makeConstraints { make in
            make.top.equalTo(rulesTextBehindTitle2.snp.bottom).offset(20)
            make.centerX.equalTo(scrollView)
            make.width.equalTo(300)
            make.height.equalTo(145)
        }
        
        buttonStackHorizontal2.snp.makeConstraints { make in
            make.top.equalTo(buttonStackHorizontal1.snp.bottom).offset(8)
            make.centerX.equalTo(scrollView)
            make.width.equalTo(300)
            make.height.equalTo(145)
        }
        
        
    }
}

