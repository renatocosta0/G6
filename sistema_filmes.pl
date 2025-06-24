% 1. BASE DE CONHECIMENTO - FILMES

% filme(titulo, generos, ano, diretor, atores, avaliacao, classificacao_etaria)
filme('Inception', [acao, ficcao_cientifica, thriller], 2010, 'Christopher Nolan', 
      ['Leonardo DiCaprio', 'Marion Cotillard'], 8.8, 12).

filme('The Godfather', [drama, crime], 1972, 'Francis Ford Coppola', 
      ['Marlon Brando', 'Al Pacino'], 9.2, 16).

filme('Pulp Fiction', [crime, drama], 1994, 'Quentin Tarantino', 
      ['John Travolta', 'Samuel L. Jackson'], 8.9, 18).

filme('Forrest Gump', [drama, romance, comedia], 1994, 'Robert Zemeckis', 
      ['Tom Hanks', 'Robin Wright'], 8.8, 12).

filme('The Dark Knight', [acao, crime, drama], 2008, 'Christopher Nolan', 
      ['Christian Bale', 'Heath Ledger'], 9.0, 12).

filme('Schindlers List', [biografia, drama, historia], 1993, 'Steven Spielberg', 
      ['Liam Neeson', 'Ralph Fiennes'], 9.0, 16).

filme('The Matrix', [acao, ficcao_cientifica], 1999, 'Lana Wachowski', 
      ['Keanu Reeves', 'Laurence Fishburne'], 8.7, 16).

filme('Goodfellas', [biografia, crime, drama], 1990, 'Martin Scorsese', 
      ['Robert De Niro', 'Ray Liotta'], 8.7, 18).

filme('Titanic', [drama, romance], 1997, 'James Cameron', 
      ['Leonardo DiCaprio', 'Kate Winslet'], 7.9, 12).

filme('Saving Private Ryan', [drama, guerra], 1998, 'Steven Spielberg', 
      ['Tom Hanks', 'Matt Damon'], 8.6, 16).

filme('Interstellar', [aventura, drama, ficcao_cientifica], 2014, 'Christopher Nolan', 
      ['Matthew McConaughey', 'Anne Hathaway'], 8.6, 12).

filme('The Shawshank Redemption', [drama], 1994, 'Frank Darabont', 
      ['Tim Robbins', 'Morgan Freeman'], 9.3, 16).

filme('Fight Club', [drama], 1999, 'David Fincher', 
      ['Brad Pitt', 'Edward Norton'], 8.8, 18).

filme('Avatar', [acao, aventura, fantasia], 2009, 'James Cameron', 
      ['Sam Worthington', 'Zoe Saldana'], 7.9, 12).

filme('Toy Story', [animacao, aventura, comedia], 1995, 'John Lasseter', 
      ['Tom Hanks', 'Tim Allen'], 8.3, 0).

filme('Spider-Man', [acao, aventura], 2002, 'Sam Raimi', 
      ['Tobey Maguire', 'Kirsten Dunst'], 7.4, 12).


% 2. BASE DE CONHECIMENTO - UTILIZADORES

% usuario(nome, idade, generos_favoritos, diretores_preferidos, atores_admirados, filmes_assistidos)
usuario('João', 25, [acao, ficcao_cientifica], ['Christopher Nolan'], 
        ['Leonardo DiCaprio'], ['Inception', 'The Matrix']).

usuario('Maria', 30, [drama, romance], ['Steven Spielberg'], 
        ['Tom Hanks'], ['Forrest Gump']).

usuario('Pedro', 22, [crime, thriller], ['Quentin Tarantino', 'Martin Scorsese'], 
        ['Samuel L. Jackson'], ['Pulp Fiction']).

usuario('Ana', 28, [drama, biografia], ['Frank Darabont'], 
        ['Morgan Freeman'], []).

usuario('Carlos', 35, [acao, aventura], ['James Cameron'], 
        ['Keanu Reeves'], ['Avatar']).

usuario('Sofia', 16, [animacao, comedia, aventura], ['John Lasseter'], 
        ['Tom Hanks'], ['Toy Story']).

% 3. REGRAS DE RECOMENDAÇÃO

% Verifica se um filme é adequado para a idade do usuário
idade_adequada(Usuario, Filme) :-
    usuario(Usuario, IdadeUsuario, _, _, _, _),
    filme(Filme, _, _, _, _, _, ClassificacaoEtaria),
    IdadeUsuario >= ClassificacaoEtaria.

% Verifica se o gênero do filme é compatível com os gêneros preferidos do usuário
genero_compativel(Usuario, Filme) :-
    usuario(Usuario, _, GenerosPreferidos, _, _, _),
    filme(Filme, GenerosFilme, _, _, _, _, _),
    member(Genero, GenerosPreferidos),
    member(Genero, GenerosFilme).

% Verifica se o diretor do filme é um dos diretores preferidos do usuário
diretor_preferido(Usuario, Filme) :-
    usuario(Usuario, _, _, DiretoresPreferidos, _, _),
    filme(Filme, _, _, Diretor, _, _, _),
    member(Diretor, DiretoresPreferidos).

% Verifica se o filme tem algum ator admirado pelo usuário
ator_admirado(Usuario, Filme) :-
    usuario(Usuario, _, _, _, AtoresAdmirados, _),
    filme(Filme, _, _, _, AtoresFilme, _, _),
    member(Ator, AtoresAdmirados),
    member(Ator, AtoresFilme).

% Verifica se o usuário já assistiu ao filme
ja_assistiu(Usuario, Filme) :-
    usuario(Usuario, _, _, _, _, FilmesAssistidos),
    member(Filme, FilmesAssistidos).

% Verifica se o filme tem uma boa avaliação (>= 8.0)
boa_avaliacao(Filme) :-
    filme(Filme, _, _, _, _, Avaliacao, _),
    Avaliacao >= 8.0.

% 4. REGRA PRINCIPAL DE RECOMENDAÇÃO

% Regra principal para recomendar filmes
recomendar_filme(Usuario, Filme) :-
    filme(Filme, _, _, _, _, _, _),          
    idade_adequada(Usuario, Filme),          
    \+ ja_assistiu(Usuario, Filme),         
    (genero_compativel(Usuario, Filme) ;     
     diretor_preferido(Usuario, Filme) ;    
     ator_admirado(Usuario, Filme)),         
    boa_avaliacao(Filme).                    

% 5. REGRAS AVANÇADAS

% Regras avançadas para recomendações personalizadas
recomendacao_premium(Usuario, Filme) :-
    filme(Filme, _, _, _, _, _, _),
    idade_adequada(Usuario, Filme),
    \+ ja_assistiu(Usuario, Filme),
    genero_compativel(Usuario, Filme),
    (diretor_preferido(Usuario, Filme) ; ator_admirado(Usuario, Filme)),
    boa_avaliacao(Filme).

% Melhor filme recomendado para o usuário
melhor_filme(Usuario, Filme) :-
    recomendar_filme(Usuario, Filme),
    filme(Filme, _, _, _, _, Avaliacao, _),
    \+ (recomendar_filme(Usuario, OutroFilme),
        filme(OutroFilme, _, _, _, _, OutraAvaliacao, _),
        OutraAvaliacao > Avaliacao).

% Lista todos os filmes recomendados para um usuário
listar_recomendacoes(Usuario) :-
    write('Recomendações para '), write(Usuario), write(':'), nl,
    findall(Filme, recomendar_filme(Usuario, Filme), FilmesComDuplicatas),
    list_to_set(FilmesComDuplicatas, FilmesUnicos),
    forall(member(Filme, FilmesUnicos),
           (filme(Filme, _, Ano, Diretor, _, Avaliacao, _),
            write('- '), write(Filme), write(' ('), write(Ano), write(') - '),
            write('Dir: '), write(Diretor), write(', Avaliação: '), write(Avaliacao), nl)).
listar_recomendacoes(_).

% 6. CONSULTAS ÚTEIS PARA TESTAR

% Exemplos de consultas:
% ?- recomendar_filme('João', Filme).
% ?- melhor_filme('Maria', Filme).
% ?- listar_recomendacoes('Pedro').
% ?- recomendacao_premium('Ana', Filme).

% Consulta para ver quantas recomendações um usuário tem:
contar_recomendacoes(Usuario, Total) :-
    findall(Filme, recomendar_filme(Usuario, Filme), FilmesComDuplicatas),
    list_to_set(FilmesComDuplicatas, FilmesUnicos),
    length(FilmesUnicos, Total).

estatisticas :-
    write('=== ESTATÍSTICAS DO SISTEMA ==='), nl,
    findall(F, filme(F, _, _, _, _, _, _), Filmes),
    length(Filmes, TotalFilmes),
    write('Total de filmes: '), write(TotalFilmes), nl,
    findall(U, usuario(U, _, _, _, _, _), Usuarios),
    length(Usuarios, TotalUsuarios),
    write('Total de usuários: '), write(TotalUsuarios), nl.