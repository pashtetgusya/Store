import Foundation
import Combine

final class ProductOfDayWidgetViewModel {
    
    // MARK: Properties
    
    @Published var rows: [String] = []
    
    // MARK: Initialization
    
    init() { }
    
    // MARK: Load functions
    
    func loadWidgetData() {
        rows = Array(repeating: "", count: 10)
    }
}
