//
//  ViewController.swift
//  Sliding Cards
//
//  Created by Charles Martin Reed on 12/19/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- Instance init
    let cardView = UIView()
    let videoImageView = UIImageView()
    let titleLabel = UILabel()
    let watchButton = UIButton()
    let animationButton = UIButton()
    
    var cardViewBottomConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupCardView()

    }
    
    func setupCardView() {
        view.addSubview(cardView)
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 12
        setupCardViewConstraints()
        
        setupAnimateButton()
        setupVideoImageView()
        setupTitleLabel()
        setupWatchButton()
        
    }
    
    //MARK:- Setup UI Methods
    func setupAnimateButton() {
        view.addSubview(animationButton)
        animationButton.addTarget(self, action: #selector(animateCard), for: .touchUpInside)
        
        animationButton.backgroundColor = .blue
        animationButton.setTitle("Activate", for: .normal)
        animationButton.setTitleColor(.white, for: .normal)
        
        animationButton.layer.cornerRadius = 12
        
        setupAnimateButtonConstraints()
    }
    
    func setupVideoImageView() {
        cardView.addSubview(videoImageView)
        videoImageView.layer.cornerRadius = 8
        videoImageView.layer.masksToBounds = true
        videoImageView.image = UIImage(named: "Baby_Hedgehog")
        videoImageView.contentMode = .scaleAspectFill
        videoImageView.clipsToBounds = true
        
        setupVideoImageViewConstraints()
    }
    
    func setupTitleLabel() {
        cardView.addSubview(titleLabel)
        titleLabel.text = "Lil' Sonic"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = .darkGray
        titleLabel.textAlignment = .center
        
        setupTitleLabelConstraints()
    }
    
    func setupWatchButton() {
        cardView.addSubview(watchButton)
        watchButton.backgroundColor = .red
        watchButton.setTitleColor(.white, for: .normal)
        watchButton.setTitle("Watch Now", for: .normal)
        watchButton.layer.cornerRadius = 12
        
        setupWatchButtonConstraints()
    }
    
    //MARK:- Constraint methods
    func setupCardViewConstraints() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 360).isActive = true
        
        //bottom constraint is being animated at button tap
        cardViewBottomConstraint = cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 600)
        cardViewBottomConstraint.isActive = true
    }
    
    func setupVideoImageViewConstraints() {
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        videoImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 50).isActive = true
        
        videoImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 30).isActive = true
        videoImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -30).isActive = true
        
        //helps keep the 16:9 aspect ratio
        videoImageView.heightAnchor.constraint(equalTo: videoImageView.widthAnchor, multiplier: 9.0/16.0).isActive = true
    }
    
    func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: videoImageView.bottomAnchor, constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: videoImageView.leadingAnchor, constant: 28).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: -28).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
    
    func setupWatchButtonConstraints() {
        watchButton.translatesAutoresizingMaskIntoConstraints = false
        
        watchButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 30).isActive = true
        watchButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -30).isActive = true
        watchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        watchButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -30).isActive = true
        
    }
    
    func setupAnimateButtonConstraints() {
        animationButton.translatesAutoresizingMaskIntoConstraints = false
        
        animationButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        animationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        animationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        animationButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    //MARK:- Animation method
    @objc func animateCard() {
        cardViewBottomConstraint.constant = -10
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    


}

