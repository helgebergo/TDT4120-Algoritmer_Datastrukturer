s = []
push!(s, 2)
push!(s, 5)
println(s)    # gir lista [2,5]
println(s[1]) # dette gir verdien 2
x = pop!(s)
println(x)    # dette gir verdien 5



# Visste du at funksjoner kan ha emoji i navnet?  💯
function reverseandlimit(array, maxnumber)
    #rev_array = Vector{Int}(undef, length(array))
    rev_array=[]
    for i in 1:length(array)
        #rev_array[i] = pop!(array)
        x = pop!(array)
        push!(rev_array,x)
        if rev_array[i] > maxnumber
            rev_array[i] = maxnumber
        end
    end
    
    return rev_array
end

