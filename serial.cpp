/**
 * @file serial.cpp
 * @author Colin Rioux <crioux@scu.edu>
 * @author David Krakauer
 * @author Alexandra Kissas
 * 
 */

# include <iostream>
# include <stdio.h>
# include <stdlib.h>
# include <assert.h>
# include <time.h>
# include <cstring>
# include <math.h>

using namespace std;

/**
 * Load in the graph. Based off of the load() function from dijkstra.cpp in problem 3
 * 
 * @param filename 
 * @param num_nodes 
 * @param graph 
 */
static void load(const char * const filename, int * const num_nodes, float ** const graph)
{
    int nnodes;
    float * tmp_graph;
    FILE * fp = fopen(filename, "r");
    assert(fp);

    int ret = fscanf(fp, "%d", &nnodes);
    assert(1 == ret);

    tmp_graph = (float *)malloc(nnodes * nnodes * sizeof(*tmp_graph));
    assert(graph);

    for (int i = 0; i < nnodes; ++i)
    {
        for (int j = 0; j < nnodes; ++j)
        {
            ret = fscanf(fp, "%f", &tmp_graph[i * nnodes + j]);
            assert(1 == ret);
        }
    }

    ret = fclose(fp);
    assert(!ret);

    *num_nodes = nnodes;
    *graph = tmp_graph;
}

/**
 * Unload the graph to a file
 * 
 * @param filename 
 * @param num_nodes 
 * @param graph 
 */
static void unload(const char * filename, const int num_nodes, const float * const graph)
{
    FILE *fp = fopen(filename, "w");
    assert(fp);

    int ret = fprintf(fp, "%d\n", num_nodes);
    assert(ret >= 0);

    for (int i = 0; i < num_nodes; ++i)
    {
        int i_idx = i * num_nodes;
        for (int j = 0; j < num_nodes; ++j)
        {
            if (graph[i_idx + j] == INFINITY)
            {
                ret = fprintf(fp, "inf");
            }
            else
            {
                ret = fprintf(fp, "%f", graph[i_idx + j]);
            }
            assert(ret >= 0);
            if (j != num_nodes - 1)
            {
                ret = fprintf(fp, " ");
                assert(ret >= 0);
            }
        }
        ret = fprintf(fp, "\n");
        assert(ret >= 0);
    }

    ret = fclose(fp);
    assert(!ret);

}

/**
 * Find all shortest paths between all pairs of nodes using Floyd-Warshall's algorithm
 * 
 * @param num_nodes the number of nodes in the graph
 * @param graph the current graph
 */
static void floyd_warshall(const int num_nodes, float * graph)
{
    for (int k = 0; k < num_nodes; ++k)
    {
        int k_idx = k * num_nodes;
        for (int src = 0; src < num_nodes; ++src)
        {
            int src_idx = src * num_nodes;
            for (int dest = 0; dest < num_nodes; ++dest)
            {
                float other = graph[src_idx + k] + graph[k_idx + dest];
                if (graph[src_idx + dest] > other)
                {
                    graph[src_idx + dest] = other;
                }
            }
        }
    }
}

int main(int argc, char **argv)
{
    if (argc < 2)
    {
        cout << "Invalid arguments." << endl;
        cout << "Usage: fw_serial <graph> [<output_file]." << endl;
        return EXIT_FAILURE;
    }

    float * graph;
    int num_nodes;
    clock_t time_start, time_end;

    cout << "Loading graph from " << argv[1] << endl;
    load(argv[1], &num_nodes, &graph);

    cout << "Executing Floyd-Warshall on " << argv[1] << " for all pairs" << endl;
    time_start = clock();
    floyd_warshall(num_nodes, graph);
    time_end = clock();
    printf("Compute Time: %0.06fs\n", (double) ((time_end - time_start) / CLOCKS_PER_SEC));
    
    if (argc >= 3)
    {
        cout << "Writing result to " << argv[2] << endl;
        unload(argv[2], num_nodes, graph);
    }

    return EXIT_SUCCESS;
}