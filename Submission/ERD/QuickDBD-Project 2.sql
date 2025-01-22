
CREATE TABLE "category" (
    "cat_ids" char(4) UNIQUE NOT NULL,
    "category" varchar(30)   NOT NULL,
    "last_update" timestamp DEFAULT localtimestamp  NOT NULL
);

CREATE TABLE "subcategory" (
    "sub_ids" varchar(8) UNIQUE  NOT NULL,
    "subcategory" varchar(30)   NOT NULL,
    "last_update" timestamp DEFAULT localtimestamp NOT NULL
);

CREATE TABLE "contact_info" (
    "contact_id" serial UNIQUE  NOT NULL,
    "firstname" varchar(30)   NOT NULL,
    "lastname" varchar(30)   NOT NULL,
    "email" varchar(50)   NOT NULL,
    "last_update" timestamp DEFAULT localtimestamp NOT NULL
);

CREATE TABLE "campaign" (
    "cf_id" serial   NOT NULL,
    "contact_id" int   NOT NULL,
    "cat_ids" char(4)   NOT NULL,
    "sub_ids" varchar(8)   NOT NULL,
    "company_name" varchar(60)   NOT NULL,
    "description" varchar(100)   NOT NULL,
    "goal" int   NOT NULL,
    "pledged" int   NOT NULL,
    "outcome" varchar(30)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar(30)   NOT NULL,
    "currency" varchar(30)   NOT NULL,
    "launch_date" timestamp  DEFAULT localtimestamp NOT NULL,
    "end_date" timestamp  DEFAULT localtimestamp NOT NULL,
    "last_update" timestamp  DEFAULT localtimestamp NOT NULL
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contact_info" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_cat_ids" FOREIGN KEY("cat_ids")
REFERENCES "category" ("cat_ids");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_sub_ids" FOREIGN KEY("sub_ids")
REFERENCES "subcategory" ("sub_ids");

