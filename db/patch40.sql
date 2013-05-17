-- adding the links column to the talk

create table link_types(
    ID int not null auto_increment primary key,
    
    link_type varchar(31) not null,
    name text not null,
    
    unique index(link_type)
);

create table talk_attachments (
    ID int not null auto_increment primary key,
    talk_id int not null,
    
    link_type_id int unsigned not null,
    link_url text not null,
    
    index(talk_id, link_type_id)
);

insert into link_types values(1, 'slides', 'Slides');
insert into talk_attachments (talk_id, link_type_id, link_url) select ID, 1, slides_link from talks where slides_link <> '';

alter table talks drop slides_link;

INSERT INTO patch_history SET patch_number = 40;
