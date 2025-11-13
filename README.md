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

Todos os objetos seguem o padrão:

