function greet() {
  const name = prompt("あなたの名前は?");
  const greeting = document.querySelector("#greeting");
  greeting.textContent = `${name} さん、こんにちは。はじめまして！`;
}


