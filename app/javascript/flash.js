// my_custom.js

document.addEventListener('DOMContentLoaded', function () {
    // Выбираем все элементы с классами .alert и .flash-notice
    var $alerts = document.querySelectorAll('.flash-message');

    // Устанавливаем таймер для скрытия сообщений через 2000 миллисекунд (10 секунды)
    $alerts.forEach(function (alert) {
        setTimeout(function () {
            alert.style.display = 'none'; // Скрываем сообщение
        }, 10000);
    });
});
