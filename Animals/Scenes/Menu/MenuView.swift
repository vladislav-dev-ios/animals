import UIKit
import Lottie

class MenuView: UIView {
    
    // MARK: - Callbacks
    var callbackForStartButton: (() -> Void)?
    
    // MARK: - Properties
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Image.start_btn.rawValue), for: .normal)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var animationView: AnimationView = {
        let view = AnimationView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.animation = Animation.named("menu")
        view.loopMode = .loop
        return view
    }()
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = bounds
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.layer.zPosition = -1
        imageView.image = UIImage(named: Image.background.rawValue)
        return imageView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addStartButton()
        addAnimationView()
        addBackgroundImageview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func addStartButton() {
        addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: safeBottomAnchor, constant: -80)
        ])
    }
    
    private func addAnimationView() {
        addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            animationView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    private func addBackgroundImageview() {
        addSubview(backgroundImageView)
    }
}

// MARK: - MenuView private methods
extension MenuView {
    
    @objc private func startButtonTapped() {
        callbackForStartButton?()
    }
    
}

// MARK: - MenuView public methods

extension MenuView {
    public func startAnimation() {
        animationView.play(completion: nil)
    }
    
    public func stopAnimation() {
        animationView.stop()
    }
}
