create schema "public";
create table "public"."aa_test_a_punon_tooltip_ok_osdo" (
  "ahcahkchkadhkbcvabhkascasc" char(1) null
);
create table "public"."actor" (
  "actor_id" int generated by default as identity not null,
  "first_name" varchar(45) not null,
  "last_name" varchar(45) not null,
  "last_update" timestamp(6) not null default null,
  constraint "actor_pkey"
    primary key ("actor_id")
);
create table "public"."address" (
  "address_id" int generated by default as identity not null,
  "address" varchar(50) not null,
  "address2" varchar(50) null,
  "district" varchar(20) not null,
  "city_id" smallint not null,
  "postal_code" varchar(10) null,
  "phone" varchar(20) not null,
  "last_update" timestamp(6) not null default null,
  constraint "address_pkey"
    primary key ("address_id")
);
create table "public"."category" (
  "category_id" int generated by default as identity not null,
  "name" varchar(25) not null,
  "last_update" timestamp(6) not null default null,
  constraint "category_pkey"
    primary key ("category_id")
);
create table "public"."city" (
  "city_id" int generated by default as identity not null,
  "city" varchar(50) not null,
  "country_id" smallint not null,
  "last_update" timestamp(6) not null default null,
  constraint "city_pkey"
    primary key ("city_id")
);
create table "public"."country" (
  "country_id" int generated by default as identity not null,
  "country" varchar(50) not null,
  "last_update" timestamp(6) not null default null,
  constraint "country_pkey"
    primary key ("country_id")
);
create table "public"."customer" (
  "customer_id" int generated by default as identity not null,
  "store_id" smallint not null,
  "first_name" varchar(45) not null,
  "last_name" varchar(45) not null,
  "email" varchar(50) null,
  "address_id" smallint not null,
  "activebool" boolean not null default true,
  "create_date" date not null default null,
  "last_update" timestamp(6) null default null,
  "active" int null,
  constraint "customer_pkey"
    primary key ("customer_id")
);
create table "public"."film" (
  "film_id" int generated by default as identity not null,
  "title" varchar(255) not null,
  "description" text null,
  "release_year" any null,
  "language_id" smallint not null,
  "rental_duration" smallint not null default 3,
  "rental_rate" numeric(4, 2) not null default 4.99,
  "length" smallint null,
  "replacement_cost" numeric(5, 2) not null default 19.99,
  "rating" any null,
  "last_update" timestamp(6) not null default null,
  "special_features" text[] null,
  "fulltext" any null,
  constraint "film_pkey"
    primary key ("film_id")
);
create table "public"."film_actor" (
  "actor_id" smallint not null,
  "film_id" smallint not null,
  "last_update" timestamp(6) not null default null,
  constraint "film_actor_pkey"
    primary key (
      "actor_id",
      "film_id"
    )
);
create table "public"."film_category" (
  "film_id" smallint not null,
  "category_id" smallint not null,
  "last_update" timestamp(6) not null default null,
  constraint "film_category_pkey"
    primary key (
      "film_id",
      "category_id"
    )
);
create table "public"."inventory" (
  "inventory_id" int generated by default as identity not null,
  "film_id" smallint not null,
  "store_id" smallint not null,
  "last_update" timestamp(6) not null default null,
  constraint "inventory_pkey"
    primary key ("inventory_id")
);
create table "public"."language" (
  "language_id" int generated by default as identity not null,
  "name" char(20) not null,
  "last_update" timestamp(6) not null default null,
  constraint "language_pkey"
    primary key ("language_id")
);
create table "public"."payment" (
  "payment_id" int generated by default as identity not null,
  "customer_id" smallint not null,
  "staff_id" smallint not null,
  "rental_id" int not null,
  "amount" numeric(5, 2) not null,
  "payment_date" timestamp(6) not null,
  constraint "payment_pkey"
    primary key ("payment_id")
);
create table "public"."rental" (
  "rental_id" int generated by default as identity not null,
  "rental_date" timestamp(6) not null,
  "inventory_id" int not null,
  "customer_id" smallint not null,
  "return_date" timestamp(6) null,
  "staff_id" smallint not null,
  "last_update" timestamp(6) not null default null,
  constraint "rental_pkey"
    primary key ("rental_id")
);
create table "public"."staff" (
  "staff_id" int generated by default as identity not null,
  "first_name" varchar(45) not null,
  "last_name" varchar(45) not null,
  "address_id" smallint not null,
  "email" varchar(50) null,
  "store_id" smallint not null,
  "active" boolean not null default true,
  "username" varchar(16) not null,
  "password" varchar(40) null,
  "last_update" timestamp(6) not null default null,
  "picture" bytea null,
  constraint "staff_pkey"
    primary key ("staff_id")
);
create table "public"."store" (
  "store_id" int generated by default as identity not null,
  "manager_staff_id" smallint not null,
  "address_id" smallint not null,
  "last_update" timestamp(6) not null default null,
  constraint "store_pkey"
    primary key ("store_id")
);
alter table "public"."address"
  add constraint "fk_address_city"
    foreign key ("city_id")
    references "public"."city" ("city_id");
alter table "public"."city"
  add constraint "fk_city"
    foreign key ("country_id")
    references "public"."country" ("country_id");
alter table "public"."customer"
  add constraint "customer_address_id_fkey"
    foreign key ("address_id")
    references "public"."address" ("address_id");
alter table "public"."film"
  add constraint "film_language_id_fkey"
    foreign key ("language_id")
    references "public"."language" ("language_id");
alter table "public"."film_actor"
  add constraint "film_actor_actor_id_fkey"
    foreign key ("actor_id")
    references "public"."actor" ("actor_id");
alter table "public"."film_actor"
  add constraint "film_actor_film_id_fkey"
    foreign key ("film_id")
    references "public"."film" ("film_id");
alter table "public"."film_category"
  add constraint "film_category_category_id_fkey"
    foreign key ("category_id")
    references "public"."category" ("category_id");
alter table "public"."film_category"
  add constraint "film_category_film_id_fkey"
    foreign key ("film_id")
    references "public"."film" ("film_id");
alter table "public"."inventory"
  add constraint "inventory_film_id_fkey"
    foreign key ("film_id")
    references "public"."film" ("film_id");
alter table "public"."payment"
  add constraint "payment_customer_id_fkey"
    foreign key ("customer_id")
    references "public"."customer" ("customer_id");
alter table "public"."payment"
  add constraint "payment_rental_id_fkey"
    foreign key ("rental_id")
    references "public"."rental" ("rental_id");
alter table "public"."payment"
  add constraint "payment_staff_id_fkey"
    foreign key ("staff_id")
    references "public"."staff" ("staff_id");
alter table "public"."rental"
  add constraint "rental_customer_id_fkey"
    foreign key ("customer_id")
    references "public"."customer" ("customer_id");
alter table "public"."rental"
  add constraint "rental_inventory_id_fkey"
    foreign key ("inventory_id")
    references "public"."inventory" ("inventory_id");
alter table "public"."rental"
  add constraint "rental_staff_id_key"
    foreign key ("staff_id")
    references "public"."staff" ("staff_id");
alter table "public"."staff"
  add constraint "staff_address_id_fkey"
    foreign key ("address_id")
    references "public"."address" ("address_id");
alter table "public"."store"
  add constraint "store_address_id_fkey"
    foreign key ("address_id")
    references "public"."address" ("address_id");
alter table "public"."store"
  add constraint "store_manager_staff_id_fkey"
    foreign key ("manager_staff_id")
    references "public"."staff" ("staff_id");
create unique index "actor_pkey" on "public"."actor"("actor_id" asc);
create index "idx_actor_last_name" on "public"."actor"("last_name" asc);
create unique index "address_pkey" on "public"."address"("address_id" asc);
create index "idx_fk_city_id" on "public"."address"("city_id" asc);
create unique index "category_pkey" on "public"."category"("category_id" asc);
create unique index "city_pkey" on "public"."city"("city_id" asc);
create index "idx_fk_country_id" on "public"."city"("country_id" asc);
create unique index "country_pkey" on "public"."country"("country_id" asc);
create unique index "customer_pkey" on "public"."customer"("customer_id" asc);
create index "idx_fk_address_id" on "public"."customer"("address_id" asc);
create index "idx_fk_store_id" on "public"."customer"("store_id" asc);
create index "idx_last_name" on "public"."customer"("last_name" asc);
create index "film_fulltext_idx" on "public"."film"("fulltext" asc);
create unique index "film_pkey" on "public"."film"("film_id" asc);
create index "idx_fk_language_id" on "public"."film"("language_id" asc);
create index "idx_title" on "public"."film"("title" asc);
create unique index "film_actor_pkey" on "public"."film_actor"(
  "actor_id" asc,
  "film_id" asc
);
create index "idx_fk_film_id" on "public"."film_actor"("film_id" asc);
create unique index "film_category_pkey" on "public"."film_category"(
  "film_id" asc,
  "category_id" asc
);
create index "idx_store_id_film_id" on "public"."inventory"(
  "store_id" asc,
  "film_id" asc
);
create unique index "inventory_pkey" on "public"."inventory"("inventory_id" asc);
create unique index "language_pkey" on "public"."language"("language_id" asc);
create index "idx_fk_customer_id" on "public"."payment"("customer_id" asc);
create index "idx_fk_rental_id" on "public"."payment"("rental_id" asc);
create index "idx_fk_staff_id" on "public"."payment"("staff_id" asc);
create unique index "payment_pkey" on "public"."payment"("payment_id" asc);
create index "idx_fk_inventory_id" on "public"."rental"("inventory_id" asc);
create unique index "idx_unq_rental_rental_date_inventory_id_customer_id" on "public"."rental"(
  "rental_date" asc,
  "inventory_id" asc,
  "customer_id" asc
);
create unique index "rental_pkey" on "public"."rental"("rental_id" asc);
create unique index "staff_pkey" on "public"."staff"("staff_id" asc);
create unique index "idx_unq_manager_staff_id" on "public"."store"("manager_staff_id" asc);
create unique index "store_pkey" on "public"."store"("store_id" asc);