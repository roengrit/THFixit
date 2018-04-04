DROP SEQUENCE IF EXISTS "public"."role_id_seq";
CREATE SEQUENCE "public"."role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

DROP TABLE IF EXISTS "public"."roles";
CREATE TABLE "public"."roles" (
  "id" int4 NOT NULL DEFAULT nextval('role_id_seq'::regclass),
  "lock" bool NOT NULL DEFAULT false,   
  "name" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,   
  "is_technical" bool NOT NULL DEFAULT false,
  "active" bool NOT NULL DEFAULT false,
  "creator_id" int4,
  "created_at" timestamptz(6) NOT NULL,
  "editor_id" int4,
  "edited_at" timestamptz(6),
  CONSTRAINT "roles_pkey" PRIMARY KEY ("id"),
  CONSTRAINT "roles_unique_name" UNIQUE ("name")
)
;

ALTER TABLE "public"."roles" 
  OWNER TO "postgres";

INSERT INTO "roles"("id", "lock", "name", "is_technical", "active", "creator_id", "created_at", "editor_id", "edited_at") VALUES (1, 't', 'Administrator', 'f', 't', 1, '2018-04-04 15:39:10+07', 1, '2018-04-04 15:39:13+07');
