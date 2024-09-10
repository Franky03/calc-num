function euler(f, y0, x0, h, x_final)
    n = Int((x_final - x0) / h) # Number of steps
    x = x0 # Initial x value
    y = y0 # Initial y value
    
    for i in 1:n # Loop over the number of steps
        y += h * f(x, y) # Euler's method
        x += h # Increment x
    end
    
    return y # Return the final y value
end

# Definindo a função derivada de y, a partir de 2x + y * y' = y^2
# y' = (y^2 - 2x) / y

function dydx(x, y)
    return (y^2 - 2*x) / y
end

# Método de Runge-Kutta de 3ª ordem
function runge_kutta_3(f, y0, x0, h, x_final)
    n = Int((x_final - x0) / h) # Number of steps
    x = x0 # Initial x value    
    y = y0 # Initial y value

    for i in 1:n # Loop over the number of steps
        k1 = h * f(x, y)
        k2 = h * f(x + h/2, y + k1/2)
        k3 = h * f(x + h, y - k1 + 2*k2)

        y += (k1 + 4*k2 + k3) / 6
        x += h
    end
    return y
end

function exact_solution(x)
    return sqrt(2x + 1)
end

y0 = 1.0
x0 = 0.0

h = 0.2
x_final = 1.0

y_euler = euler(dydx, y0, x0, h, x_final)
y_rk3 = runge_kutta_3(dydx, y0, x0, h, x_final)

y_exact = exact_solution(x_final)

erro_euler = abs(y_exact - y_euler)
erro_rk3 = abs(y_exact - y_rk3)

println("Método de Euler: y(1) = ", y_euler)
println("Erro absoluto (Euler): ", erro_euler)

println("Método de Runge-Kutta de 3ª ordem: y(1) = ", y_rk3)
println("Erro absoluto (Runge-Kutta): ", erro_rk3)

