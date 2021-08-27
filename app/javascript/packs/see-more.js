const listenForSeeMore = () => {
  const seeMore = document.querySelector('.show-content');
  seeMore.addEventListener("click", (e) => {
    e.preventDefault();
    let button = seeMore.querySelector('a');
    if (button.innerText === "Show more") {
      button.innerText = "Show less";
    } else {
      button.innerText = "Show more";
    };
    document.getElementById('hide').classList.toggle('hide-content');
  });
};

export { listenForSeeMore };
