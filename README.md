# Weekly Plate — Assignment 2

## CSCI 521 | Data Modeling & Swift Mastery

**Student Name**: Anusha Reddy Kothapeta 
**Z-ID**: Z2081200
**Partner Name (if applicable)**: Ramya Sri Kadiyala
**Partner Z-ID (if applicable)**: Z2039166

---

## Part A: Data Models

| File | Purpose |
|---|---|
| `Models/Meal.swift` | **Primary model** — id, name, category, area, instructions, thumbnailURL, ingredients, isFavorite, youtubeURL + computed properties |
| `Models/Ingredient.swift` | **Secondary model** — ingredient name + measure, used inside Meal. Also contains `MealCategory` |
| `Models/PlannedDay.swift` | **Planner models** — `PlannedDay`, `WeekPlan` (with shopping list generation logic), `ShoppingItem` |
| `Models/AppEnums.swift` | **Enums** — `LoadingState<T>`, `AppearanceMode`, `DayOfWeek`, `MealPlanAction` (with associated values) |
| `Models/SampleData.swift` | **Sample data** — 5 realistic meals, 8 categories, 1 sample WeekPlan with previews |

## Part B: Swift Exercises

`Assignment2-Exercises.playground/Contents.swift` covers:

- **Exercise 1 — Error Handling:** `ValidationError` enum, `validateUsername` with `do-catch` / `try?` / `try!`
- **Exercise 2 — Protocols:** `Displayable` protocol, two conforming types, `printInfo(for:)` function
- **Exercise 3 — Generics:** `findFirst<T>` function, `Stack<Element>` struct
- **Exercise 4 — Type Casting:** `MediaItem` hierarchy, `is` counting, `as?` downcasting

