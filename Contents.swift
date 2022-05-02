import UIKit

//conforming node to equatable since type T only defines the value not the actual node structure

class Node<T: Equatable>: Equatable {
    
    var value: T
    var next: Node? // singly linked
   // var previous: Node? // doubly linked
    
    //required function for protocol Equatable
    // function overide
    //lhs(tail) == rhs(head)

    
    static func == (lhs: Node, rhs: Node) -> Bool{
        return lhs.value == rhs.value && lhs.next == rhs.next
        //If theyre qual and pointing to the same object,they both have to be true i order for this to be true
    }
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

class LinkedList<T: Equatable> {

     var head: Node<T>?
     var tail: Node<T>?

    public init() { }

    public var isEmpty: Bool {
        print("Empty list")
     return head == nil //if head = nil then the list is empty
    }
    
    // first computed  property
    public var first: Node<T>?{
        return head
        }
    public var last: Node<T>? {
        return tail
    }
    // Scenario 1 appending to an empty list, the head and the tail are the same thing.The list has only one object.
    public func append(_ value: T) {
        let newNode = Node(value)
    
        guard let lastNode = tail else{
            head = newNode
            tail = head
            return
        }
        
    //Scenario 2: existing nodes
        lastNode.next = newNode
        tail = newNode
        
        
    }
    public func removeLast() -> Node<T>? {
        if isEmpty {
            
            // Scenario #1 empty list
            return nil }
    
        var removedNode: Node<T>?
        
        // Scenario #2 One Node, if head and tail are pointing to the same node
        
        if head == tail {
            let removedNode = head
            head = nil
            tail = nil
            return removedNode
            
        }
        //Scenario #3 - More than one node in the linked list, traverse the linked list starting frm the head
        
        var currentNode = head
        
        //while loop traverses the list as long as the conditions are true and stops at node before tail, increments current node by 1
        
        while currentNode?.next != tail {
            currentNode = currentNode?.next
        }
        
        // where is my currentNode  at the end of the while loop? It is second to last and that becomes the new tail.
        //sets that next poiner to nil
        // if we get to the tail weve gone too far
        removedNode = tail
        // save the tail node before removing the last node
        tail = currentNode
        //set tail to second to last value
        currentNode?.next = nil
        
        return removedNode
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
fellows.append("Tanya")
fellows.append("David")

print(fellows) // Oscar -> nil


