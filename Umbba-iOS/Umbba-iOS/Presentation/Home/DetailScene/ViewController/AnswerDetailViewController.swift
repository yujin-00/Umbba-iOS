//
//  AnswerDetailViewController.swift
//  Umbba-iOS
//
//  Created by 남유진 on 2023/07/13.
//

import UIKit

final class AnswerDetailViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let answerDetailView = AnswerDetailView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = answerDetailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
    }
}

// MARK: - Extensions

extension AnswerDetailViewController {
    func setDelegate() {
        answerDetailView.delegate = self
        answerDetailView.nextDelegate = self
    }
}

extension AnswerDetailViewController: NavigationBarDelegate {
    func backButtonTapped() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let keyWindow = windowScene.windows.first else {
            return
        }
        keyWindow.rootViewController = TabBarController()
    }

    func completeButtonTapped() {
        
    }
}

extension AnswerDetailViewController: NextButtonDelegate {
    func nextButtonTapped() {
        self.navigationController?.pushViewController(AnswerWriteViewController(), animated: true)
    }
}
