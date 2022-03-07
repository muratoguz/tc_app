create table applications
(
    id                   bigint unsigned auto_increment
        primary key,
    os_id                int                  not null,
    app_name             varchar(255)         not null,
    user_name            varchar(255)         not null,
    password             varchar(255)         not null,
    is_active            tinyint(1) default 1 not null,
    third_party_endpoint varchar(255)         not null,
    created_at           timestamp            null,
    updated_at           timestamp            null
)
    collate = utf8_unicode_ci;

create index applications_os_id_index
    on applications (os_id);

INSERT INTO tc_app.applications (id, os_id, app_name, user_name, password, is_active, third_party_endpoint, created_at, updated_at) VALUES (1, 1, 'App Name 1', 'app1', 'app1', 1, 'http:://localhost/api/app/1', null, null);
INSERT INTO tc_app.applications (id, os_id, app_name, user_name, password, is_active, third_party_endpoint, created_at, updated_at) VALUES (2, 2, 'App Name 2', 'app2', 'app2', 1, 'http:://localhost/api/app/2', null, null);
INSERT INTO tc_app.applications (id, os_id, app_name, user_name, password, is_active, third_party_endpoint, created_at, updated_at) VALUES (3, 2, 'App Name 3', 'app3', 'app3', 1, 'http:://localhost/api/app/3', null, null);
INSERT INTO tc_app.applications (id, os_id, app_name, user_name, password, is_active, third_party_endpoint, created_at, updated_at) VALUES (4, 1, 'App Name 4', 'app4', 'app4', 1, 'http:://localhost/api/app/4', null, null);
INSERT INTO tc_app.applications (id, os_id, app_name, user_name, password, is_active, third_party_endpoint, created_at, updated_at) VALUES (5, 1, 'App Name 5', 'app5', 'app5', 0, 'http:://localhost/api/app/5', null, null);
