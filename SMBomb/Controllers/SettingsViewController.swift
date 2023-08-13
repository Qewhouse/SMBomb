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
    var miniScreenViewForBacgroundMusic: UIView!
    
    var miniScreenViewForTickBomb: UIView!
    
    var miniScreenViewForBoomBomb: UIView!
    
    private let buttonToShowMiniScreenForBackgroundMusic: UIButton = {
        var element = UIButton()
        element.setTitle("Мелодия 1", for: .normal)
        element.backgroundColor = .clear
        element.titleLabel?.font = UIFont(name: Theme.appFont, size: 20)
        element.setTitleColor(Theme.blackFont, for: .normal)
        return element
    }()
    
    private let buttonToShowMinScrForTickBomb:UIButton = {
        var element = UIButton()
        element.setTitle("Мелодия 1", for: .normal)
        element.backgroundColor = .clear
        element.titleLabel?.font = UIFont(name: Theme.appFont, size: 20)
        element.setTitleColor(Theme.blackFont, for: .normal)
        return element
    }()
    
    private let buttonToShowMinScrForBoomBomb:UIButton = {
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
    
    private let buttonFirstTickBomb = ButtonForMiniScree(labelText: "Мелодия 1", isActive: true)
    
    private let buttonSecondTickBomb = ButtonForMiniScree(labelText: "Мелодия 2", isActive: false)
    
    private let buttonThirdTickBomb = ButtonForMiniScree(labelText: "Мелодия 3", isActive: false)
    
    private let buttonFirstBoomBomb = ButtonForMiniScree(labelText: "Мелодия 1", isActive: true)
    
    private let buttonSecondBoomBomb = ButtonForMiniScree(labelText: "Мелодия 2", isActive: false)
    
    private let buttonThirdBoomBomb = ButtonForMiniScree(labelText: "Мелодия 3", isActive: false)
    
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
        view.addSubview(buttonToShowMiniScreenForBackgroundMusic)
        view.addSubview(buttonToShowMinScrForTickBomb)
        view.addSubview(buttonToShowMinScrForBoomBomb)

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
        buttonToShowMiniScreenForBackgroundMusic.addTarget(self, action: #selector(showMiniScreenForBackgroundMusic), for: .touchUpInside)
        buttonToShowMinScrForTickBomb.addTarget(self, action: #selector(showMiniScreenForTickBomb), for: .touchUpInside)
        buttonToShowMinScrForBoomBomb.addTarget(self, action: #selector(showMiniScreenForBoomBomb), for: .touchUpInside)
    }
//MARK: - MiniScreen
    func setupMiniScreenViewBoomBomb(){
        miniScreenViewForBoomBomb = UIView()
        miniScreenViewForBoomBomb.backgroundColor = .white
        miniScreenViewForBoomBomb.layer.cornerRadius = 20
        miniScreenViewForBoomBomb.layer.borderWidth = 0.2
        view.addSubview(miniScreenViewForBoomBomb)
        
        miniScreenViewForBoomBomb.snp.makeConstraints { make in
            make.bottom.equalTo(buttonToShowMinScrForBoomBomb.snp.top).offset(-10)
            make.trailing.equalToSuperview().offset(-10)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        miniScreenViewForBoomBomb.addSubview(buttonFirstBoomBomb)
        miniScreenViewForBoomBomb.addSubview(buttonSecondBoomBomb)
        miniScreenViewForBoomBomb.addSubview(buttonThirdBoomBomb)
        
        buttonFirstBoomBomb.addTarget(self, action: #selector(buttonFirstBoomTupped), for: .touchUpInside)
        buttonSecondBoomBomb.addTarget(self, action: #selector(buttonSecondBoomTupped), for: .touchUpInside)
        buttonThirdBoomBomb.addTarget(self, action: #selector(buttonThirdBoomTupped), for: .touchUpInside)
        
        buttonFirstBoomBomb.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(1)
            make.leading.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(32)
        }
        
        buttonSecondBoomBomb.snp.makeConstraints { make in
            make.top.equalTo(buttonFirstBoomBomb.snp.bottom).offset(1)
            make.leading.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(32)
        }
        
        buttonThirdBoomBomb.snp.makeConstraints { make in
            make.top.equalTo(buttonSecondBoomBomb.snp.bottom).offset(1)
            make.leading.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(32)
        }
        
    }
    
    func setupMiniScreenViewForTickBomb(){
        miniScreenViewForTickBomb = UIView()
        miniScreenViewForTickBomb.backgroundColor = .white
        miniScreenViewForTickBomb.layer.cornerRadius = 20
        miniScreenViewForTickBomb.layer.borderWidth = 0.2
        view.addSubview(miniScreenViewForTickBomb)
        
        miniScreenViewForTickBomb.snp.makeConstraints { make in
            make.bottom.equalTo(buttonToShowMinScrForTickBomb.snp.top).offset(-10)
            make.trailing.equalToSuperview().offset(-10)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        miniScreenViewForTickBomb.addSubview(buttonFirstTickBomb)
        miniScreenViewForTickBomb.addSubview(buttonSecondTickBomb)
        miniScreenViewForTickBomb.addSubview(buttonThirdTickBomb)
        
        buttonFirstTickBomb.addTarget(self, action: #selector(buttonFirstTickTupped), for: .touchUpInside)
        buttonSecondTickBomb.addTarget(self, action: #selector(buttonSecondTickTupped), for: .touchUpInside)
        buttonThirdTickBomb.addTarget(self, action: #selector(buttonThirdTickTupped), for: .touchUpInside)
        
        buttonFirstTickBomb.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(1)
            make.leading.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(32)
        }
        
        buttonSecondTickBomb.snp.makeConstraints { make in
            make.top.equalTo(buttonFirstTickBomb.snp.bottom).offset(1)
            make.leading.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(32)
        }
        
        buttonThirdTickBomb.snp.makeConstraints { make in
            make.top.equalTo(buttonSecondTickBomb.snp.bottom).offset(1)
            make.leading.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(32)
        }
    }
    
    func setupMiniScreenViewForBackgroundMusic() {
        miniScreenViewForBacgroundMusic = UIView()
        miniScreenViewForBacgroundMusic.backgroundColor = .white
        miniScreenViewForBacgroundMusic.layer.cornerRadius = 20
        miniScreenViewForBacgroundMusic.layer.borderWidth = 0.2
        view.addSubview(miniScreenViewForBacgroundMusic)

        miniScreenViewForBacgroundMusic.snp.makeConstraints { make in
            make.bottom.equalTo(buttonToShowMiniScreenForBackgroundMusic.snp.top).offset(-10)
            make.trailing.equalToSuperview().offset(-10)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        miniScreenViewForBacgroundMusic.addSubview(buttonFirstMusicBacground)
        miniScreenViewForBacgroundMusic.addSubview(buttonSecondMusicBacground)
        miniScreenViewForBacgroundMusic.addSubview(buttonThirdMusicBacground)
        
        buttonFirstMusicBacground.addTarget(self, action: #selector(buttonFirstMusicBackTupped), for: .touchUpInside)
        buttonSecondMusicBacground.addTarget(self, action: #selector(buttonSecondMusicTupped), for: .touchUpInside)
        buttonThirdMusicBacground.addTarget(self, action: #selector(buttonThirdMusicTupped), for: .touchUpInside)
        
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

    @objc func showMiniScreenForBackgroundMusic() {
        if miniScreenViewForBacgroundMusic == nil {
            setupMiniScreenViewForBackgroundMusic()
        }
    }
    
    @objc func showMiniScreenForTickBomb() {
        if miniScreenViewForTickBomb == nil {
            setupMiniScreenViewForTickBomb()
        }
    }
    
    @objc func showMiniScreenForBoomBomb() {
        if miniScreenViewForBoomBomb == nil {
            setupMiniScreenViewBoomBomb()
        }
    }

    @objc func hideMiniScreenBackMusic() {
        miniScreenViewForBacgroundMusic.removeFromSuperview()
        miniScreenViewForBacgroundMusic = nil
    }
    
    @objc func hideMiniScreenTickBomb() {
        miniScreenViewForTickBomb.removeFromSuperview()
        miniScreenViewForTickBomb = nil
    }
    
    @objc func hideMiniScreenBoomBomb() {
        miniScreenViewForBoomBomb.removeFromSuperview()
        miniScreenViewForBoomBomb = nil
    }
    //MARK: - Action For Background Music
    @objc func buttonFirstMusicBackTupped() {
        buttonFirstMusicBacground.showCheckmark(true)
        buttonSecondMusicBacground.showCheckmark(false)
        buttonThirdMusicBacground.showCheckmark(false)
        buttonToShowMiniScreenForBackgroundMusic.titleLabel?.text = buttonFirstMusicBacground.titleLabel?.text
        SettingsBackgroundMusic.updateMemory(buttonFirstMusicBacground.titleLabel?.text ?? "")
        hideMiniScreenBackMusic()
    }
    
    @objc func buttonSecondMusicTupped(){
        buttonFirstMusicBacground.showCheckmark(false)
        buttonSecondMusicBacground.showCheckmark(true)
        buttonThirdMusicBacground.showCheckmark(false)
        buttonToShowMiniScreenForBackgroundMusic.titleLabel?.text = buttonSecondMusicBacground.titleLabel?.text
        SettingsBackgroundMusic.updateMemory(buttonSecondMusicBacground.titleLabel?.text ?? "")
        hideMiniScreenBackMusic()
    }
    
    @objc func buttonThirdMusicTupped(){
        buttonFirstMusicBacground.showCheckmark(false)
        buttonSecondMusicBacground.showCheckmark(false)
        buttonThirdMusicBacground.showCheckmark(true)
        buttonToShowMiniScreenForBackgroundMusic.titleLabel?.text = buttonThirdMusicBacground.titleLabel?.text
        SettingsBackgroundMusic.updateMemory(buttonThirdMusicBacground.titleLabel?.text ?? "")
        hideMiniScreenBackMusic()
    }
    //MARK: - Action for tick bomb
    @objc func buttonFirstTickTupped(){
        buttonFirstTickBomb.showCheckmark(true)
        buttonSecondTickBomb.showCheckmark(false)
        buttonThirdTickBomb.showCheckmark(false)
        buttonToShowMinScrForTickBomb.titleLabel?.text = buttonFirstTickBomb.titleLabel?.text
        SettingsTickSound.updateMemory(buttonFirstTickBomb.titleLabel?.text ?? "")
        hideMiniScreenTickBomb()
    }
    
    @objc func buttonSecondTickTupped(){
        buttonFirstTickBomb.showCheckmark(false)
        buttonSecondTickBomb.showCheckmark(true)
        buttonThirdTickBomb.showCheckmark(false)
        buttonToShowMinScrForTickBomb.titleLabel?.text = buttonSecondTickBomb.titleLabel?.text
        SettingsTickSound.updateMemory(buttonSecondTickBomb.titleLabel?.text ?? "")
        hideMiniScreenTickBomb()
    }
    
    @objc func buttonThirdTickTupped(){
        buttonFirstTickBomb.showCheckmark(false)
        buttonSecondTickBomb.showCheckmark(false)
        buttonThirdTickBomb.showCheckmark(true)
        buttonToShowMinScrForTickBomb.titleLabel?.text = buttonThirdTickBomb.titleLabel?.text
        SettingsTickSound.updateMemory(buttonThirdTickBomb.titleLabel?.text ?? "")
        hideMiniScreenTickBomb()
    }
    
    //MARK: - Action for boom bomb
    
    @objc func buttonFirstBoomTupped(){
        buttonFirstBoomBomb.showCheckmark(true)
        buttonSecondBoomBomb.showCheckmark(false)
        buttonThirdBoomBomb.showCheckmark(false)
        buttonToShowMinScrForBoomBomb.titleLabel?.text = buttonFirstBoomBomb.titleLabel?.text
        SettingsBombSound.updateMemory(buttonFirstBoomBomb.titleLabel?.text ?? "")
        hideMiniScreenBoomBomb()
    }
    
    @objc func buttonSecondBoomTupped(){
        buttonFirstBoomBomb.showCheckmark(false)
        buttonSecondBoomBomb.showCheckmark(true)
        buttonThirdBoomBomb.showCheckmark(false)
        buttonToShowMinScrForBoomBomb.titleLabel?.text = buttonSecondBoomBomb.titleLabel?.text
        SettingsBombSound.updateMemory(buttonSecondBoomBomb.titleLabel?.text ?? "")
        hideMiniScreenBoomBomb()
    }
    
    @objc func buttonThirdBoomTupped(){
        buttonFirstBoomBomb.showCheckmark(false)
        buttonSecondBoomBomb.showCheckmark(false)
        buttonThirdBoomBomb.showCheckmark(true)
        buttonToShowMinScrForBoomBomb.titleLabel?.text = buttonThirdBoomBomb.titleLabel?.text
        SettingsBombSound.updateMemory(buttonThirdBoomBomb.titleLabel?.text ?? "")
        hideMiniScreenBoomBomb()
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
        buttonViewLongTime.nameButtonLabel.textColor = Theme.violetFont
        buttonViewRandomTime.backgroundColor = Theme.violetBack
        buttonViewRandomTime.nameButtonLabel.textColor = Theme.yellowFont
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
        buttonToShowMiniScreenForBackgroundMusic.snp.makeConstraints { make in
            make.centerY.equalTo(labelBacgroundMusicForPicker.snp.centerY)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        labelTickSoundBomb.snp.makeConstraints { make in
            make.top.equalTo(labelBacgroundMusicForPicker.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        buttonToShowMinScrForTickBomb.snp.makeConstraints { make in
            make.centerY.equalTo(labelTickSoundBomb.snp.centerY)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        labelSoundBoomBomb.snp.makeConstraints { make in
            make.top.equalTo(labelTickSoundBomb.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        buttonToShowMinScrForBoomBomb.snp.makeConstraints { make in
            make.centerY.equalTo(labelSoundBoomBomb.snp.centerY)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    
}
