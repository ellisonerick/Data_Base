
-- Atividade de Banco de Dados - Relatórios


-- Tarefa 1: Recupere atores de filmes assistidos com frequência
-- Objetivo: Retornar apenas os atores de filmes que foram assistidos mais de 3 vezes.
SELECT p.NOME
FROM filme f
JOIN aluguel a ON f.ID = a.IDFILME
JOIN filme_pessoa fp ON f.ID = fp.IDFILME
JOIN pessoa p ON fp.IDPESSOA = p.ID
WHERE fp.FUNCAO = 'ATOR'
GROUP BY p.NOME, f.ID
HAVING COUNT(a.IDFILME) > 3;


-- Tarefa 2: Recuperar informações de contato do usuário
-- Objetivo: Nome e telefone dos usuários que assistiram a mais de 3 horas de filmes.
SELECT u.NOME, u.TELEFONE
FROM pessoa u
JOIN aluguel a ON u.ID = a.IDUSUARIO
JOIN filme f ON a.IDFILME = f.ID
GROUP BY u.ID, u.NOME, u.TELEFONE
HAVING SUM(f.DURACAO) > 180;


-- Tarefa 3: Recuperar e-mails de usuários com nome "JOAO"
-- Objetivo: Todos os e-mails de usuários cujos nomes começam com "JOAO".
SELECT EMAIL
FROM pessoa
WHERE NOME LIKE 'JOAO%';


-- Tarefa 4: Total de dias alugados para cada filme
-- Objetivo: Retornar a soma dos dias alugados para cada filme.
SELECT f.NOME AS FILME, COUNT(*) AS TOTAL_DIAS_ALUGADOS
FROM aluguel a
JOIN filme f ON a.IDFILME = f.ID
GROUP BY f.NOME;


-- Tarefa 5: Horas assistidas por dia para cada filme alugado
-- Objetivo: Mostrar as horas assistidas por dia para cada filme.
SELECT f.NOME AS FILME, 
       f.DURACAO / COUNT(*) AS HORAS_POR_DIA
FROM aluguel a
JOIN filme f ON a.IDFILME = f.ID
GROUP BY f.ID, f.NOME, f.DURACAO;


-- Tarefa 6: Duração média dos aluguéis de cada filme
-- Objetivo: Calcular a média da duração dos aluguéis por filme.
SELECT f.NOME,
       AVG(f.DURACAO) AS MEDIA_DURACAO
FROM aluguel a
JOIN filme f ON a.IDFILME = f.ID
GROUP BY f.ID, f.NOME;
