function P(h)
    return 5 * h^2 + 3 * h + 2
end

h_inicial = 0 
h_final = 10
n = 5

delta_h = (h_final - h_inicial) / n

function regra_dos_trapezios_generalizada()
    soma = P(h_inicial) + P(h_final) # soma dos valores nas extremidades

    for i in 1:(n-1)
        h_i = h_inicial + i * delta_h
        soma += 2 * P(h_i)
    end

    area = (delta_h / 2) * soma
    return area
end

area_total = regra_dos_trapezios_generalizada()
println("A pressão total estimada sobre a parede da barragem é: ", area_total)
    