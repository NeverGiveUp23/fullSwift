//
//  typecasting.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 5/27/25.
//

// TYPE CASTING

// Type Casting is a way to check the type of an instance, or to treat that instane as a different superclass or subclass from somewhere else in its own hierarchy

// Type casting in Swift is implemented with the 'is' and 'as' operators. These two operators provide a simple and expressive way to check the type of a value or cast a value to a different type

class MediaItem {
    var name: String
    init (name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init (name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String){
        self.artist = artist
        super.init(name: name)
    }
}
// let library: [MediaItem] = ...
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
// the type of "library" is inferred to be [MediaItem]


/*
 Checking Type

 Use the type check operator (is) to check whether an instance is of a certain subclass type. The type check operator returns true if the instance is of that subclass type and false if it’s not.

 The example below defines two variables, movieCount and songCount, which count the number of Movie and Song instances in the library array:
 */


/*
 var movieCount = 0
 var songCount = 0

 for item in library {
     if item is Movie { returns true if the current MediaItem is a Movie instance and false if it’s not
         movieCount += 1
     } else if item is Song {
         songCount += 1
     }
 }
 print("Media library contains \(movieCount) movies and \(songCount) songs")
 // Prints "Media library contains 2 movies and 3 songs"

 
 This example iterates through all items in the library array. On each pass, the for-in loop sets the item constant to the next MediaItem in the array.

 item is Movie returns true if the current MediaItem is a Movie instance and false if it’s not.
 */



// DOWNCASTING
// A constant or variable of a certain class type may actually refer to an instance of a subclass behind the scenes. Where you belive this is thecase, you can try to 'downcast' to the subclass type with a type cast operator(as? or as!).

// becuase downcasting can fail, the type cast operator comes in two diff forms. the conditiona form, as?, returns an optional value of the type you are trying to downcast to.
// the forced from, as!, attempts the downcast and force-unwraps the results as a single compund action


/*
 Use the conditional form of the type cast operator (as?) when you aren’t sure if the downcast will succeed. This form of the operator will always return an optional value, and the value will be nil if the downcast was not possible. This enables you to check for a successful downcast.

 Use the forced form of the type cast operator (as!) only when you are sure that the downcast will always succeed. This form of the operator will trigger a runtime error if you try to downcast to an incorrect class type.
 */

/*
for item in library {
    if let movie = item as? Movie {
        print("Movie director: \(movie.director)")
    } else if let song = item as? Song {
        print("Song artist: \(song.artist)")
    }
}
*/
