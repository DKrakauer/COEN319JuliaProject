#!/usr/bin/julia
using Base.Test

# type Vertex
#     id::Int
#     value::ASCIIString

#     Vertex(x,y) = new(x,y)
# end

# type Edge
#     id::Int
#     v1::Vertex
#     v2::Vertex
#     weight::Int

#     Edge(v,x,y,z) = new(v,x,y,z)
# end

function print(vertex::Vertex{})
  for i=1:1:length(vertex)
    println(vertex[i].id);
  end

  return true;
end


function floyd_warshall(edge_list::Array{Edge})

    n::Int = length(edge_list);
    dist = eye(n);
      i = 1;
      for edge in edge_list
        # println(edge.id);
        # println("index =$(i)");
  
          j = 1;
            for edge in edge_list
              dist[i, j] = 1;
            # println("i = $(i), j = $(j)");
            j += 1;
            end
  
        i += 1;
      end
  
    return true;
  end