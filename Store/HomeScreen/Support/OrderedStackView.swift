import UIKit

class OrderedStackView: UIStackView {
    
    // MARK: Properties
    
    private var arrangedSubviewsTags: [Int] { arrangedSubviews.map { $0.tag } }
    var isOnlyUniqueOrders: Bool = true
    
    // MARK: Setup functions
    
    open override func addArrangedSubview(_ view: UIView) {
        guard !arrangedSubviews.contains(view) else { return }
        
        if isOnlyUniqueOrders {
            guard !contains(with: view.tag) else { return }
        }
        
        let tags = (arrangedSubviewsTags + [view.tag]).sorted()
        
        guard let index = tags.firstIndex(of: view.tag) else { return }
        
        insertArrangedSubview(view, at: index)
    }
    
    // MARK: Subviews
    
    private func contains(with tag: Int) -> Bool {
        return arrangedSubviews.contains(where: { $0.tag == tag })
    }
}
