
function changeBtn () {
  for (let step = 0; step < 5; step++) {
  const list = document.getElementById("tabList");
  const li = document.createElement("li");
  li.textContent = "クリックしたよん";
  list.appendChild(li);
  };
  }


function changeTitle () {
  const str = document.getElementById("test");
  str.innerHTML = "タイトル変えたよん"
  }

function removeList () {
  const lists = document.querySelectorAll("li");
  lists.forEach(list => list.remove());
}
