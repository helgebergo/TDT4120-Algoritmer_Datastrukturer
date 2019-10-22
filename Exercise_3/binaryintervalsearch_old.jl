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
    upper_index = q+1
    
    lower_counter = 0
    upper_counter = 0

    # Venstre side
    while lower_index > 0 && x[lower_index,coordinate] > lower_bound 
        @show x[lower_index,coordinate]
        @show lower_index
        @show lower_counter
        lower_index -= 1
        lower_counter += 1
    end
    @show lower_index
    @show lower_counter

    # Høyre side
    while upper_index < r && x[upper_index,coordinate] < upper_bound  
        @show x[upper_index+1,coordinate]
        @show upper_index
        @show upper_counter
        upper_index += 1
        upper_counter += 1
    end
    @show upper_index
    @show upper_counter

    if lower_index <= 0 && upper_index >= r
        println("utenfor grensene")
        return -1, -1
    elseif lower_counter == 0 && upper_counter == 0
        return -1, -1
    elseif lower_index == q && upper_index == q
        println("grensene er medianen")
        return -1, -1
    else
        println("Oi, kanskje det gikk")
        return lower_index+1, upper_index-1
    end

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
        # Skal gi -1, -1.
    elseif test == 3
        x = [1 0; 2 0; 2 0; 3 0; 4 0; 5 0; 5 0]
        delta = 1
        coordinate = 1
        return binaryintervalsearch(x,delta,coordinate)
        # Skal gi 2, 5.
    elseif test == 4
        x = [1.0 0.0; 2.0 0.0; 3.0 0.0] 
        delta = 0.5
        coordinate = 1
        return binaryintervalsearch(x,delta,coordinate)
    else 
        return -1
    end
end
