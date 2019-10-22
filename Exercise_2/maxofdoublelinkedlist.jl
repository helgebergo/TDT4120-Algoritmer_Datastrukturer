mutable struct NodeDoublyLinked
    prev::Union{NodeDoublyLinked, Nothing} # Er enten forrige node eller nothing
    next::Union{NodeDoublyLinked, Nothing} # Er enten neste node eller nothing
    value::Int # Verdien til noden
end

function createLinkedListDoublyLinked(length)
    # Create the list from the last element in the chain
    # This is so the returned element will be the first in the chain
    current = nothing
    beforeCurrent = nothing

    for i in 1:length
        # only fill out the next field because prev will be filled out later
        current = NodeDoublyLinked(nothing, beforeCurrent, rand(-1000:1000))
        # link up the node before this node to this node
        if beforeCurrent != nothing
            beforeCurrent.prev = current
        end
        beforeCurrent = current
    end
    return current
end

function maxofdoublelinkedlist(linkedlist)
    node = linkedlist
    max = node.value

    while node.next != nothing
        node = node.next
        if node.value > max
            max = node.value
        end
    end

    node = linkedlist
    while node.prev != nothing
        node = node.prev
        if node.value > max
            max = node.value
        end
    end
    return max
end



function test(length)
    linkedlist = createLinkedListDoublyLinked(length)
    println(linkedlist)
    max = maxofdoublelinkedlist(linkedlist)
    return max
    println(max)
end
