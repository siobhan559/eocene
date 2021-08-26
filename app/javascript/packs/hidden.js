const listenForHiddenClick = () => {
  const hidden = document.getElementById('hidden-btn');
  hidden.addEventListener("click", (e) => {
    e.preventDefault();
    let button = hidden.querySelector('a');
      if (button.innerText === "Let's Book!") {
        button.innerText = "Hide booking form";
      } else {
        button.innerText = "Let's Book!";
      };
    document.getElementById('signup-box').classList.toggle('hidden');
  });
};

export { listenForHiddenClick };
