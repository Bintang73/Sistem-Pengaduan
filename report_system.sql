/*
 Navicat Premium Data Transfer

 Source Server         : zzzzz local
 Source Server Type    : PostgreSQL
 Source Server Version : 120015 (120015)
 Source Host           : localhost:5432
 Source Catalog        : report_system
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120015 (120015)
 File Encoding         : 65001

 Date: 04/09/2023 14:33:37
*/


-- ----------------------------
-- Sequence structure for activity_log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."activity_log_id_seq";
CREATE SEQUENCE "public"."activity_log_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for categories_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."categories_id_seq";
CREATE SEQUENCE "public"."categories_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for failed_jobs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."failed_jobs_id_seq";
CREATE SEQUENCE "public"."failed_jobs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for media_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."media_id_seq";
CREATE SEQUENCE "public"."media_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for migrations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."migrations_id_seq";
CREATE SEQUENCE "public"."migrations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for permissions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."permissions_id_seq";
CREATE SEQUENCE "public"."permissions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for personal_access_tokens_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."personal_access_tokens_id_seq";
CREATE SEQUENCE "public"."personal_access_tokens_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for report_trackers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."report_trackers_id_seq";
CREATE SEQUENCE "public"."report_trackers_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for reporters_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."reporters_id_seq";
CREATE SEQUENCE "public"."reporters_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for reports_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."reports_id_seq";
CREATE SEQUENCE "public"."reports_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for roles_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."roles_id_seq";
CREATE SEQUENCE "public"."roles_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for status_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."status_id_seq";
CREATE SEQUENCE "public"."status_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."users_id_seq";
CREATE SEQUENCE "public"."users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for activity_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."activity_log";
CREATE TABLE "public"."activity_log" (
  "id" int8 NOT NULL DEFAULT nextval('activity_log_id_seq'::regclass),
  "log_name" varchar(191) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default" NOT NULL,
  "subject_type" varchar(191) COLLATE "pg_catalog"."default",
  "subject_id" int8,
  "causer_type" varchar(191) COLLATE "pg_catalog"."default",
  "causer_id" int8,
  "properties" json,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "event" varchar(191) COLLATE "pg_catalog"."default",
  "batch_uuid" uuid
)
;

-- ----------------------------
-- Records of activity_log
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS "public"."categories";
CREATE TABLE "public"."categories" (
  "id" int8 NOT NULL DEFAULT nextval('categories_id_seq'::regclass),
  "name" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "slug" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0)
)
;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO "public"."categories" VALUES (37, 'Infrastruktur', 'infrastruktur', '2023-09-04 00:13:24', '2023-09-04 00:13:24', NULL);
INSERT INTO "public"."categories" VALUES (38, 'Lingkungan', 'lingkungan', '2023-09-04 00:13:24', '2023-09-04 00:13:24', NULL);
INSERT INTO "public"."categories" VALUES (39, 'Layanan Publik', 'layanan-publik', '2023-09-04 00:13:24', '2023-09-04 00:13:24', NULL);
INSERT INTO "public"."categories" VALUES (40, 'Keamanan', 'keamanan', '2023-09-04 00:13:24', '2023-09-04 00:13:24', NULL);
INSERT INTO "public"."categories" VALUES (41, 'Kesehatan', 'kesehatan', '2023-09-04 00:13:24', '2023-09-04 00:13:24', NULL);
INSERT INTO "public"."categories" VALUES (42, 'Lain-lain', 'lain-lain', '2023-09-04 00:13:24', '2023-09-04 00:13:24', NULL);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS "public"."failed_jobs";
CREATE TABLE "public"."failed_jobs" (
  "id" int8 NOT NULL DEFAULT nextval('failed_jobs_id_seq'::regclass),
  "uuid" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "connection" text COLLATE "pg_catalog"."default" NOT NULL,
  "queue" text COLLATE "pg_catalog"."default" NOT NULL,
  "payload" text COLLATE "pg_catalog"."default" NOT NULL,
  "exception" text COLLATE "pg_catalog"."default" NOT NULL,
  "failed_at" timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS "public"."media";
CREATE TABLE "public"."media" (
  "id" int8 NOT NULL DEFAULT nextval('media_id_seq'::regclass),
  "model_type" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "model_id" int8 NOT NULL,
  "uuid" uuid,
  "collection_name" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "file_name" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "mime_type" varchar(191) COLLATE "pg_catalog"."default",
  "disk" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "conversions_disk" varchar(191) COLLATE "pg_catalog"."default",
  "size" int8 NOT NULL,
  "manipulations" json NOT NULL,
  "custom_properties" json NOT NULL,
  "generated_conversions" json NOT NULL,
  "responsive_images" json NOT NULL,
  "order_column" int4,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of media
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."migrations";
CREATE TABLE "public"."migrations" (
  "id" int4 NOT NULL DEFAULT nextval('migrations_id_seq'::regclass),
  "migration" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "batch" int4 NOT NULL
)
;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO "public"."migrations" VALUES (16, '2023_07_30_013129_create_categories_table', 1);
INSERT INTO "public"."migrations" VALUES (28, '2014_10_12_000000_create_users_table', 2);
INSERT INTO "public"."migrations" VALUES (29, '2014_10_12_100000_create_password_resets_table', 2);
INSERT INTO "public"."migrations" VALUES (30, '2019_08_19_000000_create_failed_jobs_table', 2);
INSERT INTO "public"."migrations" VALUES (31, '2019_12_14_000001_create_personal_access_tokens_table', 2);
INSERT INTO "public"."migrations" VALUES (32, '2020_02_19_173711_create_notifications_table', 2);
INSERT INTO "public"."migrations" VALUES (33, '2022_04_01_132914_create_media_table', 2);
INSERT INTO "public"."migrations" VALUES (34, '2022_04_01_133918_create_permission_tables', 2);
INSERT INTO "public"."migrations" VALUES (35, '2022_04_01_134140_create_activity_log_table', 2);
INSERT INTO "public"."migrations" VALUES (36, '2022_04_01_134141_add_event_column_to_activity_log_table', 2);
INSERT INTO "public"."migrations" VALUES (37, '2022_04_01_134142_add_batch_uuid_column_to_activity_log_table', 2);
INSERT INTO "public"."migrations" VALUES (38, '2023_03_12_195541_add_expires_at_column_to_personal_access_tokens_table', 2);
INSERT INTO "public"."migrations" VALUES (39, '2023_09_04_000000_create_categories_table', 2);
INSERT INTO "public"."migrations" VALUES (40, '2023_09_04_000001_create_status_table', 2);
INSERT INTO "public"."migrations" VALUES (41, '2023_09_04_000002_create_reporters_table', 2);
INSERT INTO "public"."migrations" VALUES (42, '2023_09_04_000003_create_reports_table', 2);
INSERT INTO "public"."migrations" VALUES (43, '2023_09_04_000004_create_report_trackers_table', 2);
INSERT INTO "public"."migrations" VALUES (45, '2023_09_04_000005_add_deleted_at_column_to_reporters_table', 3);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."model_has_permissions";
CREATE TABLE "public"."model_has_permissions" (
  "permission_id" int8 NOT NULL,
  "model_type" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "model_id" int8 NOT NULL
)
;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS "public"."model_has_roles";
CREATE TABLE "public"."model_has_roles" (
  "role_id" int8 NOT NULL,
  "model_type" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "model_id" int8 NOT NULL
)
;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO "public"."model_has_roles" VALUES (1, 'App\Models\User', 6);
INSERT INTO "public"."model_has_roles" VALUES (2, 'App\Models\User', 7);
INSERT INTO "public"."model_has_roles" VALUES (3, 'App\Models\User', 8);

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS "public"."notifications";
CREATE TABLE "public"."notifications" (
  "id" uuid NOT NULL,
  "type" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "notifiable_type" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "notifiable_id" int8 NOT NULL,
  "data" text COLLATE "pg_catalog"."default" NOT NULL,
  "read_at" timestamp(0),
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of notifications
-- ----------------------------

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS "public"."password_reset_tokens";
CREATE TABLE "public"."password_reset_tokens" (
  "email" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "token" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0)
)
;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."permissions";
CREATE TABLE "public"."permissions" (
  "id" int8 NOT NULL DEFAULT nextval('permissions_id_seq'::regclass),
  "name" varchar(125) COLLATE "pg_catalog"."default" NOT NULL,
  "guard_name" varchar(125) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO "public"."permissions" VALUES (1, 'view_backend', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (2, 'view_logs', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (3, 'view_users', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (4, 'add_users', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (5, 'edit_users', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (6, 'delete_users', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (7, 'restore_users', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (8, 'block_users', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (9, 'view_roles', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (10, 'add_roles', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (11, 'edit_roles', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (12, 'delete_roles', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (13, 'restore_roles', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (14, 'view_backups', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (15, 'add_backups', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (16, 'create_backups', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (17, 'download_backups', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (18, 'delete_backups', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (19, 'view_posts', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (20, 'add_posts', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (21, 'edit_posts', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (22, 'delete_posts', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (23, 'restore_posts', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (24, 'view_categories', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (25, 'add_categories', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (26, 'edit_categories', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (27, 'delete_categories', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (28, 'restore_categories', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (30, 'add_tags', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (31, 'edit_tags', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (32, 'delete_tags', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (33, 'restore_tags', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."permissions" VALUES (29, 'view_reporters', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS "public"."personal_access_tokens";
CREATE TABLE "public"."personal_access_tokens" (
  "id" int8 NOT NULL DEFAULT nextval('personal_access_tokens_id_seq'::regclass),
  "tokenable_type" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "tokenable_id" int8 NOT NULL,
  "name" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "token" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "abilities" text COLLATE "pg_catalog"."default",
  "last_used_at" timestamp(0),
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "expires_at" timestamp(0)
)
;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for report_trackers
-- ----------------------------
DROP TABLE IF EXISTS "public"."report_trackers";
CREATE TABLE "public"."report_trackers" (
  "id" int8 NOT NULL DEFAULT nextval('report_trackers_id_seq'::regclass),
  "user_id" int8 NOT NULL,
  "report_id" int8 NOT NULL,
  "status" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "note" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of report_trackers
-- ----------------------------
INSERT INTO "public"."report_trackers" VALUES (3, 6, 7, 'Pending', 'Pemohon 11 Membuat laporan baru', '2023-09-04 14:19:24', '2023-09-04 14:19:24');
INSERT INTO "public"."report_trackers" VALUES (5, 6, 7, 'Proses Administratif', 'superadmin mengubah status laporan menjadi ', '2023-09-04 14:31:53', '2023-09-04 14:31:53');

-- ----------------------------
-- Table structure for reporters
-- ----------------------------
DROP TABLE IF EXISTS "public"."reporters";
CREATE TABLE "public"."reporters" (
  "id" int8 NOT NULL DEFAULT nextval('reporters_id_seq'::regclass),
  "name" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "phone_number" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "identity_type" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "identity_number" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "pob" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "dob" date NOT NULL,
  "address" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0)
)
;

-- ----------------------------
-- Records of reporters
-- ----------------------------
INSERT INTO "public"."reporters" VALUES (13, 'Pemohon 11', 'hilmysyarif13@gmail.com', '+62895365359636', 'KTP', '222222222222222222', 'JAKARTA', '2023-09-04', 'Jl. AKASIA III BLOK B3 NO 6', '2023-09-04 14:18:34', '2023-09-04 14:18:34', NULL);
INSERT INTO "public"."reporters" VALUES (14, 'Pemohon 11', 'hilmysyarif13@gmail.com', '+62895365359636', 'KTP', '222222222222222222', 'JAKARTA', '2023-09-04', 'Jl. AKASIA III BLOK B3 NO 6', '2023-09-04 14:19:23', '2023-09-04 14:19:23', NULL);
INSERT INTO "public"."reporters" VALUES (2, 'Pelapor 1', 'pelapor1@gmail.com', '+62800000000000', 'KTP', '3174080212930002', 'TANGERANG', '1993-12-13', 'Jl. AKASIA III BLOK B3 NO 6', '2023-09-04 05:11:20', '2023-09-04 05:11:20', NULL);
INSERT INTO "public"."reporters" VALUES (3, 'Pelapor 2', 'pelapor2@gmail.com', '+62800000000000', 'KTP', '3174080212930002', 'TANGERANG', '1993-12-13', 'Jl. AKASIA III BLOK B3 NO 6', '2023-09-04 05:11:46', '2023-09-04 05:11:46', NULL);
INSERT INTO "public"."reporters" VALUES (4, 'Pelapor 3', 'pelapor3@gmail.com', '+62800000000000', 'KTP', '3174080212930002', 'TANGERANG', '1993-12-13', 'Jl. AKASIA III BLOK B3 NO 6', '2023-09-04 05:16:21', '2023-09-04 05:16:21', NULL);
INSERT INTO "public"."reporters" VALUES (5, 'Pelapor 4', 'pelapor4@gmail.com', '+62800000000000', 'KTP', '3174080212930002', 'TANGERANG', '1993-12-13', 'Jl. AKASIA III BLOK B3 NO 6', '2023-09-04 05:17:47', '2023-09-04 05:17:47', NULL);
INSERT INTO "public"."reporters" VALUES (6, 'Pelapor 5', 'pelapor5@gmail.com', '+62800000000000', 'KTP', '3174080212930002', 'TANGERANG', '1993-12-13', 'Jl. AKASIA III BLOK B3 NO 6', '2023-09-04 05:18:03', '2023-09-04 05:18:03', NULL);
INSERT INTO "public"."reporters" VALUES (7, 'Pelapor 6', 'pelapor6@gmail.com', '+62800000000000', 'KTP', '3174080212930002', 'TANGERANG', '1993-12-13', 'Jl. AKASIA III BLOK B3 NO 6', '2023-09-04 05:18:46', '2023-09-04 05:18:46', NULL);
INSERT INTO "public"."reporters" VALUES (8, 'Pelapor 7', 'pelapor7@gmail.com', '+62800000000000', 'KTP', '3174080212930002', 'TANGERANG', '1993-12-13', 'Jl. AKASIA III BLOK B3 NO 6', '2023-09-04 05:19:03', '2023-09-04 05:19:03', NULL);
INSERT INTO "public"."reporters" VALUES (9, 'Pelapor 8', 'pelapor8@gmail.com', '+62800000000000', 'KTP', '3174080212930002', 'TANGERANG', '1993-12-13', 'Jl. AKASIA III BLOK B3 NO 6', '2023-09-04 05:19:36', '2023-09-04 05:19:36', NULL);
INSERT INTO "public"."reporters" VALUES (10, 'Pelapor 10', 'hilmysyarif13@gmail.com', '+62895365359636', 'KTP', '222222222222222', 'TANGERANG', '2023-09-04', 'Jl. AKASIA III BLOK B3 NO 6', '2023-09-04 14:10:37', '2023-09-04 14:10:37', NULL);
INSERT INTO "public"."reporters" VALUES (11, 'Pelapor 10', 'hilmysyarif13@gmail.com', '+62895365359636', 'KTP', '222222222222222', 'TANGERANG', '2023-09-04', 'Jl. AKASIA III BLOK B3 NO 6', '2023-09-04 14:11:33', '2023-09-04 14:11:33', NULL);
INSERT INTO "public"."reporters" VALUES (12, 'Pemohon 11', 'hilmysyarif13@gmail.com', '+62895365359636', 'KTP', '222222222222222222', 'JAKARTA', '2023-09-04', 'Jl. AKASIA III BLOK B3 NO 6', '2023-09-04 14:18:04', '2023-09-04 14:18:04', NULL);

-- ----------------------------
-- Table structure for reports
-- ----------------------------
DROP TABLE IF EXISTS "public"."reports";
CREATE TABLE "public"."reports" (
  "id" int8 NOT NULL DEFAULT nextval('reports_id_seq'::regclass),
  "reporter_id" int8 NOT NULL,
  "category_id" int8 NOT NULL,
  "ticket_id" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0)
)
;

-- ----------------------------
-- Records of reports
-- ----------------------------
INSERT INTO "public"."reports" VALUES (3, 9, 42, '1', 'Test', 'Test pengaduan 1', 'Pending', '2023-09-04 05:19:38', '2023-09-04 05:19:38', NULL);
INSERT INTO "public"."reports" VALUES (4, 11, 42, '4', 'Test Pengaduan', 'Deskripsi laporan', 'Pending', '2023-09-04 14:11:33', '2023-09-04 14:11:33', NULL);
INSERT INTO "public"."reports" VALUES (5, 12, 42, '5', 'Test Laporan', 'Deskripsi Laporan', 'Pending', '2023-09-04 14:18:04', '2023-09-04 14:18:04', NULL);
INSERT INTO "public"."reports" VALUES (6, 13, 42, '6', 'Test Laporan', 'Deskripsi Laporan', 'Pending', '2023-09-04 14:18:34', '2023-09-04 14:18:34', NULL);
INSERT INTO "public"."reports" VALUES (7, 14, 38, '7', 'Test Laporan', 'Deskripsi Laporan', 'Proses Administratif', '2023-09-04 14:19:24', '2023-09-04 14:31:03', NULL);

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."role_has_permissions";
CREATE TABLE "public"."role_has_permissions" (
  "permission_id" int8 NOT NULL,
  "role_id" int8 NOT NULL
)
;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO "public"."role_has_permissions" VALUES (1, 1);
INSERT INTO "public"."role_has_permissions" VALUES (2, 1);
INSERT INTO "public"."role_has_permissions" VALUES (3, 1);
INSERT INTO "public"."role_has_permissions" VALUES (4, 1);
INSERT INTO "public"."role_has_permissions" VALUES (5, 1);
INSERT INTO "public"."role_has_permissions" VALUES (6, 1);
INSERT INTO "public"."role_has_permissions" VALUES (7, 1);
INSERT INTO "public"."role_has_permissions" VALUES (8, 1);
INSERT INTO "public"."role_has_permissions" VALUES (9, 1);
INSERT INTO "public"."role_has_permissions" VALUES (10, 1);
INSERT INTO "public"."role_has_permissions" VALUES (11, 1);
INSERT INTO "public"."role_has_permissions" VALUES (12, 1);
INSERT INTO "public"."role_has_permissions" VALUES (13, 1);
INSERT INTO "public"."role_has_permissions" VALUES (14, 1);
INSERT INTO "public"."role_has_permissions" VALUES (15, 1);
INSERT INTO "public"."role_has_permissions" VALUES (16, 1);
INSERT INTO "public"."role_has_permissions" VALUES (17, 1);
INSERT INTO "public"."role_has_permissions" VALUES (18, 1);
INSERT INTO "public"."role_has_permissions" VALUES (19, 1);
INSERT INTO "public"."role_has_permissions" VALUES (20, 1);
INSERT INTO "public"."role_has_permissions" VALUES (21, 1);
INSERT INTO "public"."role_has_permissions" VALUES (22, 1);
INSERT INTO "public"."role_has_permissions" VALUES (23, 1);
INSERT INTO "public"."role_has_permissions" VALUES (24, 1);
INSERT INTO "public"."role_has_permissions" VALUES (25, 1);
INSERT INTO "public"."role_has_permissions" VALUES (26, 1);
INSERT INTO "public"."role_has_permissions" VALUES (27, 1);
INSERT INTO "public"."role_has_permissions" VALUES (28, 1);
INSERT INTO "public"."role_has_permissions" VALUES (29, 1);
INSERT INTO "public"."role_has_permissions" VALUES (30, 1);
INSERT INTO "public"."role_has_permissions" VALUES (31, 1);
INSERT INTO "public"."role_has_permissions" VALUES (32, 1);
INSERT INTO "public"."role_has_permissions" VALUES (33, 1);
INSERT INTO "public"."role_has_permissions" VALUES (1, 2);
INSERT INTO "public"."role_has_permissions" VALUES (2, 2);
INSERT INTO "public"."role_has_permissions" VALUES (3, 2);
INSERT INTO "public"."role_has_permissions" VALUES (4, 2);
INSERT INTO "public"."role_has_permissions" VALUES (5, 2);
INSERT INTO "public"."role_has_permissions" VALUES (6, 2);
INSERT INTO "public"."role_has_permissions" VALUES (7, 2);
INSERT INTO "public"."role_has_permissions" VALUES (8, 2);
INSERT INTO "public"."role_has_permissions" VALUES (9, 2);
INSERT INTO "public"."role_has_permissions" VALUES (10, 2);
INSERT INTO "public"."role_has_permissions" VALUES (11, 2);
INSERT INTO "public"."role_has_permissions" VALUES (12, 2);
INSERT INTO "public"."role_has_permissions" VALUES (13, 2);
INSERT INTO "public"."role_has_permissions" VALUES (14, 2);
INSERT INTO "public"."role_has_permissions" VALUES (15, 2);
INSERT INTO "public"."role_has_permissions" VALUES (16, 2);
INSERT INTO "public"."role_has_permissions" VALUES (17, 2);
INSERT INTO "public"."role_has_permissions" VALUES (18, 2);
INSERT INTO "public"."role_has_permissions" VALUES (19, 2);
INSERT INTO "public"."role_has_permissions" VALUES (20, 2);
INSERT INTO "public"."role_has_permissions" VALUES (21, 2);
INSERT INTO "public"."role_has_permissions" VALUES (22, 2);
INSERT INTO "public"."role_has_permissions" VALUES (23, 2);
INSERT INTO "public"."role_has_permissions" VALUES (24, 2);
INSERT INTO "public"."role_has_permissions" VALUES (25, 2);
INSERT INTO "public"."role_has_permissions" VALUES (26, 2);
INSERT INTO "public"."role_has_permissions" VALUES (27, 2);
INSERT INTO "public"."role_has_permissions" VALUES (28, 2);
INSERT INTO "public"."role_has_permissions" VALUES (29, 2);
INSERT INTO "public"."role_has_permissions" VALUES (30, 2);
INSERT INTO "public"."role_has_permissions" VALUES (31, 2);
INSERT INTO "public"."role_has_permissions" VALUES (32, 2);
INSERT INTO "public"."role_has_permissions" VALUES (33, 2);
INSERT INTO "public"."role_has_permissions" VALUES (1, 3);
INSERT INTO "public"."role_has_permissions" VALUES (2, 3);
INSERT INTO "public"."role_has_permissions" VALUES (29, 3);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS "public"."roles";
CREATE TABLE "public"."roles" (
  "id" int8 NOT NULL DEFAULT nextval('roles_id_seq'::regclass),
  "name" varchar(125) COLLATE "pg_catalog"."default" NOT NULL,
  "guard_name" varchar(125) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO "public"."roles" VALUES (1, 'super admin', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."roles" VALUES (2, 'administrator', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');
INSERT INTO "public"."roles" VALUES (3, 'operator', 'web', '2023-09-04 00:13:26', '2023-09-04 00:13:26');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS "public"."status";
CREATE TABLE "public"."status" (
  "id" int8 NOT NULL DEFAULT nextval('status_id_seq'::regclass),
  "name" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "default" bool NOT NULL DEFAULT false,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0)
)
;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO "public"."status" VALUES (1, 'Pending', 't', '2023-09-03 23:59:39', '2023-09-03 23:59:39', NULL);
INSERT INTO "public"."status" VALUES (2, 'Proses Administratif', 'f', '2023-09-03 23:59:39', '2023-09-03 23:59:39', NULL);
INSERT INTO "public"."status" VALUES (3, 'Proses Penanganan', 'f', '2023-09-03 23:59:39', '2023-09-03 23:59:39', NULL);
INSERT INTO "public"."status" VALUES (4, 'Selesai Ditangani', 'f', '2023-09-03 23:59:39', '2023-09-03 23:59:39', NULL);
INSERT INTO "public"."status" VALUES (5, 'Laporan Ditolak', 'f', '2023-09-03 23:59:39', '2023-09-03 23:59:39', NULL);
INSERT INTO "public"."status" VALUES (31, 'Pending', 't', '2023-09-04 00:13:24', '2023-09-04 00:13:24', NULL);
INSERT INTO "public"."status" VALUES (32, 'Proses Administratif', 'f', '2023-09-04 00:13:24', '2023-09-04 00:13:24', NULL);
INSERT INTO "public"."status" VALUES (33, 'Proses Penanganan', 'f', '2023-09-04 00:13:24', '2023-09-04 00:13:24', NULL);
INSERT INTO "public"."status" VALUES (34, 'Selesai Ditangani', 'f', '2023-09-04 00:13:24', '2023-09-04 00:13:24', NULL);
INSERT INTO "public"."status" VALUES (35, 'Laporan Ditolak', 'f', '2023-09-04 00:13:24', '2023-09-04 00:13:24', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "id" int8 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
  "name" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "username" varchar(191) COLLATE "pg_catalog"."default",
  "phone_number" varchar(191) COLLATE "pg_catalog"."default",
  "password" varchar(191) COLLATE "pg_catalog"."default",
  "remember_token" varchar(100) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0)
)
;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES (6, 'Super Admin', 'superadmin@pengaduan.com', 'superadmin', '+1-272-227-2274', '$2y$10$W3CoQ5hTH3vHlVKcWK/wceUizLUVhw6JzGgkh6RuKXmX6eR/Hb0kS', NULL, '2023-09-04 00:13:24', '2023-09-04 00:13:24', NULL);
INSERT INTO "public"."users" VALUES (7, 'Administrator', 'admin@pengaduan.com', 'admin', '(520) 285-4825', '$2y$10$KsZCPQHmdTVCVGJ3v6KBHuSnOwNwzXQ/4UHQTS7hnYdX2BLLPFVNu', NULL, '2023-09-04 00:13:25', '2023-09-04 00:13:25', NULL);
INSERT INTO "public"."users" VALUES (8, 'Staff', 'staff@pengaduan.com', 'staff', '239-246-5728', '$2y$10$ynnbK/.djW3MYUvaFlgtJ.xlOWSsME7vuLrEsly5AzU5YvBfWpW.2', NULL, '2023-09-04 00:13:25', '2023-09-04 00:13:25', NULL);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."activity_log_id_seq"
OWNED BY "public"."activity_log"."id";
SELECT setval('"public"."activity_log_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."categories_id_seq"
OWNED BY "public"."categories"."id";
SELECT setval('"public"."categories_id_seq"', 42, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."failed_jobs_id_seq"
OWNED BY "public"."failed_jobs"."id";
SELECT setval('"public"."failed_jobs_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."media_id_seq"
OWNED BY "public"."media"."id";
SELECT setval('"public"."media_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."migrations_id_seq"
OWNED BY "public"."migrations"."id";
SELECT setval('"public"."migrations_id_seq"', 45, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."permissions_id_seq"
OWNED BY "public"."permissions"."id";
SELECT setval('"public"."permissions_id_seq"', 38, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."personal_access_tokens_id_seq"
OWNED BY "public"."personal_access_tokens"."id";
SELECT setval('"public"."personal_access_tokens_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."report_trackers_id_seq"
OWNED BY "public"."report_trackers"."id";
SELECT setval('"public"."report_trackers_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."reporters_id_seq"
OWNED BY "public"."reporters"."id";
SELECT setval('"public"."reporters_id_seq"', 14, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."reports_id_seq"
OWNED BY "public"."reports"."id";
SELECT setval('"public"."reports_id_seq"', 7, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."roles_id_seq"
OWNED BY "public"."roles"."id";
SELECT setval('"public"."roles_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."status_id_seq"
OWNED BY "public"."status"."id";
SELECT setval('"public"."status_id_seq"', 35, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."users_id_seq"
OWNED BY "public"."users"."id";
SELECT setval('"public"."users_id_seq"', 8, true);

-- ----------------------------
-- Indexes structure for table activity_log
-- ----------------------------
CREATE INDEX "activity_log_log_name_index" ON "public"."activity_log" USING btree (
  "log_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "causer" ON "public"."activity_log" USING btree (
  "causer_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "causer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "subject" ON "public"."activity_log" USING btree (
  "subject_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "subject_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table activity_log
-- ----------------------------
ALTER TABLE "public"."activity_log" ADD CONSTRAINT "activity_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table categories
-- ----------------------------
ALTER TABLE "public"."categories" ADD CONSTRAINT "categories_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table failed_jobs
-- ----------------------------
ALTER TABLE "public"."failed_jobs" ADD CONSTRAINT "failed_jobs_uuid_unique" UNIQUE ("uuid");

-- ----------------------------
-- Primary Key structure for table failed_jobs
-- ----------------------------
ALTER TABLE "public"."failed_jobs" ADD CONSTRAINT "failed_jobs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table media
-- ----------------------------
CREATE INDEX "media_model_type_model_id_index" ON "public"."media" USING btree (
  "model_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "model_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "media_order_column_index" ON "public"."media" USING btree (
  "order_column" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table media
-- ----------------------------
ALTER TABLE "public"."media" ADD CONSTRAINT "media_uuid_unique" UNIQUE ("uuid");

-- ----------------------------
-- Primary Key structure for table media
-- ----------------------------
ALTER TABLE "public"."media" ADD CONSTRAINT "media_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table migrations
-- ----------------------------
ALTER TABLE "public"."migrations" ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table model_has_permissions
-- ----------------------------
CREATE INDEX "model_has_permissions_model_id_model_type_index" ON "public"."model_has_permissions" USING btree (
  "model_id" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "model_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table model_has_permissions
-- ----------------------------
ALTER TABLE "public"."model_has_permissions" ADD CONSTRAINT "model_has_permissions_pkey" PRIMARY KEY ("permission_id", "model_id", "model_type");

-- ----------------------------
-- Indexes structure for table model_has_roles
-- ----------------------------
CREATE INDEX "model_has_roles_model_id_model_type_index" ON "public"."model_has_roles" USING btree (
  "model_id" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "model_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table model_has_roles
-- ----------------------------
ALTER TABLE "public"."model_has_roles" ADD CONSTRAINT "model_has_roles_pkey" PRIMARY KEY ("role_id", "model_id", "model_type");

-- ----------------------------
-- Indexes structure for table notifications
-- ----------------------------
CREATE INDEX "notifications_notifiable_type_notifiable_id_index" ON "public"."notifications" USING btree (
  "notifiable_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "notifiable_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table notifications
-- ----------------------------
ALTER TABLE "public"."notifications" ADD CONSTRAINT "notifications_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table password_reset_tokens
-- ----------------------------
CREATE INDEX "password_reset_tokens_email_index" ON "public"."password_reset_tokens" USING btree (
  "email" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table permissions
-- ----------------------------
ALTER TABLE "public"."permissions" ADD CONSTRAINT "permissions_name_guard_name_unique" UNIQUE ("name", "guard_name");

-- ----------------------------
-- Primary Key structure for table permissions
-- ----------------------------
ALTER TABLE "public"."permissions" ADD CONSTRAINT "permissions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table personal_access_tokens
-- ----------------------------
CREATE INDEX "personal_access_tokens_tokenable_type_tokenable_id_index" ON "public"."personal_access_tokens" USING btree (
  "tokenable_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "tokenable_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table personal_access_tokens
-- ----------------------------
ALTER TABLE "public"."personal_access_tokens" ADD CONSTRAINT "personal_access_tokens_token_unique" UNIQUE ("token");

-- ----------------------------
-- Primary Key structure for table personal_access_tokens
-- ----------------------------
ALTER TABLE "public"."personal_access_tokens" ADD CONSTRAINT "personal_access_tokens_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table report_trackers
-- ----------------------------
ALTER TABLE "public"."report_trackers" ADD CONSTRAINT "report_trackers_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table reporters
-- ----------------------------
ALTER TABLE "public"."reporters" ADD CONSTRAINT "reporters_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table reports
-- ----------------------------
ALTER TABLE "public"."reports" ADD CONSTRAINT "reports_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table role_has_permissions
-- ----------------------------
ALTER TABLE "public"."role_has_permissions" ADD CONSTRAINT "role_has_permissions_pkey" PRIMARY KEY ("permission_id", "role_id");

-- ----------------------------
-- Uniques structure for table roles
-- ----------------------------
ALTER TABLE "public"."roles" ADD CONSTRAINT "roles_name_guard_name_unique" UNIQUE ("name", "guard_name");

-- ----------------------------
-- Primary Key structure for table roles
-- ----------------------------
ALTER TABLE "public"."roles" ADD CONSTRAINT "roles_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table status
-- ----------------------------
ALTER TABLE "public"."status" ADD CONSTRAINT "status_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_email_unique" UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table model_has_permissions
-- ----------------------------
ALTER TABLE "public"."model_has_permissions" ADD CONSTRAINT "model_has_permissions_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "public"."permissions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table model_has_roles
-- ----------------------------
ALTER TABLE "public"."model_has_roles" ADD CONSTRAINT "model_has_roles_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "public"."roles" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table report_trackers
-- ----------------------------
ALTER TABLE "public"."report_trackers" ADD CONSTRAINT "report_trackers_report_id_foreign" FOREIGN KEY ("report_id") REFERENCES "public"."reports" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."report_trackers" ADD CONSTRAINT "report_trackers_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table reports
-- ----------------------------
ALTER TABLE "public"."reports" ADD CONSTRAINT "reports_category_id_foreign" FOREIGN KEY ("category_id") REFERENCES "public"."categories" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."reports" ADD CONSTRAINT "reports_reporter_id_foreign" FOREIGN KEY ("reporter_id") REFERENCES "public"."reporters" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table role_has_permissions
-- ----------------------------
ALTER TABLE "public"."role_has_permissions" ADD CONSTRAINT "role_has_permissions_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "public"."permissions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."role_has_permissions" ADD CONSTRAINT "role_has_permissions_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "public"."roles" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
