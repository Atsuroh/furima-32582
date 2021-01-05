(() => {
  //HTMLのid値を使って以下のDOM要素を取得
  const likebtn = document.getElementById('likebtn');
  //ボタンが押されたらカウント増
  likebtn.addEventListener('click', (event) => {
    text.value++;
  })
})();