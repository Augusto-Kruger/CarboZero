document.getElementById("registration-form").addEventListener("submit", function (event) {
    event.preventDefault(); // Evita que o formulário seja enviado

    const name = document.getElementById("name").value;
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;

    // Aqui você pode adicionar a lógica para salvar os dados do usuário
    // Exemplo de mensagem de sucesso
    showMessage(`Cadastro realizado com sucesso, ${name} !`);
});

// Função para mostrar mensagens
function showMessage(message) {
    const messageBox = document.getElementById("message");
    messageBox.innerText = message;
    messageBox.classList.remove("hidden");
}
