# コード

```
h, w = gets.split.map(&:to_i)
board = []
h.times { board << gets.chomp.chars }

y, x = gets.split.map(&:to_i)

# 反転する関数
def flip(c)
  c == '#' ? '.' : '#'
end

# 隣接するマス（自己含む）の座標
directions = [[0, 0], [1, 0], [-1, 0], [0, 1], [0, -1]]

# 反転処理
directions.each do |dy, dx|
  ny, nx = y + dy, x + dx
  if ny.between?(0, h - 1) && nx.between?(0, w - 1)  # 範囲内の座標に対して処理
    board[ny][nx] = flip(board[ny][nx])
  end
end

# 結果を出力
board.each { |row| puts row.join }
```

