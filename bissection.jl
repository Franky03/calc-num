module Bissection

export bissection

function bissection(f, a, b; tol=1e-7, max_iter=10000)
    if f(a) * f(b) > 0
        error("f(a) and f(b) must have different signs")
    end

    iter = 0
    while (b - a) / 2 > tol && iter < max_iter
        c = (a + b) / 2
        if f(c) == 0
            return c
        elseif f(a) * f(c) < 0
            b = c
        else
            a = c
        end
        iter += 1
    end
    return (a + b) / 2
end

end

