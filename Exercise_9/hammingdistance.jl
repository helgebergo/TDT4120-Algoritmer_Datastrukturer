function hammingdistance(s1, s2)
    unsimilar = 0
    for c in s1
        if s1[c] != s2[c]
            unsimilar += 1
        end
    end
    
    return unsimilar

end