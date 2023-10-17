document.addEventListener('turbo:load', function() {
  const toggleSwitch = document.querySelector('.toggle-switch');
  const toggleForm = document.querySelector('.toggle-form');
  if (toggleSwitch && toggleForm) {
    toggleSwitch.addEventListener('change', function () {
      toggleForm.submit();
    });
  }
});
