// SampleData.swift
// WeeklyPlate
//
// Static sample data used for SwiftUI Previews and development testing.
// Mirrors real TheMealDB API responses so previews look realistic.

/*
**Student Name: Anusha Reddy Kothapeta **
**Z-ID: Z2081200**
**Partner Name (if applicable): Ramya Sri Kadiyala**
**Partner Z-ID (if applicable): Z2039166**
*/

import Foundation

extension Meal {

    /// Five realistic sample meals for use in previews and testing.
    static let sampleData: [Meal] = [
        Meal(
            id: "52772",
            name: "Butter Chicken",
            category: "Chicken",
            area: "Indian",
            instructions: """
            Mix yogurt, lemon juice, turmeric, garam masala, cumin, and chili powder. \
            Coat chicken and marinate for 2 hours. Grill or bake the chicken until cooked. \
            Sauté onions, garlic, and ginger in butter. Add tomatoes and cook until soft. \
            Blend the sauce until smooth. Return to heat, add cream and the cooked chicken. \
            Simmer for 10 minutes. Garnish with cilantro and serve with rice or naan.
            """,
            thumbnailURL: "https://www.themealdb.com/images/media/meals/wyxwsp1486979827.jpg",
            ingredients: [
                Ingredient(name: "Chicken", measure: "1kg"),
                Ingredient(name: "Butter", measure: "3 tbsp"),
                Ingredient(name: "Tomatoes", measure: "400g"),
                Ingredient(name: "Heavy Cream", measure: "200ml"),
                Ingredient(name: "Garlic", measure: "4 cloves"),
                Ingredient(name: "Garam Masala", measure: "2 tsp"),
                Ingredient(name: "Ginger", measure: "1 inch piece")
            ],
            isFavorite: true,
            youtubeURL: "https://www.youtube.com/watch?v=a03U45jFxOI"
        ),
        Meal(
            id: "52767",
            name: "Pasta Bolognese",
            category: "Beef",
            area: "Italian",
            instructions: """
            Brown ground beef in a large pan over medium-high heat. Add onion, garlic, and \
            carrots, cook for 5 minutes. Stir in tomato paste and crushed tomatoes. \
            Add red wine and simmer for 30 minutes. Season with salt, pepper, and Italian herbs. \
            Cook spaghetti according to package instructions. Serve sauce over pasta, \
            topped with Parmesan.
            """,
            thumbnailURL: "https://www.themealdb.com/images/media/meals/sutysw1468247559.jpg",
            ingredients: [
                Ingredient(name: "Ground Beef", measure: "500g"),
                Ingredient(name: "Spaghetti", measure: "400g"),
                Ingredient(name: "Tomato Sauce", measure: "400ml"),
                Ingredient(name: "Onion", measure: "1 large"),
                Ingredient(name: "Garlic", measure: "3 cloves"),
                Ingredient(name: "Parmesan", measure: "50g"),
                Ingredient(name: "Olive Oil", measure: "2 tbsp"),
                Ingredient(name: "Red Wine", measure: "125ml")
            ],
            isFavorite: false,
            youtubeURL: "https://www.youtube.com/watch?v=_T5jJoNBEFo"
        ),
        Meal(
            id: "52819",
            name: "Caesar Salad",
            category: "Vegetarian",
            area: "American",
            instructions: """
            Make the dressing by whisking together garlic, lemon juice, Dijon mustard, \
            Worcestershire sauce, and mayonnaise. Stir in Parmesan. Toss romaine lettuce \
            with dressing and croutons. Top with more Parmesan and black pepper.
            """,
            thumbnailURL: "https://www.themealdb.com/images/media/meals/bc8v651619789840.jpg",
            ingredients: [
                Ingredient(name: "Romaine Lettuce", measure: "1 head"),
                Ingredient(name: "Parmesan", measure: "75g"),
                Ingredient(name: "Croutons", measure: "1 cup"),
                Ingredient(name: "Mayonnaise", measure: "3 tbsp"),
                Ingredient(name: "Lemon Juice", measure: "2 tbsp"),
                Ingredient(name: "Garlic", measure: "2 cloves")
            ],
            isFavorite: false,
            youtubeURL: nil
        ),
        Meal(
            id: "53049",
            name: "Salmon with Asparagus",
            category: "Seafood",
            area: "British",
            instructions: """
            Preheat oven to 200°C. Place salmon fillets on a baking sheet. \
            Drizzle with olive oil, season with salt, pepper, and lemon zest. \
            Arrange asparagus around the salmon. Bake for 15 minutes. \
            Finish with a squeeze of fresh lemon juice.
            """,
            thumbnailURL: "https://www.themealdb.com/images/media/meals/1548772327.jpg",
            ingredients: [
                Ingredient(name: "Salmon Fillet", measure: "2 pieces"),
                Ingredient(name: "Asparagus", measure: "200g"),
                Ingredient(name: "Olive Oil", measure: "2 tbsp"),
                Ingredient(name: "Lemon", measure: "1 whole"),
                Ingredient(name: "Garlic", measure: "1 clove"),
                Ingredient(name: "Black Pepper", measure: "to taste")
            ],
            isFavorite: true,
            youtubeURL: nil
        ),
        Meal(
            id: "52987",
            name: "Chicken Tikka Masala",
            category: "Chicken",
            area: "Indian",
            instructions: """
            Marinate chicken in yogurt and spices for at least 1 hour. Grill until charred. \
            Sauté onions until golden. Add garlic, ginger, and spices. Stir in tomato puree \
            and simmer. Add cream and grilled chicken. Cook for 10 more minutes. \
            Serve with basmati rice and naan.
            """,
            thumbnailURL: "https://www.themealdb.com/images/media/meals/wyxwsp1486979827.jpg",
            ingredients: [
                Ingredient(name: "Chicken Breast", measure: "700g"),
                Ingredient(name: "Yogurt", measure: "150ml"),
                Ingredient(name: "Tomato Puree", measure: "400g"),
                Ingredient(name: "Heavy Cream", measure: "150ml"),
                Ingredient(name: "Onion", measure: "2 large"),
                Ingredient(name: "Garam Masala", measure: "2 tsp"),
                Ingredient(name: "Turmeric", measure: "1 tsp"),
                Ingredient(name: "Ginger", measure: "1 inch piece")
            ],
            isFavorite: false,
            youtubeURL: "https://www.youtube.com/watch?v=ZcKDMxBqm6I"
        )
    ]

    /// A single sample meal — handy for single-item previews (e.g., DetailView)
    static let sample: Meal = sampleData[0]

    /// Only the favorite meals from sampleData — for FavoritesView preview
    static let sampleFavorites: [Meal] = sampleData.filter { $0.isFavorite }
}

// MARK: - Sample Categories

extension MealCategory {

    static let sampleData: [MealCategory] = [
        MealCategory(id: "1",  name: "Chicken",    thumbnailURL: "https://www.themealdb.com/images/category/chicken.png",    description: "Chicken dishes from around the world"),
        MealCategory(id: "2",  name: "Beef",       thumbnailURL: "https://www.themealdb.com/images/category/beef.png",       description: "Hearty beef recipes"),
        MealCategory(id: "3",  name: "Seafood",    thumbnailURL: "https://www.themealdb.com/images/category/seafood.png",    description: "Fresh seafood recipes"),
        MealCategory(id: "4",  name: "Vegetarian", thumbnailURL: "https://www.themealdb.com/images/category/vegetarian.png", description: "Plant-based and meat-free dishes"),
        MealCategory(id: "5",  name: "Pasta",      thumbnailURL: "https://www.themealdb.com/images/category/pasta.png",      description: "Pasta and noodle dishes"),
        MealCategory(id: "6",  name: "Dessert",    thumbnailURL: "https://www.themealdb.com/images/category/dessert.png",    description: nil),
        MealCategory(id: "7",  name: "Lamb",       thumbnailURL: "https://www.themealdb.com/images/category/lamb.png",       description: nil),
        MealCategory(id: "8",  name: "Pork",       thumbnailURL: "https://www.themealdb.com/images/category/pork.png",       description: nil)
    ]
}

// MARK: - Sample WeekPlan

extension WeekPlan {

    /// A sample week plan for previewing the Planner screen.
    static let sample: WeekPlan = {
        // Build dates for Feb 17–23 (Mon–Sun) relative to a fixed reference
        var calendar = Calendar.current
        calendar.firstWeekday = 2 // Monday

        // Use fixed components so preview is always consistent
        var components = DateComponents()
        components.year = 2025
        components.month = 2
        components.day = 17  // Monday Feb 17

        let monday = calendar.date(from: components)!
        let meals: [Meal?] = [
            Meal.sampleData[0], // MON – Butter Chicken
            Meal.sampleData[2], // TUE – Caesar Salad
            nil,                // WED – empty
            nil,                // THU – empty
            Meal.sampleData[1], // FRI – Pasta Bolognese
            nil,                // SAT – empty
            nil                 // SUN – empty
        ]

        let days: [PlannedDay] = (0..<7).map { offset in
            let date = calendar.date(byAdding: .day, value: offset, to: monday)!
            return PlannedDay(date: date, meal: meals[offset])
        }

        return WeekPlan(weekStart: monday, days: days)
    }()
}
