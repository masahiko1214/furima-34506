window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");



  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    add_tax_price.innerHTML = Math.floor(inputValue*0.1)
    console.log(add_tax_price)
    profit.innerHTML = Math.floor(inputValue*0.9)
    console.log(profit)


 })


  


});