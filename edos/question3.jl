using Plots

P0 = 50976.0          # População inicial
b = 2.9e-2          # Taxa de nascimento
k = 1.4e-7          # Taxa de mortalidade

# dP/dt = bP - kP^2
function dPdt(P, t)
    return b*P - k*P^2
end

function runge_kutta(P0, t0, tf, dt)
    t_values = t0:dt:tf
    P_values = [P0]

    P = P0
    for t in t_values[2:end]
        k1 = dt * dPdt(P, t)
        k2 = dt * dPdt(P + 0.5 * k1, t + 0.5 * dt)
        k3 = dt * dPdt(P + 0.5 * k2, t + 0.5 * dt)
        k4 = dt * dPdt(P + k3, t + dt)
        P += (k1 + 2*k2 + 2*k3 + k4) / 6
        push!(P_values, P)
    end

    return t_values, P_values
end

t0 = 0.0   # Tempo inicial (anos)
tf = 5.0   # Tempo final (anos)
dt = 0.1   # Passo de tempo (anos)

t_values, P_values = runge_kutta(P0, t0, tf, dt)

plot(t_values, P_values, xlabel="Tempo (anos)", ylabel="População", label="População", lw=2)
savefig("populacao.png")

println("População após 5 anos: ", P_values[end])
open("population.txt", "w") do file
    for i in eachindex(t_values)
        println(file, "Tempo: ", round(t_values[i], digits=4), " anos -> População: ", round(P_values[i], digits=4))
    end
    println(file, "População após 5 anos: ", P_values[end])
end