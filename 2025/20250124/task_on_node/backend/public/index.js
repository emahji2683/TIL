document.getElementById('addTaskBtn').addEventListener('click', () => {
  const li = document.createElement('li');
  li.textContent = '新しいタスク';
  document.getElementById('taskList').appendChild(li);
});
document.getElementById('rmTaskBtn').addEventListener('click', () => {
  const li = document.querySelectorAll('li');
  li.forEach ( (li) => li.remove());
});
