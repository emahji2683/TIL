function changeBtn() {
  const num = document.getElementById("test")
  num.innerHTML = "クリックしました"
}


const button = document.getElementById("button");

button.addEventListener("click", async () => { 
  try {
    const text = "トイレット";

    // Blobを作成
    const blob = new Blob([text], { type: 'text/plain' });

    // ダウンロード用のURLを作成
    const url = URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.href = url;
    link.download = 'hello.txt'; // ダウンロードファイル名
    document.body.appendChild(link); // 一時的にリンクを追加
    link.click();
    document.body.removeChild(link); // クリック後に削除

    // メモリの解放
    URL.revokeObjectURL(url);
  } catch (error) {
    console.error("エラーが発生しました:", error);
  }
});
