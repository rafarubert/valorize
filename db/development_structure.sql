CREATE TABLE "blog_categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "blog_categories_blog_posts" ("blog_category_id" integer, "blog_post_id" integer);
CREATE TABLE "blog_comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "blog_post_id" integer, "spam" boolean, "name" varchar(255), "email" varchar(255), "body" text, "state" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "blog_posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "body" text, "draft" boolean, "published_at" datetime, "created_at" datetime, "updated_at" datetime, "user_id" integer);
CREATE TABLE "campaigns" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "subject" varchar(255), "mailchimp_campaign_id" varchar(255), "mailchimp_list_id" varchar(255), "mailchimp_template_id" varchar(255), "from_email" varchar(255), "from_name" varchar(255), "to_name" varchar(255), "body" text, "sent_at" datetime, "scheduled_at" datetime, "auto_tweet" boolean DEFAULT 'f', "created_at" datetime, "updated_at" datetime);
CREATE TABLE "images" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "image_mime_type" varchar(255), "image_name" varchar(255), "image_size" integer, "image_width" integer, "image_height" integer, "created_at" datetime, "updated_at" datetime, "image_uid" varchar(255), "image_ext" varchar(255));
CREATE TABLE "news_item_translations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "news_item_id" integer, "locale" varchar(255), "title" varchar(255), "body" text, "external_url" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "news_items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "body" text, "publish_date" datetime, "created_at" datetime, "updated_at" datetime, "external_url" varchar(255), "image_id" integer);
CREATE TABLE "page_part_translations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "page_part_id" integer, "locale" varchar(255), "body" text, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "page_parts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "page_id" integer, "title" varchar(255), "body" text, "position" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "page_translations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "page_id" integer, "locale" varchar(255), "title" varchar(255), "custom_title" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "pages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "parent_id" integer, "position" integer, "path" varchar(255), "created_at" datetime, "updated_at" datetime, "show_in_menu" boolean DEFAULT 't', "link_url" varchar(255), "menu_match" varchar(255), "deletable" boolean DEFAULT 't', "custom_title_type" varchar(255) DEFAULT 'none', "draft" boolean DEFAULT 'f', "skip_to_first_child" boolean DEFAULT 'f', "lft" integer, "rgt" integer, "depth" integer);
CREATE TABLE "refinery_settings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "value" text, "destroyable" boolean DEFAULT 't', "created_at" datetime, "updated_at" datetime, "scoping" varchar(255), "restricted" boolean DEFAULT 'f', "callback_proc_as_string" varchar(255), "form_value_type" varchar(255));
CREATE TABLE "resources" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "file_mime_type" varchar(255), "file_name" varchar(255), "file_size" integer, "created_at" datetime, "updated_at" datetime, "file_uid" varchar(255), "file_ext" varchar(255));
CREATE TABLE "roles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255));
CREATE TABLE "roles_users" ("user_id" integer, "role_id" integer);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "seo_meta" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "seo_meta_id" integer, "seo_meta_type" varchar(255), "browser_title" varchar(255), "meta_keywords" varchar(255), "meta_description" text, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "slugs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "sluggable_id" integer, "sequence" integer DEFAULT 1 NOT NULL, "sluggable_type" varchar(40), "scope" varchar(40), "created_at" datetime, "locale" varchar(255));
CREATE TABLE "user_plugins" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "name" varchar(255), "position" integer);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar(255) NOT NULL, "email" varchar(255) NOT NULL, "encrypted_password" varchar(255) NOT NULL, "persistence_token" varchar(255), "created_at" datetime, "updated_at" datetime, "perishable_token" varchar(255), "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "sign_in_count" integer, "remember_token" varchar(255), "reset_password_token" varchar(255), "remember_created_at" datetime);
CREATE INDEX "index_blog_categories_blog_posts_on_bc_and_bp" ON "blog_categories_blog_posts" ("blog_category_id", "blog_post_id");
CREATE INDEX "index_blog_categories_on_id" ON "blog_categories" ("id");
CREATE INDEX "index_blog_comments_on_id" ON "blog_comments" ("id");
CREATE INDEX "index_blog_posts_on_id" ON "blog_posts" ("id");
CREATE INDEX "index_campaigns_on_id" ON "campaigns" ("id");
CREATE INDEX "index_news_item_translations_on_news_item_id" ON "news_item_translations" ("news_item_id");
CREATE INDEX "index_news_items_on_id" ON "news_items" ("id");
CREATE INDEX "index_page_part_translations_on_page_part_id" ON "page_part_translations" ("page_part_id");
CREATE INDEX "index_page_parts_on_id" ON "page_parts" ("id");
CREATE INDEX "index_page_parts_on_page_id" ON "page_parts" ("page_id");
CREATE INDEX "index_page_translations_on_page_id" ON "page_translations" ("page_id");
CREATE INDEX "index_pages_on_depth" ON "pages" ("depth");
CREATE INDEX "index_pages_on_id" ON "pages" ("id");
CREATE INDEX "index_pages_on_lft" ON "pages" ("lft");
CREATE INDEX "index_pages_on_parent_id" ON "pages" ("parent_id");
CREATE INDEX "index_pages_on_rgt" ON "pages" ("rgt");
CREATE INDEX "index_refinery_settings_on_name" ON "refinery_settings" ("name");
CREATE INDEX "index_roles_users_on_role_id_and_user_id" ON "roles_users" ("role_id", "user_id");
CREATE INDEX "index_roles_users_on_user_id_and_role_id" ON "roles_users" ("user_id", "role_id");
CREATE INDEX "index_seo_meta_on_id" ON "seo_meta" ("id");
CREATE INDEX "index_seo_meta_on_seo_meta_id_and_seo_meta_type" ON "seo_meta" ("seo_meta_id", "seo_meta_type");
CREATE INDEX "index_slugs_on_locale" ON "slugs" ("locale");
CREATE UNIQUE INDEX "index_slugs_on_n_s_s_and_s" ON "slugs" ("name", "sluggable_type", "scope", "sequence");
CREATE INDEX "index_slugs_on_sluggable_id" ON "slugs" ("sluggable_id");
CREATE UNIQUE INDEX "index_unique_user_plugins" ON "user_plugins" ("user_id", "name");
CREATE INDEX "index_user_plugins_on_title" ON "user_plugins" ("name");
CREATE INDEX "index_users_on_id" ON "users" ("id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20110425115052');

INSERT INTO schema_migrations (version) VALUES ('20110425115053');

INSERT INTO schema_migrations (version) VALUES ('20110425115054');

INSERT INTO schema_migrations (version) VALUES ('20110425115055');

INSERT INTO schema_migrations (version) VALUES ('20110425115056');

INSERT INTO schema_migrations (version) VALUES ('20110425115057');

INSERT INTO schema_migrations (version) VALUES ('20110425115058');

INSERT INTO schema_migrations (version) VALUES ('20110425115059');

INSERT INTO schema_migrations (version) VALUES ('20110425115060');

INSERT INTO schema_migrations (version) VALUES ('20110425115061');

INSERT INTO schema_migrations (version) VALUES ('20110425115062');

INSERT INTO schema_migrations (version) VALUES ('20110425115063');

INSERT INTO schema_migrations (version) VALUES ('20110425115064');

INSERT INTO schema_migrations (version) VALUES ('20110425115065');

INSERT INTO schema_migrations (version) VALUES ('20110425115066');

INSERT INTO schema_migrations (version) VALUES ('20110425115067');

INSERT INTO schema_migrations (version) VALUES ('20110425115068');

INSERT INTO schema_migrations (version) VALUES ('20110425120236');

INSERT INTO schema_migrations (version) VALUES ('20110425120237');

INSERT INTO schema_migrations (version) VALUES ('20110425120238');

INSERT INTO schema_migrations (version) VALUES ('20110425120239');

INSERT INTO schema_migrations (version) VALUES ('20110425120408');

INSERT INTO schema_migrations (version) VALUES ('20110503134817');

INSERT INTO schema_migrations (version) VALUES ('20110503134818');