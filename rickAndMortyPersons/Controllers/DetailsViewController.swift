//
//  DetailsViewController.swift
//  rickAndMortyPersons
//
//  Created by Kirill Drozdov on 09.01.2022.
//

import Foundation
import UIKit


class DetailsViewController: UIViewController{
    // Character Image
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Character Name Label
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Character Species Label
    private lazy var speciesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Character Gender Label
    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Character Location Label
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var results: Results?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupComponents()
        setupUI()
    }
    
    func setupNavigation() {
        self.navigationItem.title = results?.name
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupComponents() {
        guard let image = results?.image,
            let name = results?.name,
            let species = results?.species,
            let gender = results?.gender,
            let location = results?.location?.name else { return }
        characterImageView.loadInCacheImage(from: image, key: image)
        nameLabel.text = "Name: \(name)"
        speciesLabel.text = "Species: \(species)"
        genderLabel.text = "Gender: \(gender)"
        locationLabel.text = "Location: \(location)"
    }
    
    func setupUI() {
        
        view.backgroundColor = .systemBackground
        view.addSubview(characterImageView)
        view.addSubview(speciesLabel)
        view.addSubview(genderLabel)
        view.addSubview(locationLabel)
        
        NSLayoutConstraint.activate([
            
            // Character Image
            characterImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            characterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            characterImageView.heightAnchor.constraint(equalToConstant: 340),
            
//            // Character Name Label
//            nameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 32),
//            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            nameLabel.heightAnchor.constraint(equalToConstant: 13),
            
            // Character Species Label
            speciesLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 16),
            speciesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            speciesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            speciesLabel.heightAnchor.constraint(equalToConstant: 13),
            
            // Character Species Label
            genderLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 16),
            genderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            genderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            genderLabel.heightAnchor.constraint(equalToConstant: 13),
            
            // Character Species Label
            locationLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 16),
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 13),
        ])
    }
}

