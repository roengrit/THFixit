DROP SEQUENCE IF EXISTS "public"."rooms_id_seq";
CREATE SEQUENCE "public"."rooms_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

DROP TABLE IF EXISTS "public"."rooms";
CREATE TABLE "public"."rooms" (
  "id" int4 NOT NULL DEFAULT nextval('rooms_id_seq'::regclass),
	"branch_id" int4  ,
	"building_id" int4  ,
	"class_id" int4  ,
  "is_lock" bool NOT NULL DEFAULT false,
	"code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,   	 
  "active" bool NOT NULL DEFAULT false,
  "creator_id" int4,
  "created_at" timestamptz(6) NOT NULL,
  "editor_id" int4,
  "edited_at" timestamptz(6),
  CONSTRAINT "rooms_pkey" PRIMARY KEY ("id"),
  CONSTRAINT "rooms_unique_code" UNIQUE ("code")
)
;

ALTER TABLE "public"."rooms" 
  OWNER TO "postgres";