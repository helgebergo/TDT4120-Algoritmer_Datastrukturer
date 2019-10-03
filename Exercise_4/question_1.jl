function countingsortletters(A,position)
    k = 26  # max value, since letters are only a-z lowercase.
    #= B = []
    #zeros(Int64,length(A))  # output
    for i in 1:length(A)
        push!(B,"")
    end  =#

    B = Array{Any}(undef, size(A, 1)) # output array

    C = zeros(1,k)   # counting array
    for j in 1:length(A)
        C[chartodigit(A[j][position])] += 1
    end

    for  i in 2:k
        C[i] = C[i] + C[i-1]
    end

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
