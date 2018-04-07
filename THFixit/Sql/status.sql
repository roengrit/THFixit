DROP SEQUENCE IF EXISTS "public"."status_id_seq";
CREATE SEQUENCE "public"."status_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

DROP TABLE IF EXISTS "public"."status";
CREATE TABLE "public"."statuss" (
  "id" int4 NOT NULL DEFAULT nextval('status_id_seq'::regclass),
  "is_lock" bool NOT NULL DEFAULT false,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,   	 
  "active" bool NOT NULL DEFAULT false,
  "creator_id" int4,
  "created_at" timestamptz(6) NOT NULL,
  "editor_id" int4,
  "edited_at" timestamptz(6),
  CONSTRAINT "status_pkey" PRIMARY KEY ("id") 
)
;

 