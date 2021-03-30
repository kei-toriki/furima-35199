function price() {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const priceProfit = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    addTaxDom.innerHTML = inputValue * 0.1
    priceProfit.innerHTML = inputValue - inputValue * 0.1
  })
}

window.addEventListener('load', price);