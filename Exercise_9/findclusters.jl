function findclusters(E::Vector{Tuple{Int, Int, Int}}, n::Int, k::Int)
    A = 0
    for v in E.v
        makeset(v)
    end
    for u in E.u
        u = DisjointSetNode()
        u.rank = 0
    end
    sort!(E,E.v)
    for i in 1:length(E)
        if findset(u) != findset(v)
            A = A    
    end
end



mutable struct DisjointSetNode
    rank::Int
    p::DisjointSetNode
    DisjointSetNode() = (obj = new(0); obj.p = obj;)
end

function makeset(x)
    x.p = x
    x.rank = 0
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