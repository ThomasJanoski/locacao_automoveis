CREATE TABLE Clientes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nomeCliente VARCHAR(255) NOT NULL,
    CPF VARCHAR(14) NOT NULL UNIQUE,
    dataNascimento DATE NOT NULL
);

CREATE TABLE Veiculos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    modeloVeiculo VARCHAR(255) NOT NULL,
    corVeiculo VARCHAR(50) NOT NULL,
    placaVeiculo VARCHAR(10) NOT NULL UNIQUE,
    diariaVeiculo DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Locacoes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    clienteID INT NOT NULL,
    veiculoID INT NOT NULL,
    diasLocacao INT NOT NULL,
    valorTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (clienteID) REFERENCES Clientes(ID),
    FOREIGN KEY (veiculoID) REFERENCES Veiculos(ID)
);

DELIMITER $

CREATE PROCEDURE InserirCliente (nomeCliente_Var VARCHAR(255), CPF VARCHAR(14), dataNascimento_Var DATE) BEGIN
	INSERT INTO Clientes (nomeCliente, CPF, dataNascimento) VALUES(nomeCliente_Var, CPF, dataNascimento_Var);
END $

DELIMITER ;

DELIMITER $

CREATE PROCEDURE InserirVeiculos (modeloVeiculo_Var VARCHAR(255), corVeiculo_Var VARCHAR(50), placaVeiculo_Var VARCHAR(10), diariaVeiculo_Var INT) BEGIN
	INSERT INTO Veiculos (modeloVeiculo, corVeiculo, placaVeiculo, diariaVeiculo) VALUES(modeloVeiculo_Var, corVeiculo_Var, placaVeiculo_Var, diariaVeiculo_Var);
END $

DELIMITER ;

DELIMITER $

CREATE PROCEDURE InserirLocacoes (clienteID INT, veiculoID INT, diasLocacao INT) BEGIN
	DECLARE valorTotal DECIMAL(10, 2);
    DECLARE valorDiaria INT;
    
	SELECT diariaVeiculo INTO valorDiaria FROM Veiculos WHERE ID = veiculoID;
    SET valorTotal = diasLocacao * valorDiaria;
    
    INSERT INTO Locacoes (clienteID, veiculoID, diasLocacao, valorTotal) VALUES(clienteID, veiculoID, diasLocacao, valorTotal);
END $

DELIMITER ;