function gauss_seidel(epsilon, max_iter=100)
    # chute inicial para as variáveis
    x1 = 0.0
    x2 = 0.0
    x3 = 0.0

    erro = 1.0
    iter = 0

    while erro > epsilon
        x1_old, x2_old, x3_old = x1, x2, x3
        x1 = (1 + x2 - x3) / 3
        x2 = (-2*x3 - 3*x1)/6
        x3 = (-3*x1-3*x2)/7

        erro = max(abs(x1 - x1_old), abs(x2 - x2_old), abs(x3 - x3_old))

        iter += 1
    end

    println("Solução encontrada após ", iter, " iterações:")
    println("x1 = ", x1)
    println("x2 = ", x2)
    println("x3 = ", x3)
    println("Erro = ", erro)
end

epsilon = 0.001
max_iter = 400

gauss_seidel(epsilon, max_iter)

