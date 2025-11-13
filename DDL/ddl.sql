
/*******************************************************************************
*** Clean-up script, run only if you need to execute the script more than once
*******************************************************************************/

drop table piu_dom_mediaType cascade constraints;
drop table piu_dom_postVisibility cascade constraints;
drop table piu_dom_followStatus cascade constraints;
drop table piu_dom_interactionType cascade constraints;
drop table piu_dom_shortLinkStatus cascade constraints;
drop table piu_dom_messageRole cascade constraints;
drop table piu_dom_messageStatus cascade constraints;
drop table piu_dom_notificationType cascade constraints;
drop table piu_dom_notificationStatus cascade constraints;
drop table piu_dom_loginResult cascade constraints;
drop table piu_dom_loginResult cascade constraints;
drop table piu_dom_reportType cascade constraints;
drop table piu_dom_reportStatus cascade constraints;
drop table piu_dom_embeddingModel cascade constraints;
drop table piu_usr_users cascade constraints;
drop table piu_pst_posts cascade constraints;
drop table piu_med_media cascade constraints;
drop table piu_lnk_shortLinks cascade constraints;
drop table piu_fol_follows cascade constraints;
drop table piu_int_interactions cascade constraints;
drop table piu_msg_directMessages cascade constraints;
drop table piu_msg_messageUsers cascade constraints;
drop table piu_men_mentions cascade constraints;
drop table piu_tag_hashtags cascade constraints;
drop table piu_tag_postHashtags cascade constraints;
drop table piu_not_notifications cascade constraints;
drop table piu_rep_reports cascade constraints;
drop table piu_vec_postEmbeddings cascade constraints;
drop table piu_vec_userEmbeddings cascade constraints;

/*******************************************************************************
*** Domains
*******************************************************************************/

create table piu_dom_postVisibility (
    dom_postVisibilityCode  varchar2(30) constraint piu_pk_dom_postVisibility primary key,
    dom_description         varchar2(200) not null
);

comment on table piu_dom_postVisibility is 'Domain table that defines the available visibility options for posts in PIU.';
comment on column piu_dom_postVisibility.dom_postVisibilityCode is 'Code that identifies a post visibility option (e.g. public, followers).';
comment on column piu_dom_postVisibility.dom_description is 'Human-readable description of the post visibility option.';

create table piu_dom_mediaType (
    dom_mediaTypeCode   varchar2(30) constraint piu_pk_dom_mediaType primary key,
    dom_description     varchar2(200) not null
);

comment on table piu_dom_mediaType is 'Domain table that defines the supported media types for attachments in PIU.';
comment on column piu_dom_mediaType.dom_mediaTypeCode is 'Code that identifies a media type (e.g. image, video).';
comment on column piu_dom_mediaType.dom_description is 'Human-readable description of the media type.';

create table piu_dom_followStatus (
    dom_followStatusCode  varchar2(30) constraint piu_pk_dom_followStatus primary key,
    dom_description       varchar2(200) not null
);

comment on table piu_dom_followStatus is 'Domain table that defines the possible statuses for follower relationships in PIU.';
comment on column piu_dom_followStatus.dom_followStatusCode is 'Code that identifies a follow relationship status (e.g. active, blocked, muted).';
comment on column piu_dom_followStatus.dom_description is 'Human-readable description of the follow relationship status.';

create table piu_dom_interactionType (
    dom_interactionTypeCode  varchar2(30) constraint piu_pk_dom_interactionType primary key,
    dom_description          varchar2(200) not null
);

comment on table piu_dom_interactionType is 'Domain table that defines the types of interactions users can perform on posts (like, repost, quote, bookmark).';
comment on column piu_dom_interactionType.dom_interactionTypeCode is 'Code that identifies the interaction type (e.g. like, repost, quote, bookmark).';
comment on column piu_dom_interactionType.dom_description is 'Human-readable description of the interaction type.';

create table piu_dom_shortLinkStatus (
    dom_shortLinkStatusCode  varchar2(30) constraint piu_pk_dom_shortLinkStatus primary key,
    dom_description          varchar2(200) not null
);

comment on table piu_dom_shortLinkStatus is 'Domain table that defines the status of short links generated in PIU.';
comment on column piu_dom_shortLinkStatus.dom_shortLinkStatusCode is 'Code that identifies the status of a short link (e.g. active, disabled, expired).';
comment on column piu_dom_shortLinkStatus.dom_description is 'Human-readable description of the short link status.';

create table piu_dom_messageRole (
    dom_messageRoleCode   varchar2(30) constraint piu_pk_dom_messageRole primary key,
    dom_description       varchar2(200) not null
);

comment on table piu_dom_messageRole is 'Domain table that defines the possible roles a user can have in a direct message (sender or recipient).';
comment on column piu_dom_messageRole.dom_messageRoleCode is 'Code that identifies the user role in a direct message (e.g. sender, recipient).';
comment on column piu_dom_messageRole.dom_description is 'Human-readable description of the direct message user role.';

create table piu_dom_messageStatus (
    dom_messageStatusCode  varchar2(30) constraint piu_pk_dom_messageStatus primary key,
    dom_description        varchar2(200) not null
);

comment on table piu_dom_messageStatus is 'Domain table that defines the possible statuses of a direct message for a given user (sent, delivered, read, archived, deleted).';
comment on column piu_dom_messageStatus.dom_messageStatusCode is 'Code that identifies the status of a direct message for a user (e.g. sent, delivered, read).';
comment on column piu_dom_messageStatus.dom_description is 'Human-readable description of the direct message status.';

create table piu_dom_notificationType (
    dom_notificationTypeCode  varchar2(50) constraint piu_pk_dom_notificationType primary key,
    dom_description           varchar2(200) not null
);

comment on table piu_dom_notificationType is 'Domain table that defines the different types of notifications generated in PIU.';
comment on column piu_dom_notificationType.dom_notificationTypeCode is 'Code that identifies the notification type (like, reply, repost, mention, follow, directMsg, system).';
comment on column piu_dom_notificationType.dom_description is 'Human-readable description of the notification type.';

create table piu_dom_notificationStatus (
    dom_notificationStatusCode  varchar2(30) constraint piu_pk_dom_notificationStatus primary key,
    dom_description             varchar2(200) not null
);

comment on table piu_dom_notificationStatus is 'Domain table that defines the status of notifications for a given user.';
comment on column piu_dom_notificationStatus.dom_notificationStatusCode is 'Code that identifies the notification status (unread, read, dismissed).';
comment on column piu_dom_notificationStatus.dom_description is 'Human-readable description of the notification status.';

create table piu_dom_loginResult (
    dom_loginResultCode   varchar2(30) constraint piu_pk_dom_loginResult primary key,
    dom_description       varchar2(200) not null
);

comment on table piu_dom_loginResult is 'Domain table that defines possible outcomes for user login attempts in PIU.';
comment on column piu_dom_loginResult.dom_loginResultCode is 'Code that identifies the login result (success, invalidCredentials, locked, passwordExpired, error).';
comment on column piu_dom_loginResult.dom_description is 'Human-readable description of the login result.';

create table piu_dom_reportType (
    dom_reportTypeCode   varchar2(50) constraint piu_pk_dom_reportType primary key,
    dom_description      varchar2(200) not null
);

comment on table piu_dom_reportType is 'Domain table that defines the possible categories for user reports in PIU.';
comment on column piu_dom_reportType.dom_reportTypeCode is 'Code that identifies the report type category (e.g. spam, abuse, nsfw, misinformation, copyright, other).';
comment on column piu_dom_reportType.dom_description is 'Human-readable description of the report type.';

create table piu_dom_reportStatus (
    dom_reportStatusCode  varchar2(30) constraint piu_pk_dom_reportStatus primary key,
    dom_description       varchar2(200) not null
);

comment on table piu_dom_reportStatus is 'Domain table that defines the possible statuses for user reports in PIU.';
comment on column piu_dom_reportStatus.dom_reportStatusCode is 'Code that identifies the status of a report (open, underReview, resolved, dismissed).';
comment on column piu_dom_reportStatus.dom_description is 'Human-readable description of the report status.';

create table piu_dom_embeddingModel (
    dom_embeddingModelCode   varchar2(50) constraint piu_pk_dom_embeddingModel primary key,
    dom_description          varchar2(200) not null,
    dom_vectorDimension      number not null,
    dom_provider             varchar2(100),
    dom_isActive             char(1) default 'y' not null,
    dom_createdAt            date default sysdate not null,
    dom_updatedAt            date default sysdate not null
);

create or replace trigger piu_trg_bu_dom_embeddingModel_updateTimestamp
before update on piu_dom_embeddingModel
for each row
begin
    :new.dom_updatedAt := sysdate;
end;
/

comment on table piu_dom_embeddingModel is 'Domain table that defines the embedding models used by PIU for vector representations (e.g. posts, users).';
comment on column piu_dom_embeddingModel.dom_embeddingModelCode is 'Code that identifies the embedding model configuration used for vectors.';
comment on column piu_dom_embeddingModel.dom_description is 'Human-readable description of the embedding model usage.';
comment on column piu_dom_embeddingModel.dom_vectorDimension is 'Expected vector dimension for this embedding model (must match the VECTOR column definition).';
comment on column piu_dom_embeddingModel.dom_provider is 'Provider or source of the embedding model (e.g. oracle23ai, openai, custom).';
comment on column piu_dom_embeddingModel.dom_isActive is 'Flag indicating whether this embedding model is currently active (y/n).';
comment on column piu_dom_embeddingModel.dom_createdAt is 'Timestamp when the embedding model record was created.';
comment on column piu_dom_embeddingModel.dom_updatedAt is 'Timestamp of the last update to the embedding model record.';

/*******************************************************************************
*** Users
*******************************************************************************/

create table piu_usr_users (
    usr_id_user           number generated by default as identity constraint piu_pk_usr_users primary key,
    usr_fullName          varchar2(150) not null,
    usr_username          varchar2(50)  not null unique,
    usr_email             varchar2(150) not null unique,
    usr_passwordHash      varchar2(255) not null,
    usr_birthDate         date,
    usr_gender            varchar2(20),
    usr_bio               varchar2(300),
    usr_profileImageUrl   varchar2(255),
    usr_phone             varchar2(20),
    usr_accountStatus     varchar2(15) default 'active' not null,
    usr_privacyConfig     clob,
    usr_lastActivity      date,
    usr_createdAt         date default sysdate not null,
    usr_updatedAt         date default sysdate not null
);

alter table piu_usr_users
  add constraint piu_chk_usr_accountStatus
  check (usr_accountStatus in ('active', 'inactive', 'banned'));

comment on table piu_usr_users is 'Stores core profile and authentication data for PIU social network users.';
comment on column piu_usr_users.usr_id_user is 'Unique identifier for the user.';
comment on column piu_usr_users.usr_fullName is 'User full name, used mainly for display purposes.';
comment on column piu_usr_users.usr_username is 'Unique handle for the user (e.g., @john_doe). Used in mentions and profile URLs.';
comment on column piu_usr_users.usr_email is 'User email address, used for login and notifications.';
comment on column piu_usr_users.usr_passwordHash is 'Hashed password for authentication (never store plain text passwords).';
comment on column piu_usr_users.usr_birthDate is 'User date of birth. May be used for age-based restrictions and analytics.';
comment on column piu_usr_users.usr_gender is 'Optional gender information, stored as free text label.';
comment on column piu_usr_users.usr_bio is 'Short user biography shown on the public profile.';
comment on column piu_usr_users.usr_profileImageUrl is 'URL of the user profile image (avatar).';
comment on column piu_usr_users.usr_phone is 'Optional phone number, may be used for 2FA or account recovery.';
comment on column piu_usr_users.usr_accountStatus is 'Current status of the account: active, inactive, or banned.';
comment on column piu_usr_users.usr_privacyConfig is 'JSON or structured data describing user privacy preferences (e.g. profile visibility).';
comment on column piu_usr_users.usr_lastActivity is 'Timestamp of the user last activity within PIU. Used for presence/online indicators.';
comment on column piu_usr_users.usr_createdAt is 'Timestamp when the user account was created.';
comment on column piu_usr_users.usr_updatedAt is 'Timestamp of the last update to the user record.';

alter table piu_usr_users add (
    usr_creationIp varchar2(100),
    usr_updateIp   varchar2(100)
);

comment on column piu_usr_users.usr_creationIp is 'IP address from which the user account was created.';
comment on column piu_usr_users.usr_updateIp is 'IP address from which the user record was last updated.';

create or replace trigger piu_trg_bi_usr_setCreationIp
before insert on piu_usr_users
for each row
begin
    :new.usr_creationIp := sys_context('userenv','ip_address');
end;
/

create or replace trigger piu_trg_bu_usr_setUpdateIp
before update on piu_usr_users
for each row
begin
    :new.usr_updateIp := sys_context('userenv','ip_address');
    :new.usr_updatedAt := sysdate;   -- mantém sua regra anterior
end;
/

/*******************************************************************************
*** Posts
*******************************************************************************/

create table piu_pst_posts (
    pst_id_post          number generated by default as identity constraint piu_pk_pst_posts primary key,
    usr_id_user          number not null,
    pst_contentMarkdown  clob not null,
    pst_contentHtml      clob,
    pst_visibility       varchar2(20) not null, -- 'public' or 'followers'
    pst_createdAt        date default sysdate not null,
    pst_updatedAt        date default sysdate not null
);

alter table piu_pst_posts
  add constraint piu_fk_pst_usr_author
  foreign key (usr_id_user)
  references piu_usr_users (usr_id_user);

create or replace trigger piu_trg_bu_pst_updateTimestamp
before update on piu_pst_posts
for each row
begin
    :new.pst_updatedAt := sysdate;
end;
/

comment on table piu_pst_posts is 'Stores user posts for the PIU social network, including public and followers-only content.';
comment on column piu_pst_posts.pst_id_post is 'Unique identifier for the post.';
comment on column piu_pst_posts.usr_id_user is 'Identifier of the user who authored the post, referencing piu_usr_users.';
comment on column piu_pst_posts.pst_contentMarkdown is 'Original post content written in Markdown format.';
comment on column piu_pst_posts.pst_contentHtml is 'Optional rendered HTML version of the post content, generated from Markdown.';
comment on column piu_pst_posts.pst_visibility is 'Post visibility: ''public'' for everyone, ''followers'' for followers-only posts.';
comment on column piu_pst_posts.pst_createdAt is 'Timestamp when the post was created.';
comment on column piu_pst_posts.pst_updatedAt is 'Timestamp of the last update to the post record.';

alter table piu_pst_posts add (
    dom_postVisibilityCode varchar2(30) not null
);

alter table piu_pst_posts drop column pst_visibility;

alter table piu_pst_posts
  add constraint piu_fk_pst_dom_postVisibility
  foreign key (dom_postVisibilityCode)
  references piu_dom_postVisibility (dom_postVisibilityCode);

comment on column piu_pst_posts.dom_postVisibilityCode is 'Reference to the post visibility domain (public or followers), from piu_dom_postVisibility.';

/*******************************************************************************
*** Media
*******************************************************************************/

create table piu_med_media (
    med_id_media        number generated by default as identity constraint piu_pk_med_media primary key,
    pst_id_post         number not null,
    dom_mediaTypeCode   varchar2(30) not null,
    med_fileUrl         varchar2(4000) not null,
    med_altText         varchar2(500),
    med_caption         varchar2(500),
    med_displayOrder    number,
    med_createdAt       date default sysdate not null,
    med_updatedAt       date default sysdate not null
);

alter table piu_med_media add (
    med_fileBlob blob
);

alter table piu_med_media
  add constraint piu_fk_med_pst_post
  foreign key (pst_id_post)
  references piu_pst_posts (pst_id_post);

alter table piu_med_media
  add constraint piu_fk_med_dom_mediaType
  foreign key (dom_mediaTypeCode)
  references piu_dom_mediaType (dom_mediaTypeCode);

create or replace trigger piu_trg_bu_med_updateTimestamp
before update on piu_med_media
for each row
begin
    :new.med_updatedAt := sysdate;
end;
/

comment on table piu_med_media is 'Stores media attachments (e.g. images, videos) associated with posts in the PIU social network.';
comment on column piu_med_media.med_id_media is 'Unique identifier for the media attachment.';
comment on column piu_med_media.pst_id_post is 'Identifier of the post to which this media is attached, referencing piu_pst_posts.';
comment on column piu_med_media.dom_mediaTypeCode is 'Reference to the media type domain (e.g. image, video) from piu_dom_mediaType.';
comment on column piu_med_media.med_fileUrl is 'URL pointing to the stored media file (e.g. object storage, CDN).';
comment on column piu_med_media.med_altText is 'Alternative text for the media, used for accessibility and screen readers.';
comment on column piu_med_media.med_caption is 'Optional caption or description shown together with the media.';
comment on column piu_med_media.med_displayOrder is 'Order in which this media should be displayed among other media attached to the same post.';
comment on column piu_med_media.med_createdAt is 'Timestamp when the media record was created.';
comment on column piu_med_media.med_updatedAt is 'Timestamp of the last update to the media record.';
comment on column piu_med_media.med_fileBlob is 'Binary content of the media file stored as a BLOB inside the database.';

/*******************************************************************************
*** Followers
*******************************************************************************/

create table piu_fol_follows (
    fol_id_follow          number generated by default as identity constraint piu_pk_fol_follows primary key,
    usr_id_user_follower   number not null,
    usr_id_user_followed   number not null,
    dom_followStatusCode   varchar2(30) not null,
    fol_createdAt          date default sysdate not null,
    fol_updatedAt          date default sysdate not null
);

alter table piu_fol_follows
  add constraint piu_fk_fol_usr_follower
  foreign key (usr_id_user_follower)
  references piu_usr_users (usr_id_user);

alter table piu_fol_follows
  add constraint piu_fk_fol_usr_followed
  foreign key (usr_id_user_followed)
  references piu_usr_users (usr_id_user);

alter table piu_fol_follows
  add constraint piu_fk_fol_dom_followStatus
  foreign key (dom_followStatusCode)
  references piu_dom_followStatus (dom_followStatusCode);

alter table piu_fol_follows
  add constraint piu_uk_fol_followerFollowed
  unique (usr_id_user_follower, usr_id_user_followed);

alter table piu_fol_follows
  add constraint piu_chk_fol_notSelfFollow
  check (usr_id_user_follower <> usr_id_user_followed);

create or replace trigger piu_trg_bu_fol_updateTimestamp
before update on piu_fol_follows
for each row
begin
    :new.fol_updatedAt := sysdate;
end;
/

comment on table piu_fol_follows is 'Stores follower relationships between users in the PIU social network (who follows whom).';
comment on column piu_fol_follows.fol_id_follow is 'Unique identifier for the follower relationship.';
comment on column piu_fol_follows.usr_id_user_follower is 'Identifier of the user who follows another user (the follower), referencing piu_usr_users.';
comment on column piu_fol_follows.usr_id_user_followed is 'Identifier of the user being followed (the target), referencing piu_usr_users.';
comment on column piu_fol_follows.dom_followStatusCode is 'Reference to the follow status domain (e.g. active, blocked, muted) from piu_dom_followStatus.';
comment on column piu_fol_follows.fol_createdAt is 'Timestamp when the follow relationship was created.';
comment on column piu_fol_follows.fol_updatedAt is 'Timestamp of the last update to the follow relationship record.';

/*******************************************************************************
*** Interactions
*******************************************************************************/

create table piu_int_interactions (
    int_id_interaction       number generated by default as identity constraint piu_pk_int_interactions primary key,
    usr_id_user_actor        number not null,
    pst_id_post              number not null,
    dom_interactionTypeCode  varchar2(30) not null,
    int_createdAt            date default sysdate not null,
    int_updatedAt            date default sysdate not null
);

alter table piu_int_interactions
  add constraint piu_fk_int_usr_actor
  foreign key (usr_id_user_actor)
  references piu_usr_users (usr_id_user);

alter table piu_int_interactions
  add constraint piu_fk_int_pst_post
  foreign key (pst_id_post)
  references piu_pst_posts (pst_id_post);

alter table piu_int_interactions
  add constraint piu_fk_int_dom_interactionType
  foreign key (dom_interactionTypeCode)
  references piu_dom_interactionType (dom_interactionTypeCode);

alter table piu_int_interactions
  add constraint piu_uk_int_actorPostType
  unique (usr_id_user_actor, pst_id_post, dom_interactionTypeCode);

create or replace trigger piu_trg_bu_int_updateTimestamp
before update on piu_int_interactions
for each row
begin
    :new.int_updatedAt := sysdate;
end;
/

comment on table piu_int_interactions is 'Stores interactions that users perform on posts (like, repost, quote, bookmark) in the PIU social network.';
comment on column piu_int_interactions.int_id_interaction is 'Unique identifier for the interaction record.';
comment on column piu_int_interactions.usr_id_user_actor is 'Identifier of the user who performed the interaction (the actor), referencing piu_usr_users.';
comment on column piu_int_interactions.pst_id_post is 'Identifier of the post that is the target of the interaction, referencing piu_pst_posts.';
comment on column piu_int_interactions.dom_interactionTypeCode is 'Reference to the interaction type domain (like, repost, quote, bookmark) from piu_dom_interactionType.';
comment on column piu_int_interactions.int_createdAt is 'Timestamp when the interaction was created.';
comment on column piu_int_interactions.int_updatedAt is 'Timestamp of the last update to the interaction record.';

/*******************************************************************************
*** Short links
*******************************************************************************/

create table piu_lnk_shortLinks (
    lnk_id_shortLink        number generated by default as identity constraint piu_pk_lnk_shortLinks primary key,
    pst_id_post             number,
    usr_id_user_creator     number not null,
    lnk_code                varchar2(100) not null,
    lnk_originalUrl         varchar2(4000) not null,
    dom_shortLinkStatusCode varchar2(30) not null,
    lnk_clickCount          number default 0 not null,
    lnk_lastClickAt         date,
    lnk_createdAt           date default sysdate not null,
    lnk_updatedAt           date default sysdate not null
);

alter table piu_lnk_shortLinks
  add constraint piu_fk_lnk_usr_creator
  foreign key (usr_id_user_creator)
  references piu_usr_users (usr_id_user);

alter table piu_lnk_shortLinks
  add constraint piu_fk_lnk_pst_post
  foreign key (pst_id_post)
  references piu_pst_posts (pst_id_post);

alter table piu_lnk_shortLinks
  add constraint piu_fk_lnk_dom_shortLinkStatus
  foreign key (dom_shortLinkStatusCode)
  references piu_dom_shortLinkStatus (dom_shortLinkStatusCode);

alter table piu_lnk_shortLinks
  add constraint piu_uk_lnk_code
  unique (lnk_code);
  
create or replace trigger piu_trg_bu_lnk_updateTimestamp
before update on piu_lnk_shortLinks
for each row
begin
    :new.lnk_updatedAt := sysdate;
end;
/

comment on table piu_lnk_shortLinks is 'Stores short links generated in the PIU platform, including original URLs, status and click statistics.';
comment on column piu_lnk_shortLinks.lnk_id_shortLink is 'Unique identifier for the short link record.';
comment on column piu_lnk_shortLinks.pst_id_post is 'Identifier of the post associated with this short link, if any, referencing piu_pst_posts.';
comment on column piu_lnk_shortLinks.usr_id_user_creator is 'Identifier of the user who created the short link, referencing piu_usr_users.';
comment on column piu_lnk_shortLinks.lnk_code is 'Short code used in PIU URLs to represent the original URL (e.g. piu.app/l/{lnk_code}).';
comment on column piu_lnk_shortLinks.lnk_originalUrl is 'Full original URL that the short link redirects to.';
comment on column piu_lnk_shortLinks.dom_shortLinkStatusCode is 'Reference to the short link status domain (active, disabled, expired) from piu_dom_shortLinkStatus.';
comment on column piu_lnk_shortLinks.lnk_clickCount is 'Total number of times this short link has been clicked.';
comment on column piu_lnk_shortLinks.lnk_lastClickAt is 'Timestamp of the most recent click on this short link.';
comment on column piu_lnk_shortLinks.lnk_createdAt is 'Timestamp when the short link was created.';
comment on column piu_lnk_shortLinks.lnk_updatedAt is 'Timestamp of the last update to the short link record.';

/*******************************************************************************
*** Direct messages
*******************************************************************************/

create table piu_msg_directMessages (
    msg_id_message        number generated by default as identity constraint piu_pk_msg_directMessages primary key,
    msg_contentMarkdown   clob not null,
    msg_contentHtml       clob,
    msg_createdAt         date default sysdate not null,
    msg_updatedAt         date default sysdate not null
);

create or replace trigger piu_trg_bu_msg_updateTimestamp
before update on piu_msg_directMessages
for each row
begin
    :new.msg_updatedAt := sysdate;
end;
/

comment on table piu_msg_directMessages is 'Stores the core content of direct messages (DMs) in the PIU social network.';
comment on column piu_msg_directMessages.msg_id_message is 'Unique identifier for the direct message.';
comment on column piu_msg_directMessages.msg_contentMarkdown is 'Original direct message content written in Markdown format.';
comment on column piu_msg_directMessages.msg_contentHtml is 'Optional rendered HTML version of the direct message content, generated from Markdown.';
comment on column piu_msg_directMessages.msg_createdAt is 'Timestamp when the direct message was created.';
comment on column piu_msg_directMessages.msg_updatedAt is 'Timestamp of the last update to the direct message record.';

/*******************************************************************************
*** Message users
*******************************************************************************/

create table piu_msg_messageUsers (
    msg_id_message        number not null,
    usr_id_user           number not null,
    dom_messageRoleCode   varchar2(30) not null,
    dom_messageStatusCode varchar2(30) not null,
    msg_readAt            date,
    msg_createdAt         date default sysdate not null,
    msg_updatedAt         date default sysdate not null,
    constraint piu_pk_msg_messageUsers
        primary key (msg_id_message, usr_id_user, dom_messageRoleCode)
);

alter table piu_msg_messageUsers
  add constraint piu_fk_msg_msg_message
  foreign key (msg_id_message)
  references piu_msg_directMessages (msg_id_message);

alter table piu_msg_messageUsers
  add constraint piu_fk_msg_usr_user
  foreign key (usr_id_user)
  references piu_usr_users (usr_id_user);

alter table piu_msg_messageUsers
  add constraint piu_fk_msg_dom_messageRole
  foreign key (dom_messageRoleCode)
  references piu_dom_messageRole (dom_messageRoleCode);

alter table piu_msg_messageUsers
  add constraint piu_fk_msg_dom_messageStatus
  foreign key (dom_messageStatusCode)
  references piu_dom_messageStatus (dom_messageStatusCode);

create or replace trigger piu_trg_bu_msgUser_updateTimestamp
before update on piu_msg_messageUsers
for each row
begin
    :new.msg_updatedAt := sysdate;
end;
/

comment on table piu_msg_messageUsers is 'Associates users with direct messages, defining their role (sender/recipient) and per-user message status.';
comment on column piu_msg_messageUsers.msg_id_message is 'Identifier of the direct message, referencing piu_msg_directMessages.';
comment on column piu_msg_messageUsers.usr_id_user is 'Identifier of the user participating in the direct message, referencing piu_usr_users.';
comment on column piu_msg_messageUsers.dom_messageRoleCode is 'Reference to the direct message role domain (sender, recipient) from piu_dom_messageRole.';
comment on column piu_msg_messageUsers.dom_messageStatusCode is 'Reference to the direct message status domain (sent, delivered, read, archived, deleted) from piu_dom_messageStatus.';
comment on column piu_msg_messageUsers.msg_readAt is 'Timestamp when the user read the direct message (if applicable).';
comment on column piu_msg_messageUsers.msg_createdAt is 'Timestamp when the association between the user and the direct message was created.';
comment on column piu_msg_messageUsers.msg_updatedAt is 'Timestamp of the last update to the user-message association record.';

/*******************************************************************************
*** Mentions
*******************************************************************************/

create table piu_men_mentions (
    men_id_mention        number generated by default as identity constraint piu_pk_men_mentions primary key,
    pst_id_post           number not null,
    usr_id_user_author    number not null,
    usr_id_user_mentioned number not null,
    men_createdAt         date default sysdate not null,
    men_updatedAt         date default sysdate not null
);

alter table piu_men_mentions
  add constraint piu_fk_men_pst_post
  foreign key (pst_id_post)
  references piu_pst_posts (pst_id_post);

alter table piu_men_mentions
  add constraint piu_fk_men_usr_author
  foreign key (usr_id_user_author)
  references piu_usr_users (usr_id_user);

alter table piu_men_mentions
  add constraint piu_fk_men_usr_mentioned
  foreign key (usr_id_user_mentioned)
  references piu_usr_users (usr_id_user);

alter table piu_men_mentions
  add constraint piu_uk_men_postMentioned
  unique (pst_id_post, usr_id_user_mentioned);

create or replace trigger piu_trg_bu_men_updateTimestamp
before update on piu_men_mentions
for each row
begin
    :new.men_updatedAt := sysdate;
end;
/

comment on table piu_men_mentions is 'Stores user mentions (@username) made inside posts in the PIU social network.';
comment on column piu_men_mentions.men_id_mention is 'Unique identifier for the mention record.';
comment on column piu_men_mentions.pst_id_post is 'Identifier of the post where the mention occurred, referencing piu_pst_posts.';
comment on column piu_men_mentions.usr_id_user_author is 'Identifier of the user who authored the post that contains the mention, referencing piu_usr_users.';
comment on column piu_men_mentions.usr_id_user_mentioned is 'Identifier of the user who was mentioned in the post, referencing piu_usr_users.';
comment on column piu_men_mentions.men_createdAt is 'Timestamp when the mention record was created.';
comment on column piu_men_mentions.men_updatedAt is 'Timestamp of the last update to the mention record.';

/*******************************************************************************
*** Normalized hashtag catalog
*******************************************************************************/

create table piu_tag_hashtags (
    tag_id_hashtag     number generated by default as identity constraint piu_pk_tag_hashtags primary key,
    tag_text           varchar2(100) not null,
    tag_normalized     varchar2(100) not null,
    tag_createdAt      date default sysdate not null,
    tag_updatedAt      date default sysdate not null
);

alter table piu_tag_hashtags
  add constraint piu_uk_tag_normalized
  unique (tag_normalized);

create or replace trigger piu_trg_bu_tag_updateTimestamp
before update on piu_tag_hashtags
for each row
begin
    :new.tag_updatedAt := sysdate;
end;
/

comment on table piu_tag_hashtags is 'Stores unique hashtags used in the PIU social network, without the # symbol.';
comment on column piu_tag_hashtags.tag_id_hashtag is 'Unique identifier for the hashtag.';
comment on column piu_tag_hashtags.tag_text is 'Original hashtag text as entered by a user (without the # symbol).';
comment on column piu_tag_hashtags.tag_normalized is 'Normalized hashtag text used for uniqueness and search (lowercase, no accents).';
comment on column piu_tag_hashtags.tag_createdAt is 'Timestamp when the hashtag record was created.';
comment on column piu_tag_hashtags.tag_updatedAt is 'Timestamp of the last update to the hashtag record.';

/*******************************************************************************
*** Post x hashtag relationship
*******************************************************************************/

create table piu_tag_postHashtags (
    pst_id_post       number not null,
    tag_id_hashtag    number not null,
    tag_createdAt     date default sysdate not null,
    tag_updatedAt     date default sysdate not null,
    constraint piu_pk_tag_postHashtags
        primary key (pst_id_post, tag_id_hashtag)
);

alter table piu_tag_postHashtags
  add constraint piu_fk_tph_pst_post
  foreign key (pst_id_post)
  references piu_pst_posts (pst_id_post);

alter table piu_tag_postHashtags
  add constraint piu_fk_tph_tag_hashtag
  foreign key (tag_id_hashtag)
  references piu_tag_hashtags (tag_id_hashtag);

create or replace trigger piu_trg_bu_tph_updateTimestamp
before update on piu_tag_postHashtags
for each row
begin
    :new.tag_updatedAt := sysdate;
end;
/

comment on table piu_tag_postHashtags is 'Associates posts with hashtags in a many-to-many relationship.';
comment on column piu_tag_postHashtags.pst_id_post is 'Identifier of the post that uses the hashtag, referencing piu_pst_posts.';
comment on column piu_tag_postHashtags.tag_id_hashtag is 'Identifier of the hashtag associated with the post, referencing piu_tag_hashtags.';
comment on column piu_tag_postHashtags.tag_createdAt is 'Timestamp when the post-hashtag relation was created.';
comment on column piu_tag_postHashtags.tag_updatedAt is 'Timestamp of the last update to the post-hashtag relation record.';

/*******************************************************************************
*** Notifications
*******************************************************************************/

create table piu_not_notifications (
    not_id_notification          number generated by default as identity constraint piu_pk_not_notifications primary key,
    usr_id_user_target           number not null,
    usr_id_user_actor            number,
    pst_id_post                  number,
    msg_id_message               number,
    fol_id_follow                number,
    dom_notificationTypeCode     varchar2(50) not null,
    dom_notificationStatusCode   varchar2(30) not null,
    not_message                  varchar2(500),
    not_readAt                   date,
    not_createdAt                date default sysdate not null,
    not_updatedAt                date default sysdate not null
);

alter table piu_not_notifications
  add constraint piu_fk_not_usr_target
  foreign key (usr_id_user_target)
  references piu_usr_users (usr_id_user);

alter table piu_not_notifications
  add constraint piu_fk_not_usr_actor
  foreign key (usr_id_user_actor)
  references piu_usr_users (usr_id_user);

alter table piu_not_notifications
  add constraint piu_fk_not_pst_post
  foreign key (pst_id_post)
  references piu_pst_posts (pst_id_post);

alter table piu_not_notifications
  add constraint piu_fk_not_msg_message
  foreign key (msg_id_message)
  references piu_msg_directMessages (msg_id_message);

alter table piu_not_notifications
  add constraint piu_fk_not_fol_follow
  foreign key (fol_id_follow)
  references piu_fol_follows (fol_id_follow);

alter table piu_not_notifications
  add constraint piu_fk_not_dom_notificationType
  foreign key (dom_notificationTypeCode)
  references piu_dom_notificationType (dom_notificationTypeCode);

alter table piu_not_notifications
  add constraint piu_fk_not_dom_notificationStatus
  foreign key (dom_notificationStatusCode)
  references piu_dom_notificationStatus (dom_notificationStatusCode);

create or replace trigger piu_trg_bu_not_updateTimestamp
before update on piu_not_notifications
for each row
begin
    :new.not_updatedAt := sysdate;
end;
/

comment on table piu_not_notifications is 'Stores notifications delivered to users in the PIU social network (likes, replies, follows, mentions, DMs, system alerts).';
comment on column piu_not_notifications.not_id_notification is 'Unique identifier for the notification record.';
comment on column piu_not_notifications.usr_id_user_target is 'Identifier of the user who receives the notification, referencing piu_usr_users.';
comment on column piu_not_notifications.usr_id_user_actor is 'Identifier of the user who triggered the notification (e.g. who liked or followed), referencing piu_usr_users. May be null for system notifications.';
comment on column piu_not_notifications.pst_id_post is 'Identifier of the post related to the notification, if applicable, referencing piu_pst_posts.';
comment on column piu_not_notifications.msg_id_message is 'Identifier of the direct message related to the notification, if applicable, referencing piu_msg_directMessages.';
comment on column piu_not_notifications.fol_id_follow is 'Identifier of the follow relationship related to the notification, if applicable, referencing piu_fol_follows.';
comment on column piu_not_notifications.dom_notificationTypeCode is 'Reference to the notification type domain (like, reply, repost, mention, follow, directMsg, system) from piu_dom_notificationType.';
comment on column piu_not_notifications.dom_notificationStatusCode is 'Reference to the notification status domain (unread, read, dismissed) from piu_dom_notificationStatus.';
comment on column piu_not_notifications.not_message is 'Pre-rendered notification message text presented to the user.';
comment on column piu_not_notifications.not_readAt is 'Timestamp when the notification was read by the user.';
comment on column piu_not_notifications.not_createdAt is 'Timestamp when the notification record was created.';
comment on column piu_not_notifications.not_updatedAt is 'Timestamp of the last update to the notification record.';

/*******************************************************************************
*** Login history
*******************************************************************************/

create table piu_hln_historyLogins (
    hln_id_historyLogin    number generated by default as identity constraint piu_pk_hln_historyLogins primary key,
    usr_id_user            number,
    hln_loginTimestamp     date default sysdate not null,
    hln_logoutTimestamp    date,
    hln_clientIp           varchar2(100),
    hln_userAgent          varchar2(400),
    hln_clientDevice       varchar2(200),
    dom_loginResultCode    varchar2(30) not null,
    hln_errorMessage       varchar2(1000),
    hln_createdAt          date default sysdate not null,
    hln_updatedAt          date default sysdate not null
);

alter table piu_hln_historyLogins
  add constraint piu_fk_hln_usr_user
  foreign key (usr_id_user)
  references piu_usr_users (usr_id_user);

alter table piu_hln_historyLogins
  add constraint piu_fk_hln_dom_loginResult
  foreign key (dom_loginResultCode)
  references piu_dom_loginResult (dom_loginResultCode);

create or replace trigger piu_trg_bu_hln_updateTimestamp
before update on piu_hln_historyLogins
for each row
begin
    :new.hln_updatedAt := sysdate;
end;
/

comment on table piu_hln_historyLogins is 'Stores a history of user login attempts in the PIU platform, including success and failure details.';
comment on column piu_hln_historyLogins.hln_id_historyLogin is 'Unique identifier for the login history record.';
comment on column piu_hln_historyLogins.usr_id_user is 'Identifier of the user associated with the login attempt, if known, referencing piu_usr_users. May be null for unknown users.';
comment on column piu_hln_historyLogins.hln_loginTimestamp is 'Timestamp when the login attempt occurred.';
comment on column piu_hln_historyLogins.hln_logoutTimestamp is 'Timestamp when the user session ended, if applicable.';
comment on column piu_hln_historyLogins.hln_clientIp is 'Client IP address from which the login attempt was made.';
comment on column piu_hln_historyLogins.hln_userAgent is 'User agent string reported by the client (browser, app, device).';
comment on column piu_hln_historyLogins.hln_clientDevice is 'Optional description of the client device (e.g. mobile, desktop, browser name).';
comment on column piu_hln_historyLogins.dom_loginResultCode is 'Reference to the login result domain (success, invalidCredentials, locked, passwordExpired, error) from piu_dom_loginResult.';
comment on column piu_hln_historyLogins.hln_errorMessage is 'Optional error message or additional diagnostic information for failed login attempts.';
comment on column piu_hln_historyLogins.hln_createdAt is 'Timestamp when the login history record was created.';
comment on column piu_hln_historyLogins.hln_updatedAt is 'Timestamp of the last update to the login history record.';

/*******************************************************************************
*** Reports
*******************************************************************************/

create table piu_rep_reports (
    rep_id_report          number generated by default as identity constraint piu_pk_rep_reports primary key,
    usr_id_user_reporter   number not null,
    usr_id_user_reported   number,
    pst_id_post            number,
    msg_id_message         number,
    dom_reportTypeCode     varchar2(50) not null,
    dom_reportStatusCode   varchar2(30) not null,
    rep_title              varchar2(200),
    rep_description        varchar2(2000),
    rep_moderatorNotes     varchar2(2000),
    rep_createdAt          date default sysdate not null,
    rep_updatedAt          date default sysdate not null
);

alter table piu_rep_reports
  add constraint piu_fk_rep_usr_reporter
  foreign key (usr_id_user_reporter)
  references piu_usr_users (usr_id_user);

alter table piu_rep_reports
  add constraint piu_fk_rep_usr_reported
  foreign key (usr_id_user_reported)
  references piu_usr_users (usr_id_user);

alter table piu_rep_reports
  add constraint piu_fk_rep_pst_post
  foreign key (pst_id_post)
  references piu_pst_posts (pst_id_post);

alter table piu_rep_reports
  add constraint piu_fk_rep_msg_message
  foreign key (msg_id_message)
  references piu_msg_directMessages (msg_id_message);

alter table piu_rep_reports
  add constraint piu_fk_rep_dom_reportType
  foreign key (dom_reportTypeCode)
  references piu_dom_reportType (dom_reportTypeCode);

alter table piu_rep_reports
  add constraint piu_fk_rep_dom_reportStatus
  foreign key (dom_reportStatusCode)
  references piu_dom_reportStatus (dom_reportStatusCode);

create or replace trigger piu_trg_bu_rep_updateTimestamp
before update on piu_rep_reports
for each row
begin
    :new.rep_updatedAt := sysdate;
end;
/

comment on table piu_rep_reports is 'Stores user reports (denúncias) about users, posts or direct messages in the PIU platform for moderation purposes.';
comment on column piu_rep_reports.rep_id_report is 'Unique identifier for the report record.';
comment on column piu_rep_reports.usr_id_user_reporter is 'Identifier of the user who created the report, referencing piu_usr_users.';
comment on column piu_rep_reports.usr_id_user_reported is 'Identifier of the user being reported, if applicable, referencing piu_usr_users. Typically the author of the reported content.';
comment on column piu_rep_reports.pst_id_post is 'Identifier of the post being reported, if applicable, referencing piu_pst_posts.';
comment on column piu_rep_reports.msg_id_message is 'Identifier of the direct message being reported, if applicable, referencing piu_msg_directMessages.';
comment on column piu_rep_reports.dom_reportTypeCode is 'Reference to the report type domain (spam, abuse, nsfw, misinformation, copyright, other) from piu_dom_reportType.';
comment on column piu_rep_reports.dom_reportStatusCode is 'Reference to the report status domain (open, underReview, resolved, dismissed) from piu_dom_reportStatus.';
comment on column piu_rep_reports.rep_title is 'Optional short title provided by the reporter to summarize the issue.';
comment on column piu_rep_reports.rep_description is 'Detailed description of the issue provided by the reporter.';
comment on column piu_rep_reports.rep_moderatorNotes is 'Notes added by moderators when reviewing or resolving the report.';
comment on column piu_rep_reports.rep_createdAt is 'Timestamp when the report was created.';
comment on column piu_rep_reports.rep_updatedAt is 'Timestamp of the last update to the report record.';

/*******************************************************************************
*** AI Post Vectors
*******************************************************************************/

create table piu_vec_postEmbeddings (
    vec_id_postEmbedding      number generated by default as identity constraint piu_pk_vec_postEmbeddings primary key,
    pst_id_post               number not null,
    dom_embeddingModelCode    varchar2(50) not null,
    vec_embedding             vector(1536, float32),
    vec_createdAt             date default sysdate not null,
    vec_updatedAt             date default sysdate not null
);

alter table piu_vec_postEmbeddings
  add constraint piu_fk_vec_pst_post
  foreign key (pst_id_post)
  references piu_pst_posts (pst_id_post);

alter table piu_vec_postEmbeddings
  add constraint piu_fk_vec_dom_postEmbeddingModel
  foreign key (dom_embeddingModelCode)
  references piu_dom_embeddingModel (dom_embeddingModelCode);

alter table piu_vec_postEmbeddings
  add constraint piu_uk_vec_post_model
  unique (pst_id_post, dom_embeddingModelCode);

create or replace trigger piu_trg_bu_vec_postEmbedding_updateTimestamp
before update on piu_vec_postEmbeddings
for each row
begin
    :new.vec_updatedAt := sysdate;
end;
/

comment on table piu_vec_postEmbeddings is 'Stores vector embeddings for posts in the PIU social network, one record per post and embedding model.';
comment on column piu_vec_postEmbeddings.vec_id_postEmbedding is 'Unique identifier for the post embedding record.';
comment on column piu_vec_postEmbeddings.pst_id_post is 'Identifier of the post whose content is represented by this vector embedding, referencing piu_pst_posts.';
comment on column piu_vec_postEmbeddings.dom_embeddingModelCode is 'Reference to the embedding model configuration used to generate this post embedding, from piu_dom_embeddingModel.';
comment on column piu_vec_postEmbeddings.vec_embedding is 'Vector representation (embedding) of the post content, stored using the Oracle VECTOR data type.';
comment on column piu_vec_postEmbeddings.vec_createdAt is 'Timestamp when the post embedding record was created.';
comment on column piu_vec_postEmbeddings.vec_updatedAt is 'Timestamp of the last update to the post embedding record.';

/*******************************************************************************
*** AI User Vectors
*******************************************************************************/

create table piu_vec_userEmbeddings (
    vec_id_userEmbedding      number generated by default as identity constraint piu_pk_vec_userEmbeddings primary key,
    usr_id_user               number not null,
    dom_embeddingModelCode    varchar2(50) not null,
    vec_embedding             vector(1536, float32),
    vec_createdAt             date default sysdate not null,
    vec_updatedAt             date default sysdate not null
);

alter table piu_vec_userEmbeddings
  add constraint piu_fk_vec_usr_user
  foreign key (usr_id_user)
  references piu_usr_users (usr_id_user);

alter table piu_vec_userEmbeddings
  add constraint piu_fk_vec_dom_userEmbeddingModel
  foreign key (dom_embeddingModelCode)
  references piu_dom_embeddingModel (dom_embeddingModelCode);

alter table piu_vec_userEmbeddings
  add constraint piu_uk_vec_user_model
  unique (usr_id_user, dom_embeddingModelCode);

create or replace trigger piu_trg_bu_vec_userEmbedding_updateTimestamp
before update on piu_vec_userEmbeddings
for each row
begin
    :new.vec_updatedAt := sysdate;
end;
/

comment on table piu_vec_userEmbeddings is 'Stores vector embeddings for users in the PIU social network, one record per user and embedding model.';
comment on column piu_vec_userEmbeddings.vec_id_userEmbedding is 'Unique identifier for the user embedding record.';
comment on column piu_vec_userEmbeddings.usr_id_user is 'Identifier of the user represented by this vector embedding, referencing piu_usr_users.';
comment on column piu_vec_userEmbeddings.dom_embeddingModelCode is 'Reference to the embedding model configuration used to generate this user embedding, from piu_dom_embeddingModel.';
comment on column piu_vec_userEmbeddings.vec_embedding is 'Vector representation (embedding) of the user profile or behavior, stored using the Oracle VECTOR data type.';
comment on column piu_vec_userEmbeddings.vec_createdAt is 'Timestamp when the user embedding record was created.';
comment on column piu_vec_userEmbeddings.vec_updatedAt is 'Timestamp of the last update to the user embedding record.';
