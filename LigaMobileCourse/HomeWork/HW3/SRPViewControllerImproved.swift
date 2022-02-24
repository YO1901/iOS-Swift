//
//  SRPViewControllerImproved.swift
//
//
//  Created by Yerlan Omarov on 24.02.2022.
//

import Foundation
import UIKit

class SRPViewController: UIViewController {
    let calculator: NutrientCalculator
    
    // some logic
}


protocol DailyNutrients {
    func calculateDailtyNutrients(proportionType: ProportionType,
                                  caloriesCalculatorType: CaloriesCalculationType) -> Nutrients
}

struct NutrientCalculator: DailyNutrients {
    func calculateDailtyNutrients(proportionType: ProportionType,
                                  caloriesCalculatorType: CaloriesCalculationType) -> Nutrients {
        let targetCalories = calculateTargetCalories(caloriesCalculatorType: caloriesCalculatorType)
        
        return calculateTargetNutrients(proportionType: proportionType, targetCalories: targetCalories)
    }
    
    private func calculateTargetCalories(caloriesCalculatorType: CaloriesCalculationType) -> Int {
        var targetCalories: Int
        switch caloriesCalculatorType {
        case .mifflin:
            targetCalories = 1200
        case .harrisBenedict:
            targetCalories = 1400
        }
        return targetCalories
    }
    
    private func calculateTargetNutrients(proportionType: ProportionType, targetCalories: Int) -> Nutrients {
        var nutrient: Nutrients
        let caloriesCoefficient = targetCalories / 1000
        switch proportionType {
        case .paleo:
            nutrient = caloriesCoefficient * Nutrients(carbs: 4, fats: 10, proteins: 8)
        case .keto:
            nutrient = caloriesCoefficient * Nutrients(carbs: 6, fats: 1, proteins: 20)
        }
    
        return nutrient
    }
}

struct Nutrients {
    var carbs = 0
    var fats = 0
    var proteins = 0
    
    static func * (_ coefficient: Int, _ nutrient: Nutrients) -> Nutrients {
        Nutrients(carbs: coefficient * nutrient.carbs,
                 fats: coefficient * nutrient.fats,
                 proteins: coefficient * nutrient.proteins)
    }
}

enum ProportionType: String {
    case paleo
    case keto
}

enum CaloriesCalculationType: String {
    case mifflin
    case harrisBenedict
}
