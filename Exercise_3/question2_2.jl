function binaryintervalsearch(x, delta, coordinate)
    result = []
    N = size(x)[1]

    error = []
    push!(error,-1)
    push!(error,-1)

    if N % 2 == 0
        q = fld(N,2)
        median = (x[q,coordinate] + x[q+1,coordinate])/2
    else
        median = x[div(N,2)+1,coordinate]
    end
    
    lower_bound = median - delta
    upper_bound = median + delta
    count_lower = 1
    count_upper = 1
    
    for i in 1:N
        if x[i,coordinate] >= lower_bound
            push!(result,count_lower)
            break
        else
            count_lower += 1
        end
    end

    for j in 1:N
        if x[j,coordinate] > upper_bound
           push!(result,count_upper-1)
           break
        else
            count_upper += 1
        end
    end
    
    if length(result) == 1
        push!(result,N)
    end

    if length(result) <= 1
        return error
    elseif result[1] > result[2]
        return error
    end
    
    return result

end
    
    x = [1 2; 2 3; 3 0; 4 0; 5 1]
    delta = 1.5
    coordinate = 1
    
    print(binaryintervalsearch(x,delta, coordinate))
    