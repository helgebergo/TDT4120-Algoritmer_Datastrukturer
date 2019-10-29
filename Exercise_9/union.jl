mutable struct DisjointSetNode
    rank::Int
    p::DisjointSetNode
    DisjointSetNode() = (obj = new(0); obj.p = obj;)
end

function findset(x)
    if x != x.p
        x.p = findset(x.p)
    end
    return x.p
end

function link!(x, y)
    if x.rank > y.rank
        y.p = x
    else
        x.p = y
        if x.rank == y.rank
            y.rank += 1
        end
    end

end

function union!(x,y)
    link!(findset(x),findset(y))
end