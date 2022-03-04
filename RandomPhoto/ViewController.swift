//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Eugenia Consoli on 04/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
        
    }()//carica l'immagine
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
        
    }()//carica l'icona per il cambio immagine
    
    let colors: [UIColor] = [
        .systemPink,
        .systemRed,
        .systemBlue,
        .systemCyan,
        .systemFill,
        .systemGray,
        .systemMint,
        .systemTeal,
        .systemBrown,
        .systemPurple,
        .systemYellow,
        .systemOrange,
        .systemIndigo,
        
    ] //scelta di colori random, per lo sfondo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)//grandezza spazio per immagine
        imageView.center = view.center //imposto immagine in mezzo allo schermo
        
        view.addSubview(button)//fa visualizzare il bottone
        getRandomPhoto() //chiamo la funzione che cerca foto
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton(){
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()//sceglie colore random
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(
            x: 30,
            y: view.frame.size.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 55
        )
    }
    
    func getRandomPhoto(){
        let urlString =
            "https://picsum.photos/200" //url da cui prendo le foto
        let url = URL(string: urlString)! //! assicura esistenza del sito
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        imageView.image = UIImage(data: data)
    }

}

