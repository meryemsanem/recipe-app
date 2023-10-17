//= link application.css
//= link application.js
//= link controllers/application.js
//= link controllers/hello_controller.js
//= link controllers/index.js

document.addEventListener('turbo:load', function () {
  const toggleSwitch = document.querySelector('.toggle-switch');
  const toggleForm = document.querySelector('.toggle-form');
  if (toggleSwitch && toggleForm) {
    toggleSwitch.addEventListener('change', function () {
      toggleForm.submit();
    });
  }
});
