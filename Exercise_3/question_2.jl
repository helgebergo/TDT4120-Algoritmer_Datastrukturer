function binaryintervalsearch(x,delta, coordinate)
    p = 1
    r = length(x[:,coordinate])
    q = fld((p+r),2)
    
    if mod1(r, 2) == 2  # Sjekk om median blir heltall eller snitt av de to midterste
        median = (x[q,coordinate] + x[q+1,coordinate])/2
    else
        median = q
    end

    left = x[p:q,:] # Lag nye lister, uten å ødelegge x
    right = x[q+1:r,:]
    @show left
    @show right

    lower_bound = median - delta
    upper_bound = median + delta
    println("Median = ", median,"; Bounds = [",lower_bound,",",upper_bound,"]")

    lower_index = q
    upper_index = q
    
    lower_counter = 0
    upper_counter = 0

    # Venstre side
    while lower_bound <= lower_index && lower_index > 0

        lower_index -= 1
        lower_counter += 1
        @show lower_index
        @show lower_counter
    end

    
    #if lower_index == 0 && upper_index 

end



function testbinaryintervalsearch(test)
    if test == 1
        x = [1 2; 2 3; 3 0; 4 0; 5 1] 
        delta = 1.5 
        coordinate = 1
        return binaryintervalsearch(x,delta,coordinate)
    elseif test == 2
        x = [1 2; 2 0; 3 3; 4 4]
        delta = 0.25
        coordinate = 1
        return binaryintervalsearch(x,delta,coordinate)
    elseif test == 3
        x = [1 0; 2 0; 2 0; 3 0; 4 0; 5 0; 5 0]
        delta = 1
        coordinate = 1
        return binaryintervalsearch(x,delta,coordinate)
    else 
        return -1
    end
end
