//
//  SettingsView.swift
//  Race2D-Aston
//
//  Created by Dmitry Apenko on 22.02.2024.
//

import UIKit

//MARK: SettingsViewDelegate

protocol SettingsViewDelegate: AnyObject {
    func didTapSaveSettingsButton(inputText: String?)
    func carSettingsLeftButtonTapped()
    func carSettingsRightButtonTapped()
    func gameSpeedSettingsLeftButtonTapped()
    func gameSpeedSettingsRightButtonTapped()
    func obctacleSettingsLeftButtonTapped()
    func obstacleSettingsRightButtonTapped()
    func controlSettingsLeftButtonTapped()
    func controlSettingsRightButtonTapped()
}

final class SettingsView: UIView {
        
    // MARK: Constants
    
    private enum Constants {
        static let textFieldText = "Введите имя"
        static let userImageSize = 110.0
        static let textFieldHeight = 48
        static let leftButtonSystemName = "chevron.left"
        static let rightButtonSystemName = "chevron.right"
        static let saveUserInfoButtonTitle = "Cохранить данные"
        static let saveSettingsButtonTitle = "Cохранить настройки"
    }
    
    // MARK: Internal properties
    
    weak var delegate: SettingsViewDelegate?
    
    var userImage: UIImage? {
        didSet {
            userImageView.image = userImage
        }
    }
    
    var usernameLabelText: String? {
        didSet {
            usernameLabel.text = usernameLabelText
            usernameLabel.isHidden = !(usernameLabel.text.isNotEmpty)
        }
    }
    
    var carSettingsLabelText: String? {
        didSet {
            carSettingsLabel.text = carSettingsLabelText
        }
    }
    
    var gameSpeedSettingsLabelText: String? {
        didSet {
            gameSpeedSettingsLabel.text = gameSpeedSettingsLabelText
        }
    }
    
    var obstacleSettingsLabelText: String? {
        didSet {
            obstacleSettingsLabel.text = obstacleSettingsLabelText
        }
    }
    
    var controlSettingsLabelText: String? {
        didSet {
            controlSettingsLabel.text = controlSettingsLabelText
        }
    }
        
    //MARK: Private properties
    
    private lazy var rootStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = AppConstants.largeSpacing
        return stack
    }()
    
    private lazy var userSettingsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = AppConstants.largeSpacing
        return stack
    }()
    
    private lazy var gameSettingsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = AppConstants.largeSpacing
        return stack
    }()

    private lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = SemiboldFont.h1
        label.textColor = Assets.Colors.dark
        return label
    }()

    private lazy var usernameCustomTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholderText = Constants.textFieldText
        return textField
    }()
    
    private lazy var carSettingsLeftButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    private lazy var carSettingsRightButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    private lazy var carSettingsLabel: UILabel = {
        let label = UILabel()
        label.textColor = Assets.Colors.dark
        label.font = SemiboldFont.h2
        return label
    }()

    private lazy var gameSpeedSettingsLeftButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    private lazy var gameSpeedSettingsRightButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    private lazy var gameSpeedSettingsLabel: UILabel = {
        let label = UILabel()
        label.textColor = Assets.Colors.dark
        label.font = SemiboldFont.h2
        return label
    }()
    
    private lazy var obstacleSettingsLeftButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    private lazy var obstacleSettingsRightButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    private lazy var obstacleSettingsLabel: UILabel = {
        let label = UILabel()
        label.textColor = Assets.Colors.dark
        label.font = SemiboldFont.h2
        return label
    }()
    
    private lazy var controlSettingsLeftButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    private lazy var controlSettingsRightButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()

    private lazy var controlSettingsLabel: UILabel = {
        let label = UILabel()
        label.textColor = Assets.Colors.dark
        label.font = SemiboldFont.h2
        return label
    }()
    
    private lazy var carSettingsStackView = createStackView(
        label: carSettingsLabel,
        leftButton: carSettingsLeftButton,
        leftButtonAction: #selector(carSettingsLeftButtonTapped),
        rightButton: carSettingsRightButton,
        rightButtonAction: #selector(carSettingsRightButtonTapped)
    )
    
    private lazy var gameSpeedSettingsStackView = createStackView(
        label: gameSpeedSettingsLabel,
        leftButton: gameSpeedSettingsLeftButton,
        leftButtonAction: #selector(gameSpeedSettingsLeftButtonTapped),
        rightButton: gameSpeedSettingsRightButton,
        rightButtonAction: #selector(gameSpeedSettingsRightButtonTapped)
    )
    
    private lazy var obstacleSettingsStackView = createStackView(
        label: obstacleSettingsLabel,
        leftButton: obstacleSettingsLeftButton,
        leftButtonAction: #selector(obctacleSettingsLeftButtonTapped),
        rightButton: obstacleSettingsRightButton,
        rightButtonAction: #selector(obstacleSettingsRightButtonTapped)
    )
    
    private lazy var controlSettingsStackView = createStackView(
        label: controlSettingsLabel,
        leftButton: controlSettingsLeftButton,
        leftButtonAction: #selector(controlSettingsLeftButtonTapped),
        rightButton: controlSettingsRightButton,
        rightButtonAction: #selector(controlSettingsRightButtonTapped)
    )
    
    private lazy var saveSettingsCustomButton: CustomButton = {
        let button = CustomButton()
        button.title = Constants.saveSettingsButtonTitle
        button.addTarget(
            self,
            action: #selector(didTapSaveSettingsButton),
            for: .touchUpInside
        )
        return button
    }()

    private lazy var buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()

    
    //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: Private extension

private extension SettingsView {
    
    func setupUI() {
        backgroundColor = Assets.Colors.background
        
        configureLayout()
    }
    
    func configureLayout() {
        addSubview(rootStackView)
        rootStackView.addArrangedSubview(userSettingsStackView)
        rootStackView.addArrangedSubview(gameSettingsStackView)
        rootStackView.addArrangedSubview(buttonStackView)
        
        userSettingsStackView.addArrangedSubview(userImageView)
        userSettingsStackView.addArrangedSubview(usernameLabel)
        userSettingsStackView.addArrangedSubview(usernameCustomTextField)
        
        gameSettingsStackView.addArrangedSubview(carSettingsStackView)
        gameSettingsStackView.addArrangedSubview(gameSpeedSettingsStackView)
        gameSettingsStackView.addArrangedSubview(obstacleSettingsStackView)
        gameSettingsStackView.addArrangedSubview(controlSettingsStackView)
        
        buttonStackView.addArrangedSubview(saveSettingsCustomButton)
        
        userImageView.snp.makeConstraints {
            $0.size.equalTo(Constants.userImageSize)
        }
        
        usernameCustomTextField.snp.makeConstraints {
            $0.height.equalTo(Constants.textFieldHeight)
        }
        
        rootStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(AppConstants.normalSpacing)
        }
    }
    
    func createStackView(
        label: UILabel,
        leftButton: UIButton,
        leftButtonAction: Selector,
        rightButton: UIButton,
        rightButtonAction: Selector
    ) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .center
    
        let leftView = UIView()
        leftView.backgroundColor = Assets.Colors.background
        stackView.addArrangedSubview(leftView)

        leftButton.setImage(UIImage(systemName: Constants.leftButtonSystemName), for: .normal)
        leftButton.tintColor = Assets.Colors.red
        leftButton.addTarget(
            self,
            action: leftButtonAction,
            for: .touchUpInside
        )
        leftButton.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        stackView.addArrangedSubview(leftButton)
        
        label.font = SemiboldFont.h2
        label.textAlignment = .center
        stackView.addArrangedSubview(label)
        
        rightButton.setImage(UIImage(systemName: Constants.rightButtonSystemName), for: .normal)
        rightButton.tintColor = Assets.Colors.red
        rightButton.addTarget(
            self,
            action: rightButtonAction,
            for: .touchUpInside
        )
        rightButton.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        stackView.addArrangedSubview(rightButton)
        
        let rightView = UIView()
        rightView.backgroundColor = Assets.Colors.background
        stackView.addArrangedSubview(rightView)

        return stackView
    }
}

//MARK: Action

@objc
private extension SettingsView {

    func didTapSaveSettingsButton() {
        delegate?.didTapSaveSettingsButton(inputText: usernameCustomTextField.text)
        usernameCustomTextField.text = nil
        usernameCustomTextField.resignFirstResponder()
    }
    
    func carSettingsLeftButtonTapped() {
        delegate?.carSettingsLeftButtonTapped()
    }
    
    func carSettingsRightButtonTapped() {
        delegate?.carSettingsRightButtonTapped()
    }
    
    func gameSpeedSettingsLeftButtonTapped() {
        delegate?.gameSpeedSettingsLeftButtonTapped()
    }
    
    func gameSpeedSettingsRightButtonTapped() {
        delegate?.gameSpeedSettingsRightButtonTapped()
    }
    
    func obctacleSettingsLeftButtonTapped() {
        delegate?.obctacleSettingsLeftButtonTapped()
    }
    
    func obstacleSettingsRightButtonTapped() {
        delegate?.obstacleSettingsRightButtonTapped()
    }
    
    func controlSettingsLeftButtonTapped() {
        delegate?.controlSettingsLeftButtonTapped()
    }
    
    func controlSettingsRightButtonTapped() {
        delegate?.controlSettingsRightButtonTapped()
    }
}
