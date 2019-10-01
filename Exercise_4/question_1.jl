function countingsortletters(A,position)

for j in 2 : length(A)
key = A[j]
#println(key)
i = j-1
    while i > 0 && A[i][position] > key[position]
        A[i+1] = A[i]
        i = i-1
        end
    A[i+1] = key
    end
return A
end

#A = ["ccc", "cba", "ca", "ab", "abc"]

#print(countingsortletters(A,2))

function chartodigit(character)
    #Dette er en hjelpefunksjon for å få omgjort en char til tall
    #Den konverterer 'a' til 1, 'b' til 2 osv.
    #Eksempel: chartodigit("hei"[2]) gir 5 siden 'e' er den femte bokstaven i alfabetet.

    return character - '`'
end

using Test
@testset "Basic tests" begin
    @test countingsortletters(["aa", "bb", "cc"], 1) == ["aa", "bb", "cc"]
    @test countingsortletters(["cc", "bb", "aa"], 2) == ["aa", "bb", "cc"]
    @test countingsortletters(["ac", "bb", "ca"], 2) == ["ca", "bb", "ac"]
    @test countingsortletters(["ccc", "cba", "ca", "ab", "abc"], 2) == ["ca", "cba", "ab", "abc", "ccc"]
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")
