window.addEventListener("load", () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    //販売手数料を計算
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

    //販売利益を計算
    const gainedProfit = document.getElementById("profit");
    gainedProfit.innerHTML = inputValue - Math.floor(inputValue * 0.1);
  });
});