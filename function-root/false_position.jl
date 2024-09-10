module FalsaPosicao

export false_position

function false_position(f,a,b; tol=1e-7, max_iter=1000)
    if f(a) * f(b) > 0
        error("f(a) and f(b) must have different signs")
    end

    iter = 0
    c = a
    while (b-a) > tol && iter < max_iter # enquanto o valor não for muito menor que a tolerancia...
        c = b - f(b) * (b - a) / (f(b) - f(a)) # calcula o novo valor de c
        if f(c) == 0
            return c
        elseif f(a) * f(c) < 0
            b = c
        else
            a = c
        end
        iter += 1
       
    end
   
    return c
end

end