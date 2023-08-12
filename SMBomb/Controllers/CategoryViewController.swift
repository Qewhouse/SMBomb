//
//  CategoryViewController.swift
//  SMBomb
//
//  Created by Miras Maratov on 09.08.2023.
//

import UIKit

class CategoryViewController : UIViewController {
// MARK: - constants
    private let imageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "background")
        element.contentMode = .scaleToFill
        element.clipsToBounds = true
        return element
    }()
    
    private let viewStack: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 15
        element.alignment = .center
        element.distribution = .fillEqually
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
// MARK: - stack one
    private let viewStack1: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 15
        element.alignment = .center
        element.distribution = .fillEqually
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let categoryView1: UIView = {
        let element = UIView()
        element.backgroundColor = Theme.violetBack
        element.layer.cornerRadius = 40
        return element
    }()
    
    private let imageView1: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "miscLogo")
        element.backgroundColor = .clear
        element.contentMode = .scaleToFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let categoryLabel1: UILabel = {
        let element = UILabel()
        element.text = "О разном"
        element.textColor = Theme.yellowFont
        element.numberOfLines = 0
        element.textAlignment = .center
        element.frame.size.height = 22
        element.font = UIFont(name: Theme.appFont, size: 16)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let categoryView2: UIView = {
        let element = UIView()
        element.backgroundColor = Theme.violetBack
        element.layer.cornerRadius = 40
        return element
    }()
    
    private let imageView2: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "hobbyLogo")
        element.contentMode = .scaleToFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let categoryLabel2: UILabel = {
        let element = UILabel()
        element.text = "Cпорт и Хобби"
        element.textColor = Theme.yellowFont
        element.numberOfLines = 0
        element.textAlignment = .center
        element.frame.size.height = 22
        element.font = UIFont(name: Theme.appFont, size: 16)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let selectButton1: UIImageView = {
        let element = UIImageView()
        if CategoryFlag.isSelectedMisc == true {
            element.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            element.image = UIImage(systemName: "circle")
        }
        element.tintColor = .white
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let selectButton2: UIImageView = {
        let element = UIImageView()
        if CategoryFlag.isSelectedHobby == true{
            element.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            element.image = UIImage(systemName: "circle")
        }
        element.tintColor = .white
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
// MARK: - stack two
    private let viewStack2: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 15
        element.alignment = .center
        element.distribution = .fillEqually
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
   
    private let categoryView3: UIView = {
        let element = UIView()
        element.backgroundColor = Theme.violetBack
        element.layer.cornerRadius = 40
        return element
    }()
    
    
    private let imageView3: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "lifeLogo")
        element.backgroundColor = .clear
        element.contentMode = .scaleToFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let categoryLabel3: UILabel = {
        let element = UILabel()
        element.text = "Про Жизнь"
        element.textColor = Theme.yellowFont
        element.numberOfLines = 0
        element.textAlignment = .center
        element.frame.size.height = 22
        element.font = UIFont(name: Theme.appFont, size: 16)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let categoryView4: UIView = {
        let element = UIView()
        element.backgroundColor = Theme.violetBack
        element.layer.cornerRadius = 40
        return element
    }()
    
    private let imageView4: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "celebsLogo")
        element.contentMode = .scaleToFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let categoryLabel4: UILabel = {
        let element = UILabel()
        element.text = "Знаменитости"
        element.textColor = Theme.yellowFont
        element.numberOfLines = 0
        element.textAlignment = .center
        element.frame.size.height = 22
        element.font = UIFont(name: Theme.appFont, size: 16)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let selectButton3: UIImageView = {
        let element = UIImageView()
        if CategoryFlag.isSelectedLife == true{
            element.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            element.image = UIImage(systemName: "circle")
        }
        element.tintColor = .white
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    private let selectButton4: UIImageView = {
        let element = UIImageView()
        if CategoryFlag.isSelectedCelebs == true{
            element.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            element.image = UIImage(systemName: "circle")
        }
        element.tintColor = .white
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
// MARK: - stack three
    private let viewStack3: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 15
        element.alignment = .center
        element.distribution = .fillEqually
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let categoryView5: UIView = {
        let element = UIView()
        element.backgroundColor = Theme.violetBack
        element.layer.cornerRadius = 40
        return element
    }()
    
    private let imageView5: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "movieLogo")
        element.backgroundColor = .clear
        element.contentMode = .scaleToFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let categoryLabel5: UILabel = {
        let element = UILabel()
        element.text = "Искусство и Кино"
        element.textColor = Theme.yellowFont
        element.numberOfLines = 0
        element.textAlignment = .center
        element.frame.size.height = 22
        element.font = UIFont(name: Theme.appFont, size: 16)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let categoryView6: UIView = {
        let element = UIView()
        element.backgroundColor = Theme.violetBack
        element.layer.cornerRadius = 40
        return element
    }()
    
    private let imageView6: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "natureLogo")
        element.contentMode = .scaleToFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let categoryLabel6: UILabel = {
        let element = UILabel()
        element.text = "Природа"
        element.textColor = Theme.yellowFont
        element.numberOfLines = 0
        element.textAlignment = .center
        element.frame.size.height = 22
        element.font = UIFont(name: Theme.appFont, size: 16)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let selectButton5: UIImageView = {
        let element = UIImageView()
        if CategoryFlag.isSelectedArt == true{
            element.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            element.image = UIImage(systemName: "circle")
        }
        element.tintColor = .white
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let selectButton6: UIImageView = {
        let element = UIImageView()
        //element.backgroundColor = Theme.violetBack
        if CategoryFlag.isSelectedNature == true{
            element.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            element.image = UIImage(systemName: "circle")
        }

        element.tintColor = .white
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
// MARK: - life cycle func
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setConstaraints()
        configureNavBar()
    }
}

// MARK: - extension
extension CategoryViewController {
    
// MARK: - flow funcs
    private func configureNavBar(){
        let titleLabel = UILabel()
        titleLabel.text = "Кaтегории"
        titleLabel.font = UIFont(name: Theme.appFont, size: 35)
        titleLabel.textColor = Theme.violetFont
        navigationItem.titleView = titleLabel
    }
    
    @objc private func selectOne(){
        if CategoryFlag.isSelectedMisc == false{
            selectButton1.image = UIImage(systemName: "checkmark.circle.fill")
            CategoryFlag.isSelectedMisc = true
        } else {
            selectButton1.image = UIImage(systemName: "circle")
            CategoryFlag.isSelectedMisc = false
        }
    }
    
    @objc private func selectTwo(){
        if CategoryFlag.isSelectedHobby == false{
            selectButton2.image = UIImage(systemName: "checkmark.circle.fill")
            CategoryFlag.isSelectedHobby = true
        } else {
            selectButton2.image = UIImage(systemName: "circle")
            CategoryFlag.isSelectedHobby = false
        }
    }
    
    @objc private func selectThree(){
        if CategoryFlag.isSelectedLife == false{
            selectButton3.image = UIImage(systemName: "checkmark.circle.fill")
            CategoryFlag.isSelectedLife = true
        } else {
            selectButton3.image = UIImage(systemName: "circle")
            CategoryFlag.isSelectedLife = false
        }
    }
    @objc private func selectFour(){
        if CategoryFlag.isSelectedCelebs == false{
            selectButton4.image = UIImage(systemName: "checkmark.circle.fill")
            CategoryFlag.isSelectedCelebs = true
        } else {
            selectButton4.image = UIImage(systemName: "circle")
            CategoryFlag.isSelectedCelebs = false
        }
    }
    
    @objc private func selectFive(){
        if CategoryFlag.isSelectedArt == false{
            selectButton5.image = UIImage(systemName: "checkmark.circle.fill")
            CategoryFlag.isSelectedArt = true
        } else {
            selectButton5.image = UIImage(systemName: "circle")
            CategoryFlag.isSelectedArt = false
        }
    }
    
    @objc private func selectSix(){
        if CategoryFlag.isSelectedNature == false{
            selectButton6.image = UIImage(systemName: "checkmark.circle.fill")
            CategoryFlag.isSelectedNature = true
        } else {
            selectButton6.image = UIImage(systemName: "circle")
            CategoryFlag.isSelectedNature = false
        }
    }

    private func setView(){
        imageView.frame = view.bounds
        view.addSubview(imageView)
        
        categoryView1.addSubview(imageView1)
        categoryView1.addSubview(categoryLabel1)
        categoryView1.addSubview(selectButton1)
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(selectOne))
        categoryView1.addGestureRecognizer(recognizer1)
        
        categoryView2.addSubview(imageView2)
        categoryView2.addSubview(categoryLabel2)
        categoryView2.addSubview(selectButton2)
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(selectTwo))
        categoryView2.addGestureRecognizer(recognizer2)
        viewStack1.addArrangedSubview(categoryView1)
        viewStack1.addArrangedSubview(categoryView2)
        
        categoryView3.addSubview(imageView3)
        categoryView3.addSubview(categoryLabel3)
        categoryView3.addSubview(selectButton3)
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(selectThree))
        categoryView3.addGestureRecognizer(recognizer3)
        
        categoryView4.addSubview(imageView4)
        categoryView4.addSubview(categoryLabel4)
        categoryView4.addSubview(selectButton4)
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(selectFour))
        categoryView4.addGestureRecognizer(recognizer4)
        viewStack2.addArrangedSubview(categoryView3)
        viewStack2.addArrangedSubview(categoryView4)
        
        categoryView5.addSubview(imageView5)
        categoryView5.addSubview(categoryLabel5)
        categoryView5.addSubview(selectButton5)
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(selectFive))
        categoryView5.addGestureRecognizer(recognizer5)
        
        categoryView6.addSubview(imageView6)
        categoryView6.addSubview(categoryLabel6)
        categoryView6.addSubview(selectButton6)
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(selectSix))
        categoryView6.addGestureRecognizer(recognizer6)
        viewStack3.addArrangedSubview(categoryView5)
        viewStack3.addArrangedSubview(categoryView6)
        
        viewStack.addArrangedSubview(viewStack1)
        viewStack.addArrangedSubview(viewStack2)
        viewStack.addArrangedSubview(viewStack3)
        view.addSubview(viewStack)
    }
    
    private func setConstaraints() {
        NSLayoutConstraint.activate([
            imageView1.topAnchor.constraint(equalTo: categoryView1.topAnchor, constant: 20),
            imageView1.leadingAnchor.constraint(equalTo: categoryView1.leadingAnchor, constant: 20),
            imageView1.trailingAnchor.constraint(equalTo: categoryView1.trailingAnchor, constant: -20),
            imageView1.bottomAnchor.constraint(equalTo: categoryView1.bottomAnchor, constant: -50),
            
            categoryLabel1.topAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: 2),
            categoryLabel1.leadingAnchor.constraint(equalTo: categoryView1.leadingAnchor, constant: 5),
            categoryLabel1.trailingAnchor.constraint(equalTo: categoryView1.trailingAnchor, constant: -5),
            
            categoryView1.topAnchor.constraint(equalTo: viewStack1.topAnchor, constant: 0),
            categoryView1.bottomAnchor.constraint(equalTo: viewStack1.bottomAnchor, constant: 0),
            categoryView1.heightAnchor.constraint(equalTo: categoryView1.widthAnchor, multiplier: 1.0),
            
            selectButton1.topAnchor.constraint(equalTo: categoryView1.topAnchor, constant: 10),
            selectButton1.leadingAnchor.constraint(equalTo: categoryView1.leadingAnchor, constant: 10),
            selectButton1.widthAnchor.constraint(equalTo: selectButton1.heightAnchor, multiplier: 1.0),
            selectButton1.trailingAnchor.constraint(equalTo: categoryView1.trailingAnchor, constant: -140),
            
            imageView2.topAnchor.constraint(equalTo: categoryView2.topAnchor, constant: 20),
            imageView2.leadingAnchor.constraint(equalTo: categoryView2.leadingAnchor, constant: 20),
            imageView2.trailingAnchor.constraint(equalTo: categoryView2.trailingAnchor, constant: -20),
            imageView2.bottomAnchor.constraint(equalTo: categoryView2.bottomAnchor, constant: -50),
            
            categoryLabel2.topAnchor.constraint(equalTo: imageView2.bottomAnchor, constant: 2),
            categoryLabel2.leadingAnchor.constraint(equalTo: categoryView2.leadingAnchor, constant: 5),
            categoryLabel2.trailingAnchor.constraint(equalTo: categoryView2.trailingAnchor, constant: -5),
            
            categoryView2.topAnchor.constraint(equalTo: viewStack1.topAnchor, constant: 0),
            categoryView2.bottomAnchor.constraint(equalTo: viewStack1.bottomAnchor, constant: 0),
            categoryView2.heightAnchor.constraint(equalTo: categoryView2.widthAnchor, multiplier: 1.0),
            
            selectButton2.topAnchor.constraint(equalTo: categoryView2.topAnchor, constant: 10),
            selectButton2.leadingAnchor.constraint(equalTo: categoryView2.leadingAnchor, constant: 10),
            selectButton2.widthAnchor.constraint(equalTo: selectButton2.heightAnchor, multiplier: 1.0),
            selectButton2.trailingAnchor.constraint(equalTo: categoryView2.trailingAnchor, constant: -140),
            
            imageView3.topAnchor.constraint(equalTo: categoryView3.topAnchor, constant: 20),
            imageView3.leadingAnchor.constraint(equalTo: categoryView3.leadingAnchor, constant: 20),
            imageView3.trailingAnchor.constraint(equalTo: categoryView3.trailingAnchor, constant: -20),
            imageView3.bottomAnchor.constraint(equalTo: categoryView3.bottomAnchor, constant: -50),
            
            categoryLabel3.topAnchor.constraint(equalTo: imageView3.bottomAnchor, constant: 2),
            categoryLabel3.leadingAnchor.constraint(equalTo: categoryView3.leadingAnchor, constant: 5),
            categoryLabel3.trailingAnchor.constraint(equalTo: categoryView3.trailingAnchor, constant: -5),
            
            categoryView3.topAnchor.constraint(equalTo: viewStack2.topAnchor, constant: 0),
            categoryView3.bottomAnchor.constraint(equalTo: viewStack2.bottomAnchor, constant: 0),
            categoryView3.heightAnchor.constraint(equalTo: categoryView3.widthAnchor, multiplier: 1.0),
            
            selectButton3.topAnchor.constraint(equalTo: categoryView3.topAnchor, constant: 10),
            selectButton3.leadingAnchor.constraint(equalTo: categoryView3.leadingAnchor, constant: 10),
            selectButton3.widthAnchor.constraint(equalTo: selectButton3.heightAnchor, multiplier: 1.0),
            selectButton3.trailingAnchor.constraint(equalTo: categoryView3.trailingAnchor, constant: -140),
            
            imageView4.topAnchor.constraint(equalTo: categoryView4.topAnchor, constant: 20),
            imageView4.leadingAnchor.constraint(equalTo: categoryView4.leadingAnchor, constant: 20),
            imageView4.trailingAnchor.constraint(equalTo: categoryView4.trailingAnchor, constant: -20),
            imageView4.bottomAnchor.constraint(equalTo: categoryView4.bottomAnchor, constant: -50),
            
            categoryLabel4.topAnchor.constraint(equalTo: imageView4.bottomAnchor, constant: 2),
            categoryLabel4.leadingAnchor.constraint(equalTo: categoryView4.leadingAnchor, constant: 5),
            categoryLabel4.trailingAnchor.constraint(equalTo: categoryView4.trailingAnchor, constant: -5),
            
            categoryView4.topAnchor.constraint(equalTo: viewStack2.topAnchor, constant: 0),
            categoryView4.bottomAnchor.constraint(equalTo: viewStack2.bottomAnchor, constant: 0),
            categoryView4.heightAnchor.constraint(equalTo: categoryView4.widthAnchor, multiplier: 1.0),
            
            selectButton4.topAnchor.constraint(equalTo: categoryView4.topAnchor, constant: 10),
            selectButton4.leadingAnchor.constraint(equalTo: categoryView4.leadingAnchor, constant: 10),
            selectButton4.widthAnchor.constraint(equalTo: selectButton4.heightAnchor, multiplier: 1.0),
            selectButton4.trailingAnchor.constraint(equalTo: categoryView4.trailingAnchor, constant: -140),
            
            imageView5.topAnchor.constraint(equalTo: categoryView5.topAnchor, constant: 20),
            imageView5.leadingAnchor.constraint(equalTo: categoryView5.leadingAnchor, constant: 20),
            imageView5.trailingAnchor.constraint(equalTo: categoryView5.trailingAnchor, constant: -20),
            imageView5.bottomAnchor.constraint(equalTo: categoryView5.bottomAnchor, constant: -50),
            
            categoryLabel5.topAnchor.constraint(equalTo: imageView5.bottomAnchor, constant: 2),
            categoryLabel5.leadingAnchor.constraint(equalTo: categoryView5.leadingAnchor, constant: 5),
            categoryLabel5.trailingAnchor.constraint(equalTo: categoryView5.trailingAnchor, constant: -5),
            
            categoryView5.topAnchor.constraint(equalTo: viewStack3.topAnchor, constant: 0),
            categoryView5.bottomAnchor.constraint(equalTo: viewStack3.bottomAnchor, constant: 0),
            categoryView5.heightAnchor.constraint(equalTo: categoryView5.widthAnchor, multiplier: 1.0),
            
            selectButton5.topAnchor.constraint(equalTo: categoryView5.topAnchor, constant: 10),
            selectButton5.leadingAnchor.constraint(equalTo: categoryView5.leadingAnchor, constant: 10),
            selectButton5.widthAnchor.constraint(equalTo: selectButton5.heightAnchor, multiplier: 1.0),
            selectButton5.trailingAnchor.constraint(equalTo: categoryView5.trailingAnchor, constant: -140),
            
            imageView6.topAnchor.constraint(equalTo: categoryView6.topAnchor, constant: 20),
            imageView6.leadingAnchor.constraint(equalTo: categoryView6.leadingAnchor, constant: 20),
            imageView6.trailingAnchor.constraint(equalTo: categoryView6.trailingAnchor, constant: -20),
            imageView6.bottomAnchor.constraint(equalTo: categoryView6.bottomAnchor, constant: -50),
            
            categoryLabel6.topAnchor.constraint(equalTo: imageView6.bottomAnchor, constant: 2),
            categoryLabel6.leadingAnchor.constraint(equalTo: categoryView6.leadingAnchor, constant: 5),
            categoryLabel6.trailingAnchor.constraint(equalTo: categoryView6.trailingAnchor, constant: -5),
            
            categoryView6.topAnchor.constraint(equalTo: viewStack3.topAnchor, constant: 0),
            categoryView6.bottomAnchor.constraint(equalTo: viewStack3.bottomAnchor, constant: 0),
            categoryView6.heightAnchor.constraint(equalTo: categoryView6.widthAnchor, multiplier: 1.0),
            
            selectButton6.topAnchor.constraint(equalTo: categoryView6.topAnchor, constant: 10),
            selectButton6.leadingAnchor.constraint(equalTo: categoryView6.leadingAnchor, constant: 10),
            selectButton6.widthAnchor.constraint(equalTo: selectButton6.heightAnchor, multiplier: 1.0),
            selectButton6.trailingAnchor.constraint(equalTo: categoryView6.trailingAnchor, constant: -140),
            
            viewStack1.leadingAnchor.constraint(equalTo: viewStack.leadingAnchor, constant: 0),
            viewStack1.trailingAnchor.constraint(equalTo: viewStack.trailingAnchor, constant: 0),
            viewStack2.leadingAnchor.constraint(equalTo: viewStack.leadingAnchor, constant: 0),
            viewStack2.trailingAnchor.constraint(equalTo: viewStack.trailingAnchor, constant: 0),
            viewStack3.leadingAnchor.constraint(equalTo: viewStack.leadingAnchor, constant: 0),
            viewStack3.trailingAnchor.constraint(equalTo: viewStack.trailingAnchor, constant: 0),
            
            viewStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            viewStack.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 10),
            viewStack.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -10),
            viewStack.bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor, constant: -300)
        ])
    }
}
