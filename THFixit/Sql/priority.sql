DROP SEQUENCE IF EXISTS "public"."priority_id_seq";
CREATE SEQUENCE "public"."priority_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

DROP TABLE IF EXISTS "public"."prioritys";
CREATE TABLE "public"."prioritys" (
  "id" int4 NOT NULL DEFAULT nextval('priority_id_seq'::regclass), 
  "is_lock" bool NOT NULL DEFAULT false,
	"name" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,   
  "creator_id" int4,
  "created_at" timestamptz(6) NOT NULL,
  "editor_id" int4,
  "edited_at" timestamptz(6),
  CONSTRAINT "prioritys_pkey" PRIMARY KEY ("id")
)
;

ALTER TABLE "public"."prioritys" 
  OWNER TO "postgres";