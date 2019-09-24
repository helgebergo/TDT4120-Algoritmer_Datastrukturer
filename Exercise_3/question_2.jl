function binaryintervalsearch(x,delta, coordinate)
    p = 1
    r = length(x[:,coordinate])
    q = fld((p+r),2)
    
    if mod1(r, 2) == 2
        median = (x[q,coordinate] + x[q+1,coordinate])/2
    else
        median = q
    end

    if p <= r
        #q = fld((p+r),2)
        if median == x[q,coordinate]
            return q
        elseif median < x[q,coordinate]
            binaryintervalsearch(x[p:q-1,coordinate])
        else
            binaryintervalsearch(x[q:r,coordinate])
        end
    end
    return -1
end





function testfunction(test)
    if test == 1
        x = [1 2; 2 3; 3 0; 4 0; 5 1] 
        delta = 1.5 
        coordinate = 1
        result = binaryintervalsearch(x,delta,coordinate)
        return result
    elseif test == 2
        x = [1 2; 2 0; 3 3; 4 4]
        delta = 0.25
        coordinate = 1
        result = binaryintervalsearch(x,delta,coordinate)
        return result
    elseif test == 3
        x = [1 0; 2 0; 2 0; 3 0; 4 0; 5 0; 5 0]
        delta = 1
        coordinate = 1
        result = binaryintervalsearch(x,delta,coordinate)
        return result
    else 
        return -1
    end
end
