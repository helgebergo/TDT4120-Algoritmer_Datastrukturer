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
    S = nothing
    Q = PriorityQueue(G.v...
        )
    while Q != nothing
        u = dequeue!(Q)
        S = [S, u]
        for each vertex
            update!(u,v,w)
        end
    end
end



function initialize!(G, s)
    # din kode her
end


function update!(u, v, w)
    # din kode her
end
