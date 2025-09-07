const initPricecalc = (opts = { clearOnRender: false }) => {
  const priceInput  = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit      = document.getElementById("profit");
  if (!priceInput || !addTaxPrice || !profit) return;

  if (priceInput.dataset.bound === "true") {
    if (opts.clearOnRender) {
      addTaxPrice.textContent = "";
      profit.textContent = "";
    }
    return;
  }
  priceInput.dataset.bound = "true";

  const update = () => {
    const price = parseInt(priceInput.value, 10) || 0;
    const tax = Math.floor(price * 0.1);
    const profitValue = Math.floor(price - tax);
    addTaxPrice.textContent = tax;
    profit.textContent = profitValue;
  };

  priceInput.addEventListener("input", update);

  if (opts.clearOnRender) {
    addTaxPrice.textContent = "";
    profit.textContent = "";
  } else {
    update();
  }
};

document.addEventListener("turbo:load",  () => initPricecalc({ clearOnRender: false }));
document.addEventListener("turbo:render", () => initPricecalc({ clearOnRender: true }));


