function backtrack(pathweights)
	rows, cols = size(pathweights)
	j = argmin(pathweights[rows,:])
	path = []
	push!(path,(rows,j))
	for i in rows-1:-1:1
		if j == 1
			j = argmin(pathweights[i,j:j+1])
		elseif j == cols
			if pathweights[i,j-1] <= pathweights[i,j]
				j -= 1
			end
		else
			if pathweights[i,j-1] <= pathweights[i,j] && pathweights[i,j-1] <= pathweights[i,j+1]
				j -= 1
			elseif pathweights[i,j] <= pathweights[i,j-1] && pathweights[i,j] <= pathweights[i,j+1]
				
			elseif pathweights[i,j+1] <= pathweights[i,j] && pathweights[i,j+1] <= pathweights[i,j-1]
				j += 1
			end
		end
		push!(path,(i,j))
		display(path)
	end
	return path
end



### Tester ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!
printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test backtrack([1 1 ; 2 2]) == [(2,1),(1,1)]
	@test backtrack([3  6  8  6  3; 10 9  11 10 6; 13 19 13 7  12; 23 17 10 8  9; 23 11 15 11 17]) == [(5,2), (4,3), (3,4), (2,5), (1,5)]
	@test backtrack([80 25 28 2 98 35; 37 57 4 64 101 133; 44 86 89 14 83 194; 119 141 28 109 76 99; 199 114 66 38 138 162; 145 112 110 78 118 150]) == [(6,4), (5,4), (4,3), (3,4), (2,3), (1,4)]
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")