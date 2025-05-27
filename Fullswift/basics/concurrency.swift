//
//  concurrency.swift
//  Fullswift
//
//  Created by Felix Vargas Jr on 5/27/25.
//
import Foundation


/*
 Swift has built-in support for writing asynchronous and parallel code in a structured way.
 Asynchronous code can be suspended and resumed later, although only one piece of the program executes at a time.
 Suspending and resuming code in your program lets it continue to make progress on short-term operations like updating its UI while continuing to work on long-running operations like fetching data over the network or parsing files
 
 */


// Defining Async Code
// an Async function or method is a special kind of function that can be susbended while its partway through execution. In a syncronous funcion which is non-async, returns either a completion, error or never return.
// An Async function still does one of those three things, but it can pause in the middle when its waiting for something.

func listPhotoss(inGallery name: String) async -> [String]{
    let result: [String] = [name] // pretend some networking async code
    return result
}

// For a function or method that’s both asynchronous and throwing, you write async before throws.
func listPhotosAsyncThrows(inGallery: String) async throws -> [String] {
    return [String]()
}

// When calling an asynchronous method, execution suspends until that method returns.
// You write 'await' in front of the call to mark the possible suspension point.

// *  This is like writing 'try' when calling a throwing function, to mark the possible change to the program’s flow if there’s an error. *

/*
 Inside an asynchronous method, the flow of execution is suspended only when you call another asynchronous method — suspension is never implicit or preemptive — which means every possible suspension point is marked with await.
 */


///  let photoNames = await listPhotos(inGallery: "Traveling")
///  let sortedNames = photoNames.sorted()
///  let name = sortedNames[0]
///  let photo = await loadPhoto(named: name)


/*
 Because the listPhotos(inGallery:) and downloadPhoto(named:) functions both need to make network requests, they could take a relatively long time to complete. Making them both asynchronous by writing async before the return arrow lets the rest of the app’s code keep running while this code waits for the picture to be ready.
 */


/*
 The possible suspension points in your code marked with await indicate that the current piece of code might pause execution while waiting for the asynchronous function or method to return. This is also called yielding the thread because, behind the scenes, Swift suspends the execution of your code on the current thread and runs some other code on that thread instead.
 */

// To explicitly insert a suspension point by calling the Task.yeild() method
func generateSlides(forGallery gallery: String) async {
    let photos = await listPhotoss(inGallery: gallery)
    for photo in photos {
        // .. render a few seconds of video for this photo....
        await Task.yield() // you can add Task.yield() to explicitly add suspension points.
    }
}

/*
 The Task.sleep(for:tolerance:clock:) method is useful when writing simple code to learn how concurrency works. This method suspends the current task for at least the given amount of time. Here’s a version of the listPhotos(inGallery:) function that uses sleep(for:tolerance:clock:) to simulate waiting for a network operation:
 */

func listPhotosSleep(inGallery name: String) async throws -> [String] {
    try await Task.sleep(for: .seconds(2)) // wait 2 seconds to fetch data and return
    return ["photo1.jpg", "photo2.jpg", "photo3.jpg"]
}

// code above is both asynchronous and throwing, becuase the call to Task.sleep(until:tolerance:clock:) can throw an error. When you call this version, you write both try and await

// var photo1 = try await listPhotosSleep(inGallery: "A rainy weekend")


// CALLING ASYNCHRONOUS FUNCTIONS IN PARALLEL

// Calling an async function with 'await' runs only one piece of code at a time. While the async code is running, the caller waits for that code to finish before moving on to run the next line of code.
// EX code:
//let firstPhoto = await listPhotoss(inGallery: photoNames[0])
//let secondPhoto = await listPhotoss(inGallery: photoNames[1])
//let thirdPhoto = await listPhotoss(inGallery: photoNames[2])
//
//let photos = [firstPhoto, secondPhoto, thirdPhoto]

// The apporach above has a drawback: Although the download is asynchronous and lets other work happen while it progresses, only one call to listPhotos(inGallery:) run at a time. Each photo downloads completely before going on to the next one.

// However you can download each phot independently or even at the same time.
// to call an async function and let it run in parallel with code around it, write 'async' in front of 'let' when you define a constant, and then await each time you use the constant
//
//async let firstPhoto1 = listPhotoss(inGallery: photoNames[0])
//async let secondPhoto2 = listPhotoss(inGallery: photoNames[1])
//async let thirdPhoto3 = listPhotoss(inGallery: photoNames[2])

//let photos = await [firstPhoto, secondPhoto, thirdPhoto]
//

/*
let photos = await withTaskGroup(of: Data.self) { group in
    let photoNames = await listPhotoss(inGallery: "Summer Vacation")
    for name in photoNames {
        group.addTask {
            return await downloadPhoto(named: name)
        }
    }
    var result: [Data] = []
    for await photo in group {
        result.append(photo)
    }
    return result
}
*/
// Task Cancelation
// Swift concurrency uses a cooperative model. Each task checks whether it has been cancelled at the appropriate points in its execution, and responds to cancelation appropriatly. Depending on what work the task is doing, responding to cancellation usually means one of the following:
// -> Throwing an error like 'CancellationError'
// -> Returning nil or a empty collection
// -> Returning the partially completed work

// For example -> Downloading pictures could take a long time if the pictures are large or the network is slow. To let the user stop this work, without waiting for all of the tasks to complete, the tasks need check for cancellation and stop running if they are canceled.

// There are two ways a task can do this: by calling the Task.checkCancellation() type method, or by reading the Task.isCancelled type property.

// Calling checkCancellation() throws an error if the tasks is canceled;
// a throwing task can propagate the error out of the task, stopping all ofthe tasks work.

// For more flexibility, use the isCancelled property, which lets you perform clean-up work as part of stopping the task, like closing network connections and deleting temporary files.
/*
let newPhotos = await withTaskGroup(of: Optional<Data>.self) { group in
    let photoNames = await listPhotoss(inGallery: "Summer Vacation")
    for name in photoNames {
        let added = group.addTaskUnlessCancelled {
            guard !Task.isCancelled else { return nil }
            return await downloadPhoto(named: name)
        }
        guard added else { break }
    }
    
    var results: [Data] = []
    for await photo in group {
        if let photo { result.append(photo)}
    }
    return results
}
*/

/*
 The code above makes several changes from the previous version:

     Each task is added using the TaskGroup.addTaskUnlessCancelled(priority:operation:) method, to avoid starting new work after cancellation.

     After each call to addTaskUnlessCancelled(priority:operation:), the code confirms that the new child task was added. If the group is canceled, the value of added is false — in that case, the code stops trying to download additional photos.

     Each task checks for cancellation before starting to download the photo. If it has been canceled, the task returns nil.

     At the end, the task group skips nil values when collecting the results. Handling cancellation by returning nil means the task group can return a partial result — the photos that were already downloaded at the time of cancellation — instead of discarding that completed work.
 */
// For work that needs immediate notification of cancellation, use the Task.withTaskCancellationHandler(operation:onCancel:isolation:) method. For example:

//
//let task = await Task.withTaskCancellationHandler {
//    // ...
//} onCancel: {
//    print("Cancelled!")
//}


// ACTORS
// You can also use tasks to break up your program into isolated pieces. Tasks are isolated from each other, which is what makes it safe for them to run at the same time, but sometimes you need to share some information between tasks.
// Actors let you safely share information between concurrent code


actor TempLogger {
    let label: String
    var measurements: [Int]
    private(set) var max: Int
    
    init (label: String, measurement: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }
}

// you intorduce an actor with the 'actor' keyword.

let logger = TempLogger(label: "CPU Temp", measurement: 85)

