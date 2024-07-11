include("bissection.jl")
using .Bissection
include("false_position.jl")
using .FalsaPosicao

function f(x)
    return x^5 - 2*x^3 - 5x + 1
end

a = -1.33
b = 1.33

root = bissection(f, a, b)
println("Root With Bissection: $root")

root = false_position(f, a, b)
println("Root With False Position: $root")
