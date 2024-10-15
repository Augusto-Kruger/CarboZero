function calculateEmissions() {
    // Fatores de emissão (em kg CO2 por litro, kg ou kWh)
    const emissionFactors = {
        gasolina: 2.31,         // Gasolina (litros)
        etanol: 0.74,           // Etanol (litros)
        diesel: 2.68,           // Diesel (litros)
        gasNatural: 2.75,       // Gás Natural (m³)
        carvao: 2.86,           // Carvão (kg)
        eletricidade: 0.50      // Eletricidade (kWh, baseado em usina térmica)
    };

    // Obter valores do formulário
    const fuelType = document.getElementById("fuelType").value;
    const consumption = parseFloat(document.getElementById("consumption").value);

    // Limpar o resultado anterior
    const resultElement = document.getElementById("result");
    resultElement.textContent = "";

    // Verificar se o tipo de emissão foi selecionado
    if (!fuelType) {
        resultElement.textContent = "Por favor, selecione um tipo de emissão.";
        return;
    }

    // Verificar se o valor de consumo é válido
    if (isNaN(consumption) || consumption <= 0) {
        resultElement.textContent = "Por favor, insira um valor válido para o consumo.";
        return;
    }

    // Calcular emissões
    const emissions = consumption * emissionFactors[fuelType];

    // Exibir resultado
    resultElement.textContent = `Emissões de CO2: ${emissions.toFixed(2)} kg por mês.`;
}
