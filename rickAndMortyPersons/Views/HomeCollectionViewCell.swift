//
//  HomeCollectionViewCell.swift
//  rickAndMortyPersons
//
//  Created by Kirill Drozdov on 09.01.2022.
//

import UIKit
import SnapKit
class HomeCollectionViewCell: UICollectionViewCell {
    
    // Character Image
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12

        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Character Name Label
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populate(character: Results) {
        self.nameLabel.text = character.name
        guard let charImage = character.image else { return }
        self.characterImageView.loadInCacheImage(from: charImage, key: charImage)
    }
    
    func setupUI() {
        addSubview(characterImageView)
        addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(-16)
            make.left.equalToSuperview().inset(15)
        }
    
        characterImageView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview().inset(0)
        }
    }
}
