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
        //element.clipsToBounds = true
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
        //element.clipsToBounds = true
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
    
    private let selectButton1: UIButton = {
        let element = UIButton()
        element.frame.size.width = 28
        element.frame.size.height = 28
        element.layer.cornerRadius = 14
        element.layer.borderWidth = 2
        element.layer.borderColor = UIColor.white.cgColor
        element.backgroundColor = Theme.violetBack
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let selectButton2: UIButton = {
        let element = UIButton()
        element.frame.size.width = 28
        element.frame.size.height = 28
        element.layer.cornerRadius = 14
        element.layer.borderWidth = 2
        element.layer.borderColor = UIColor.white.cgColor
        element.backgroundColor = Theme.violetBack
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
        //element.clipsToBounds = true
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
        //element.clipsToBounds = true
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
    
    private let selectButton3: UIButton = {
        let element = UIButton()
        element.frame.size.width = 28
        element.frame.size.height = 28
        element.layer.cornerRadius = 14
        element.layer.borderWidth = 2
        element.layer.borderColor = UIColor.white.cgColor
        element.backgroundColor = Theme.violetBack
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    private let selectButton4: UIButton = {
        let element = UIButton()
        element.frame.size.width = 28
        element.frame.size.height = 28
        element.layer.cornerRadius = 14
        element.layer.borderWidth = 2
        element.layer.borderColor = UIColor.white.cgColor
        element.backgroundColor = Theme.violetBack
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
        //element.clipsToBounds = true
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
        //element.clipsToBounds = true
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
    
    private let selectButton5: UIButton = {
        let element = UIButton()
        element.frame.size.width = 28
        element.frame.size.height = 28
        element.layer.cornerRadius = 14
        element.layer.borderWidth = 2
        element.layer.borderColor = UIColor.white.cgColor
        element.backgroundColor = Theme.violetBack
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let selectButton6: UIButton = {
        let element = UIButton()
        element.frame.size.width = 28
        element.frame.size.height = 28
        element.layer.cornerRadius = 14
        element.layer.borderWidth = 2
        element.layer.borderColor = UIColor.white.cgColor
        element.backgroundColor = Theme.violetBack
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
        titleLabel.font = UIFont(name: Theme.appFont, size: 24)
        titleLabel.textColor = Theme.violetFont
        navigationItem.titleView = titleLabel
    }
    
    @objc private func isSelected(element: UIButton){
        if selectButton1.currentImage == UIImage(named: "selectLogo") {
            selectButton1.backgroundColor = Theme.violetBack
        } else {
            selectButton1.backgroundColor = .clear
            selectButton1.setImage(UIImage(named: "selectLogo"), for: .normal)
        }
    }
    
    private func setView(){
        imageView.frame = view.bounds
        view.addSubview(imageView)
        
        categoryView1.addSubview(imageView1)
        categoryView1.addSubview(categoryLabel1)
        categoryView1.addSubview(selectButton1)
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(isSelected))
        categoryView1.addGestureRecognizer(recognizer1)
        
        categoryView2.addSubview(imageView2)
        categoryView2.addSubview(categoryLabel2)
        categoryView2.addSubview(selectButton2)
        viewStack1.addArrangedSubview(categoryView1)
        viewStack1.addArrangedSubview(categoryView2)
        
        categoryView3.addSubview(imageView3)
        categoryView3.addSubview(categoryLabel3)
        categoryView3.addSubview(selectButton3)
        
        categoryView4.addSubview(imageView4)
        categoryView4.addSubview(categoryLabel4)
        categoryView4.addSubview(selectButton4)
        viewStack2.addArrangedSubview(categoryView3)
        viewStack2.addArrangedSubview(categoryView4)
        
        categoryView5.addSubview(imageView5)
        categoryView5.addSubview(categoryLabel5)
        categoryView5.addSubview(selectButton5)
        
        categoryView6.addSubview(imageView6)
        categoryView6.addSubview(categoryLabel6)
        categoryView6.addSubview(selectButton6)
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
            
            viewStack1.leadingAnchor.constraint(equalTo: viewStack.leadingAnchor, constant: 0),
            viewStack1.trailingAnchor.constraint(equalTo: viewStack.trailingAnchor, constant: 0),
            viewStack2.leadingAnchor.constraint(equalTo: viewStack.leadingAnchor, constant: 0),
            viewStack2.trailingAnchor.constraint(equalTo: viewStack.trailingAnchor, constant: 0),
            viewStack3.leadingAnchor.constraint(equalTo: viewStack.leadingAnchor, constant: 0),
            viewStack3.trailingAnchor.constraint(equalTo: viewStack.trailingAnchor, constant: 0),
            
            viewStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            viewStack.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 10),
            viewStack.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -10),
            viewStack.bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor, constant: -40)
        ])
    }
}
