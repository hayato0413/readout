function readoutBtn() {
  const flag = document.getElementById("readout")
  if (flag.style.display == 'none') {
    flag.style.display = "block";
  } else {
    flag.style.display = 'none';
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
