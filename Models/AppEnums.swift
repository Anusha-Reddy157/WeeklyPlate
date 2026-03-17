// AppEnums.swift
// WeeklyPlate
// Enums representing states and options used throughout the app.
/*
**Student Name: Anusha Reddy Kothapeta **
**Z-ID: Z2081200**
**Partner Name (if applicable): Ramya Sri Kadiyala**
**Partner Z-ID (if applicable): Z2039166**
*/
import Foundation

// MARK: - LoadingState

/// Tracks the loading lifecycle of an async data fetch.
/// Used in ViewModels to drive UI state (spinner, content, error banner).
enum LoadingState<T> {
    /// No fetch has been initiated yet
    case idle

    /// A network request is in flight
    case loading

    /// Data successfully fetched and decoded
    case loaded(T)

    /// Fetch failed — carries a user-friendly error message
    case error(String)

    /// Convenience: true when data is available
    var isLoaded: Bool {
        if case .loaded = self { return true }
        return false
    }

    /// Convenience: extract the data if in loaded state
    var value: T? {
        if case .loaded(let data) = self { return data }
        return nil
    }
}

// MARK: - AppearanceMode

/// Controls the color scheme preference set by the user in Settings.
/// Mirrors the three-way toggle shown in Screen 6 wireframe.
enum AppearanceMode: String, CaseIterable, Identifiable {
    case light  = "Light"
    case dark   = "Dark"
    case system = "System"

    var id: String { rawValue }
}

// MARK: - DayOfWeek

/// The seven days of the week used to label planner rows.
enum DayOfWeek: Int, CaseIterable, Identifiable {
    case monday    = 0
    case tuesday   = 1
    case wednesday = 2
    case thursday  = 3
    case friday    = 4
    case saturday  = 5
    case sunday    = 6

    var id: Int { rawValue }

    /// Short display label (e.g., "MON")
    var shortLabel: String {
        switch self {
        case .monday:    return "MON"
        case .tuesday:   return "TUE"
        case .wednesday: return "WED"
        case .thursday:  return "THU"
        case .friday:    return "FRI"
        case .saturday:  return "SAT"
        case .sunday:    return "SUN"
        }
    }

    /// Full name for accessibility labels
    var fullName: String {
        switch self {
        case .monday:    return "Monday"
        case .tuesday:   return "Tuesday"
        case .wednesday: return "Wednesday"
        case .thursday:  return "Thursday"
        case .friday:    return "Friday"
        case .saturday:  return "Saturday"
        case .sunday:    return "Sunday"
        }
    }
}

// MARK: - MealPlanAction

/// Actions a user can take on the planner, used for confirmation dialogs
enum MealPlanAction {
    /// User wants to add a meal to a specific day
    case addMeal(dayOfWeek: DayOfWeek)

    /// User wants to remove the meal from a specific day
    case removeMeal(dayOfWeek: DayOfWeek)

    /// User wants to replace an existing meal on a day
    case replaceMeal(dayOfWeek: DayOfWeek, existingMealName: String)

    /// User wants to clear all meals for the entire week
    case clearWeek

    /// A human-readable description shown in confirmation alerts
    var confirmationMessage: String {
        switch self {
        case .addMeal(let day):
            return "Add a meal for \(day.fullName)?"
        case .removeMeal(let day):
            return "Remove the meal from \(day.fullName)?"
        case .replaceMeal(let day, let existingName):
            return "Replace \"\(existingName)\" on \(day.fullName)?"
        case .clearWeek:
            return "Clear all meals for this week? This cannot be undone."
        }
    }
}
