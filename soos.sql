-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Nov-2019 às 23:01
-- Versão do servidor: 10.3.15-MariaDB
-- versão do PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
create database if not exists soos;
--
-- Banco de dados: `soos`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `email`, `senha`) VALUES
(58, 'Adston Oliveira Pereira', 'suportetecnico.adston@gmail.com', '$2b$10$EyIkXHt4ggyGM48TqC4uT.33/JZENm0PamvHxchZSYY7EXyOCQOqm'),
(60, 'Adston Oliveira Pereira', 'aqsuportetecnico.adston@gmail.com', '$2b$10$zc7VbVJ9fmsS7J.VexOlAubSP.bkjLxE2I2NGibQAFYF/qv.QyZNG'),
(67, 'Adston Oliveira', 'asuportetecnico.adston@gmail.com', '$2b$10$wa2hoIBXtPx1zSREsMHUtuzFsewD0KjQDW2d6lxSLTe58CxgiOpN6');

-- --------------------------------------------------------

--
-- Estrutura da tabela `defeito`
--

CREATE TABLE `defeito` (
  `os_id` int(11) NOT NULL,
  `defeito` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipamento`
--

CREATE TABLE `equipamento` (
  `id` int(11) NOT NULL,
  `num_serie` varchar(45) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  `marca_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `marca` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `marca`
--

INSERT INTO `marca` (`id`, `marca`) VALUES
(1, 'Sony');

-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamento`
--

CREATE TABLE `orcamento` (
  `id` int(11) NOT NULL,
  `ordem_servico_id` int(11) NOT NULL,
  `desconto` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamento_has_produto`
--

CREATE TABLE `orcamento_has_produto` (
  `orcamento_id` int(11) NOT NULL,
  `ordem_servico_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `qtde` float NOT NULL,
  `desconto` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ordem_servico`
--

CREATE TABLE `ordem_servico` (
  `id` int(11) NOT NULL,
  `dt_abertura` date NOT NULL,
  `dt_encerramento` date NOT NULL,
  `Equipamento_id` int(11) NOT NULL,
  `situacao_id` int(11) NOT NULL,
  `defeito_os_id` int(11) NOT NULL,
  `solucao_os_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `vl_un` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `situacao`
--

CREATE TABLE `situacao` (
  `id` int(11) NOT NULL,
  `descricao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `solucao`
--

CREATE TABLE `solucao` (
  `os_id` int(11) NOT NULL,
  `solucao` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE `telefone` (
  `id` int(11) NOT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo`
--

CREATE TABLE `tipo` (
  `id` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo`
--

INSERT INTO `tipo` (`id`, `descricao`) VALUES
(1, 'Computador');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `defeito`
--
ALTER TABLE `defeito`
  ADD PRIMARY KEY (`os_id`);

--
-- Índices para tabela `equipamento`
--
ALTER TABLE `equipamento`
  ADD PRIMARY KEY (`id`,`cliente_id`,`marca_id`,`tipo_id`),
  ADD KEY `fk_Equipamento_cliente_idx` (`cliente_id`),
  ADD KEY `fk_Equipamento_marca1_idx` (`marca_id`),
  ADD KEY `fk_Equipamento_tipo1_idx` (`tipo_id`);

--
-- Índices para tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `orcamento`
--
ALTER TABLE `orcamento`
  ADD PRIMARY KEY (`id`,`ordem_servico_id`),
  ADD KEY `fk_orcamento_ordem_servico1_idx` (`ordem_servico_id`);

--
-- Índices para tabela `orcamento_has_produto`
--
ALTER TABLE `orcamento_has_produto`
  ADD PRIMARY KEY (`orcamento_id`,`ordem_servico_id`,`produto_id`),
  ADD KEY `fk_orcamento_has_produto_produto1_idx` (`produto_id`),
  ADD KEY `fk_orcamento_has_produto_orcamento1_idx` (`orcamento_id`,`ordem_servico_id`);

--
-- Índices para tabela `ordem_servico`
--
ALTER TABLE `ordem_servico`
  ADD PRIMARY KEY (`id`,`Equipamento_id`,`defeito_os_id`,`solucao_os_id`),
  ADD KEY `fk_ordem_servico_Equipamento1_idx` (`Equipamento_id`),
  ADD KEY `fk_ordem_servico_situacao1_idx` (`situacao_id`),
  ADD KEY `fk_ordem_servico_defeito1_idx` (`defeito_os_id`),
  ADD KEY `fk_ordem_servico_solucao1_idx` (`solucao_os_id`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `situacao`
--
ALTER TABLE `situacao`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `solucao`
--
ALTER TABLE `solucao`
  ADD PRIMARY KEY (`os_id`);

--
-- Índices para tabela `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`id`,`cliente_id`),
  ADD KEY `fk_telefone_cliente1_idx` (`cliente_id`);

--
-- Índices para tabela `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de tabela `equipamento`
--
ALTER TABLE `equipamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `orcamento`
--
ALTER TABLE `orcamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ordem_servico`
--
ALTER TABLE `ordem_servico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `situacao`
--
ALTER TABLE `situacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `telefone`
--
ALTER TABLE `telefone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
