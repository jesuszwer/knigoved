document.addEventListener('DOMContentLoaded', function () {
    // Выбираем все элементы с классами .alert и .flash-notice
    var $alerts = document.querySelectorAll('.flash-message');
    console.log("flash.js integration");

    // Устанавливаем таймер для скрытия сообщений через 5000 миллисекунд (5 секунд)
    $alerts.forEach(function (alert) {
        setTimeout(function () {
            alert.style.display = 'none'; // Скрываем сообщение
        }, 5000);
        alert.remove();
    });
});
