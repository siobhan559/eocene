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
    console.log(button.innerText);
    if (button.innerText === "Let's Book!"){
      button.innerText = "Hide booking form";
    } else {
      button.innerText = "Let's Book!";
    };
  });
};

export { listenForHiddenClick };
export { listenForClickButton };
