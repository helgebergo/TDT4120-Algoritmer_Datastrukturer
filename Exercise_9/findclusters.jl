function findclusters(E::Vector{Tuple{Int, Int, Int}}, n::Int, k::Int)
    A = []
    nodes = zeros(Int64,n)
    for v in 1:n
        E[v] = DisjointSetNode()
        makeset(E[v])
        nodes[v] = E[v]
    end

    end
    sort!(E)
    i = 1
    while i < n - k
        for j in 1:length(E)
            if findset(E[E.[2]]) != findset(E[E.[3]])
                push!(A,E)
            end
        end
        i += 1
    end
    for i in 1:length(E)
        if findset(u) != findset(v)
            A = A:12   
            union!(nodes[u],nodes[v])
        end
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


printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)


using Test
@testset "Tester" begin
    @test sort([sort(x) for x in findclusters([(1, 3, 4), (3, 1, 3), (5, 1, 4), (6, 2, 1), (7, 2, 3), (8, 3, 1), (9, 3, 2), 
    (10, 4, 1), (11, 4, 2), (12, 4, 3), (4, 2, 4), (2, 1, 2)], 4, 2)]) == sort([[1, 2], [3, 4]])
    @test sort([sort(x) for x in findclusters([(1, 3, 4), (3, 1, 3), (5, 1, 4), (6, 2, 1), (7, 2, 3), (8, 3, 1), (9, 3, 2), 
    (10, 4, 1), (11, 4, 2), (12, 4, 3), (4, 2, 4), (2, 1, 2)], 4, 3)]) == sort([[1], [2], [3, 4]])
end

println("\nFungerte det? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke sjekker alle grensetilfellene")
println("---------------------------------------------------------\n\n")