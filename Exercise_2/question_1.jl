mutable struct Node
    next::Union{Node, Nothing} # next kan peke på et Node-objekt eller ha verdien nothing.
    value::Int
end

function createlinkedlist(length)
    # Creates the list starting from the last element
    # This is done so the last element we generate is the head
    child = nothing
    node = nothing

    for i in 1:length
        node = Node(child, rand(1:8000))
        child = node
    end
    return node

end



# Skriv koden din her!
function findindexinlist(linkedlist, index)
    node = linkedlist

    for i in 1:index
        if i == index
            return node.value
        elseif node.next === nothing
            return -1
        else
            node = node.next
        end
    end
end

function testfunction(numberoftests, length, index)
    for i in 1:numberoftests
        testlist = createlinkedlist(length)
        answer = findindexinlist(testlist,index)
        if answer == -1
            println("Index larger than list")
        else
            println("Index ",index," => ",answer)
            println(testlist)
        end
    end
end

