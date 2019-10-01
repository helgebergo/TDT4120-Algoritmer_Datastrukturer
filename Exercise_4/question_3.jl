## Hvis du bruker denne, kan jeg desverre ikke gi ut LF
## Da må du fylle den ut selv
function countingsortletters(A,position)
	# TODO hvis du vil bruke den
end

## Hvis du bruker denne, kan jeg desverre ikke gi ut LF
## Da må du fylle den ut selv
function countingsortlength(A)
    # TODO hvis du vil bruke den
end

## Du skal implementere denne funksjonen 
function flexradix(A, maxlength)
    # TODO
end





### Tests ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere! 

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Basic tests" begin
    @test flexradix(["d", "c", "b", "a"], 1) == ["a", "b", "c", "d"]
    @test flexradix(["d", "c", "b", ""], 1) == ["", "b", "c", "d"]
    @test flexradix(["jeg", "elsker", "deg"], 6) == ["deg", "elsker", "jeg"]
    @test flexradix(["denne", "oppgaven", "mangler", "emojies"], 8) == ["denne", "emojies", "mangler", "oppgaven"]
    @test flexradix(["kobra", "aggie", "agg", "kort", "hyblen"], 6) == ["agg", "aggie", "hyblen", "kobra", "kort"] # Fra oppgaven
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")