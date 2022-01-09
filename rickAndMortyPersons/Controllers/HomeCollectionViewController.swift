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
            cell?.backgroundColor = .orange
            return cell
        })
    }
}


extension HomeCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = view.bounds.width / 2 - 16
        let height: CGFloat = 300
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 2, left: 0, bottom: 8, right: 8) так норм
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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
