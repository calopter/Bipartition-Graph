def bipartite? adj, i, colors
  q = [i]
  colors[i] = 1

  while !q.empty?
    u = q.shift
    adj[u].each do |v|
      if colors[v] == -1
        colors[v] = 1 - colors[u]
        q << v
      elsif colors[u] == colors[v]
        return false
      end
    end
  end
  return true
end

def possible_bipartition dislikes
  colors = Array.new(dislikes.length, -1)

  dislikes.each_index do |i|
    if colors[i] == -1
      return false unless bipartite? dislikes, i, colors
    end
  end
  return true
end
