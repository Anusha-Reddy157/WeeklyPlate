// Ingredient.swift
// WeeklyPlate
//
// Secondary model representing a single ingredient + its measurement.
// Used as a nested type inside Meal.

/*
**Student Name: Anusha Reddy Kothapeta **
**Z-ID: Z2081200**
**Partner Name (if applicable): Ramya Sri Kadiyala**
**Partner Z-ID (if applicable): Z2039166**
*/

import Foundation

/// A single ingredient paired with its measurement (e.g., "Chicken" + "200g").
struct Ingredient: Identifiable {

    /// Stable ID for use in SwiftUI ForEach
    let id: UUID

    /// Ingredient name (e.g., "Garlic", "Olive Oil")
    let name: String

    /// Measurement string from the API (e.g., "3 cloves", "2 tbsp")
    /// Optional because TheMealDB sometimes returns blank measure fields.
    let measure: String?

    /// A combined display string for shopping list and detail view.
    var displayText: String {
        if let measure = measure, !measure.trimmingCharacters(in: .whitespaces).isEmpty {
            return "\(measure.trimmingCharacters(in: .whitespaces)) \(name)"
        }
        return name
    }

    /// Convenience initializer that auto-generates an ID.
    init(name: String, measure: String?) {
        self.id = UUID()
        self.name = name
        self.measure = measure
    }
}

// MARK: -

// MealCategory.swift
// WeeklyPlate
//
// Secondary model representing a recipe category from TheMealDB.
// Used on the Browse screen to display category chips/buttons.

/// A meal category returned by TheMealDB (e.g., Chicken, Beef, Seafood).
struct MealCategory: Identifiable {

    /// Unique identifier from the API (e.g., "1")
    let id: String

    /// Category name displayed on screen (e.g., "Chicken")
    let name: String

    /// URL string for the category's thumbnail image
    let thumbnailURL: String

    /// A short description of the category — optional, API may omit it
    let description: String?
}
