#x og y er to sorterte arrays, coordinate angir koordinat akse
function mergearrays(x,y,coordinate)
    n1 = length(x[:,coordinate])
    n2 = length(y[:,coordinate])
    N = n1 + n2             # Lengde på den mergede lista 
    L = [x; Inf Inf]        # Lag venstre liste, legg til inf-verdi som sentinel i slutten
    R = [y; Inf Inf]        # Høyre liste
    x_counter = 1
    y_counter = 1
    merged = [zeros(Int64, N) zeros(Int64, N)]  # Lag en tom liste med plass til både x og y
    
    for i in 1:N
       if L[x_counter,coordinate] <= R[y_counter,coordinate]    # Stabil sortering, sjekk venstre først
            merged[i,:] = L[x_counter,:]
            x_counter += 1
        else 
            merged[i,:] = R[y_counter,:]
            y_counter += 1
        end
        println("mergearray i = ",i," -> ",merged)  # Kontrollsjekk at i faktisk går mange nok ganger
    end
    return merged
end

#x usortert array, coordinate angir koordinat akse vi skal sortere langs
function mergesort(x, coordinate)
    p = 1
    r = length(x[:,coordinate])
    if p < r 
        q = Int(fld(p+r,2))
        #println("Left = ",x[p:q,:])
        #println("Right = ",x[q+1,:])
        left = mergesort(x[p:q,:],coordinate) # left side
        #println("mergesort venstre = ", left)
        right = mergesort(x[q+1:r,:],coordinate) #right side
        #println("mergesort høyre = ", right)
        x = mergearrays(left,right,coordinate)
        #println("mergearray endte opp med = ", x)
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
