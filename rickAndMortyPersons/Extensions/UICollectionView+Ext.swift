//
//  UICollectionView+Ext.swift
//  rickAndMortyPersons
//
//  Created by Kirill Drozdov on 09.01.2022.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    class var reuseIdentifier: String {
        return String(describing: self)
    }
}
