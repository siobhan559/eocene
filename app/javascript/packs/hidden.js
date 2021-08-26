const listenForHiddenClick = () => {
  const hidden = document.getElementById('hidden-btn');
  hidden.addEventListener("click", (e) => {
    e.preventDefault();
    document.getElementById('signup-box').classList.toggle('hidden');
  });
};

const listenForClickButton = () => {
  const button = document.getElementById('hidden-btn');
  button.addEventListener("click", () => {
    console.log(button.classList);
    if (button.innerText === "Let's Book!"){
      button.innerText = "Hide booking form";
      button.classList = "call-to-action";
    } else {
      button.innerText = "Let's Book!";
      button.classList = "call-to-action";
    };
  });
};

export { listenForHiddenClick };
export { listenForClickButton };
