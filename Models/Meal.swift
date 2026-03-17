// Meal.swift
// WeeklyPlate
//
// Primary data model representing a meal/recipe fetched from TheMealDB API.

/*
**Student Name: Anusha Reddy Kothapeta **
**Z-ID: Z2081200**
**Partner Name (if applicable): Ramya Sri Kadiyala**
**Partner Z-ID (if applicable): Z2039166**
*/

import Foundation

/// Represents a single meal/recipe from TheMealDB.
/// This is the primary data entity for Weekly Plate.
struct Meal: Identifiable {

    // MARK: - Properties

    /// Unique identifier from TheMealDB (e.g., "52772")
    let id: String

    /// Display name of the meal (e.g., "Butter Chicken")
    let name: String

    /// Meal category (e.g., "Chicken", "Beef", "Seafood")
    let category: String

    /// Cuisine area (e.g., "Indian", "Italian") — optional, API may omit it
    let area: String?

    /// Step-by-step cooking instructions — optional, some meals may lack them
    let instructions: String?

    /// URL string for the meal's thumbnail image
    let thumbnailURL: String

    /// Ordered list of ingredients with their measurements
    let ingredients: [Ingredient]

    /// Whether the user has marked this meal as a favorite (stored locally)
    var isFavorite: Bool

    /// YouTube video link for the recipe — optional
    let youtubeURL: String?

    // MARK: - Computed Properties

    /// Returns the ingredient count as a readable string for display.
    var ingredientSummary: String {
        "\(ingredients.count) ingredient\(ingredients.count == 1 ? "" : "s")"
    }

    /// Returns a short display string for area/category tags shown on the detail screen.
    var tags: [String] {
        var result: [String] = [category]
        if let area = area, !area.isEmpty {
            result.append(area)
        }
        return result
    }

    /// Returns instructions split into numbered steps for easier reading.
    /// Falls back to a friendly message if instructions are missing.
    var formattedSteps: [String] {
        guard let instructions = instructions, !instructions.isEmpty else {
            return ["No instructions available for this recipe."]
        }
        // Split on newlines, filter blank lines, trim whitespace
        return instructions
            .components(separatedBy: "\n")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
    }
}
