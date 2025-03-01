document.addEventListener('DOMContentLoaded', function() {
    // Obsługa przełączania trybu ciemnego
    document.querySelector('.dark-mode-toggle').addEventListener('click', function() {
      document.body.classList.toggle('dark-mode');
    });
});
