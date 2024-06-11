CREATE VIEW viewCompleta_Locacao AS
SELECT 
    Locacoes.ID,
    Clientes.nomeCliente AS Cliente,
    Veiculos.modeloVeiculo AS Veiculo,
	Veiculos.corVeiculo AS Cor,
    Veiculos.placaVeiculo AS Placa,
    Locacoes.diasLocacao AS Dias,
    Locacoes.valorTotal AS Total
FROM Locacoes
JOIN Clientes ON Locacoes.clienteID = Clientes.ID
JOIN Veiculos ON Locacoes.veiculoID = Veiculos.ID;
    
SELECT * FROM viewCompleta_Locacao;