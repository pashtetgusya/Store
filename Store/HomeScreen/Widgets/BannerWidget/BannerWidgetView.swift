import UIKit

final class BannerWidgetView: UIView {
    
    // MARK: Properties
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: 1000)
    }
    
    // MARK: Initialization
    
    init() {
        super.init(frame: .zero)
        setupAppearance()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { nil }
    
    // MARK: Setup functions
    
    func setupAppearance() {
        backgroundColor = .lightGray
    }
}
