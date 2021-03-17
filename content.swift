import UIKit

/*  1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
    2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
    3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
    4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
    5. Создать несколько объектов каждого класса. Применить к ним различные действия.
    6. Вывести сами объекты в консоль.*/

protocol Car: AnyObject {
    var mark: String {get set}
    var color: UIColor {get set}
    var doorNumber: Int {get set}
    var windowStatus: Bool {get set}
    var engineStatus: Bool {get set}
    var ligthStatus: Bool {get set}
    func lightUp ()
}

extension Car {
    func openWindow () {
        if windowStatus == false{
        print ("Окна закрыты.")
        } else {
        print ("Окна открыты.")
        }
    }
    func startEngine () {
    
        if engineStatus == false {
        print ("Двигатель выключен.")
            } else {
        print ("Двигатель включен.")
            }
        }
}

class SportCar: Car {
        
    var mark: String
    var color: UIColor
    var doorNumber: Int
    var windowStatus: Bool
    var engineStatus: Bool
    var ligthStatus: Bool
    var spoiler: Bool
    var maxSpeed: Int
        
    func lightUp() {
        if ligthStatus == false{
        print ("Фары потушены.")
        } else {
        print ("Фары зажжены")
        }
    }
    init(spoiler: Bool, maxSpeed: Int, mark: String, color: UIColor, doorNumber: Int, windowStatus: Bool, engineStatus: Bool, ligthStatus: Bool) {
    
    self.spoiler = spoiler
    self.maxSpeed = maxSpeed
    self.mark = mark
    self.color = color
    self.doorNumber = doorNumber
    self.windowStatus = windowStatus
    self.engineStatus = engineStatus
    self.ligthStatus = ligthStatus
    
    }
}

extension SportCar: CustomStringConvertible {
 
        var description: String {
        return "Автомобиль марки \(mark) \(color) цвета имеет максимальную скорость: \(maxSpeed)."
        }
    }

class TrunkCar : Car {
    var mark: String
    var color: UIColor
    var doorNumber: Int
    var windowStatus: Bool
    var engineStatus: Bool
    var ligthStatus: Bool
    var trunkVolume: Int
    var seatNumber: Int
    func lightUp() {
        if ligthStatus == false{
        print ("Фары потушены.")
        } else {
        print ("Фары зажжены")
        }
    }
    init(trunkVolume: Int, seatNumber: Int, mark: String, color: UIColor, doorNumber: Int, windowStatus: Bool, engineStatus: Bool, ligthStatus: Bool) {
        self.trunkVolume = trunkVolume
        self.seatNumber = seatNumber
        self.mark = mark
        self.color = color
        self.doorNumber = doorNumber
        self.windowStatus = windowStatus
        self.engineStatus = engineStatus
        self.ligthStatus = ligthStatus
    }
}
extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль марки \(mark) \(color) цвета имеет объем кузова \(trunkVolume) и \(seatNumber) сидений."
    }
    
}

let car1 = SportCar(spoiler: true, maxSpeed: 300, mark: "Nissan", color: .black, doorNumber: 2, windowStatus: false, engineStatus: false, ligthStatus: false)
let car2 = TrunkCar(trunkVolume: 5000, seatNumber: 6, mark: "Mercedes", color: .white, doorNumber: 5, windowStatus: true, engineStatus: true, ligthStatus: true)
 
car1.ligthStatus = true
car1.lightUp()
car2.engineStatus = false
car2.startEngine()
car1.windowStatus = true
car1.openWindow()


print(car1)
print(car2)
