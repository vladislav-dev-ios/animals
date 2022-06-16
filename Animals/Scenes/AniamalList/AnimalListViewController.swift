import Foundation
import UIKit

class AnimalListViewController: UIViewController {
    
    // MARK: - Properties
    private let animalsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(AnimalCollectionViewCell.self,  forCellWithReuseIdentifier: AnimalCollectionViewCell.identifier)
        return cv
    }()
    
    private lazy var customView = AnimalListView()
    
    var presenter: AnimallListPresenterProtocol?
    
    // MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionView()
        setupNavigationItem()
    }
    
}

// MARK: - Priavate Methods
extension AnimalListViewController {
    
    private func setupCollectionView() {
        animalsCollectionView.delegate = self
        animalsCollectionView.dataSource = self
        customView.addSubview(animalsCollectionView)
        NSLayoutConstraint.activate([
            animalsCollectionView.topAnchor.constraint(equalTo: customView.safeTopAnchor),
            animalsCollectionView.leftAnchor.constraint(equalTo: customView.safeLeftAnchor, constant: 7),
            animalsCollectionView.rightAnchor.constraint(equalTo: customView.safeRightAnchor, constant: -7),
            animalsCollectionView.bottomAnchor.constraint(equalTo: customView.safeBottomAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        title = "Animals"
        
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: Common.fontBold, size: 20.0)!, NSAttributedString.Key.foregroundColor: UIColor.black]
        
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func setupNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: Image.refresh_btn.rawValue), style: .plain, target: self, action: #selector(reloadButtonTapped))
    }
    
    @objc private func reloadButtonTapped() {
        presenter?.getAnimals()
    }
    
}

// MARK: - AnimalListView Protocol
extension AnimalListViewController: AnimalListViewProtocol {
    
    func succes() {
        animalsCollectionView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    func presentView(vc: UIViewController) {
        present(vc, animated: true)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
extension AnimalListViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getCountOfAnimals() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnimalCollectionViewCell.identifier, for: indexPath) as! AnimalCollectionViewCell
        
        if let url = presenter?.getImageUrlOfAnimal(index: indexPath.row) {
            cell.configure(url: url)
        }
        
        cell.backgroundColor = .clear
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.frame.width-7.0)/2.0

        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.openAnimalDetailModule(index: indexPath.row)
    }
    
}
