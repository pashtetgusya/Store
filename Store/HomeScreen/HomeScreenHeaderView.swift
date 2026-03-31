import UIKit

final class HomeScreenHeaderView: UIView {
    
    // MARK: Subviews
    
    let titlelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "Здравствуйте, Павел!"
        label.textColor = .white
        
        return label
    }()
    let favoritesItem: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.25)
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 0.25
        
        return view
    }()
    let comparisonItem: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.25)
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 0.25
        
        return view
    }()
    let mapView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.25)
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 0.25
        
        return view
    }()
    let itemsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    // MARK: Initilalization
    
    init() {
        super.init(frame: .zero)
        addSubview(titlelabel)
        addSubview(itemsStackView)
        itemsStackView.addArrangedSubview(favoritesItem)
        itemsStackView.addArrangedSubview(comparisonItem)
        itemsStackView.addArrangedSubview(mapView)
        
        NSLayoutConstraint.activate([
            titlelabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            titlelabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titlelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            
            itemsStackView.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 20),
            itemsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            itemsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            itemsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { nil }
}
