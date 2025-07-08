const output = document.getElementById("output");
const showText = document.getElementById("showText");
const saveFile = document.getElementById("saveFile");

showText.addEventListener("click", async () => {
  try {
    // 現在のウィンドウ内のすべてのタブを取得
    const tabs = await browser.tabs.query({ currentWindow: true });

    // リストをクリア
    output.innerHTML = "";

    // タブのURLをリストに表示
    for (let tab of tabs) {
      const addingText = document.createElement("li");
      addingText.textContent = `- [${tab.title}](${tab.url}])`;
      output.appendChild(addingText);
    }
  } catch (error) {
    console.error("エラーが発生しました:", error);
  }
});

saveFile.addEventListener("click", async () => {
  try {
    // 現在のウィンドウ内のすべてのタブを取得
    const tabs = await browser.tabs.query({ currentWindow: true });

    // すべてのタブのURLを改行区切りで1つの文字列にまとめる
    const allUrls = tabs.map(tab => `${tab.title},${tab.url}`).join("\n");

    // Blobを作成
    const blob = new Blob([allUrls], { type: "text/plain" });

    // ダウンロードリンクを作成
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = "tabs.txt"; // ダウンロードするファイル名
    document.body.appendChild(a);
    a.click();

    // リンクを削除
    document.body.removeChild(a);
    URL.revokeObjectURL(url);

    alert("ファイルが保存されました👍");
  } catch (error) {
    console.error("エラーが発生しました:", error);
  }
});
