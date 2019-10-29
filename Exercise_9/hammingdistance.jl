function hammingdistance(s1::String, s2::String)
    unsimilar = 0
    for c in 1:length(s1)
        if s1[c] != s2[c]
            unsimilar += 1
        end
    end
    return unsimilar
end