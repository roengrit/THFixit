DROP SEQUENCE IF EXISTS "public"."user_branch_id_seq";
CREATE SEQUENCE "public"."user_branch_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

DROP TABLE IF EXISTS "public"."user_branchs";
CREATE TABLE "public"."user_branchs" (
  "id" int4 NOT NULL DEFAULT nextval('user_branch_id_seq'::regclass),
  "branch_id" int4  ,
  "user_id" int4  ,
  "is_lock" bool NOT NULL DEFAULT false,
  "creator_id" int4,
  "created_at" timestamptz(6) NOT NULL,
  "editor_id" int4,
  "edited_at" timestamptz(6),
  CONSTRAINT "user_branchs_pkey" PRIMARY KEY ("id"),
)
;

ALTER TABLE "public"."user_branchs" 
  OWNER TO "postgres";