function floyd_warshall(adjacency_matrix, nodes, f, g)
    D = adjacency_matrix
    for k in 1:nodes
        for i in 1:nodes
            for j in 1:nodes
                D[i,j] = f(D[i,j],g(D[i,k],D[k,j]))
            end
        end
    end
    return D    # Ikke sant ;) 
end

