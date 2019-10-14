function lislength(s)
    mls = zeros(Int, size(s))
    mls[1] = 1
    @show s
    for i = 2:length(s)
        # Din kode her
        k = 1
        for j = 1:i
            if s[i] > s[j] && mls[j] >= k
                k += 1
            end
        end
        mls[i] = k
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



printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test lislength([5,3,3,6,7]) == 3
	@test lislength([2,2,2,2]) == 1
	@test lislength([100,50,25,10]) == 1
	@test lislength([0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]) == 6
	@test lislength([682, 52, 230, 441, 1000, 22, 678, 695, 0, 681]) == 5
	@test lislength([441, 1000, 22, 678, 695, 0, 681, 956, 48, 587, 604, 857, 689, 346, 425, 513, 476, 917, 114, 43, 327, 172, 162, 76, 91, 869, 549, 883, 679, 812, 747, 862, 228, 368, 774, 838, 107, 738, 717, 25, 937, 927, 145, 44, 634, 557, 850, 965]) == 12
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")