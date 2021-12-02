# Floyd-Warshall algorithm: https://rosettacode.org/wiki/Floyd-Warshall_algorithm
# v0.6

using Printf # @sprintf
using Graphs, SimpleWeightedGraphs # JuliaGraphs, floyd-floyd_warshall_shortest_paths, SimpleWeightedDiGraph
using GraphPlot # gplot
using DelimitedFiles # readdlm
using BenchmarkTools # @btime
using TickTock
# using PyCall

import Graphs.Parallel

# return next
function print_result(dist, next)
    println("pair     dist    path")
    for i in 1:size(next, 1), j in 1:size(next, 2)
        if i != j
            u = i
            path = @sprintf "%d -> %d    %2d     %s" i j dist[i, j] i
            while true
                u = next[u, j]
                path *= " -> $u"
                if u == j break end
            end
            println(path)
        end
    end
end

function floyd_warshall(weights::Matrix, nvert::Int)
    dist = fill(Inf, nvert, nvert) #fill returns an arr
    for i in 1:size(weights, 1)
        dist[weights[i, 1], weights[i, 2]] = weights[i, 3]
    end
    # return dist
    next = collect(j != i ? j : 0 for i in 1:nvert, j in 1:nvert)
 
    for k in 1:nvert, i in 1:nvert, j in 1:nvert
        if dist[i, k] + dist[k, j] < dist[i, j]
            dist[i, j] = dist[i, k] + dist[k, j]
            next[i, j] = next[i, k]
        end
    end
    print_result(dist, next)
end


function runTests()
    
    # floyd_warshall([1 3 -2; 2 1 4; 2 3 3; 3 4 2; 4 2 -1], 4)
    # write new graph file with 0s for Inf

    # create matrix from graph file
    # m = readdlm("test/5j.graph")
    x = readdlm("test/5.graph")
    n = x[1,1]
    x = x[2:6, 1:5]
    for n in eachindex(x)
        if isinf(x[n])
            x[n] = 0
        end
        # println(n)
    end

    # create graph from matrix
    convert(Matrix{Float64}, x)
    m = Matrix{Float64}(x)
    g1 = SimpleWeightedDiGraph(m)

    # run floyd'warshall parallel
    tick()
    enumerate_paths(Graphs.floyd_warshall_shortest_paths(g1))
    tock()

    g2 = SimpleWeightedDiGraph(m)
    tick()
    enumerate_paths(Parallel.floyd_warshall_shortest_paths(g2))
    tock()

    # run dijkstra across all sources
    # enumerate_paths(dijkstra_shortest_paths(g, vertices(g)))

    # g = SimpleWeightedGraph()
    # enumerate_paths(floyd_warshall_shortest_paths(g, w, true))
    

end

runTests()

