//
//  PesquisaFimeCollectionViewCell.swift
//  ProjetoVIPBootcamp
//
//  Created by Fernanda Perovano on 15/10/23.
//

import UIKit

class PesquisaFimeCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "PesquisaFimeCollectionViewCell"
    
    private var screen: PesquisaFimeCollectionViewCellScreen = PesquisaFimeCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customCell(nome: String) {
        screen.movieLabel.text = nome
    }
}
