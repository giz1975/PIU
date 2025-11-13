
insert into piu_dom_postVisibility (dom_postVisibilityCode, dom_description) values ('public', 'Post is visible to everyone.');
insert into piu_dom_postVisibility (dom_postVisibilityCode, dom_description) values ('followers', 'Post is only visible to followers of the author.');
commit;

insert into piu_dom_mediaType (dom_mediaTypeCode, dom_description) values ('image', 'Static image file (e.g. jpg, png, gif).');
insert into piu_dom_mediaType (dom_mediaTypeCode, dom_description) values ('video', 'Video file or embedded video content.');
commit;

insert into piu_dom_followStatus (dom_followStatusCode, dom_description) values ('active', 'Follower relationship is active.');
insert into piu_dom_followStatus (dom_followStatusCode, dom_description) values ('blocked', 'Follower is blocked by the target user.');
insert into piu_dom_followStatus (dom_followStatusCode, dom_description) values ('muted', 'Follower relationship is active but updates are muted.');
commit;

insert into piu_dom_interactionType (dom_interactionTypeCode, dom_description) values ('like',   'User liked the target post.');
insert into piu_dom_interactionType (dom_interactionTypeCode, dom_description) values ('repost', 'User reposted/shared the target post.');
insert into piu_dom_interactionType (dom_interactionTypeCode, dom_description) values ('quote',  'User reposted the target post with additional commentary.');
insert into piu_dom_interactionType (dom_description, dom_interactionTypeCode) values ('User bookmarked/saved the target post.', 'bookmark');
commit;

insert into piu_dom_shortLinkStatus (dom_shortLinkStatusCode, dom_description) values ('active',   'Short link is active and can be used for redirection.');
insert into piu_dom_shortLinkStatus (dom_shortLinkStatusCode, dom_description) values ('disabled', 'Short link has been disabled and should not redirect anymore.');
insert into piu_dom_shortLinkStatus (dom_shortLinkStatusCode, dom_description) values ('expired',  'Short link has expired and should no longer be used.');
commit;

insert into piu_dom_messageRole (dom_messageRoleCode, dom_description) values ('sender', 'User who sent the direct message.');
insert into piu_dom_messageRole (dom_messageRoleCode, dom_description) values ('recipient', 'User who received the direct message.');
commit;

insert into piu_dom_messageStatus (dom_messageStatusCode, dom_description) values ('sent', 'Message has been sent but not yet delivered.');
insert into piu_dom_messageStatus (dom_messageStatusCode, dom_description) values ('delivered', 'Message has been delivered to the recipient.');
insert into piu_dom_messageStatus (dom_messageStatusCode, dom_description) values ('read', 'Message has been opened/read by the recipient.');
insert into piu_dom_messageStatus (dom_messageStatusCode, dom_description) values ('archived', 'Message has been archived by the user.');
insert into piu_dom_messageStatus (dom_messageStatusCode, dom_description) values ('deleted', 'Message has been marked as deleted for the user.');
commit;

insert into piu_dom_notificationType (dom_notificationTypeCode, dom_description) values ('like', 'User liked one of your posts.');
insert into piu_dom_notificationType (dom_notificationTypeCode, dom_description) values ('reply', 'User replied to one of your posts.');
insert into piu_dom_notificationType (dom_notificationTypeCode, dom_description) values ('repost', 'User reposted one of your posts.');
insert into piu_dom_notificationType (dom_notificationTypeCode, dom_description) values ('mention', 'User mentioned you in a post.');
insert into piu_dom_notificationType (dom_notificationTypeCode, dom_description) values ('follow', 'User started following you.');
insert into piu_dom_notificationType (dom_notificationTypeCode, dom_description) values ('directMsg', 'User sent you a direct message.');
insert into piu_dom_notificationType (dom_notificationTypeCode, dom_description) values ('system', 'System-generated notification (e.g. alerts, announcements).');
commit;

insert into piu_dom_notificationStatus (dom_notificationStatusCode, dom_description) values ('unread', 'Notification has not been read yet.');
insert into piu_dom_notificationStatus (dom_notificationStatusCode, dom_description) values ('read', 'Notification has been opened/read by the user.');
insert into piu_dom_notificationStatus (dom_notificationStatusCode, dom_description) values ('dismissed', 'Notification has been dismissed or ignored by the user.');
commit;

insert into piu_dom_loginResult (dom_loginResultCode, dom_description) values ('success', 'Login attempt succeeded and session was created.');
insert into piu_dom_loginResult (dom_loginResultCode, dom_description) values ('invalidCredentials', 'Login attempt failed due to invalid username or password.');
insert into piu_dom_loginResult (dom_loginResultCode, dom_description) values ('locked', 'Login attempt failed because the account is locked.');
insert into piu_dom_loginResult (dom_loginResultCode, dom_description) values ('passwordExpired', 'Login attempt failed because the password has expired.');
insert into piu_dom_loginResult (dom_loginResultCode, dom_description) values ('error', 'Login attempt failed due to an unexpected system error.');
commit;

insert into piu_dom_reportType (dom_reportTypeCode, dom_description) values ('spam', 'Unwanted or repetitive content, advertisements or irrelevant links.');
insert into piu_dom_reportType (dom_reportTypeCode, dom_description) values ('abuse', 'Harassment, hate speech, threats or abusive behavior.');
insert into piu_dom_reportType (dom_reportTypeCode, dom_description) values ('nsfw', 'Sexually explicit or otherwise not safe for work content.');
insert into piu_dom_reportType (dom_reportTypeCode, dom_description) values ('misinformation', 'False or misleading information that may cause harm.');
insert into piu_dom_reportType (dom_reportTypeCode, dom_description) values ('copyright', 'Potential copyright or intellectual property infringement.');
insert into piu_dom_reportType (dom_reportTypeCode, dom_description) values ('other', 'Other type of violation not covered by the predefined categories.');

insert into piu_dom_reportStatus (dom_reportStatusCode, dom_description) values ('open', 'Report has been created and is waiting for review.');
insert into piu_dom_reportStatus (dom_reportStatusCode, dom_description) values ('underReview', 'Report is currently being reviewed by moderators.');
insert into piu_dom_reportStatus (dom_reportStatusCode, dom_description) values ('resolved', 'Report has been handled and appropriate action was taken.');
insert into piu_dom_reportStatus (dom_reportStatusCode, dom_description) values ('dismissed', 'Report was reviewed and considered not to be a violation.');
commit;

insert into piu_dom_embeddingModel (dom_embeddingModelCode, dom_description, dom_vectorDimension, dom_provider) values ('piu_default_user', 'Default embedding model for PIU user profile representation.', 1536, 'oracle23ai');
commit;
