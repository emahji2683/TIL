# 深さ優先探索とは

> 深さ優先探索（depth-first search, DFS）は大雑把に言うと，とにかく行けるとこまで行ってそれ以上進めなくなったら一歩戻ってまた探索するという方法です

# 具体のコード
- 最初引数として、start=Aを渡す。
- visitedの配列の中にstartが含まれていれば、処理を終了する。
- Aをvisitedに追加する。
- Aの周りのリンクのそれぞれに対して同様の処理を行う(visitedに含まれていなければ、visitedに対象の配列を追加する。)。
- 今回の場合、Bが追加される。

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
