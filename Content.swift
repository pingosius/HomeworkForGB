import UIKit

/*  1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
    2. Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными свойствами обладают эти автомобили.
    3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет TrunkCar, а какие – SportCar. Добавить эти действия в перечисление.
    4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
    5. Создать несколько объектов каждого класса. Применить к ним различные действия.
    6. Вывести значения свойств экземпляров в консоль. */


enum WindowStatus {
    case open, close
}
enum TrunkLoad {
    case load, unLoad
}
enum Transmission {
    case manual, auto
}

class Car {
    
    let mark: String
    let yearOfRelease: String
    var color: UIColor
    let trunkVolume: Int
    let transmission: Transmission
    
    init(mark: String, yearOfRelease: String, color: UIColor, trunkVolume: Int, transmission : Transmission) {
        self.mark = mark
        self.yearOfRelease = yearOfRelease
        self.color = color
        self.trunkVolume = trunkVolume
        self.transmission = transmission
        
    }
}
    class TrunkCar: Car {
    var trunkLoad: TrunkLoad
    var seatNumber: Int
        
        init (mark: String, yearOfRelease: String, color: UIColor, trunkVolume: Int, transmission: Transmission, trunkLoad: TrunkLoad, seatNumber: Int) {
        self.trunkLoad = trunkLoad
        self.seatNumber = seatNumber
            super.init(mark: mark, yearOfRelease: yearOfRelease, color: color, trunkVolume: trunkVolume, transmission: transmission)
            
        }
    }
    
    func trunkStatus (trunkLoad: TrunkLoad ) {
        if trunkLoad == .load {
            print ("Багажник загружен.")
        }else{
            
        print ("Багажник свободен.")
    }
    }

    class SportCar: Car {
    var windowStatus: WindowStatus
    init(mark: String, yearOfRelease: String, color: UIColor, trunkVolume: Int, transmission: Transmission, windowStatus: WindowStatus) {
    self.windowStatus = windowStatus
        
    super.init(mark: mark, yearOfRelease: yearOfRelease, color: color, trunkVolume: trunkVolume, transmission: transmission)

    func openWindow (windowStatus: WindowStatus) {
        if windowStatus == .open {
            print("Окна открыты.")
        } else {
            print ("Окна закрыты.")
        }
        }
    }
    }
        var car1 = Car(mark: "Audi", yearOfRelease: "2019", color: .gray, trunkVolume: 250, transmission: .auto)
        var car2 = SportCar(mark: "Alfa Romeo", yearOfRelease: "2020", color: .green, trunkVolume: 70, transmission: .manual, windowStatus: .open)
        var car3 = TrunkCar(mark: "GAZ", yearOfRelease: "2008", color: .white, trunkVolume: 7500, transmission: .manual, trunkLoad: .load, seatNumber: 6)
car1.color = .blue
car2.windowStatus = .close
car2.color = .cyan
car3.trunkLoad = .unLoad
car3.seatNumber = 12

print ("Информация о автомобиле \(car1.mark). Год выпуска: \(car1.yearOfRelease). Цвет: \(car1.color). Коробка передач: \(car1.transmission). Объем багажника: \(car1.trunkVolume).")
print ("Информация о автомобиле \(car2.mark). Год выпуска: \(car2.yearOfRelease). Цвет: \(car2.color). Коробка передач: \(car2.transmission). Объем багажника: \(car2.trunkVolume). Статус окон: \(car2.windowStatus).")
print ("Информация о автомобиле \(car3.mark). Год выпуска: \(car3.yearOfRelease). Цвет: \(car3.color). Коробка передач: \(car3.transmission). Объем багажника: \(car3.trunkVolume). Статус загрузки багажника: \(car3.trunkLoad).")


