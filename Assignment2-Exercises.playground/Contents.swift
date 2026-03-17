/*:
 # CSCI 321/521 Assignment 2
 ## Part B: Swift Mastery Exercises
 
 Complete each exercise below. Your code should compile and run without errors.
 
 **Student Name: Anusha Reddy Kothapeta **
 **Z-ID: Z2081200**
 **Partner Name (if applicable): Ramya Sri Kadiyala**
 **Partner Z-ID (if applicable): Z2039166**
 
 ---
 */

import Foundation

/*:
 ## Exercise 1: Error Handling (15 points)
 
 ### 1a) ValidationError Enum
 Create an enum `ValidationError` that conforms to `Error` with the following cases:
 - `emptyField(fieldName: String)`
 - `invalidFormat(fieldName: String)`
 - `valueTooLong(fieldName: String, maxLength: Int)`
 */

// Your code for 1a here:
enum ValidationError: Error {
    
    case emptyField(fieldName: String)
    
    case invalidFormat(fieldName: String)
    
    case valueTooLong(fieldName: String, maxLength: Int)
    
}



/*:
 ### 1b) Validate Username Function
 Write a function `validateUsername(_ username: String?) throws -> String` that:
 - Throws `emptyField` if username is nil or empty
 - Throws `invalidFormat` if username contains non-alphanumeric characters
 - Throws `valueTooLong` if username length > 20
 - Returns the valid username if all checks pass
 
 **Hint:** You can use `CharacterSet.alphanumerics` to check for valid characters.
 */

// Your code for 1b here:
func validateUsername(_ username: String?) throws -> String {
    
    // Check if username is nil or empty
    guard let username = username, !username.isEmpty else {
        throw ValidationError.emptyField(fieldName: "Username")
    }
    
    // Check if username contains only alphanumeric characters
    let allowedCharacters = CharacterSet.alphanumerics
    if username.rangeOfCharacter(from: allowedCharacters.inverted) != nil {
        throw ValidationError.invalidFormat(fieldName: "Username")
    }
    
    // Check if username length is greater than 20
    if username.count > 20 {
        throw ValidationError.valueTooLong(fieldName: "Username", maxLength: 20)
    }
    
    // If all validations pass
    return username
}



/*:
 ### 1c) Calling the Validation Function
 Demonstrate calling your validation function with:
 1. `do-catch` - handle different error cases
 2. `try?` - convert to optional
 3. `try!` - force try (use a value you KNOW is safe)
 */

// Your code for 1c here:

// Using do-catch:
do {
    let username = try validateUsername("")
    print("Valid username: \(username)")
} catch ValidationError.emptyField(let fieldName) {
    print("\(fieldName) cannot be empty.")
} catch ValidationError.invalidFormat(let fieldName) {
    print("\(fieldName) has invalid characters.")
} catch ValidationError.valueTooLong(let fieldName, let maxLength) {
    print("\(fieldName) cannot exceed \(maxLength) characters.")
} catch {
    print("An unknown error occurred.")
}


// Using try?:
let optionalUsername = try? validateUsername("User@123")
print(optionalUsername ?? "Username validation failed")


// Using try! (with a safe value):
let forcedUsername = try! validateUsername("Anusha123")
print("Forced username: \(forcedUsername)")


/*:
 ### 1d) When to Use Each Approach
 Write a comment explaining when you would use each approach: `do-catch` vs `try?` vs `try!`
 */

/*
 Your explanation for 1d here:
 
 do-catch:
 do-catch is used when you want to properly handle errors and respond
 differently depending on the type of error.
 It allows the program to catch specific errors and display appropriate messages or
 take corrective actions.

 
 
 try?:
 try? is used when you do not need detailed information about the error.
 It converts the result into an optional value and returns nil if an error occurs,
 which makes the code simpler when error details are not important.

 
 
 try!:
 try! is used when you are absolutely sure that the function will not throw an error.
 If an error does occur, the program will crash. Therefore, it should only be used
 with values that are guaranteed to be valid.
 */
 
 



/*:
 ---
 ## Exercise 2: Protocols (15 points)
 
 ### 2e) Displayable Protocol
 Create a protocol `Displayable` with the following requirements:
 - `var title: String { get }`
 - `var subtitle: String { get }`
 - `func formattedDescription() -> String`
 */

// Your code for 2e here:
protocol Displayable {
    var title: String { get }
    var subtitle: String { get }
    
    func formattedDescription() -> String
}




/*:
 ### 2f) Conform Your Primary Model
 Copy your primary model from Part A (or create a simplified version) and make it conform to `Displayable`.
 
 **Note:** If you haven't completed Part A yet, create a simple model like `Book` or `Task` with a few properties.
 */

// Your code for 2f here:
struct Meal: Displayable {
    
    var name: String
    var category: String
    var calories: Int
    
    // Protocol requirements
    var title: String {
        return name
    }
    
    var subtitle: String {
        return category
    }
    
    func formattedDescription() -> String {
        return "\(name) - \(category) (\(calories) calories)"
    }
}




/*:
 ### 2g) Second Conforming Type
 Create a second, unrelated struct (e.g., `Event`, `Product`, `Contact`) that also conforms to `Displayable`.
 */

// Your code for 2g here:
struct Event: Displayable {
    
    var name: String
    var location: String
    var date: String
    
    var title: String {
        return name
    }
    
    var subtitle: String {
        return location
    }
    
    func formattedDescription() -> String {
        return "\(name) at \(location) on \(date)"
    }
}



/*:
 ### 2h) Print Info Function
 Write a function `printInfo(for item: Displayable)` that prints the formatted description.
 */

// Your code for 2h here:
func printInfo(for item: Displayable) {
    print(item.formattedDescription())
}

let meal = Meal(name: "Pasta", category: "Dinner", calories: 500)
printInfo(for: meal)




/*:
 ### 2i) Demonstrate Protocol Usage
 Demonstrate calling `printInfo` with instances of both conforming types.
 */

// Your code for 2i here:
let meal1 = Meal(name: "Chicken", category: "Dinner", calories: 380)
let event = Event(name: "Tech Meetup", location: "Chicago", date: "April 10")

printInfo(for: meal1)
printInfo(for: event)




/*:
 ---
 ## Exercise 3: Generics (10 points)
 
 ### 3j) Generic findFirst Function
 Write a generic function:
 ```
 findFirst<T: Equatable>(in array: [T], where predicate: (T) -> Bool) -> T?
 ```
 that returns the first element matching the predicate.
 */

// Your code for 3j here:
func findFirst<T: Equatable>(in array: [T], where predicate: (T) -> Bool) -> T? {
    for element in array {
        if predicate(element) {
            return element
        }
    }
    return nil
}




/*:
 ### 3k) Demonstrate findFirst Usage
 Demonstrate using your `findFirst` function with:
 1. An array of `String`s
 2. An array of `Int`s
 */

// Your code for 3k here:

// With Strings:
// With Strings:
let names = ["Butter Chicken", "Pasta", "Caesar Salad", "Paneer Tikka"]

if let result = findFirst(in: names, where: { $0.hasPrefix("P") }) {
    print(result)
}


// With Ints:
let numbers = [3, 7, 10, 15, 20]

if let result = findFirst(in: numbers, where: { $0 > 10 }) {
    print(result)
}



/*:
 ### 3l) Generic Stack
 Write a generic struct `Stack<Element>` with the following methods:
 - `mutating func push(_ element: Element)`
 - `mutating func pop() -> Element?`
 - `func peek() -> Element?`
 - `var isEmpty: Bool { get }`
 
 Demonstrate its usage with at least one type.
 */

// Your code for 3l here:
struct Stack<Element> {
    
    private var elements: [Element] = []
    
    mutating func push(_ element: Element) {
        elements.append(element)
    }
    
    mutating func pop() -> Element? {
        return elements.popLast()
    }
    
    func peek() -> Element? {
        return elements.last
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
}




// Demonstrate usage:
var intStack = Stack<Int>()

intStack.push(10)
intStack.push(20)
intStack.push(30)

print(intStack.peek() ?? "Empty")
print(intStack.pop() ?? "Empty")
print(intStack.isEmpty)




/*:
 ---
 ## Exercise 4: Type Casting (10 points)
 
 ### 4m) Class Hierarchy
 Create a class hierarchy:
 - Base class `MediaItem` with a `title: String` property
 - Subclass `Movie` with a `director: String` property
 - Subclass `Song` with an `artist: String` property
 
 Include appropriate initializers for each class.
 */

// Your code for 4m here:
class MediaItem {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}

class Movie: MediaItem {
    var director: String
    
    init(title: String, director: String) {
        self.director = director
        super.init(title: title)
    }
}

class Song: MediaItem {
    var artist: String
    
    init(title: String, artist: String) {
        self.artist = artist
        super.init(title: title)
    }
}

let movie = Movie(title: "Inception", director: "Christopher Nolan")
let song = Song(title: "Shape of You", artist: "Ed Sheeran")



/*:
 ### 4n) Mixed Array
 Create an array of `MediaItem` containing a mix of `Movie` and `Song` instances (at least 5 items total).
 */

// Your code for 4n here:
let library: [MediaItem] = [
    Movie(title: "Inception", director: "Christopher Nolan"),
    Song(title: "Shape of You", artist: "Ed Sheeran"),
    Movie(title: "Titanic", director: "James Cameron"),
    Song(title: "Blinding Lights", artist: "The Weeknd"),
    Song(title: "Bad Guy", artist: "Billie Eilish")
]




/*:
 ### 4o) Count with `is`
 Use a `for` loop with `is` to count how many movies and songs are in the array.
 Print the counts.
 */

// Your code for 4o here:
var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie { movieCount += 1 }
    if item is Song  { songCount  += 1 }
}

print("Movies: \(movieCount)")
print("Songs: \(songCount)")




/*:
 ### 4p) Downcast with `as?`
 Use `as?` to safely downcast items and print movie-specific or song-specific information.
 */

// Your code for 4p here:
for item in library {
    if let movie = item as? Movie {
        print("Movie: " + movie.title + " - Directed by " + movie.director)
    } else if let song = item as? Song {
        print("Song: " + song.title + " - By " + song.artist)
    }
}





 
