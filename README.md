# RELATÓRIO DO PROJETO PRÁTICO
## Sistema Inteligente de Recomendação de Filmes: "Meu Filme Ideal"

---

**ESTRUTURAS DISCRETAS**  
**Programação Lógica**

**Alunos**: Renato Costa, Vencislau Moisés, Albertina Nunca, Victorino Aires
**Curso:** Ciências da Computação  
**Professor(a) Responsável:** Dikiefu Fabiano  
**Data:** 24/06/2025

---

## SUMÁRIO

1. [Introdução]
2. [Desenvolvimento]
   - 2.1 [Metodologia]
   - 2.2 [Construção da Base de Conhecimento]
   - 2.3 [Definição das Regras de Recomendação]
   - 2.4 [Resultados e Análise]
3. [Conclusão]
4. [Referências]
5. [Anexos]

---

## INTRODUÇÃO

O presente relatório documenta o desenvolvimento de um sistema inteligente de recomendação de filmes denominado "Meu Filme Ideal", implementado utilizando programação lógica em Prolog. O projeto teve como objetivo principal aplicar conceitos de estruturas discretas, especificamente fatos, regras e variáveis, para criar um sistema capaz de compreender as preferências dos utilizadores e sugerir filmes adequados ao seu perfil.

A motivação para este projeto surge da necessidade crescente de sistemas de recomendação personalizados em plataformas digitais de entretenimento. Com o vasto catálogo de filmes disponíveis atualmente, torna-se essencial desenvolver mecanismos inteligentes que auxiliem os utilizadores na descoberta de conteúdo relevante às suas preferências.

O sistema desenvolvido utiliza lógica predicativa para estabelecer relações entre características dos filmes (género, diretor, atores, avaliação) e preferências dos utilizadores, gerando recomendações personalizadas e precisas.

---

## DESENVOLVIMENTO

### METODOLOGIA

O projeto foi estruturado em três etapas principais, seguindo uma abordagem sistemática para o desenvolvimento do sistema de recomendação:

**Materiais Utilizados:**
- Ambiente de programação Prolog (SWI-Prolog)
- Base de dados cinematográfica para coleta de informações sobre filmes
- Documentação técnica sobre programação lógica

**Etapas do Desenvolvimento:**
1. **Construção da Base de Conhecimento**: Criação de fatos sobre filmes e utilizadores
2. **Definição das Regras de Recomendação**: Implementação da lógica de recomendação
3. **Testes e Validação**: Verificação do funcionamento do sistema

### CONSTRUÇÃO DA BASE DE CONHECIMENTO

A base de conhecimento foi estruturada em duas componentes principais:

**Base de Filmes:**
Foram registrados 16 filmes distintos, cada um contendo:
- Título do filme
- Géneros (ação, drama, ficção científica, etc.)
- Ano de lançamento
- Diretor
- Atores principais
- Avaliação (escala de 1 a 10)
- Classificação etária

**Exemplos de filmes incluídos:**
- "Inception" (2010) - Christopher Nolan - Avaliação: 8.8
- "The Godfather" (1972) - Francis Ford Coppola - Avaliação: 9.2
- "Pulp Fiction" (1994) - Quentin Tarantino - Avaliação: 8.9
- "The Shawshank Redemption" (1994) - Frank Darabont - Avaliação: 9.3

**Base de Utilizadores:**
Foram criados 6 perfis de utilizadores distintos, incluindo:
- Nome e idade
- Géneros favoritos
- Diretores preferidos
- Atores admirados
- Histórico de filmes assistidos

**Exemplos de utilizadores:**
- João (25 anos) - Prefere ação e ficção científica, admira Christopher Nolan
- Maria (30 anos) - Prefere drama e romance, admira Steven Spielberg
- Sofia (16 anos) - Prefere animação e comédia, admira John Lasseter

### DEFINIÇÃO DAS REGRAS DE RECOMENDAÇÃO

O sistema implementa várias regras lógicas para garantir recomendações precisas:

**Regras Básicas de Validação:**
- `idade_adequada`: Verifica se o filme é apropriado para a idade do utilizador
- `genero_compativel`: Verifica compatibilidade entre géneros preferidos e géneros do filme
- `diretor_preferido`: Identifica se o diretor do filme está entre os preferidos do utilizador
- `ator_admirado`: Verifica se algum ator do filme é admirado pelo utilizador
- `ja_assistiu`: Evita recomendar filmes já assistidos
- `boa_avaliacao`: Garante que apenas filmes com avaliação ≥ 8.0 sejam recomendados

**Regra Principal de Recomendação:**

recomendar_filme(Usuario, Filme) :-
    filme(Filme, _, _, _, _, _, _),
    idade_adequada(Usuario, Filme),
    \+ ja_assistiu(Usuario, Filme),
    (genero_compativel(Usuario, Filme) ;
     diretor_preferido(Usuario, Filme) ;
     ator_admirado(Usuario, Filme)),
    boa_avaliacao(Filme).


**Regras Avançadas:**
- `recomendacao_premium`: Recomendações que cumprem múltiplos critérios simultaneamente
- `melhor_filme`: Identifica o filme com maior avaliação entre as recomendações
- `listar_recomendacoes`: Apresenta todas as recomendações para um utilizador

### RESULTADOS E ANÁLISE

**Testes Realizados:**

1. **Teste com o utilizador João:**
   - Recomendações obtidas: "The Dark Knight", "Interstellar"
   - Justificativa: Ambos são filmes de Christopher Nolan (diretor preferido) com boa avaliação

2. **Teste com a utilizadora Sofia:**
   - Recomendação obtida: "Toy Story"
   - Justificativa: Filme de animação com classificação etária adequada (0 anos)

3. **Análise de cobertura:**
   - O sistema consegue gerar recomendações para todos os utilizadores cadastrados
   - Total de filmes na base: 16
   - Total de utilizadores: 6
   - Taxa de sucesso nas recomendações: 100%

**Funcionalidades Implementadas:**
- Sistema de contagem de recomendações por utilizador
- Estatísticas gerais do sistema (total de filmes e utilizadores)
- Interface de consulta através de predicados Prolog

**Dificuldades Encontradas:**
1. **Balanceamento de critérios**: Inicial dificuldade em equilibrar diferentes preferências dos utilizadores
2. **Duplicação de recomendações**: Implementação de `list_to_set` para eliminar duplicatas
3. **Classificação etária**: Necessidade de garantir adequação do conteúdo à idade do utilizador


---

## CONCLUSÃO

O projeto "Meu Filme Ideal" foi desenvolvido com sucesso, alcançando todos os objetivos propostos. O sistema demonstrou capacidade de gerar recomendações personalizadas e precisas, utilizando eficientemente os conceitos de programação lógica.

**Objetivos Alcançados:**
- Construção de uma base de conhecimento robusta com 16 filmes e 6 utilizadores
- Implementação de regras lógicas para recomendação inteligente
- Desenvolvimento de funcionalidades avançadas (recomendação premium, melhor filme)
- Sistema funcional com interface de consulta

**Aprendizados Obtidos:**
1. **Programação Lógica**: Compreensão profunda da sintaxe e semântica do Prolog
2. **Modelagem de Conhecimento**: Habilidade de representar informações complexas através de fatos e regras
3. **Sistemas de Recomendação**: Entendimento dos desafios e soluções na criação de sistemas inteligentes
4. **Resolução de Problemas**: Desenvolvimento de pensamento lógico e estruturado

O sistema pode ser expandido futuramente com funcionalidades como aprendizado de preferências, integração com APIs de filmes, e interface gráfica para utilizadores finais. O projeto demonstrou a eficácia da programação lógica na solução de problemas complexos de recomendação e classificação.

---

## REFERÊNCIAS

3. **Material da Disciplina** - Estruturas Discretas, Programação Lógica. [Ano Letivo 2024/2025].

4. **SWI-Prolog Documentation** - Disponível em: https://www.swi-prolog.org/

---

## ANEXOS

### Anexo A - Código Completo do Sistema


% BASE DE CONHECIMENTO COMPLETA
% [Código Prolog implementado - ver documento sistema_filmes.pl]


### Anexo B - Exemplos de Consultas

% Consultas de teste realizadas:
?- recomendar_filme('João', Filme).
?- melhor_filme('Maria', Filme).
?- listar_recomendacoes('Pedro').
?- estatisticas.


### Anexo C - Resultados dos Testes

**Teste 1 - Recomendações para João:**
- The Dark Knight (2008) - Dir: Christopher Nolan, Avaliação: 9.0
- Interstellar (2014) - Dir: Christopher Nolan, Avaliação: 8.6

**Teste 2 - Estatísticas do Sistema:**
- Total de filmes: 16
- Total de utilizadores: 6

---

*Este relatório documenta integralmente o desenvolvimento e implementação do sistema "Meu Filme Ideal", demonstrando a aplicação prática dos conceitos de programação lógica na resolução de problemas reais.*
