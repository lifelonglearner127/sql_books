-- Create Transfer program rate
create table staging.program_transferable_rate
(
    id                  serial
        primary key,
    source_program      varchar(512) not null,
    destination_program varchar(512) not null,
    ratio               numeric
);
