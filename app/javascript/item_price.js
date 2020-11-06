function item_price () {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    console.log(addTaxDom);

    const tax_result = inputValue * 0.1
    const profitNum = document.getElementById("profit")
    profitNum.innerHTML = (Math.floor(inputValue - tax_result));
    console.log(priceInput);
  })
}

window.addEventListener('load', item_price);