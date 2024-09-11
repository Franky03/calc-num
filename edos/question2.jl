using Plots

# parameters
m = 0.11 # massa (kg)
g = 9.8 # gravidade (m/s^2)
k = 0.002 # constante de atrito do ar (kg/m)
v0 = 8.0 # velocidade inicial (m/s)

# dv/dt = (mg - kv|v|) / m
function dvdt(v, t)
    return (m*g - k * v * abs(v)) / m
end

function runge_kutta(v0, t0, tf, dt)
    t_values = t0:dt:tf
    v_values = [v0]

    v = v0
    for t in t_values[2:end]
        k1 = dt * dvdt(v, t)
        k2 = dt * dvdt(v + 0.5 * k1, t + 0.5 * dt)
        k3 = dt * dvdt(v + 0.5 * k2, t + 0.5 * dt)
        k4 = dt * dvdt(v + k3, t + dt)
        v += (k1 + 2*k2 + 2*k3 + k4) / 6
        push!(v_values, v)
    end

    return t_values, v_values
end

t0 = 0.0   # tempo inicial (s)
tf = 1.0   # tempo final (s)
dt = 0.1   # passo de tempo (s)

t_values, v_values = runge_kutta(v0, t0, tf, dt)

println("Velocidades em diferentes tempos:")
open("velocities.txt", "w") do file
    for i in eachindex(t_values)
        println(file, "Tempo: ", round(t_values[i], digits=4), " s -> Velocidade: ", round(v_values[i], digits=4), " m/s")
    end
end
plot(t_values, v_values, label="Velocidade (m/s)", xlabel="Tempo (s)", ylabel="Velocidade (m/s)", title="Velocidade ao longo do tempo", legend=:bottomright)
savefig("velocity.png")