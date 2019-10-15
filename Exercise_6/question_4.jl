function backtrack(pathweights)
	rows, cols = size(pathweights)
	#path = zeros(rows,2)
	j = argmin(pathweights[rows,:])
	path = []
	#path[1,:] = (rows,j)
	push!(path,(rows,j))
	for i in rows-1:-1:1
		if j == 1
			j = argmin(pathweights[i,j:j+1])
		elseif j == cols
			j = argmin(pathweights[i,j-1:j]) + cols - 2
		else
			j = argmin(pathweights[i,j-1:j+1])
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
    #Dette er samme eksempel som det vist i oppgaveteskten
	@test backtrack([3  6  8  6  3; 10 9  11 10 6; 13 19 13 7  12; 23 17 10 8  9; 23 11 15 11 17]) == [(5,2), (4,3), (3,4), (2,5), (1,5)]
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")