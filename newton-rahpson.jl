module NewthonRaphson

export newton_raphson

function newton_raphson(f, df, x0; tol=1e-7, max_iter=10000)
    x = x0
    for iter in 1:max_iter
        fx = f(x)
        dfx = df(x)

        if abs(dfx) < 1e-10
            error("Derivada próxima de zero, método pode falhar.")
        end

        x_new = x - fx / dfx
        println("Iteração $iter: x = $x_new, f(x) = $fx")

        if abs(x_new - x) < tol
            return x_new
        end

        x = x_new
    end

    error("Número máximo de iterações atingido.")
end

end