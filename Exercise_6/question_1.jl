function lislength(s)
    mls = zeros(Int, size(s))
    mls[1] = 1
    #@show mls
    for i = 2:length(s)
        # Din kode her
        if s[i] > s[i-1]
            mls[i] += 1 
        #else
        end
        @show mls
        mls[i] += mls[i-1]
        @show mls
    end
    return maximum(mls) # Returnerer det største tallet i listen
end


function testing()
    s = [5,3,3,6,7]
    s_long = [5, 10, 14, 5, 3, 2, 10, 14, 22, 134, 25, 46, 56, 43, 32, 4, 19, 140]
    return lislength(s_long)

end

testing()