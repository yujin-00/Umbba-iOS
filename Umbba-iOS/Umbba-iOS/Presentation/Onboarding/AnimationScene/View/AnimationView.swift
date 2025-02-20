//
//  AnimationView.swift
//  Umbba-iOS
//
//  Created by 남유진 on 2023/07/16.
//

import UIKit
import SnapKit

final class AnimationView: UIView {
    
    // MARK: - Properties
    
    weak var nextDelegate: NextButtonDelegate?
    
    // MARK: - UI Components
    
    private let backgroundImage: UIImageView = {
        let animationImage = UIImageView()
        if SizeLiterals.Screen.deviceRatio > 0.5 {
            animationImage.image = ImageLiterals.Onboarding.image_se_depart
        } else {
            animationImage.image = ImageLiterals.Onboarding.img_depart
        }
        return animationImage
    }()
    
    private let animationLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Onboarding.animationLabel
        label.font = .PretendardSemiBold(size: 16)
        label.textColor = .white
        return label
    }()
    
    private let callingButton: UIButton = {
        let button = CustomButton(status: true, title: I18N.Onboarding.callingButton)
        button.isEnabled = true
        return button
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setAddTarget()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension AnimationView {
    
    func setAddTarget() {
        callingButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    func setHierarchy() {
        addSubviews(backgroundImage, animationLabel, callingButton)
    }
    func setLayout() {
        backgroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        animationLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(33)
        }
        
        callingButton.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-12)
            $0.trailing.leading.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
    }
    
    @objc
    func nextButtonTapped() {
        nextDelegate?.nextButtonTapped()
    }
}
