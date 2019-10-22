## Du skal implementere denne funksjonen 
function countingsortlength(A)
    k = maximum(length.(A)) + 1 # Maximum, plus 1 offset because of "" string
    B = Array{Any}(undef, size(A, 1)) # output array
    C = zeros(1,k)   # counting array

    # count length of elements in A
    for j in 1:length(A)
        C[length(A[j])+1] += 1
    end

    # accumulate C
    for  i in 2:k
        C[i] = C[i] + C[i-1]
    end

    # go backwards through C, fill in B with correct sorted value from A
    for j in length(A) :-1 : 1
        B[Int(C[length(A[j])+1])] = A[j]
        C[length(A[j])+1] -= 1 
    end
    return B
end



### Tests ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere! 

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Basic tests" begin
    @test countingsortlength(["ccc", "bb", "a"]) == ["a", "bb", "ccc"]
    @test countingsortlength(["aaa", "bb", "c"]) == ["c", "bb", "aaa"]
    @test countingsortlength(["bb", "a", ""]) == ["", "a", "bb"] # Testen her sjekker om du kan sortere også med emtpy string
    @test countingsortlength(["bbbb", "aa", "aaaa", "ccc"]) == ["aa", "ccc", "bbbb", "aaaa"] # Fra oppgaven
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")
