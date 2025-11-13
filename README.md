# PIU — Post • Interact • Unite  
Rede Social Experimental construída com Oracle 23ai + Oracle APEX

---

## 📌 Sobre o Projeto

**PIU** é uma rede social experimental inspirada em plataformas como X/Threads, criada com o objetivo de:

- servir como laboratório de estudo de **banco de dados Oracle 23ai**  
- explorar recursos modernos de **IA nativa com vetores (VECTOR datatype)**  
- demonstrar modelagem profissional, padronização de objetos e arquitetura limpa  
- implementar uma aplicação social real usando **Oracle APEX**  
- compor um projeto público de portfólio no GitHub

O nome PIU vem de:

> **Post • Interact • Unite**  
> além da brincadeira linguística com o "piu" dos pássaros (herança conceitual do antigo Twitter)  
> e o trocadilho com a expressão brasileira **"nem mais um pio!"**

---

## 🧱 Tecnologias Utilizadas

- **Oracle Database 23ai**  
  - VECTOR datatype  
  - IA nativa  
  - SQL/PLSQL  
  - Domínios  
  - Triggers, sequences, constraints  
- **Oracle APEX**  
  - CRUD completo  
  - Autenticação personalizada  
  - Upload de mídia (BLOB + File Storage)  
  - Página de redirecionamento "Você está saindo do PIU"  
  - Painel de moderação  
  - Timeline  
- **Markdown / HTML**  
  - Posts e DMs suportam conteúdo em Markdown convertido para HTML  
- **GitHub**  
  - Repositório público  
  - Documentação oficial  
  - Scripts versionados  

---

## 🧩 Arquitetura Geral da Aplicação

### ✔️ Módulos principais

- Autenticação e segurança  
- Posts (Markdown, HTML, mídia, hashtags, mentions)  
- Short Links com análise de cliques  
- DMs com múltiplos participantes  
- Follows, interações e grafo social  
- Notificações completas  
- Denúncias e moderação  
- Histórico de logins  
- Vetores para IA (recomendação + busca semântica)  

### ✔️ Padrão de Nomes (Padrão PIU)

Todos os objetos seguem o padrão: SSS_TTT_nomeCamelCase

- `SSS` = sistema (piu)  
- `TTT` = sigla da tabela (usr, pst, msg, med, vec, etc.)  
- `nomeCamelCase` = nome do objeto em camelCase  
- Tudo em minúsculas  
- SQL/DDL sempre minúsculo  
- PL/SQL (procedures, packages, functions e triggers) sempre camelCase  

Exemplos:

- `piu_usr_users`  
- `piu_pst_posts`  
- `piu_trg_bu_usr_updateTimestamp`  
- `piu_vec_postEmbeddings`

---

## 🧬 IA no PIU (Oracle 23ai)

O PIU utiliza o tipo nativo: VECTOR(1536, FLOAT32)

para armazenar embeddings semânticos de:

- posts (`piu_vec_postEmbeddings`)
- usuários (`piu_vec_userEmbeddings`)

Esses vetores são utilizados para:

- recomendações (“Who to follow”)  
- busca semântica de posts  
- trending topics inteligentes  
- detecção de clusters de interesse  
- posts semelhantes (“More like this”)  

---

## 📦 Estrutura de Pastas Recomendada

/db
/ddl
/dml
/packages
/functions
/triggers
/scripts
/apex
/docs
README.md
DATA_MODEL.md


---

## 📘 Documentação do Modelo de Dados

A documentação completa está disponível em:

➡️ **DATA_MODEL.md**

---

## 📜 Licença

MIT License (ou outra que você decidir)

---

## 📣 Autor

Projeto criado para estudos avançados de  
**Oracle 23ai, APEX, modelagem de dados e aplicações sociais complexas.**

