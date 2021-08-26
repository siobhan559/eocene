const listenForSeeMore = () => {
  const seeMore = document.querySelector('.show-content');
  seeMore.addEventListener("click", (e) => {
    const adjustBoxHeight = document.getElementById('info1');
    e.preventDefault();
    console.log(adjustBoxHeight);
    document.getElementById('hide').classList.toggle('hide-content');

  });
};

export { listenForSeeMore };
