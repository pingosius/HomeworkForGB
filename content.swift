import UIKit

/*  1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
    2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
    3. *Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.*/
    
struct Queue<T: Numeric> {
    
    private var elements: [T] = []
        mutating func push (_ element: T) {
            elements.append(element)
    }
    
    mutating func pop() -> T? {
        elements.removeFirst()
    }
       
       func filter(predicate: (T) -> Bool) -> [T] {
           var result = [T]()
           for element in elements {
               if predicate(element) {
                   result.append(element)
               }
           }
           return result
       }
        func map () -> [T] {
           elements.map({ $0 * $0 })
       }
    
    var isEmpty: Bool {
           return elements.count == 0
       }
    
       subscript (index: Int) -> T? {
           return index > self.elements.count-1 ? nil : elements[index]
       }
   }

    var queue = Queue<Int>()

    queue.push(2)
    queue.push(5)
    queue.push(8)
    queue.push(12)
    queue.push(17)
    queue.push(33)
    queue.push(42)

    let filter = queue.filter(predicate: { $0 % 3 == 0 })
 
    print(filter)

    print(queue)
    queue.pop()
    queue.pop()
    queue.pop()
    print(queue)

    print(queue.map())

    queue.isEmpty

    queue[1]
    queue[4]
