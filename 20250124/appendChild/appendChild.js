
function appendText() {
  const tabsList = document.getElementById("tabsList");
  const newText = document.createElement('li');
  newText.innerHTML = '追加要素';
  tabsList.appendChild(newText);
}
