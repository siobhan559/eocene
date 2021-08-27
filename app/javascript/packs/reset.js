const listenForClearClick = () => {
  const clear = document.getElementById('clear-filters');
  clear.addEventListener("click", (e) => {
    e.preventDefault();
    let button = clear.querySelector('a');
    if (button.innerText === "Let's Book!") {
      button.innerText = "Hide booking form";
    } else {
      button.innerText = "Let's Book!";
    };
    document.getElementById('signup-box').classList.toggle('clear');
  });
};

export { listenForClearClick };
