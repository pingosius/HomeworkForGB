import UIKit

/*2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws - функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch. */


enum BandMemberError: Error {
    case notActualMember
}

struct BandMember {
    let name: String
    let surname: String
    let age: Int
    let position: String
}
class RedHotChiliPeppers {
    var members = [
        "1": BandMember(name: "Anthony", surname: "Kiedis", age: 58, position: "Singer"),
        "2": BandMember(name: "John", surname: "Frusciante", age: 51, position: "guitarist"),
        "3": BandMember(name: "Chad", surname: "Smith", age: 59, position: "drummer"),
        "4": BandMember(name: "Michael", surname: "Balzary", age: 58, position: "bassist") ]
    
    func getInfo (number member: String) throws -> BandMember {
            guard let person = members[member] else {
                throw BandMemberError.notActualMember
            }
        return person
    }
}
  
let bandmember = RedHotChiliPeppers()
do {
    let person = try bandmember.getInfo(number: "3")
    print(person)
    
} catch BandMemberError.notActualMember {
print("Участник группы не найден.")
}

