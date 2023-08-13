//
//  SettingsViewController.swift
//  SMBomb
//
//  Created by Admin on 12.08.2023.
//

import UIKit
import SnapKit

class SettingsViewController:UIViewController{
    //MARK: - Properties
    let backgroundImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        return imageView
    }()
    
    let settingsLabel:UILabel = {
        let label = UILabel()
        label.text = "Время игры"
        label.font = UIFont(name: Theme.appFont, size: 30)
        label.textColor = Theme.violetFont
        return label
    }()
    //MARK: - Buttons
    let buttonViewShortTime = buttonView(labelText: "Короткое")
    
    let buttonViewAvarageTime = buttonView(labelText: "Среднее")
    
    let buttonViewLongTime = buttonView(labelText: "Длинное")
    
    let buttonViewRandomTime = buttonView(labelText: "Случайное")
    
    //MARK: - Labels
    let labelGameWithQustions:UILabel = {
        let label = UILabel()
        label.text = "Игра с вопросами"
        label.font = UIFont(name: Theme.appFont, size: 25)
        label.textColor = Theme.violetFont
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    let labelBackgroundMusic:UILabel = {
        let label = UILabel()
        label.text = "Фоновая музыка"
        label.font = UIFont(name: Theme.appFont, size: 25)
        label.textColor = Theme.violetFont
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    let labelBacgroundMusicForPicker:UILabel = {
        let label = UILabel()
        label.text = "Фоновая музыка"
        label.font = UIFont(name: Theme.appFont, size: 25)
        label.textColor = Theme.violetFont
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    let labelTickSoundBomb:UILabel = {
        let label = UILabel()
        label.text = "Тиканье Бомбы"
        label.font = UIFont(name: Theme.appFont, size: 25)
        label.textColor = Theme.violetFont
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    let labelSoundBoomBomb:UILabel = {
        let label = UILabel()
        label.text = "Взрыв Бомбы"
        label.font = UIFont(name: Theme.appFont, size: 25)
        label.textColor = Theme.violetFont
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    //MARK: - StackViews
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
    
    private let buttonStackVertical: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 8
        element.alignment = .center
        return element
    }()
    
    //MARK: - Switchers
    private let switcherForGameWithQustions: UISwitch = {
        let element = UISwitch()
        element.onTintColor = Theme.violetBack
        element.tintColor = Theme.yellowBack
        element.isOn = SettingsSwitcherFlag.punishmentFlag
        return element
    }()
    
    private let switcherForBackgroundMusic: UISwitch = {
        let element = UISwitch()
        element.onTintColor = Theme.violetBack
        element.tintColor = Theme.yellowBack
        element.isOn = SettingsSwitcherFlag.backgroundMusicFlag
        return element
    }()
    var miniScreenView: UIView!
    private let buttonToShowMiniScreen: UIButton = {
        var element = UIButton()
        element.setTitle("Мелодия 1", for: .normal)
        element.backgroundColor = .clear
        element.titleLabel?.font = UIFont(name: Theme.appFont, size: 20)
        element.setTitleColor(Theme.blackFont, for: .normal)
        return element
    }()
    
    //MARK: - Buttons instead of a picker
    
    private let buttonFirstMusicBacground = ButtonForMiniScree(labelText: "Мелодия 1", isActive: true)
    
    private let buttonSecondMusicBacground = ButtonForMiniScree(labelText: "Мелодия 2", isActive: false)
    
    private let buttonThirdMusicBacground = ButtonForMiniScree(labelText: "Мелодия 3", isActive: false)
    

    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: Theme.violetFont,
            NSAttributedString.Key.font: UIFont(name: Theme.appFont, size: 30)!
        ]
        setupButtons()
        checkFlag()
        setupViews()
    }
    //MARK: - Setup Views
    private func setupViews(){
        view.addSubview(backgroundImageView)
        view.addSubview(settingsLabel)
        view.addSubview(buttonStackVertical)
        view.addSubview(labelGameWithQustions)
        view.addSubview(switcherForGameWithQustions)
        view.addSubview(labelBackgroundMusic)
        view.addSubview(switcherForBackgroundMusic)
        view.addSubview(labelBacgroundMusicForPicker)
        view.addSubview(buttonToShowMiniScreen)

        view.addSubview(labelTickSoundBomb)
        view.addSubview(labelSoundBoomBomb)
        
        
        buttonStackVertical.addArrangedSubview(buttonStackHorizontal1)
        buttonStackVertical.addArrangedSubview(buttonStackHorizontal2)
        
        buttonStackHorizontal1.addArrangedSubview(buttonViewShortTime)
        buttonStackHorizontal1.addArrangedSubview(buttonViewAvarageTime)
        buttonStackHorizontal2.addArrangedSubview(buttonViewLongTime)
        buttonStackHorizontal2.addArrangedSubview(buttonViewRandomTime)
        
        makeConstraints()
        setupButton()
    }
    
    //MARK: - Setup Buttons
    
    func setupButtons(){
        buttonViewShortTime.addTarget(self, action: #selector(buttonViewShortTimeTupped), for: .touchUpInside)
        buttonViewAvarageTime.addTarget(self, action: #selector(buttonViewAvarageTimeTupped), for: .touchUpInside)
        buttonViewLongTime.addTarget(self, action: #selector(buttonViewLongTimeTupped), for: .touchUpInside)
        buttonViewRandomTime.addTarget(self, action: #selector(buttonViewRandomTimeTupped), for: .touchUpInside)
        switcherForGameWithQustions.addTarget(self, action: #selector(switcherPunishmentTupped), for: .valueChanged)
        switcherForBackgroundMusic.addTarget(self, action: #selector(switcherBuckgroundMusicTupped), for: .valueChanged)
    }
    
    //MARK: - Actions
    @objc private func buttonViewShortTimeTupped(){
        print("ShortTimeTupped")
        changeFlagShortTime()
    }
    
    @objc private func buttonViewAvarageTimeTupped(){
        print("AvarageTimeTupped")
        changeFlagAvarageTime()
    }
    
    @objc private func buttonViewLongTimeTupped(){
        print("LongTimeTupped")
        changeFlagLongTime()
    }
    
    @objc private func buttonViewRandomTimeTupped(){
        print("RandomTimeTupped")
        changeFlagRandomTime()
    }
    
    @objc private func switcherPunishmentTupped(){
        print("changePunischentFlag")
        if switcherForGameWithQustions.isOn{
            SettingsSwitcherFlag.punishmentFlag = true
        }
        else{
            SettingsSwitcherFlag.punishmentFlag = false
        }
    }
    
    @objc private func switcherBuckgroundMusicTupped(){
        print("changeBackgroundMusicFlag")
        if switcherForBackgroundMusic.isOn{
            SettingsSwitcherFlag.backgroundMusicFlag = true
        }
        else{
            SettingsSwitcherFlag.backgroundMusicFlag = false
        }
    }
    
    func setupButton() {
        buttonToShowMiniScreen.addTarget(self, action: #selector(showMiniScreen), for: .touchUpInside)
        view.addSubview(buttonToShowMiniScreen)
    }
//MARK: - MiniScreen
    func setupMiniScreenView() {
        miniScreenView = UIView()
        miniScreenView.backgroundColor = .white
        miniScreenView.layer.cornerRadius = 20
        miniScreenView.layer.borderWidth = 0.2
        view.addSubview(miniScreenView)

        miniScreenView.snp.makeConstraints { make in
            make.bottom.equalTo(buttonToShowMiniScreen.snp.top).offset(-10)
            make.trailing.equalToSuperview().offset(-10)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        miniScreenView.addSubview(buttonFirstMusicBacground)
        miniScreenView.addSubview(buttonSecondMusicBacground)
        miniScreenView.addSubview(buttonThirdMusicBacground)
        
        buttonFirstMusicBacground.addTarget(self, action: #selector(hideMiniScreen), for: .touchUpInside)
        buttonSecondMusicBacground.addTarget(self, action: #selector(hideMiniScreen), for: .touchUpInside)
        buttonThirdMusicBacground.addTarget(self, action: #selector(hideMiniScreen), for: .touchUpInside)
        
        buttonFirstMusicBacground.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(1)
            make.leading.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(32)
        }
        
        buttonSecondMusicBacground.snp.makeConstraints { make in
            make.top.equalTo(buttonFirstMusicBacground.snp.bottom).offset(1)
            make.leading.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(32)
        }
        
        buttonThirdMusicBacground.snp.makeConstraints { make in
            make.top.equalTo(buttonSecondMusicBacground.snp.bottom).offset(1)
            make.leading.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(32)
        }
    }

    @objc func showMiniScreen() {
        if miniScreenView == nil {
            setupMiniScreenView()
        }
    }

    @objc func hideMiniScreen() {
        miniScreenView.removeFromSuperview()
        miniScreenView = nil
    }
    
    func changeFlagShortTime(){
        SettingsButtonFlag.isSelectedShortTime = true
        SettingsButtonFlag.isSelectedAvarageTime = false
        SettingsButtonFlag.isSelectedLongTime = false
        SettingsButtonFlag.isSelectedRandomTime = false
        buttonViewShortTime.backgroundColor = Theme.violetBack
        buttonViewShortTime.nameButtonLabel.textColor = Theme.yellowFont
        buttonViewAvarageTime.backgroundColor = Theme.yellowBack
        buttonViewAvarageTime.nameButtonLabel.textColor = Theme.violetFont
        buttonViewLongTime.backgroundColor = Theme.yellowBack
        buttonViewLongTime.nameButtonLabel.textColor = Theme.violetFont
        buttonViewRandomTime.backgroundColor = Theme.yellowBack
        buttonViewRandomTime.nameButtonLabel.textColor = Theme.violetFont
    }
    
    func changeFlagAvarageTime(){
        SettingsButtonFlag.isSelectedShortTime = false
        SettingsButtonFlag.isSelectedAvarageTime = true
        SettingsButtonFlag.isSelectedLongTime = false
        SettingsButtonFlag.isSelectedRandomTime = false
        buttonViewShortTime.backgroundColor = Theme.yellowBack
        buttonViewShortTime.nameButtonLabel.textColor = Theme.violetFont
        buttonViewAvarageTime.backgroundColor = Theme.violetBack
        buttonViewAvarageTime.nameButtonLabel.textColor = Theme.yellowFont
        buttonViewLongTime.backgroundColor = Theme.yellowBack
        buttonViewLongTime.nameButtonLabel.textColor = Theme.violetFont
        buttonViewRandomTime.backgroundColor = Theme.yellowBack
        buttonViewRandomTime.nameButtonLabel.textColor = Theme.violetFont
    }
    
    func changeFlagLongTime(){
        SettingsButtonFlag.isSelectedShortTime = false
        SettingsButtonFlag.isSelectedAvarageTime = false
        SettingsButtonFlag.isSelectedLongTime = true
        SettingsButtonFlag.isSelectedRandomTime = false
        buttonViewShortTime.backgroundColor = Theme.yellowBack
        buttonViewShortTime.nameButtonLabel.textColor = Theme.violetFont
        buttonViewAvarageTime.backgroundColor = Theme.yellowBack
        buttonViewAvarageTime.nameButtonLabel.textColor = Theme.violetFont
        buttonViewLongTime.backgroundColor = Theme.violetBack
        buttonViewLongTime.nameButtonLabel.textColor = Theme.yellowFont
        buttonViewRandomTime.backgroundColor = Theme.yellowBack
        buttonViewRandomTime.nameButtonLabel.textColor = Theme.violetFont
        
    }
    
    func changeFlagRandomTime(){
        SettingsButtonFlag.isSelectedShortTime = false
        SettingsButtonFlag.isSelectedAvarageTime = false
        SettingsButtonFlag.isSelectedLongTime = false
        SettingsButtonFlag.isSelectedRandomTime = true
        buttonViewShortTime.backgroundColor = Theme.yellowBack
        buttonViewShortTime.nameButtonLabel.textColor = Theme.violetFont
        buttonViewAvarageTime.backgroundColor = Theme.yellowBack
        buttonViewAvarageTime.nameButtonLabel.textColor = Theme.violetFont
        buttonViewLongTime.backgroundColor = Theme.yellowBack
        buttonViewLongTime.nameButtonLabel.textColor = Theme.yellowFont
        buttonViewRandomTime.backgroundColor = Theme.violetBack
    }
    
    func checkFlag(){
        if SettingsButtonFlag.isSelectedShortTime{
            buttonViewShortTime.backgroundColor = Theme.violetBack
            buttonViewShortTime.nameButtonLabel.textColor = Theme.yellowFont
        }
        else if SettingsButtonFlag.isSelectedAvarageTime{
            buttonViewAvarageTime.backgroundColor = Theme.violetBack
            buttonViewAvarageTime.nameButtonLabel.textColor = Theme.yellowFont
        }
        else if SettingsButtonFlag.isSelectedLongTime{
            buttonViewLongTime.backgroundColor = Theme.violetBack
            buttonViewLongTime.nameButtonLabel.textColor = Theme.yellowFont
        }
        else if SettingsButtonFlag.isSelectedRandomTime{
            buttonViewRandomTime.backgroundColor = Theme.violetBack
            buttonViewRandomTime.nameButtonLabel.textColor = Theme.yellowFont
        }
    }
    
    //MARK: - Constraints
    private func makeConstraints(){
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        settingsLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        buttonStackVertical.snp.makeConstraints { make in
            make.top.equalTo(settingsLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(360)
            make.height.equalTo(120)
        }
        
        buttonStackHorizontal1.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
        
        buttonStackHorizontal2.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
        
        labelGameWithQustions.snp.makeConstraints { make in
            make.top.equalTo(buttonStackVertical.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        switcherForGameWithQustions.snp.makeConstraints { make in
            make.centerY.equalTo(labelGameWithQustions.snp.centerY)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        labelBackgroundMusic.snp.makeConstraints { make in
            make.top.equalTo(labelGameWithQustions.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        switcherForBackgroundMusic.snp.makeConstraints { make in
            make.centerY.equalTo(labelBackgroundMusic.snp.centerY)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        labelBacgroundMusicForPicker.snp.makeConstraints { make in
            make.top.equalTo(labelBackgroundMusic.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        buttonToShowMiniScreen.snp.makeConstraints { make in
            make.centerY.equalTo(labelBacgroundMusicForPicker.snp.centerY)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        buttonToShowMiniScreen.snp.makeConstraints { make in
            make.centerY.equalTo(labelBacgroundMusicForPicker.snp.centerY)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        labelTickSoundBomb.snp.makeConstraints { make in
            make.top.equalTo(labelBacgroundMusicForPicker.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        labelSoundBoomBomb.snp.makeConstraints { make in
            make.top.equalTo(labelTickSoundBomb.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
    }
    
}
