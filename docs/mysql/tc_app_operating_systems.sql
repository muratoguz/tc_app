create table operating_systems
(
    id             bigint unsigned auto_increment
        primary key,
    name           varchar(255)         not null,
    validation_url varchar(255)         null,
    support        tinyint(1) default 1 not null,
    is_active      tinyint(1) default 1 not null,
    created_at     timestamp            null,
    updated_at     timestamp            null
)
    collate = utf8_unicode_ci;

INSERT INTO tc_app.operating_systems (id, name, validation_url, support, is_active, created_at, updated_at) VALUES (1, 'Android OS', 'google', 1, 1, null, null);
INSERT INTO tc_app.operating_systems (id, name, validation_url, support, is_active, created_at, updated_at) VALUES (2, 'Apple iOS', 'ios', 1, 1, null, null);
INSERT INTO tc_app.operating_systems (id, name, validation_url, support, is_active, created_at, updated_at) VALUES (3, 'Symbian OS', 'symb', 0, 0, null, null);
INSERT INTO tc_app.operating_systems (id, name, validation_url, support, is_active, created_at, updated_at) VALUES (4, 'Blackberry OS', 'bberry', 0, 0, null, null);
INSERT INTO tc_app.operating_systems (id, name, validation_url, support, is_active, created_at, updated_at) VALUES (5, 'Windows Mobile OS', 'mswindow', 0, 0, null, null);
