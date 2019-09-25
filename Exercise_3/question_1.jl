#x og y er to sorterte arrays, coordinate angir koordinat akse
function mergearrays(x,y,coordinate)
    n1 = length(x[:,coordinate])
    n2 = length(y[:,coordinate])
    L = [x; Inf Inf]
    R = [y; Inf Inf]
    x_counter = 1
    y_counter = 1
    merged = [zeros(Int64, n1) zeros(Int64, n1)]
    
    # Problemet er trolig at for-løkken kjører for kort. Må se på n1 og lengden her. 

    for i in 1:n1
       if L[x_counter,coordinate] <= R[y_counter,coordinate]
            merged[i,:] = L[x_counter,:]
            x_counter += 1
        else 
            merged[i,:] = R[y_counter,:]
            y_counter += 1
        end
        println("mergearray i = ",i," -> ",merged)
        #@show merged
        #@show i
    end
    return merged
end

#x usortert array, coordinate angir koordinat akse vi skal sortere langs
function mergesort(x, coordinate)
    p = 1
    r = length(x[:,coordinate])
    if p < r 
        q = Int(fld(p+r,2))
        #@show q
        println("Left = ",x[p:q,:])
        println("Right = ",x[q+1,:])
        mergesort(x[p:q,:],coordinate) # left side
        println("mergesort venstre = ", x[p:q,:])
        mergesort(x[q+1:r,:],coordinate) #right side
        println("mergesort høyre = ",x[q+1,:])
        mergearrays(x[p:q,:], x[q+1:r,:],coordinate)
        println("mergearray endte opp med = ", x)
    end
    return x
end


function testmergesort(coordinate)
    testarray = [1 2; 4 6; 2 1;3 4;5 6;1 8]
    testarray2 = [3.0 0.0; 2.0 0.0; 1.0 0.0]
    #return testarray
    x = [1 2;2 1;3 4]
    y = [2 2;4 1;5 6]
    #merged = mergearrays(x,y,coordinate)
    #return merged
    #sorted = mergesort(testarray,coordinate)
    sorted = mergesort(testarray2,coordinate)
    return sorted

end

#testfunction(1)
