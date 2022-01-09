//
//  DetailsViewController.swift
//  rickAndMortyPersons
//
//  Created by Kirill Drozdov on 09.01.2022.
//

import Foundation
import UIKit
import SnapKit


class DetailsViewController: UIViewController
{
    private lazy var characterImageView: UIImageView =
    {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel =
    {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var speciesLabel: UILabel =
    {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genderLabel: UILabel =
    {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var locationLabel: UILabel =
    {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var results: Results?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupNavigation()
        setupComponents()
        setupUI()
    }
    
    func setupNavigation()
    {
        self.navigationItem.title = results?.name
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupComponents()
    {
        guard let image = results?.image,
            let name = results?.name,
            let species = results?.species,
            let gender = results?.gender,
            let location = results?.location?.name else { return }
        characterImageView.loadInCacheImage(from: image, key: image)
        nameLabel.text       =  "Имя: \(name)"
        speciesLabel.text    =  "Вид: \(species)"
        genderLabel.text     =  "Пол: \(gender)"
        locationLabel.text   =  "Локация: \(location)"
    }
    
    func setupUI()
    {
        
        view.backgroundColor = .systemBackground
        view.addSubview(characterImageView)
        view.addSubview(speciesLabel)
        view.addSubview(genderLabel)
        view.addSubview(locationLabel)
        
        characterImageView.snp.makeConstraints({ make in
            make.left.equalToSuperview().inset(2)
            make.right.equalToSuperview().inset(2)

            make.top.equalTo(view.snp_topMargin).offset(10)
        })
        
        speciesLabel.snp.makeConstraints { make in 
            make.top.equalTo(characterImageView.snp_bottomMargin).offset(30)
            make.left.equalToSuperview().inset(40)
        }
        
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(speciesLabel.snp_bottomMargin).offset(20)
            make.left.equalToSuperview().inset(40)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(genderLabel.snp_bottomMargin).offset(20)
            make.left.equalToSuperview().inset(40)
            make.right.equalToSuperview().inset(1)

        }
    }
}

