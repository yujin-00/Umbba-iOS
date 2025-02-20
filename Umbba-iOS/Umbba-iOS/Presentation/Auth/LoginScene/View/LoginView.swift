//
//  LoginView.swift
//  Umbba-iOS
//
//  Created by 고아라 on 2023/07/05.
//

import UIKit

import SnapKit

protocol LoginDelegate: AnyObject {
    func kakaoLogin()
    func appleLogin()
}

final class LoginView: UIView {
    
    // MARK: - Properties
    
    weak var loginDelegate: LoginDelegate?
    
    // MARK: - UI Components
    
    private let loginBackgroundImage: UIImageView = {
        let backgroundimage = UIImageView()
        backgroundimage.contentMode = .scaleAspectFill
        backgroundimage.contentMode = .scaleAspectFill
        if SizeLiterals.Screen.deviceRatio > 0.5 {
            backgroundimage.image = ImageLiterals.Auth.SE_login
        } else {
            backgroundimage.image = ImageLiterals.Auth.img_login
        }
        return backgroundimage
    }()
    
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = ImageLiterals.Common.img_umbbaLogo
        return image
    }()
    
    private let logoTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.logoTitle
        label.font = .Cafe24Regular(size: 20)
        label.textColor = .Primary500
        return label
    }()
    
    private let logoSubTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.logoSubTitle
        label.font = .PretendardRegular(size: 12)
        label.textColor = .Primary500
        return label
    }()
    
    private let loginAppleImage: UIImageView = {
        let image = UIImageView()
        image.image = ImageLiterals.Auth.icn_apple
        return image
    }()
    
    private let loginAppleTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.appleButtonTitle
        label.font = .PretendardRegular(size: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.partFontChange(targetString: "애플", font: .PretendardSemiBold(size: 16))
        return label
    }()
    
    private lazy var loginAppleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 30
        return button
    }()
    
    private let loginKakaoImage: UIImageView = {
        let image = UIImageView()
        image.image = ImageLiterals.Auth.icn_kakao
        return image
    }()
    
    private let loginKakaoTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.kakaoButtonTitle
        label.font = .PretendardRegular(size: 16)
        label.textColor = .black
        label.textAlignment = .center
        label.partFontChange(targetString: "카카오", font: .PretendardSemiBold(size: 16))
        return label
    }()
    
    private lazy var loginKakaoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .UmbbaYellow
        button.layer.cornerRadius = 30
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Extensions

private extension LoginView {
    
    func setUI() {
        backgroundColor = .UmbbaWhite
    }
    
    func setHierarchy() {
        loginAppleButton.addSubviews(loginAppleImage, loginAppleTitle)
        loginKakaoButton.addSubviews(loginKakaoImage, loginKakaoTitle)
        addSubviews(loginBackgroundImage, logoImage, logoTitle, logoSubTitle, loginAppleButton, loginKakaoButton)
    }
    
    func setLayout() {
        loginBackgroundImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaInsets)
        }
        
        logoImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(97)
            $0.width.equalTo(67)
            $0.height.equalTo(60)
        }
        
        logoTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoImage.snp.bottom).offset(2)
        }
        
        logoSubTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoTitle.snp.bottom).offset(12)
        }
        
        loginAppleButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(loginKakaoButton.snp.top).offset(-12)
            $0.height.equalTo(60)
        }
        
        loginAppleImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(24)
        }
        
        loginAppleTitle.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        loginKakaoButton.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-12)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        loginKakaoImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(24)
        }
        
        loginKakaoTitle.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
    }
    
    func setAddTarget() {
        loginKakaoButton.addTarget(self, action: #selector(kakaoLogin), for: .touchUpInside)
        loginAppleButton.addTarget(self, action: #selector(appleLogin), for: .touchUpInside)
    }
    
    @objc
    func kakaoLogin() {
        loginDelegate?.kakaoLogin()
    }
    
    @objc
    func appleLogin() {
        loginDelegate?.appleLogin()
    }
}
