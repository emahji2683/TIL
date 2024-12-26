# 経緯
いつも使用している学習記録アプリのグラフを刷新することを検討している。
この中で、chartkicksの汎用性を向上させるため、chart.jsに変更したいと考えている。

# 課題
chart.jsを上記学習アプリにesbuild経由で導入しようとしたが、表示されない現象が続いていた。

# 仮説
Ransackの実装でもあった通り、``gem同士が干渉している``ことが原因と考えた。

# 実装概要
新規にアプリを立ち上げ、この中でchart.jsが実装できるかどうか検証した。
## 前提条件
- rails7
- esbuild
- "@stimulus-components/chartjs": "^6.0.1",

## 実装の流れ
stimulusのコンポーネントにより、実装してみた。
- パッケージのインストール(yarn)
- 表示用のビューの記述
- javascript/index.jsからのimport
- グラフ概要を記述したコントローラーの作成

# 具体のコード
<details>
<summary>コード一覧</summary>

>terminal
```
yarn add @stimulus-components/chartjs
```
>app/javascript/controllers/index.js
```
import Chart from "@stimulus-components/chartjs";
application.register("chart", Chart);
```
>app/views/charts/index.html.erb
```
<canvas
  data-controller="chart"
  data-chart-data-value="<%= @chart_data.to_json %>"
  data-chart-options-value="<%= @chart_options.to_json %>"
></canvas>
```
>app/controllers/charts_controller.rb
```
 def index
    @chart_data = {
      labels: (Date.today.prev_year..Date.today).select { |day| day.day == 1 }.map { |a| a.strftime('%Y/%m') },
      datasets: [{
        type: 'line',
        label: 'スコア1推移',
        data: [26, 18, 63, 26, 61, 10, 46, 27, 23, 98, 39, 20],
        borderColor: '#F08080',
        backgroundColor: '#F08080',
        yAxisID: 'y'

      }, {
        type: 'line',
        label: 'スコア2推移',
        data: [71, 25, 69, 100, 97, 14, 47, 13, 86, 48, 33, 72],
        borderColor: '#6495ED',
        backgroundColor: '#6495ED',
        yAxisID: 'y'
      }, {
        type: 'line',
        label: 'PV数',
        data: [709, 678, 778, 23, 509, 541,
               666, 505, 563, 104, 972, 324],
        borderColor: '#008000',
        backgroundColor: '#008000',
        yAxisID: 'y1'
      }]
    }

    @chart_options = {
      responsive: true,
      scales: {
        y: {
          type: 'linear',
          display: true,
          position: 'left'
        },
        y1: {
          type: 'linear',
          display: true,
          position: 'right',
          grid: {
            drawOnChartArea: false
          }
        }
      }
    }
  end
```
</details>

# 結果
実装でき、実際に稼働している状況が確認された。

# 参考資料
- [chart.jsを利用してみる](https://qiita.com/youfuku/items/eeb360d892b1f48d5533)
