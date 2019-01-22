DROP TRIGGER IF EXISTS northwind_ar.tratamentoNullProduto;
DELIMITER //
CREATE TRIGGER northwind_ar.tratamentoNullProduto
BEFORE INSERT ON northwind_ar.ar_produto FOR EACH ROW
BEGIN
    IF(NEW.quantidadeUnidade IS NULL)
	THEN SET NEW.quantidadeUnidade = 'unknown';
    END IF;
    
END;
//

DROP TRIGGER IF EXISTS northwind_ar.tratamentoNullEncomendas;
DELIMITER //
CREATE TRIGGER northwind_ar.tratamentoNullEncomendas
BEFORE INSERT ON northwind_ar.ar_encomendas FOR EACH ROW
BEGIN
    IF(NEW.dataPagamento IS NULL)
	THEN SET NEW.dataPagamento = 0;
    END IF;

    IF(NEW.dataEnvio IS NULL)
	THEN SET NEW.dataEnvio = 0;
    END IF;
    
    IF(NEW.expedidor IS NULL)
	THEN SET NEW.expedidor = 0;
    END IF;
END;
//