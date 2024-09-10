module Bissection

export bissection

function bissection(f, a, b; tol=1e-7, max_iter=10000)
    fa = f(a)
    fb = f(b)

    if fa * fb > 0
        error("f(a) and f(b) must have different signs")
    end

    iter = 0
    while (b - a) / 2 > tol && iter < max_iter
        c = (a + b) / 2
        fc = f(c)
        println("Iteração $iter: t = $c, f(t) = $fc, erro relativo = $((b - a) / 2)")
        if fc == 0
            return c
        elseif f(a) * fc < 0
            b = c
        else
            a = c
        end
        iter += 1
    end
    return (a + b) / 2
end

end

