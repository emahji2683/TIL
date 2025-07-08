# DFSについて
深さ優先探索のこと。


# 処理とコード
`start`: DFS探索を開始するノード
`visited`: 訪れたことのある全てのノード
`grapf`: DFS処理を行うグラフの。
`graph[start]`: DFS探索開始ノードに隣接するノード
`neghbor`: `graph[start]`を展開したもの。現在のノードに隣接するあるノードのこと。

`visited << start`: 現在探索を行う前提のノードを訪れたことのある配列に加える。 
`graph[start].each do |neighbor|`: 現在いるノードの隣接ノードを全て展開する。
`  dfs(graph, neighbor, visited) unless visited.include?(neighbor)`: それぞれの要素について、同様の処理(要素の来訪済み配列への追加、隣接ノードの展開)を行う。
`end`

```
def dfs(graph, start, visited = [])
  visited << start
  graph[start].each do |neighbor|
    dfs(graph, neighbor, visited) unless visited.include?(neighbor)
  end
  visited
end

graph = {
  0 => [1, 2],
  1 => [0, 3, 4],
  2 => [0],
  3 => [1],
  4 => [1]
}
start = 0
result = dfs(graph, start)
puts result.inspect  # 出力: [0, 1, 3, 4, 2]
```
