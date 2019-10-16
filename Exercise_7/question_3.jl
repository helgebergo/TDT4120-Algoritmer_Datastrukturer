function usegreed(coins)
  n = length(coins)
  isgreedy = true
  for i in 1:n-1
    if coins[i] % coins[i+1] == 0
      isgreedy = true
    else
      return false
    end
  end
  return isgreedy
end

function mincoinsgreedy(coins, value)
  mincoins = 0.0
  i = 1
  while value > 0
    rest = value % coins[i]
    mincoins += fld(value,coins[i])
    value = rest
    i += 1
  end
  return mincoins
end

function mincoins(coins, value)
  greedy = usegreed(coins)
  if greedy
    mincoins = mincoinsgreedy(coins,value)
  else
    mincoins = 0.0
    i = 1
  end
  return mincoins
end



### Tester ###
# Disse testene blir kjørt når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n\n---------------\nKjører tester\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test mincoins([4,3,1],18) == 5
  @test mincoins([1000,500,100,30,7,1],14) == 2
  @test mincoins([40, 30, 20, 10, 1], 90) == 3
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")