#Bruteforce: Regne ut alle avstandene for å finne den minste avstand mellom to punkter
function bruteforce(x)
    minimum = 10000

    for i in 1:size(x,1)
        for j in 2:size(x,1)
            x_d = x[i, 1] - x[j, 1]
            y_d = x[i, 2] - x[j, 2]
            
            length = sqrt(x_d^2 + y_d^2)
            if length < minimum && length > 0
                minimum = length
            end
        end
    end
    #@show minimum
    return minimum
end




x = [1 1; 10 0; 2 2; 5 5]
 
minimum = bruteforce(x)
@show minimum
