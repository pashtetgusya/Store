import UIKit

final class BannerWidgetViewController: UIViewController {
    
    // MARK: Properties
    
    private let contentView: BannerWidgetView
    
    // MARK: Initialization
    
    init() {
        self.contentView = BannerWidgetView()
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { nil }
    
    // MARK: Life cycle
    
    override func loadView() {
        view = contentView
    }
}
