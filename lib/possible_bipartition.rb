def bipartite? adj, i, colors
  q = [i]
  colors[i] = true

  while !q.empty?
    u = q.shift
    adj[u].each do |v|
      if colors[v] == nil
        colors[v] = !colors[u]
        q << v
      elsif colors[u] == colors[v]
        return false
      end
    end
  end
  return true
end

def possible_bipartition dislikes
  colors = []

  dislikes.each_index do |i|
    if colors[i] == nil
      return false unless bipartite? dislikes, i, colors
    end
  end
  return true
end
