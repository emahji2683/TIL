
# 処理の概要
碁盤状の文字列の内指定した文字の置き換えを行う。

# 処理方法
まずは、初期の碁盤形状を配列として格納する。配列の要素順がy(行)に相当また、x(列)がその配列の中身に相当する。

# 標準入力から値を取得
h, w = gets.chomp.split.map(&:to_i) # 行数と列数を取得
board = []                         # 盤面を格納する配列

# 盤面を読み取る
h.times do
  board << gets.chomp.chars        # 各行を文字の配列に変換して格納
end

# 書き換える座標を取得
y, x = gets.chomp.split.map(&:to_i)

# 盤面の指定された座標の文字を書き換え
if board[y][x] == "."
  board[y][x] = "#"                # "." を "#" に書き換え
else
  board[y][x] = "."                # "#" を "." に書き換え
end

# 書き換え後の盤面を出力
board.each do |row|
  puts row.join                   # 配列を文字列に戻して出力
end
