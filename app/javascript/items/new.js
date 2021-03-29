function inputText() {
  const inputTextPrice = document.getElementById("item-price")
  const inputTextTax = document.getElementById("add-tax-price")
  const inputTextProfit = document.getElementById("profit")

  inputTextPrice.addEventListener('input', function(){
    let priceValue = inputTextPrice.value
    let priceTax = priceValue * 0.1
    let priceProfit = priceValue - priceTax

    inputTextTax.innerHTML = priceTax
    inputTextProfit.innerHTML = priceProfit
  })
}
window.addEventListener('load', inputText)