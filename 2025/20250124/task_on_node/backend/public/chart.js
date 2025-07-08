
const ctx = document.getElementById('myChart').getContext('2d');

// Chart.js の設定
const myChart = new Chart(ctx, {
  type: 'line', // グラフの種類（line, bar, pie など）
  data: {
    labels: ['January', 'February', 'March', 'April', 'May'], // X軸のラベル
    datasets: [{
      label: 'My First Dataset',
      data: [65, 59, 80, 81, 56], // グラフに表示するデータ
      borderColor: 'rgba(75, 192, 192, 1)', // 線の色
      backgroundColor: 'rgba(75, 192, 192, 0.2)', // 塗りつぶし色
      fill: true // 塗りつぶしの設定
    }]
  },
  options: {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',
      },
      tooltip: {
        enabled: true
      }
    }
  }
});
