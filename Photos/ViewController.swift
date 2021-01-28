//
//  ViewController.swift
//  Photos
//
//  Created by kushal on 28/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    let coverArtCellReuseIdentifier = "coverArtCellReuseIdentifier"
    let headerReuseIdentifier = "headerReuseIdentifier"
    let padding: CGFloat = 8
    let headerHeight: CGFloat = 30
    
    var beKind: CoverArt!
    var adoreYou: CoverArt!
    
    var coverArts: [CoverArt]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "Photos"
        
        beKind = CoverArt(name: "Be Kind", imageName: "Cover Art 1")
        adoreYou = CoverArt(name: "Adore You", imageName: "Cover Art 4")
        
        coverArts = [beKind, beKind, beKind, adoreYou, adoreYou, adoreYou, beKind, beKind, beKind, adoreYou, adoreYou, adoreYou, beKind, beKind, beKind, adoreYou, adoreYou, adoreYou, beKind, beKind, beKind, adoreYou, adoreYou, adoreYou]
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CoverArtCollectionViewCell.self, forCellWithReuseIdentifier: coverArtCellReuseIdentifier)
        view.addSubview(collectionView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: padding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding )
        ])
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coverArts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: coverArtCellReuseIdentifier, for: indexPath) as! CoverArtCollectionViewCell
        cell.configure(coverArt: coverArts[indexPath.row])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width - 2 * padding) / 3.0
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: headerHeight)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentCoverArt = coverArts[indexPath.row]
        
        if currentCoverArt.name == "Be Kind" {
            coverArts[indexPath.row] = adoreYou
        } else {
            coverArts[indexPath.row] = beKind
        }
        
        collectionView.reloadData()
    }
}
