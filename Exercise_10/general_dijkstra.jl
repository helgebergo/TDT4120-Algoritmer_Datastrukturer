using DataStructures: PriorityQueue, enqueue!, dequeue!

mutable struct Node
    name::String # used to distinguish nodes when debugging
    d::Union{Float64, Nothing} # d for distance
    p::Union{Node, Nothing} # p for predecessor
end
Node(name) = Node(name, nothing, nothing) # constructor used for naming nodes

mutable struct Graph
    V::Array{Node} # V for Vertices
    Adj::Dict{Node, Array{Node}} # Adj for Adjacency
end

function general_dijkstra!(G, w, s, reverse=false)
	initialize!(G,s)
    S = []
    if reverse
        Q = PriorityQueue{Node}(Base.Order.Reverse)
    else
        #PriorityQueue{Q}
        Q = PriorityQueue{Node}()
        #Q = PriorityQueue(u => for u in G.V)
    end
    enqueue!(Q,s)
    while !isempty(Q)
        u = dequeue!(Q)
        S = [S, u]
        for vertex
            update!(u,v,w)
        end
    end
end



function initialize!(G, s)
    for i in 1:length(G)
        G[i].d = -typemax(Float64)
        G[i].p = nothing
    end
    s.d = typemax(Float64)
end


function update!(u, v, w)
    if v.d < v.d + min(u.d,w[(u,v)])
        v.d = max(v.d,min(u.d,w[(u,v)]))
        v.p = min(u.d,w[(u,v)])
    end
end
