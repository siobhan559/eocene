const listenForSeeMore = () => {
  const seeMore = document.querySelector('.show-content');
  seeMore.addEventListener("click", (e) => {
    e.preventDefault();
    // console.log(document.querySelector('.hide-content'));
    document.getElementById('hide').classList.toggle('hide-content');
  });
};

export { listenForSeeMore };
