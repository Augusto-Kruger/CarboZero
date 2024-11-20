document.addEventListener("DOMContentLoaded", () => {
    const opcoes = document.querySelectorAll(".opcao");
    const camposCombustivel = document.getElementById("campos-combustivel");
    const camposEletricidade = document.getElementById("campos-eletricidade");
    const camposVoos = document.getElementById("campos-voos");
    const historicoContainer = document.querySelector(".historico-itens");
    const botaoCompensar = document.querySelector(".botao-compensar");
    const botaoSalvar = document.querySelector(".botao-salvar");
    const valorCO2 = document.querySelector(".valor-co2");
    const valorCreditos = document.querySelector(".valor-creditos");

    let totalCombustivel = 0;
    let totalEletricidade = 0;
    let totalVoos = 0;
    let tipoAtual = "Combustível"; // Tipo de emissão atualmente selecionado

    function limparCampos(campos) {
        const inputs = campos.querySelectorAll("input, select");
        inputs.forEach((input) => {
            if (input.type === "text") {
                input.value = "";
            } else if (input.tagName.toLowerCase() === "select") {
                input.selectedIndex = 0;
            }
        });
    }

    function limparEntradaAtual(campo) {
        const input = campo.querySelector("input[type='text']");
        if (input) input.value = "";
    }

    function mostrarCampos(camposAtivos) {
        [camposCombustivel, camposEletricidade, camposVoos].forEach((campo) => {
            campo.style.display = "none";
            campo.classList.remove("ativo");
        });
        camposAtivos.style.display = "flex";
        camposAtivos.classList.add("ativo");
    }

    function formatarEmissao(valor) {
        return Math.max(Math.round(valor), 0).toLocaleString(); // Garante que o valor não seja negativo
    }

    function aplicarTrocaCorSuave(elemento) {
        elemento.style.transition = "background-color 0.2s ease-in-out";
        elemento.style.backgroundColor = "#246f36"; // Cor leve para o destaque
        setTimeout(() => {
            elemento.style.backgroundColor = ""; // Volta ao padrão
        }, 400);
    }

    function atualizarResultadoPorTipo() {
        let resultadoCampo;
        let totalPorTipo;

        if (tipoAtual === "Combustível") {
            resultadoCampo = document.getElementById("resultado-combustivel");
            totalPorTipo = totalCombustivel;
        } else if (tipoAtual === "Eletricidade") {
            resultadoCampo = document.getElementById("resultado-eletricidade");
            totalPorTipo = totalEletricidade;
        } else if (tipoAtual === "Voos") {
            resultadoCampo = document.getElementById("resultado-voos");
            totalPorTipo = totalVoos;
        }

        if (resultadoCampo) {
            resultadoCampo.value = `${formatarEmissao(totalPorTipo)} kg/CO₂`;
            
        }
    }

    function atualizarColunaDireita() {
        const totalEmissoes = totalCombustivel + totalEletricidade + totalVoos;

        valorCO2.textContent = formatarEmissao(totalEmissoes);
        aplicarTrocaCorSuave(valorCO2);

        const creditos = Math.ceil(totalEmissoes / 1000);
        valorCreditos.textContent = creditos > 0 ? creditos : "0";
        aplicarTrocaCorSuave(valorCreditos);

        const botaoAtivo = totalEmissoes > 0;
        botaoCompensar.disabled = !botaoAtivo;
        botaoSalvar.disabled = !botaoAtivo;

        botaoCompensar.style.opacity = botaoAtivo ? "1" : "0.5";
        botaoSalvar.style.opacity = botaoAtivo ? "1" : "0.5";
    }

    function atualizarHistorico(tipo, descricao, valor, emissao) {
        const historicoItem = document.createElement("div");
        historicoItem.classList.add("historico-item", "fade-in");

        historicoItem.innerHTML = `
            <span>${tipo}</span>
            <span>${descricao}</span>
            <span class="valor-co2">${formatarEmissao(emissao)} kg/CO₂</span>
            <button class="remove-item">X</button>
        `;

        historicoItem.querySelector(".remove-item").addEventListener("click", () => {
            historicoItem.classList.remove("fade-in");
            historicoItem.classList.add("fade-out");

            historicoItem.addEventListener("animationend", () => {
                historicoItem.remove();
                if (tipo === "Combustível") {
                    totalCombustivel -= emissao;
                } else if (tipo === "Eletricidade") {
                    totalEletricidade -= emissao;
                } else if (tipo === "Voos") {
                    totalVoos -= emissao;
                }
                atualizarResultadoPorTipo();
                atualizarColunaDireita();
                atualizarEstiloHistorico();
            });
        });

        historicoContainer.appendChild(historicoItem);
        atualizarEstiloHistorico();
    }

    function atualizarEstiloHistorico() {
        const items = historicoContainer.querySelectorAll(".historico-item");
        const placeholder = historicoContainer.querySelector(".historico-placeholder");

        if (items.length === 0) {
            if (!placeholder) {
                const novoPlaceholder = document.createElement("p");
                novoPlaceholder.className = "historico-placeholder";
                novoPlaceholder.textContent = "Nenhum cálculo ainda";
                historicoContainer.appendChild(novoPlaceholder);
            }
        } else if (placeholder) {
            placeholder.remove();
        }
    }

    function salvarCalculo() {
        const totalEmissoes = totalCombustivel + totalEletricidade + totalVoos;
        if (totalEmissoes === 0) {
            alert("Nenhum cálculo para salvar.");
            return;
        }

        const usuarioLogado = JSON.parse(localStorage.getItem("loggedInUser"));
        if (usuarioLogado) {
            usuarioLogado.calculoSalvo = totalEmissoes;
            localStorage.setItem("loggedInUser", JSON.stringify(usuarioLogado));
            alert("Cálculo salvo com sucesso!");
        } else {
            alert("Usuário não autenticado. Por favor, faça login.");
        }

        totalCombustivel = 0;
        totalEletricidade = 0;
        totalVoos = 0;

        historicoContainer.innerHTML = "";
        atualizarColunaDireita();
        atualizarEstiloHistorico();
        atualizarResultadoPorTipo(); // Reseta o resultado por tipo
    }

    function calcularCombustivel() {
        const tipoVeiculo = document.getElementById("tipo-veiculo").value;
        const kmMes = parseFloat(document.getElementById("km-mes").value);

        if (isNaN(kmMes) || kmMes <= 0) {
            alert("Por favor, insira um valor válido de Km/Mês.");
            return;
        }

        const fatoresEmissao = {
            "Carro a Gasolina (até 1.4)": 0.15,
            "Carro a Gasolina (1.5 a 2.0)": 0.18,
            "Carro a Gasolina (acima de 2.0)": 0.22,
            "Carro Álcool (até 1.4)": 0.13,
            "Carro Álcool (1.5 a 2.0)": 0.16,
            "Carro Álcool (acima de 2.0)": 0.19,
            "Carro Gás Natural (GNV)": 0.12,
            "Pick-up (diesel)": 0.25,
            "Ônibus": 0.3,
        };

        const fatorEmissao = fatoresEmissao[tipoVeiculo] || 0;
        const emissao = kmMes * fatorEmissao;

        totalCombustivel += emissao;
        limparEntradaAtual(camposCombustivel);
        atualizarResultadoPorTipo();
        atualizarColunaDireita();
        atualizarHistorico("Combustível", `${tipoVeiculo}, ${kmMes} Km/mês`, kmMes, emissao);
    }

    function calcularEletricidade() {
        const regiaoSelect = document.getElementById("regiao");
        const regiao = regiaoSelect.options[regiaoSelect.selectedIndex].text;
        const fatorEmissao = parseFloat(regiaoSelect.value);
        const consumo = parseFloat(document.getElementById("consumo-energia").value);

        if (isNaN(consumo) || consumo <= 0) {
            alert("Por favor, insira um consumo válido (kWh/Mês).");
            return;
        }

        const emissao = consumo * fatorEmissao;

        totalEletricidade += emissao;
        limparEntradaAtual(camposEletricidade);
        atualizarResultadoPorTipo();
        atualizarColunaDireita();
        atualizarHistorico("Eletricidade", `${regiao}, ${consumo} kWh/mês`, consumo, emissao);
    }

    function calcularVoos() {
        const tipoVoo = document.getElementById("tipo-voo").value;
        const classe = document.getElementById("classe-assento").value;
        const distancia = parseFloat(document.getElementById("distancia-voo").value);

        if (isNaN(distancia) || distancia <= 0) {
            alert("Por favor, insira uma distância válida (km).");
            return;
        }

        const fatoresEmissao = {
            domestico: 0.2,
            "internacional-media": 0.15,
            "internacional-longa": 0.1,
        };

        const multiplicadoresClasse = {
            economica: 1,
            executiva: 1.5,
            "primeira-classe": 2,
        };

        const fatorEmissao = fatoresEmissao[tipoVoo];
        const multiplicador = multiplicadoresClasse[classe];

        if (!fatorEmissao || !multiplicador) {
            alert("Erro ao calcular o fator de emissão. Verifique as opções selecionadas.");
            return;
        }

        const emissao = distancia * fatorEmissao * multiplicador;

        totalVoos += emissao;
        limparEntradaAtual(camposVoos);
        atualizarResultadoPorTipo();
        atualizarColunaDireita();
        atualizarHistorico("Voos", `${tipoVoo}, ${classe}, ${distancia} km`, distancia, emissao);
    }

    document.getElementById("calcular-combustivel").addEventListener("click", calcularCombustivel);
    document.getElementById("calcular-eletricidade").addEventListener("click", calcularEletricidade);
    document.getElementById("calcular-voos").addEventListener("click", calcularVoos);
    botaoSalvar.addEventListener("click", salvarCalculo);

    opcoes.forEach((opcao) => {
        opcao.addEventListener("click", () => {
            opcoes.forEach((btn) => btn.classList.remove("ativo"));
            opcao.classList.add("ativo");

            if (opcao.id === "opcao-combustivel") {
                tipoAtual = "Combustível";
                mostrarCampos(camposCombustivel);
            } else if (opcao.id === "opcao-eletricidade") {
                tipoAtual = "Eletricidade";
                mostrarCampos(camposEletricidade);
            } else if (opcao.id === "opcao-voos") {
                tipoAtual = "Voos";
                mostrarCampos(camposVoos);
            }

            atualizarResultadoPorTipo();
        });
    });

    atualizarColunaDireita();
    atualizarEstiloHistorico();
});
