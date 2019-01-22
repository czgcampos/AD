-- nota: isto nao funciona pq os tipos sao incompativeis
-- tinha q criar uma BD nova
-- mas está certo

-- eliminar linguagem originar (atributo) do DW

DELIMITER $$
CREATE PROCEDURE data_warehouse_ad.fillFilm()
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE titulo VARCHAR(100);
    DECLARE descricao TEXT;
    DECLARE release_year YEAR;
    DECLARE linguagem VARCHAR(20);
	DECLARE classificacao VARCHAR(10);
    DECLARE linguagem_original VARCHAR(20);
    DECLARE duracao SMALLINT;
    -- DECLARE categoria..
    
    DECLARE cur1 CURSOR FOR -- DOIS DELECTS DEVIDO À DUPLA LIGAÇAO
		SELECT DISTINCT f.title, f.description, f.release_year, f.rating, f.length, l.name as ling, (select distinct l.name from sakila.language as l where f.original_language_id = l.language_id) as lingOr FROM sakila.film as f, sakila.language as l
			WHERE f.language_id = l.language_id;
                       
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur1;
    
    read_loop: LOOP
		FETCH cur1 INTO titulo, descricao, release_year, linguagem, classificacao, linguagem_original, duracao;
        IF done THEN
			LEAVE read_loop;
		END IF;
		INSERT INTO data_warehouse_ad.dim_filme(titulo, descricao, anoLancamento, linguagem, linguagemOriginal, classificacao, duracao) -- nome igual ao das colunas do DW
			VALUES (titulo, descricao, release_year, linguagem, linguagem_original, classificacao, duracao); -- nome das vars do declare
	END LOOP;
    
    CLOSE cur1;
END$$

CALL data_warehouse_ad.fillFilm();
