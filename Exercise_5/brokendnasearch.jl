### Denne må med når en tester lokalt ###
# (try-catch er bare for å unngå feilmelding om redefinition of constant struct)
try
	mutable struct Node
    	children::Dict{Char,Node}
    	count::Int
	end
catch
	println("Node() allerede definert")
end




### Du skal implementere denne funksjonen ###
function brokendnasearch(root, dna, i=1)
	# din kode
end




### Konstruert testdata, la stå ###
root1 = Node(Dict('A' => Node(Dict{Char,Node}(), 1)), 0)
root2 = Node(Dict('A' => Node(Dict('G' => Node(Dict('T' => Node(Dict('A' => Node(Dict{Char,Node}(), 1),'T' => Node(Dict{Char,Node}(), 1),'C' => Node(Dict{Char,Node}(), 1)), 4)), 5)), 5)), 0)
root3 = Node(Dict('C' => Node(Dict('C' => Node(Dict('C' => Node(Dict('C' => Node(Dict('C' => Node(Dict('C' => Node(Dict{Char,Node}(), 1)), 2)), 3)), 4)), 5)), 6)), 0)

s1 = "A"
s2 = "T"
s3 = "?"
s4 = "??"
s5 = "C?C"
s6 = "???"
s7 = "?????"




### Tester ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test brokendnasearch(root1, s1) == 1
	@test brokendnasearch(root1, s2) == 0
	@test brokendnasearch(root1, s3) == 1
	@test brokendnasearch(root1, s4) == 0
	@test brokendnasearch(root2, s1) == 5
	@test brokendnasearch(root2, s3) == 5
	@test brokendnasearch(root2, s4) == 5
	@test brokendnasearch(root2, s5) == 0
	@test brokendnasearch(root2, s6) == 4
	@test brokendnasearch(root3, s5) == 4
	@test brokendnasearch(root3, s6) == 4
	@test brokendnasearch(root3, s7) == 2
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")