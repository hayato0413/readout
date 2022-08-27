function readoutBtn() {
  const flag = document.getElementById("readout")
  if (flag.style.visibility == 'hidden') {
    flag.style.visibility = "visible";
  } else {
    flag.style.visibility = "hidden";
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const button = document.getElementById("readoutBtn")
  button.addEventListener("click", () => { readoutBtn() })
})
document.addEventListener('DOMContentLoaded', () => {
  const button = document.getElementById("cancelBtn")
  button.addEventListener("click", () => { readoutBtn() })
})
