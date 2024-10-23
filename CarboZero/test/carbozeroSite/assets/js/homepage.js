document.addEventListener('DOMContentLoaded', function () {
    const perfilBotao = document.querySelector('.perfil-botao');
    const menuSuspenso = document.getElementById('dropdown-menu');
    const seta = document.querySelector('.perfil-botao .seta-icon');

    perfilBotao.addEventListener('click', function () {
        // Alterna a visibilidade do menu suspenso
        menuSuspenso.classList.toggle('show');
        perfilBotao.classList.toggle('menu-aberto'); // Alterna a rotação da seta
    });

    // Fechar o menu suspenso se clicar fora dele
    document.addEventListener('click', function (event) {
        if (!perfilBotao.contains(event.target) && !menuSuspenso.contains(event.target)) {
            menuSuspenso.classList.remove('show');
            perfilBotao.classList.remove('menu-aberto'); // Reseta a rotação da seta
        }
    });
});
