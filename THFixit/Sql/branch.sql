DROP SEQUENCE IF EXISTS "public"."branch_id_seq";
CREATE SEQUENCE "public"."branch_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

DROP TABLE IF EXISTS "public"."branchs";
CREATE TABLE "public"."branchs" (
  "id" int4 NOT NULL DEFAULT nextval('branch_id_seq'::regclass),
  "is_lock" bool NOT NULL DEFAULT false,
	"code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,   
	"address" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "tel" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
	"email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "image" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
	"user_limit" int4,
  "token_line" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,	
  "active" bool NOT NULL DEFAULT false,
  "creator_id" int4,
  "created_at" timestamptz(6) NOT NULL,
  "editor_id" int4,
  "edited_at" timestamptz(6),
  CONSTRAINT "branchs_pkey" PRIMARY KEY ("id"),
  CONSTRAINT "branchs_unique_code" UNIQUE ("code")
)
;

ALTER TABLE "public"."branchs" 
  OWNER TO "postgres";

INSERT INTO "public"."branchs" VALUES (1, 'f', 'UBN', 'UBN', '-', '-', '-', '-', 0, '-', 't', 1, '2018-04-05 11:09:21+07', NULL, NULL);
INSERT INTO "public"."branchs" VALUES (2, 'f', 'SSK', 'SSK', '-', '-', '-', '-', 0, '-', 't', 1, '2018-04-05 11:10:33+07', NULL, NULL);
