using Plots

frequencia = [1, 10, 100, 200, 500, 1000, 10000, 100000, 1000000, 2000000, 10000000]
tensao_saida = [-18.5e-6, -75e-6, 10.24e-3, 26.81e-3, 67.3e-3, 101e-3, 119.2e-3, 117e-3, 51.54e-3, 27.85e-3, 5.69e-3]
tensao_entrada = [1e-3 for _ in frequencia]

ganho_av = [abs(ts/te) for (ts, te) in zip(tensao_saida, tensao_entrada)]
ganho_avdb = [20*log10(g) for g in ganho_av]

println("Frequência | Ganho Av | Ganho Av (dB)")
for (f, av, avdb) in zip(frequencia, ganho_av, ganho_avdb)
    println("$(f) Hz | $(av) | $(avdb) dB")
end

plot(frequencia, ganho_avdb, xscale=:log10, xlabel="Frequência (Hz)", ylabel="Ganho (dB)", title="Gráfico de Bode", seriestype=:scatter)
plot!(frequencia, ganho_avdb, xscale=:log10, seriestype=:line)
savefig("bode_graph.png")