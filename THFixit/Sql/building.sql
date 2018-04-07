DROP SEQUENCE IF EXISTS "public"."building_id_seq";
CREATE SEQUENCE "public"."building_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

DROP TABLE IF EXISTS "public"."buildings";
CREATE TABLE "public"."buildings" (
  "id" int4 NOT NULL DEFAULT nextval('building_id_seq'::regclass),
   "branch_id" int4  ,
  "is_lock" bool NOT NULL DEFAULT false,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,   	 
  "active" bool NOT NULL DEFAULT false,
  "creator_id" int4,
  "created_at" timestamptz(6) NOT NULL,
  "editor_id" int4,
  "edited_at" timestamptz(6),
  CONSTRAINT "buildings_pkey" PRIMARY KEY ("id") 
)
;

ALTER TABLE "public"."buildings" 
  OWNER TO "postgres";