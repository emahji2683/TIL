const button = document.getElementById("button");

button.addEventListener("click", async () => { 

    const text = "トイレット";

    // Blobを作成
    const blob = new Blob([text], { type: 'text/plain' });

    // ダウンロード用のURLを作成
    const url = URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.href = url;
    link.download = 'hello.txt'; // ダウンロードファイル名
    link.click();

    // メモリの解放
    URL.revokeObjectURL(url);
  } catch (error) {
    console.error("エラーが発生しました:", error);
  }
});
