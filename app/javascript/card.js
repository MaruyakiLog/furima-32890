const { formInputClickSelector } = require("@rails/ujs")

const pay = () => {
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("item[number]"),
      cvc: formData.get("item[cvc]"),
      exp_month: formData.get("item[exp_month]"),
      exp_year: formData.get("item[exp_year]")
    };

    Payjp.createToken(card, (status, response) => {
      debugger;
    });


    console.log("test");
  });
}

window.addEventListener("load", pay);