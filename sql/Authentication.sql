CREATE SCHEMA "authentication";

CREATE TYPE "authentication"."account_status" AS ENUM (
  'REGISTERED',
  'VERIFIED',
  'BANNED',
  'DELETED'
);

CREATE TABLE "authentication"."users" (
  "id" uuid PRIMARY KEY NOT NULL,
  "name" varchar(100) NOT NULL,
  "nickname" varchar(32) UNIQUE NOT NULL,
  "email" varchar(254) UNIQUE NOT NULL,
  "password_hash" bytea NOT NULL,
  "about_me" varchar(254),
  "account_status" account_status NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now()),
  "last_update_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "authentication"."roles" (
  "id" uuid PRIMARY KEY NOT NULL,
  "name" varchar(24) UNIQUE NOT NULL,
  "description" varchar(254)
);

CREATE TABLE "authentication"."permissions" (
  "id" uuid PRIMARY KEY NOT NULL,
  "name" varchar(24) UNIQUE NOT NULL,
  "description" varchar(254),
  "created_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "authentication"."user_roles" (
  "id" uuid PRIMARY KEY NOT NULL,
  "user_id" uuid NOT NULL,
  "role_id" uuid NOT NULL,
  "assigned_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "authentication"."role_permissions" (
  "id" uuid PRIMARY KEY NOT NULL,
  "role_id" uuid NOT NULL,
  "permission_id" uuid NOT NULL
);

ALTER TABLE "authentication"."users" ADD CONSTRAINT "user_to_roles" FOREIGN KEY ("id") REFERENCES "authentication"."user_roles" ("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE "authentication"."roles" ADD CONSTRAINT "role_to_users" FOREIGN KEY ("id") REFERENCES "authentication"."user_roles" ("role_id") ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE "authentication"."roles" ADD CONSTRAINT "role_to_permissions" FOREIGN KEY ("id") REFERENCES "authentication"."role_permissions" ("role_id") ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE "authentication"."permissions" ADD CONSTRAINT "permission_to_roles" FOREIGN KEY ("id") REFERENCES "authentication"."role_permissions" ("permission_id") ON DELETE RESTRICT ON UPDATE CASCADE;
