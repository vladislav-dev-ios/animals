import UIKit
import Lottie

class IntroView: UIView {
    
    // MARK: - Properties
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: Common.fontBlack, size: 30)
        label.numberOfLines = 0
        label.text = "Developed by:\nVladislav Kuzmichev"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var animationView: AnimationView = {
        let view = AnimationView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.animation = Animation.named("intro")
        view.loopMode = .playOnce
        return view
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.6089829803, green: 0.3453348875, blue: 0.7144572139, alpha: 1)
        
        addAnimationView()
        addLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func addAnimationView() {
        addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func addLabel() {
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: safeTopAnchor, constant: 40),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
}

// MARK: - IntroView public methods

extension IntroView {
    public func startAnimation(completion : @escaping () -> Void) {
        animationView.play { finished in
            completion()
        }
    }
    
    public func stopAnimation() {
        animationView.stop()
    }
}
