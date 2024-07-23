using Symbolics


@variables F i n P

A = (F*i) / (1- (1+i)^(-n)) - P

println(Symbolics.derivative(A, i))
dA_di = expand_derivatives(Symbolics.derivative(A, i))

println(dA_di)