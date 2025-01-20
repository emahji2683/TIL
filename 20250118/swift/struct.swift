struct Person {
    var firstName: String
    var lastName: String
    
    func fullname() -> String {
        return lastName + firstName
    }
}

let person = Person(firstName: "tarou", lastName: "tanaka")
print (person.fullname())
