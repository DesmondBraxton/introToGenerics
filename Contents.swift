import UIKit

class Node<T> {
    
    var value: T
    var next: Node? // singly linked
    var previous: Node? // doubly linked
    init(_ value:T) {
        self.value = value
    }
}
// implementing custom string convertible
extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

// instantiating node instances
let car12 = Node<Int>(12)
let car99 = Node<Int>(99)
let car37 = Node<Int>(37)

//link our nodes using the next pointer

car12.next = car99
car99.next = car37

//print the current state of the linked node

print(car12)

class LinkedList<T> {

     var head: Node<T>?
     var tail: Node<T>?

    public init() { }

    public var isEmpty: Bool {
    head == nil
    }
    
    public var first: Node<T>?{
        return head
        }
    public var last: Node<T>? {
        return tail
    }
    public func append(_ value: T) {
        let newNode = Node(value)
        
    // Scenario 1 appending to an empty list, the head and the tail are the same thing.The list has only one object.
        
        guard let lastNode = tail else{
            head = newNode
            tail = head
            return
        }
        
    //Scenario 2: existing nodes
        lastNode.next = newNode
        newNode = tail
    }
    public func removeLast(){
        
    }
}

extension LinkedList: CustomStringConvertible {
    // THis is a computed property, extensions shouldnt have stored properties
    var description: String {
        guard let head = head else {
            return "empty list"
        }
        return "\(head)"
    }
}
let fellows = LinkedList<String>()

fellows.append("Oscar")

print(fellows) // Oscar -> nil

//first
//last
//append method
//remove last

    
