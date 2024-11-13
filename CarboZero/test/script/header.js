document.addEventListener('DOMContentLoaded', function () {
    const perfilBotao = document.querySelector('.perfil-botao');
    const menuSuspenso = document.getElementById('dropdown-menu');
    const seta = document.querySelector('.perfil-botao .seta-icon');
    const loginButton = document.querySelector('.botao-login'); // Botão de login
    const logoffButton = document.querySelector('#dropdown-menu li:last-child a'); // Botão de logoff

    // Verifica se o usuário está logado com base na chave 'loggedInUser' no localStorage
    const loggedInUser = JSON.parse(localStorage.getItem('loggedInUser'));

    // Alternar entre exibir o botão de login ou o perfil com base no estado de login
    if (loggedInUser && loggedInUser.email) {
        perfilBotao.style.display = 'flex'; // Mostra o botão de perfil
        loginButton.style.display = 'none'; // Esconde o botão de login
    } else {
        perfilBotao.style.display = 'none'; // Esconde o botão de perfil
        loginButton.style.display = 'block'; // Mostra o botão de login
    }

    // Evento para redirecionar o usuário para a página de login ao clicar no botão de login
    loginButton.addEventListener('click', function () {
        window.location.href = 'login_e_registro.html'; // Redireciona para a página de login
    });

    // Evento para abrir o menu suspenso com animação
    perfilBotao.addEventListener('click', function () {
        const rect = perfilBotao.getBoundingClientRect();
        menuSuspenso.style.top = `${rect.bottom + window.scrollY - 15}px`;
        menuSuspenso.style.left = `${rect.left + window.scrollX + (rect.width / 2)}px`;

        // Alterna a visibilidade do menu suspenso
        menuSuspenso.classList.toggle('show');
        perfilBotao.classList.toggle('menu-aberto'); // Alterna a rotação da seta
    });

    // Evento de logout
    logoffButton.addEventListener('click', function (event) {
        event.preventDefault(); // Impede o comportamento padrão do link
        localStorage.removeItem('loggedInUser'); // Remove o usuário logado do localStorage
        window.location.href = 'homepage.html'; // Redireciona para a página de login
    });

    // Fechar o menu suspenso se clicar fora dele
    document.addEventListener('click', function (event) {
        if (!perfilBotao.contains(event.target) && !menuSuspenso.contains(event.target)) {
            menuSuspenso.classList.remove('show');
            perfilBotao.classList.remove('menu-aberto'); // Reseta a rotação da seta
        }
    });
});
