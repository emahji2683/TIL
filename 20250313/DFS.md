# 深さ優先探索(DFS)とは
DFS(Depth-FirstSearch)の略である。

# 具体のコード
## コード

```
graph = { 'A' => ['B', 'C'], 'B' => ['D', 'E'], 'C' => ['F'], 'D' => [], 'E' => ['F'], 'F' => [] }

def dfs(graph, start, visited = [])
  return if visited.include?(start)

  puts start
  visited << start
  graph[start].each { |neighbor| dfs(graph, neighbor, visited) }
end

dfs(graph, 'A')
```
