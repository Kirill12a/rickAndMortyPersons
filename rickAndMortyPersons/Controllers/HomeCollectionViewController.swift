//
//  HomeCollectionViewController.swift
//  rickAndMortyPersons
//
//  Created by Kirill Drozdov on 09.01.2022.
//

import Foundation
import UIKit

class HomeCollectionViewController: UICollectionViewController{
    
    
    var homeViewModel = HomeViewModel()

    override func viewDidLoad() {
        setupCollectionView()
        setupDataSource()
        homeViewModel.fetchCharacters()
        setupNavigation()
    }
    
    func setupCollectionView(){
        self.collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .systemBackground
    }
    
    func setupNavigation(){
        self.navigationItem.title = "Персонажы"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupDataSource() {
        homeViewModel.dataSource = UICollectionViewDiffableDataSource<Sections, Results>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, results) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.reuseIdentifier, for: indexPath) as? HomeCollectionViewCell
            cell?.populate(character: results)
            return cell
        })
    }
}


extension HomeCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width / 3) - 16
        let height: CGFloat = 148
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeViewModel.didSelectItemAt(indexPath) { controller in
            navigationController?.pushViewController(controller, animated: true)
        }
    }

    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        homeViewModel.willDisplay(indexPath)
    }
}
