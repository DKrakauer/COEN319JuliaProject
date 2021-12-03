# Floyd-Warshall algorithm: https://rosettacode.org/wiki/Floyd-Warshall_algorithm
# v0.6

using Printf # @sprintf
using Graphs, SimpleWeightedGraphs # JuliaGraphs, floyd-floyd_warshall_shortest_paths, SimpleWeightedDiGraph
using GraphPlot # gplot
using DelimitedFiles # readdlm
using BenchmarkTools # @btime
using TickTock
using Base.Threads
# using PyCall

import Graphs.Parallel

# return next

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
    return dist
end

function floyd_warshall_parallel(g::SimpleWeightedDiGraph{Int64, Float64})
    distmx = weights(g)
    n = nv(g)
    dist = fill(Inf, (Int(n), Int(n)))

    for v in 1:n
        dist[v,v] = 0.0
    end

    for e in edges(g)
        u = src(e)
        v = dst(e)
        dist[u, v] = min(distmx[u, v], dist[u, v])
    end

    for k in vertices(g)
        @threads for j in 1:n
            d = dist[k, j]
            if d != Inf && j != k
                for i in 1:n
                    if dist[i, k] == Inf || i == k
                        ans = Inf
                    else
                        ans = dist[i,k] + d
                    end

                    if dist[i,j] > ans
                        dist[i,j] = ans
                    end
                end
            end
        end
    end

    return dist
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
    g = SimpleWeightedDiGraph(m)

    # run floyd'warshall parallel
    # tick()
    # r = Graphs.floyd_warshall_shortest_paths(g)
    # println(r)
    # tock()

    tick()
    r = Parallel.floyd_warshall_shortest_paths(g)
    println(r)
    tock()

    tick()
    r = floyd_warshall_parallel(g)
    println(r)
    tock()

    

    # run dijkstra across all sources
    # enumerate_paths(dijkstra_shortest_paths(g, vertices(g)))

    # g = SimpleWeightedGraph()
    # enumerate_paths(floyd_warshall_shortest_paths(g, w, true))
    

end

runTests()

