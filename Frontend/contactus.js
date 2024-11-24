const isValidEmail = (email) => {
  const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(String(email).toLowerCase());
};
const isValidPhone = (phone) => {
  const re = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;
  return re.test(String(phone).toLowerCase());
};

const form = document.querySelector('form');
const thankYou = document.querySelector('.thank-you');
const nameInput = document.querySelector (
  'input[name="name"]'
);
const emailInput = document.querySelector (
  'input[name="email"]'
);
const phoneInput = document.querySelector (
    'input[name="phone"]'
);
const messageInput = document.querySelector (
    'textarea[name="message"]'
);

const inputs = [nameInput, emailInput, phoneInput, messageInput]

let isFormvalid = false;
let isvalidationOn = false;

const resetElm = (elm) => {
  elm.classList.remove("invalid");
  elm.nextElementSibling.classList.add("hidden");
};

const invalidateElm = (elm) => {
  elm.classList.add("invalid");
  elm.nextElementSibling.classList.remove("hidden");
};

const validateInputs = () => {
  if (!isvalidationOn) return;

  isFormvalid = true; 
  inputs.forEach(resetElm)

    if(!nameInput.value){
        isFormvalid = false;
        invalidateElm(nameInput);
    }

    
    if(!isValidEmail(emailInput.value)){
        isFormvalid = false; 
        invalidateElm(emailInput);
    }

    if(!isValidPhone(phoneInput.value)){
        isFormvalid = false; 
        invalidateElm(phoneInput);
    }

    if(!messageInput.value){
        isFormvalid = false; 
        invalidateElm(messageInput);
    }

};

form.addEventListener('submit', (e)=> {
    e.preventDefault();
    isvalidationOn = true;
    validateInputs();
    if (isFormvalid){
      form.remove();
      thankYou.classList.remove("hidden")
    }

});

inputs.forEach(input => {
    input.addEventListener('input', () => {
      validateInputs();
    });
});

