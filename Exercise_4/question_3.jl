## Hvis du bruker denne, kan jeg desverre ikke gi ut LF
## Da må du fylle den ut selv
function countingsortletters(A,position)
    k = 26  # max value, letters are only a-z lowercase
    B = Array{Any}(undef, size(A, 1)) # output array
    C = zeros(1,k)   # counting array

    # count letters in A
    for j in 1:length(A)
        C[chartodigit(A[j][position])] += 1
    end

    # accumulate C
    for  i in 2:k
        C[i] = C[i] + C[i-1]
    end

    # go backwards through C, fill in B with correct sorted value from A
    for j in length(A) :-1 : 1
        B[Int(C[chartodigit(A[j][position])])] = A[j]
        C[chartodigit(A[j][position])] -= 1
    end
    return B
end


function chartodigit(character)
    #Dette er en hjelpefunksjon for å få omgjort en char til tall
    #Den konverterer 'a' til 1, 'b' til 2 osv.
    #Eksempel: chartodigit("hei"[2]) gir 5 siden 'e' er den femte bokstaven i alfabetet.

    return character - '`'
end

## Hvis du bruker denne, kan jeg desverre ikke gi ut LF
## Da må du fylle den ut selv
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
        B[Int8(C[length(A[j])+1])] = A[j]
        C[length(A[j])+1] -= 1 
    end
    return B
end

## Du skal implementere denne funksjonen 
function flexradix(A, maxlength)
    B = countingsortlength(A)
    for i in maxlength-1:1
        B = countingsortletters(B,i)
    end
    return B
end





### Tests ###
# Disse testene blir kjørt når du kjører filen
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