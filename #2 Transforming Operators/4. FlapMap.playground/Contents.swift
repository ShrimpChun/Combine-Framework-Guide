import UIKit
import Combine

struct School {
    let name: String
    let numberOfStudents: CurrentValueSubject<Int, Never>
    
    init(name: String, numberOfStudents: Int) {
        self.name = name
        self.numberOfStudents = CurrentValueSubject(numberOfStudents)
    }
}

let citySchool = School(name: "City School", numberOfStudents: 100)

let school = CurrentValueSubject<School, Never>(citySchool)

// We are getting a notification that something has changed.
school.flatMap {
    $0.numberOfStudents
}.sink {
    print($0)
}

let townSchool = School(name: "Town School", numberOfStudents: 65)

school.value = townSchool

citySchool.numberOfStudents.value += 1
townSchool.numberOfStudents.value += 10
