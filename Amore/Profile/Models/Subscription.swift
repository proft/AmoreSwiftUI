import Foundation

struct Subscription: Identifiable {
    let id = UUID()
    
    var month: Int
    var monthlyCost: Double
    var totalCost: Double
    var savePercent: Int?
    var tagLine: TagLine = .none

    var costMonth: String {
        return "$\(String(format: "%.2f", monthlyCost)) / mo"
    }

    var costTotal: String {
        return "$\(String(format: "%.2f", totalCost))"
    }
    
    enum TagLine: String {
        case mostPopular = "Most Popular"
        case bestValue = "Best Value"
        case none
    }
}

extension Subscription {
    static let example1 = Subscription(month: 6, monthlyCost: 12, totalCost: 59, savePercent: 25, tagLine: .bestValue)
    
    static let example2 = Subscription(month: 3, monthlyCost: 19, totalCost: 49, savePercent: 15, tagLine: .mostPopular)
    
    static let example3 = Subscription(month: 1, monthlyCost: 15, totalCost: 29)
}
