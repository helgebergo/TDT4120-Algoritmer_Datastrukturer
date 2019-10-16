
module Resize

using Images, ImageFiltering

export reduce_width

function path_weights(weights)
    #Din kode her
end

function back_track(path_weights)
    #Din kode her
end

function gradiant(image)
    kernel = [1 0 -1; 2 0 -2;1 0 -1]
    sobel_x = imfilter(image, centered(kernel))
    grad = imfilter(sobel_x, centered(kernel'))
end

function absolute_gradiant(image)
    height, width = size(image)
    grad = gradiant(image)
    reshape([abs(pixel.r)+abs(pixel.g)+abs(pixel.b) for pixel in grad],height,width)
end

function reduce_width(image_url, reduction)
    image = load(image_url)

    for i in 1:reduction
        h, w = size(image)

        #=
        Det finnes mange måter å gi hver piksel en vekt.
        Her brukes summen av absoluttverdiene avgradientene,
        men det kan endres om man vil.
        =#
        weights = absolute_gradiant(image)
        cumulative_weights = path_weights(weights)

        #=
        Her bruker vi stien vi finner med back_track til å lage en boolsk
        matrise der cellene vi ønsker å fjerne fra bildet har verdien false
        =#
        crop_matrix = ones(Bool,h,w)
        for (i,j) in back_track(cumulative_weights)
            crop_matrix[i,j] = false
        end

        #=
        Et boolsk oppslag i matrisen vår fjerner alle celler der den boolske
        matrisen er false. Fordi resultatet av et slikt oppslag er en 1-dimensjonell
        matrise så bruker vi reshape for å få originalformen tilbake, minus den ene
        pikselen vi har fjernet i bredden.
        =#
        image = reshape(image'[crop_matrix'],w-1,h)'
    end

    image
end

function main()
    reduce_width("tower.jpg",200)
end

end
