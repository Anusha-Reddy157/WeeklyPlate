// PlannedDay.swift
// WeeklyPlate
//
// Models for the weekly planner feature.
// PlannedDay represents one day's meal assignment.
// WeekPlan represents the full 7-day plan for a given week.

/*
**Student Name: Anusha Reddy Kothapeta **
**Z-ID: Z2081200**
**Partner Name (if applicable): Ramya Sri Kadiyala**
**Partner Z-ID (if applicable): Z2039166**
*/

import Foundation

/// Represents a single day in the weekly meal planner.
struct PlannedDay: Identifiable {

    /// Auto-generated stable ID
    let id: UUID

    /// The calendar day this entry represents (e.g., Monday Feb 17)
    let date: Date

    /// The meal assigned to this day — nil means no meal planned yet
    var meal: Meal?

    /// Abbreviated weekday label for display (e.g., "MON", "TUE")
    var weekdayLabel: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: date).uppercased()
    }

    /// Short date label for display (e.g., "Feb 17")
    var shortDateLabel: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter.string(from: date)
    }

    /// True if a meal has been assigned to this day
    var hasMeal: Bool { meal != nil }

    init(date: Date, meal: Meal? = nil) {
        self.id = UUID()
        self.date = date
        self.meal = meal
    }
}

/// Represents the full 7-day plan for a specific week.
struct WeekPlan: Identifiable {

    let id: UUID

    /// The Monday that starts this week
    let weekStart: Date

    /// Seven days, Monday through Sunday
    var days: [PlannedDay]

    /// Display range string shown at the top of the Planner (e.g., "Feb 17 – Feb 23")
    var weekRangeLabel: String {
        guard let lastDay = days.last else { return "" }
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return "\(formatter.string(from: weekStart)) – \(formatter.string(from: lastDay.date))"
    }

    /// Collects all ingredients from every planned meal for shopping list generation.
    /// Merges duplicate ingredient names (case-insensitive) by concatenating measures.
    var shoppingListIngredients: [ShoppingItem] {
        var merged: [String: ShoppingItem] = [:]

        for day in days {
            guard let meal = day.meal else { continue }
            for ingredient in meal.ingredients {
                let key = ingredient.name.lowercased()
                if merged[key] == nil {
                    merged[key] = ShoppingItem(
                        ingredientName: ingredient.name,
                        measures: ingredient.measure.map { [$0] } ?? []
                    )
                } else {
                    if let measure = ingredient.measure {
                        merged[key]?.measures.append(measure)
                    }
                }
            }
        }
        return Array(merged.values).sorted { $0.ingredientName < $1.ingredientName }
    }

    /// Returns true if at least one day has a meal planned
    var hasMeals: Bool { days.contains { $0.hasMeal } }

    init(weekStart: Date, days: [PlannedDay]) {
        self.id = UUID()
        self.weekStart = weekStart
        self.days = days
    }
}

/// A merged shopping list entry combining an ingredient across multiple meals.
struct ShoppingItem: Identifiable {

    let id: UUID

    /// Ingredient name (e.g., "Garlic")
    let ingredientName: String

    /// All measure strings collected from planned meals (e.g., ["3 cloves", "2 cloves"])
    var measures: [String]

    /// Combined measure text for display (e.g., "3 cloves, 2 cloves")
    var combinedMeasure: String {
        measures.filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty }.joined(separator: " + ")
    }

    /// Whether the user has checked this item off in the shopping list
    var isPurchased: Bool = false

    init(ingredientName: String, measures: [String]) {
        self.id = UUID()
        self.ingredientName = ingredientName
        self.measures = measures
    }
}
