# 📊 PIU — Data Model Documentation  
Modelo de Dados da Aplicação

---

## 🧭 Visão Geral

O modelo de dados do PIU foi projetado seguindo padrões corporativos de:

- modelagem relacional  
- consistência lógica  
- normalização  
- separação entre domínios e tabelas de negócio  
- governança e auditoria de dados  
- extensibilidade para IA (Oracle 23ai)

Ele é dividido em módulos:

1. Usuários e segurança  
2. Posts e mídia  
3. Grafo social  
4. Mensagens diretas (DMs)  
5. Hashtags e menções  
6. Short Links  
7. Notificações  
8. Denúncias (Reports)  
9. IA / Vetores  
10. Histórico de login  

---

## 🏗️ Entidades Principais (por módulo)

### 1. Usuários e segurança
- **piu_usr_users**
- **piu_dom_accountStatus**
- **piu_dom_privacyLevel**
- **piu_hln_historyLogins**
- **piu_dom_loginResult**

### 2. Posts e mídia
- **piu_pst_posts**
- **piu_dom_postVisibility**
- **piu_med_media**
- **piu_dom_mediaType**

### 3. Grafo social
- **piu_fol_follows**
- **piu_dom_followStatus**
- **piu_int_interactions**
- **piu_dom_interactionType**

### 4. Mensagens diretas
- **piu_msg_directMessages**
- **piu_msg_messageUsers**
- **piu_dom_messageRole**
- **piu_dom_messageStatus**

### 5. Hashtags e menções
- **piu_tag_hashtags**
- **piu_tag_postHashtags**
- **piu_men_mentions**

### 6. Short Links
- **piu_lnk_shortLinks**
- **piu_dom_shortLinkStatus**

### 7. Notificações
- **piu_not_notifications**
- **piu_dom_notificationType**
- **piu_dom_notificationStatus**

### 8. Denúncias
- **piu_rep_reports**
- **piu_dom_reportType**
- **piu_dom_reportStatus**

### 9. IA / Vetores
- **piu_dom_embeddingModel**
- **piu_vec_postEmbeddings**
- **piu_vec_userEmbeddings**

---

## 🔗 Relacionamentos (MER lógico)

### Usuários → Posts
- Um usuário **cria muitos posts**  
- `piu_pst_posts.usr_id_user` → `piu_usr_users.usr_id_user`

### Posts → Mídias
- Um post pode ter **muitas mídias**  
- `piu_med_media.pst_id_post` → `piu_pst_posts.pst_id_post`

### Posts → Interações
- Um post pode ter **muitas interações**  
- `piu_int_interactions.pst_id_post` → `piu_pst_posts.pst_id_post`

### Usuários → Interações
- Um usuário pode **interagir muitas vezes**  
- `piu_int_interactions.usr_id_user_actor` → `piu_usr_users.usr_id_user`

### Posts → Hashtags (N:N)
- `piu_tag_postHashtags` relaciona posts e hashtags  

### Posts → Mentions
- `piu_men_mentions.pst_id_post` → `piu_pst_posts.pst_id_post`

### Usuários → Mentions
- Quem menciona  
  - `usr_id_user_author`  
- Quem é mencionado  
  - `usr_id_user_mentioned`

### Usuários ↔ Usuários (Follow)
- `piu_fol_follows.usr_id_user_follower` → usuário seguidor  
- `piu_fol_follows.usr_id_user_followed` → usuário seguido  

### DMs → Participantes
- `piu_msg_messageUsers.msg_id_message` → DM  
- Uma DM tem **muitos participantes**  

### Notificações
- `usr_id_user_target` → quem recebe  
- `usr_id_user_actor` → quem causou  
- `pst_id_post` → opcional  
- `msg_id_message` → opcional  
- `fol_id_follow` → opcional  

### Reports
- `usr_id_user_reporter` → denunciante  
- `usr_id_user_reported` → denunciado  
- `pst_id_post` → opcional  
- `msg_id_message` → opcional  

### Vetores
- `piu_vec_postEmbeddings.pst_id_post` → `piu_pst_posts`  
- `piu_vec_userEmbeddings.usr_id_user` → `piu_usr_users`  

---

## 📐 MER Simplificado (texto)

USERS (1) ───< POSTS (N)  
USERS (1) ───< MEDIA (N)  
USERS (1) ───< POST_INTERACTIONS (N)  
USERS (1) ───< FOLLOWS (N) >───(1) USERS  

POSTS (1) ───< MEDIA (N)  
POSTS (1) ───< INTERACTIONS (N)  
POSTS (1) ───< MENTIONS (N)  
POSTS (1) ───< POST_HASHTAGS (N) >───(1) HASHTAGS  

DMs (1) ───< MESSAGE_USERS (N) >───(1) USERS  

USERS (1) ───< NOTIFICATIONS (N)  
POSTS (1) ───< NOTIFICATIONS (N) (opcional)  
FOLLOWS (1) ───< NOTIFICATIONS (N) (opcional)  
DMs (1) ───< NOTIFICATIONS (N) (opcional)  

POSTS (1) ───< POST_EMBEDDINGS (N)  
USERS (1) ───< USER_EMBEDDINGS (N)  


---

## 📘 Observações Importantes

- Todas as tabelas possuem **createdAt**, **updatedAt**, e triggers BU.  
- Todas as tabelas possuem **COMMENT ON TABLE/COLUMN**.  
- Todos os domínios usam prefixo `piu_dom_`.  
- Todas as FKs seguem o padrão: `piu_fk_TT1_TT2_nomeCamelCase`.  
- Todas as PKs seguem: `piu_pk_TTT_nomeCamelCase`.  
- Todas as tabelas têm nomes em inglês.  
- Todo SQL é minúsculo.  
- Toda parte final dos objetos usa **camelCase**.  

---

## ✨ Diagrama Visual

Para gerar um diagrama visual no **dbdiagram.io**, use:

https://dbdiagram.io

> Basta copiar a seção MER Simplificado e as listas de entidades.

---

## 📦 Próximos Passos

- Criar visões (Views) do tipo:  
  - `piu_vw_publicTimeline`  
  - `piu_vw_userFeed`  
  - `piu_vw_notificationsList`  
  - `piu_vw_postSearchSemantic` (usando VECTOR)

- Criar packages de API:  
  - `piu_pkg_postApi`  
  - `piu_pkg_dmApi`  
  - `piu_pkg_followApi`  
  - `piu_pkg_aiApi` (para embeddings)

---

