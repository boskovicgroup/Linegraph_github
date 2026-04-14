%% function that takes in a graph G and produces linegraph LG
function LG = linegraph(G)
    % G is a graph or digraph
    E = G.Edges;
    numE = size(E,1);

    % Line graph adjacency (sparse)
    ii = [];
    jj = [];

    % Extract endpoints of each edge
    endpoints = G.Edges.EndNodes;

    % Compare each pair of edges
    for e1 = 1:numE
        for e2 = e1+1:numE
            % Check if the two edges share a node
            if ~isempty(intersect(endpoints(e1,:), endpoints(e2,:)))
                ii = [ii; e1; e2];
                jj = [jj; e2; e1];
            end
        end
    end

    % Create the line graph
    LG_temp= graph(ii, jj);
    LG_A = adjacency(LG_temp);
    LG = graph(LG_A, 'upper');
end
