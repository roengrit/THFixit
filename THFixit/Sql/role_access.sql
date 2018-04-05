DROP SEQUENCE IF EXISTS "public"."role_access_id_seq";
CREATE SEQUENCE "public"."role_access_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

DROP TABLE IF EXISTS "public"."role_access";
CREATE TABLE "public"."role_access" (
  "id" int4 NOT NULL DEFAULT nextval('role_access_id_seq'::regclass),
  "is_lock" bool NOT NULL DEFAULT false,   
  "role_id" int4,
	"menu_id" int4,
  "active" bool NOT NULL DEFAULT false,
  "creator_id" int4,
  "created_at" timestamptz(6) NOT NULL,
  "editor_id" int4,
  "edited_at" timestamptz(6) ,
	CONSTRAINT "role_access_pkey" PRIMARY KEY ("id")
)
;

ALTER TABLE "public"."role_access" 
  OWNER TO "postgres";