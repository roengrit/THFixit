DROP SEQUENCE IF EXISTS "public"."user_id_seq";
CREATE SEQUENCE "public"."user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "id" int4 NOT NULL DEFAULT nextval('user_id_seq'::regclass),
  "is_lock" bool NOT NULL DEFAULT false,
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "name" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "tel" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "line" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "image_avatar" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,  
  "role_id" int4,
  "branch_id" int4,
  "depart_id" int4,
  "building_id" int4,
  "room_id" int4,
  "class_id" int4,
  "is_technical" bool NOT NULL DEFAULT false,
  "active" bool NOT NULL DEFAULT false,
  "creator_id" int4,
  "created_at" timestamptz(6) NOT NULL,
  "editor_id" int4,
  "edited_at" timestamptz(6),
  CONSTRAINT "users_pkey" PRIMARY KEY ("id"),
  CONSTRAINT "users_unique_username" UNIQUE ("username")
)
;

ALTER TABLE "public"."users" 
  OWNER TO "postgres";

INSERT INTO "users"("id", "is_lock", "username", "password", "name", "tel", "line", "role_id", "branch_id", "depart_id", "building_id", "room_id", "class_id", "is_technical", "active", "creator_id", "created_at", "edited_at", "editor_id") VALUES (1, 'f', 'admin', '$2a$10$adKOXX/I9OjHb0c62Qz6XOHyBM9.x2CEg9FzYPXWclqm4PwGxJEdW', 'Administrator', '', '', 1, 1, 1, 1, 1, 1, 'f', 't', 1, '2018-04-04 09:19:01+07', '2018-04-04 09:22:54+07', 1);
