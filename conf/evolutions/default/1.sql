# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table product (
  id                        integer not null,
  name                      varchar(255),
  category_id               integer,
  owner_id                  integer,
  created                   timestamp,
  quantity                  integer,
  price                     double,
  description               varchar(255),
  image_url                 varchar(255),
  constraint pk_product primary key (id))
;

create table user (
  id                        integer not null,
  username                  varchar(255),
  password                  varchar(255),
  constraint pk_user primary key (id))
;

create sequence product_seq;

create sequence user_seq;

alter table product add constraint fk_product_owner_1 foreign key (owner_id) references user (id) on delete restrict on update restrict;
create index ix_product_owner_1 on product (owner_id);



# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists product;

drop table if exists user;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists product_seq;

drop sequence if exists user_seq;

