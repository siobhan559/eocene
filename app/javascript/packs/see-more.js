const listenForSeeMore = () => {
  const seeMore = document.querySelector('.show-content');
  seeMore.addEventListener("click", (e) => {
    const adjustBoxHeight = document.getElementById('info1');
    e.preventDefault();
    console.log(adjustBoxHeight);
    // console.log(document.querySelector('.hide-content'));
    document.getElementById('hide').classList.toggle('hide-content');
    // if (adjustBoxHeight.classList === "info-box") {
    //   adjustBoxHeight.classList = "info-box2";
    // } else {
    //   adjustBoxHeight.classList = "info-box";
    // };
  });
};

export { listenForSeeMore };
// if (button.innerText === "Let's Book!") {
//   button.innerText = "Hide booking form";
//   button.classList = "call-to-action";
// } else {
//   button.innerText = "Let's Book!";
//   button.classList = "call-to-action";
// };
