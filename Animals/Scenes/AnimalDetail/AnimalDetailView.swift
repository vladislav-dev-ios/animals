import UIKit

class AnimalDetailView: UIView {
    
    // MARK: -  Properties
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Common.fontBlack, size: 21)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var latinNameTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Common.fontBold, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Latin name:"
        return label
    }()

    private lazy var latinNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Common.fontRegular, size: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var habitatTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Common.fontBold, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Habitat:"
        return label
    }()

    private lazy var habitatLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Common.fontRegular, size: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var geoTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Common.fontBold, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Geographical position:"
        return label
    }()

    private lazy var geoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Common.fontRegular, size: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dietTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Common.fontBold, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Diet:"
        return label
    }()

    private lazy var dietLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Common.fontRegular, size: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lifespanTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Common.fontBold, size: 20)
        label.text = "Lifespan:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var lifespanLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Common.fontRegular, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    // MARK: -  Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.9802961946, green: 0.9804602265, blue: 1, alpha: 1)
        
        addImageView()
        addNameLabel()
        addLatinNameLabels()
        addHabitatLabels()
        addGeoLabels()
        addDietLabels()
        addLifespanLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: -  Private Methods
    private func addNameLabel() {
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            nameLabel.leftAnchor.constraint(equalTo: imageView.leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -5)
        ])
    }
    
    private func addLatinNameLabels() {
        addSubview(latinNameTitleLabel)
        addSubview(latinNameLabel)
        NSLayoutConstraint.activate([
            latinNameTitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            latinNameTitleLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            
            latinNameLabel.topAnchor.constraint(equalTo: latinNameTitleLabel.bottomAnchor, constant: 0),
            latinNameLabel.leftAnchor.constraint(equalTo: latinNameTitleLabel.leftAnchor),
            latinNameLabel.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -5)
        ])
    }
    
    private func addHabitatLabels() {
        addSubview(habitatTitleLabel)
        addSubview(habitatLabel)
        NSLayoutConstraint.activate([
            habitatTitleLabel.topAnchor.constraint(equalTo: latinNameLabel.bottomAnchor, constant: 15),
            habitatTitleLabel.leftAnchor.constraint(equalTo: latinNameLabel.leftAnchor),
            
            habitatLabel.topAnchor.constraint(equalTo: habitatTitleLabel.bottomAnchor),
            habitatLabel.leftAnchor.constraint(equalTo: habitatTitleLabel.leftAnchor),
            habitatLabel.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -5)
        ])
    }
    
    private func addGeoLabels() {
        addSubview(geoTitleLabel)
        addSubview(geoLabel)
        NSLayoutConstraint.activate([
            geoTitleLabel.topAnchor.constraint(equalTo: habitatLabel.bottomAnchor, constant: 15),
            geoTitleLabel.leftAnchor.constraint(equalTo: habitatLabel.leftAnchor),
            
            geoLabel.topAnchor.constraint(equalTo: geoTitleLabel.bottomAnchor),
            geoLabel.leftAnchor.constraint(equalTo: geoTitleLabel.leftAnchor),
            geoLabel.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -5)
        ])
    }
    
    private func addDietLabels() {
        addSubview(dietTitleLabel)
        addSubview(dietLabel)
        NSLayoutConstraint.activate([
            dietTitleLabel.topAnchor.constraint(equalTo: geoLabel.bottomAnchor, constant: 15),
            dietTitleLabel.leftAnchor.constraint(equalTo: geoLabel.leftAnchor),
            
            dietLabel.topAnchor.constraint(equalTo: dietTitleLabel.bottomAnchor),
            dietLabel.leftAnchor.constraint(equalTo: dietTitleLabel.leftAnchor),
            dietLabel.rightAnchor.constraint(equalTo: safeRightAnchor, constant: -5)
        ])
    }
    
    private func addLifespanLabels() {
        addSubview(lifespanTitleLabel)
        addSubview(lifespanLabel)
        NSLayoutConstraint.activate([
            lifespanTitleLabel.topAnchor.constraint(equalTo: dietLabel.bottomAnchor, constant: 15),
            lifespanTitleLabel.leftAnchor.constraint(equalTo: dietLabel.leftAnchor),
            
            lifespanLabel.topAnchor.constraint(equalTo: lifespanTitleLabel.bottomAnchor),
            lifespanLabel.leftAnchor.constraint(equalTo: lifespanTitleLabel.leftAnchor)
        ])
    }
    
    private func addImageView() {
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeTopAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 3/4),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
    }
    
}

// MARK: -  Public Methods
extension AnimalDetailView {
    func configure(nameText: String, latinNameText: String, habitatText: String, geoText: String, lifespan: String, dietText: String) {
        nameLabel.text = nameText
        latinNameLabel.text = latinNameText
        habitatLabel.text = habitatText
        geoLabel.text = geoText
        dietLabel.text = dietText
        lifespanLabel.text = lifespan
       

    }
    
    func setImage(image: UIImage?) {
        guard let image = image else {
            return
        }
        imageView.image = image
    }
}
