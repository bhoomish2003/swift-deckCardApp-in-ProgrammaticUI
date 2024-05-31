//
//  cardSelectionVC.swift
//  cardWorkout-ProgrammaticUI
//
//  Created by APPLE on 30/05/24.
//

import UIKit

class cardSelectionVC: UIViewController {
    
    let cardImageView = UIImageView()
    let stopButton = CWButton(backgroundColor: .systemRed, title: "Stop!")
    let restartButton = CWButton(backgroundColor: .systemGreen, title: "Restart")
    let rulesButton = CWButton(backgroundColor: .systemBlue, title: "Rules")
    var cards: [UIImage]=card.allValues
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        configureUI()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    func startTimer(){
        timer=Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage(){
        cardImageView.image=cards.randomElement() ?? UIImage(named: "AS")
    }

    
    func configureUI(){
        configureCardImageView()
        configureStopButton()
        configureRestartButton()
        configureRulesButton()
        
    }
    
    func configureCardImageView(){
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton(){
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(presentStopTarget), for: .touchUpInside)
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 250),
            stopButton.heightAnchor.constraint(equalToConstant: 60),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30),
            
        ])
    }
    
    @objc func presentStopTarget(){
        timer.invalidate()
    }

        func configureRestartButton(){
            view.addSubview(restartButton)
            restartButton.addTarget(self, action: #selector(presentRestartTarget), for: .touchUpInside)
            NSLayoutConstraint.activate([
                restartButton.widthAnchor.constraint(equalToConstant: 115),
                restartButton.heightAnchor.constraint(equalToConstant: 60),
                restartButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
                restartButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
            ])
    }
    
    
    @objc func presentRulesVC(){
        present(RulesVC(), animated: true)
    }
    @objc func presentRestartTarget(){
        timer.invalidate()
        startTimer()
    }
    
    func configureRulesButton(){
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)

        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 60),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
}

}
