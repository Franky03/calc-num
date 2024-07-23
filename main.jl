include("bissection.jl")
using .Bissection
include("false_position.jl")
using .FalsaPosicao
include("newton-rahpson.jl")
using .NewthonRaphson

function v(t)
    u = 200
    M0 = 1600
    c=27
    g=9.8
    
    return (u * log(M0 / (M0 - c*t))) + (g*t) - 100

end

a = 6
b = 8

println("Questão 1: Usando Método da Bissecção")
root = bissection(v, a, b, tol=0.008)
println("Time to reach 100m/s: $root")

println("Questão 4: Usando Método da Falsa Posição")

# Calcular o tempo necessário para que a carga do capacitor caia a 1/3
# da carga inicial, após 0,1 s. (erro menor que 1%)

R = 1.0

function q(t)
    L = 5.0
    C = 1e-4
    
    return exp(-R * t / (2*L)) * cos(sqrt(1/(L*C) - (R/(2*L))^2) * t) - (1/3)
end


root = false_position(q, a, b, tol=0.01)

println("Time to reach 1/3 of the initial charge: $root")

println("Questão 6: Usando o Método Newton-Raphson")

# Determine em que ponto, após a descarga de esgoto, o nível de oxigênio terá
# caído para 4. Calcule com erro menor que 1%.

function f(x)
    return 10 - 15*(exp(-0.1x) - exp(-0.5x)) - 4
end

function df(x)
    return 1.5*exp(-0.1x) - 7.5*exp(-0.5x)
end

x0 = 1.0
tol = 0.01

root = newton_raphson(f, df, x0, tol=tol)

println("Time to reach 4mg/L: $root")