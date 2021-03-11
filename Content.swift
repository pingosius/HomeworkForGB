import UIKit

/*Задание.
1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.*/

enum EngineStatus {
    case on, off
}
enum WindowStatus {
    case open, close

}
enum TrunkLoad {
    case load, unLoad
}
enum CarMark {
    case BMW
    case Audi
    case Gaz
    case Hyundai
}

struct sportCar {
    let mark: String
    let yearOfRelease: Int
    var trunkVolume: Int {
       didSet {
        if (trunkLoad == .unLoad) && (oldValue != 0) && (trunkVolume <= oldValue){
            let freeVolume = oldValue - trunkVolume
            print("В багажнике \(mark) занято \(mark), осталось места \(freeVolume).")
        } else {
            print("Багажник у \(mark) полностью загружен.")
            trunkVolume = oldValue
        }
       }
    }
   
    var engineStatus: EngineStatus {
        willSet{
            newValue == .on ? print("Двигатель у \(mark) работает.") : print("Двигатель у \(mark) выключен.")
        }
    }
    var windowStatus: WindowStatus {
        willSet{
            newValue == .open ? print("Окна у \(mark) открыты.") : print("Окна у \(mark) закрыты.")
        }
    }
        var trunkLoad: TrunkLoad
    mutating func emptyTrunk() {
        self.trunkLoad = .unLoad
        print("Багажник \(mark) пуст.")
    }
}

    

struct trunkCar {
    let mark: String
    let yearOfRelease: Int
    var trunkVolume: Int {
       didSet {
        if (trunkLoad == .unLoad) && (oldValue != 0) && (trunkVolume <= oldValue){
            let freeVolume = oldValue - trunkVolume
            print("В багажнике \(mark) занято \(mark), осталось места \(freeVolume).")
        } else {
            print("Багажник у \(mark) полностью загружен.")
            trunkVolume = oldValue
        }
       }
    }
   
    var engineStatus: EngineStatus {
        willSet{
            newValue == .on ? print("Двигатель у \(mark) работает.") : print("Двигатель у \(mark) выключен.")
        }
    }
    var windowStatus: WindowStatus {
        willSet{
            newValue == .open ? print("Окна у \(mark) открыты.") : print("Окна у \(mark) закрыты.")
        }
    }
        var trunkLoad: TrunkLoad
    mutating func emptyTrunk() {
        self.trunkLoad = .unLoad
        print("Багажник \(mark) пуст.")
    }
}



var car1 = sportCar(mark: "BMW", yearOfRelease: 2018, trunkVolume: 220, engineStatus: .on, windowStatus: .open, trunkLoad: .unLoad)
var car2 = sportCar(mark: "Audi", yearOfRelease: 2020, trunkVolume: 300, engineStatus: .off, windowStatus: .close, trunkLoad: .load)
var car3 = trunkCar(mark: "Hyundai", yearOfRelease: 2015, trunkVolume: 7500, engineStatus: .on, windowStatus: .close, trunkLoad: .unLoad)
var car4 = trunkCar(mark: "GAZ", yearOfRelease: 1996, trunkVolume: 9000, engineStatus: .off, windowStatus: .open, trunkLoad: .load)

car1.engineStatus = .off
car1.trunkVolume = 150
car1.emptyTrunk()

car2.trunkVolume = 200
car2.emptyTrunk()
car2.windowStatus = .open

car3.engineStatus = .off
car3.trunkVolume = 6000
car3.emptyTrunk()

car4.trunkVolume = 1000
car4.windowStatus = .close

print ("Информация о автомобиле \(car1.mark). Год выпуска: \(car1.yearOfRelease). Статус двигателя: \(car1.engineStatus). Статус окон: \(car1.windowStatus)")
print ("Информация о автомобиле \(car3.mark). Год выпуска: \(car3.yearOfRelease). Статус двигателя: \(car3.engineStatus). Статус окон: \(car3.windowStatus)")



