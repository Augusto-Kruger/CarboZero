document.addEventListener("DOMContentLoaded", () => {
    const calcularBtn = document.querySelector(".parte-campos button");
    const tipoVeiculo = document.getElementById("tipo-veiculo");
    const kmMes = document.getElementById("km-mes");
    const resultadoValor = document.getElementById("resultado-valor");
    const historicoContainer = document.querySelector(".historico-itens");
    let totalEmissao = 0;

    // Formata a emissão para exibição agradável
    function formatarEmissao(valor) {
        return valor.toLocaleString(undefined, { minimumFractionDigits: 0, maximumFractionDigits: 2 });
    }

    // Atualiza o resultado total no card de resultado
    function atualizarResultadoTotal() {
        const valorFormatado = formatarEmissao(totalEmissao);
        resultadoValor.textContent = valorFormatado;

        if (valorFormatado.length > 5) {
            resultadoValor.parentElement.classList.add("pequeno");
        } else {
            resultadoValor.parentElement.classList.remove("pequeno");
        }
    }

    // Atualiza o estilo do histórico para exibir ou ocultar o placeholder
    function atualizarEstiloHistorico() {
        const items = historicoContainer.querySelectorAll(".historico-item");
        const placeholder = historicoContainer.querySelector(".historico-placeholder");

        if (items.length === 0) {
            if (!placeholder) {
                // Adiciona o placeholder caso não exista
                const novoPlaceholder = document.createElement("p");
                novoPlaceholder.className = "historico-placeholder";
                novoPlaceholder.textContent = "Nenhum cálculo ainda";
                historicoContainer.appendChild(novoPlaceholder);
            }
            totalEmissao = 0;
            atualizarResultadoTotal();
        } else {
            if (placeholder) {
                placeholder.remove(); // Remove o placeholder ao adicionar o primeiro cálculo
            }
        }
    }

    // Função de cálculo das emissões
    function calcularEmissao() {
        const km = parseFloat(kmMes.value);
        if (isNaN(km) || km <= 0) {
            alert("Por favor, insira um valor válido de Km/Mês.");
            return;
        }

        let fatorEmissao;
        switch (tipoVeiculo.value) {
            case "Carro a Gasolina (até 1.4)":
                fatorEmissao = 0.15;
                break;
            case "Carro a Gasolina (1.5 a 2.0)":
                fatorEmissao = 0.18;
                break;
            case "Carro a Gasolina (acima de 2.0)":
                fatorEmissao = 0.22;
                break;
            case "Carro Álcool (até 1.4)":
                fatorEmissao = 0.13;
                break;
            case "Carro Álcool (1.5 a 2.0)":
                fatorEmissao = 0.16;
                break;
            case "Carro Álcool (acima de 2.0)":
                fatorEmissao = 0.19;
                break;
            case "Carro Gás Natural (GNV)":
                fatorEmissao = 0.12;
                break;
            case "Pick-up (diesel)":
                fatorEmissao = 0.25;
                break;
            case "Ônibus":
                fatorEmissao = 0.3;
                break;
            default:
                fatorEmissao = 0;
                break;
        }

        const emissao = km * fatorEmissao;
        totalEmissao += emissao;
        atualizarResultadoTotal();

        adicionarAoHistorico(tipoVeiculo.value, km, emissao);
    }

// Formata a emissão para exibição agradável com uma casa decimal no máximo
// Formata a emissão para exibição agradável sem casas decimais
function formatarEmissao(valor) {
    return Math.round(valor).toLocaleString(); // Arredonda o valor e formata com separador de milhares
}



    // Adiciona um item ao histórico
    function adicionarAoHistorico(tipo, km, emissao) {
        const historicoItem = document.createElement("div");
        historicoItem.classList.add("historico-item", "fade-in");

        historicoItem.innerHTML = `
            <span>${tipo}</span>
            <span>${km} Km/mês</span>
            <span class="valor-co2">${formatarEmissao(emissao)} tCO₂</span>
            <button class="remove-item">X</button>
        `;

        historicoItem.querySelector(".remove-item").addEventListener("click", () => {
            historicoItem.classList.remove("fade-in");
            historicoItem.classList.add("fade-out");
            totalEmissao -= emissao;
            atualizarResultadoTotal();

            historicoItem.addEventListener("animationend", () => {
                historicoItem.remove();
                atualizarEstiloHistorico(); // Atualiza o estilo para verificar se o placeholder deve ser exibido
            });
        });

        historicoContainer.appendChild(historicoItem);
        atualizarEstiloHistorico(); // Verifica o placeholder ao adicionar
    }

    atualizarEstiloHistorico();

    // Adiciona evento ao botão de calcular
    calcularBtn.addEventListener("click", calcularEmissao);
});
