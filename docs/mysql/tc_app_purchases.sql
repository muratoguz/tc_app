create table purchases
(
    id                bigint unsigned auto_increment
        primary key,
    u_id              varchar(255)                          not null,
    app_id            int                                   not null,
    receipt           varchar(255)                          not null,
    is_active         tinyint(1)  default 1                 not null,
    status            varchar(10) default 'started'         not null,
    status_callback   varchar(10)                           null,
    os_validation_url varchar(10)                           not null,
    created_at        timestamp                             null,
    updated_at        timestamp                             null,
    expire_date       timestamp   default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP
)
    collate = utf8_unicode_ci;

create index purchases_expire_date_index
    on purchases (expire_date);

create index purchases_status_index
    on purchases (status);

INSERT INTO tc_app.purchases (id, u_id, app_id, receipt, is_active, status, status_callback, os_validation_url, created_at, updated_at, expire_date) VALUES (1, '3555b7a5-11f4-4f8d-9a21-8006f5cb2820', 3, '1646622243', 1, 'renewed', 'waiting', 'ios', '2022-03-07 03:04:05', '2022-03-07 03:04:05', '2022-03-07 05:25:55');
INSERT INTO tc_app.purchases (id, u_id, app_id, receipt, is_active, status, status_callback, os_validation_url, created_at, updated_at, expire_date) VALUES (2, '09381eb0-fa1b-49d5-a5e4-38b4647e1c43', 3, '1646622391', 1, 'pending', 'waiting', 'ios', '2022-03-07 03:06:33', '2022-03-07 03:06:33', '2022-03-07 05:25:55');
INSERT INTO tc_app.purchases (id, u_id, app_id, receipt, is_active, status, status_callback, os_validation_url, created_at, updated_at, expire_date) VALUES (3, '09381eb0-fa1b-49d5-a5e4-38b4647e1c43', 1, '1646622423', 1, 'renewed', 'waiting', 'google', '2022-03-07 03:07:06', '2022-03-07 03:07:06', '2022-03-07 05:25:55');
INSERT INTO tc_app.purchases (id, u_id, app_id, receipt, is_active, status, status_callback, os_validation_url, created_at, updated_at, expire_date) VALUES (4, '09381eb0-fa1b-49d5-a5e4-38b4647e1c43', 2, '1646622603', 1, 'cancelled', 'waiting', 'ios', '2022-03-07 03:10:06', '2022-03-07 03:10:06', '2022-03-07 05:25:55');
INSERT INTO tc_app.purchases (id, u_id, app_id, receipt, is_active, status, status_callback, os_validation_url, created_at, updated_at, expire_date) VALUES (5, '09381eb0-fa1b-49d5-a5e4-38b4647e1c43', 4, '1646623401', 1, 'renewed', 'waiting', 'google', '2022-03-07 03:23:24', '2022-03-07 03:23:24', '2022-03-07 05:25:55');
INSERT INTO tc_app.purchases (id, u_id, app_id, receipt, is_active, status, status_callback, os_validation_url, created_at, updated_at, expire_date) VALUES (6, '09381eb0-fa1b-49d5-a5e4-38b4647e1c43', 5, '1646623411', 1, 'pending', 'waiting', 'google', '2022-03-07 03:23:34', '2022-03-07 03:23:34', '2022-03-07 05:25:55');
INSERT INTO tc_app.purchases (id, u_id, app_id, receipt, is_active, status, status_callback, os_validation_url, created_at, updated_at, expire_date) VALUES (7, '3555b7a5-11f4-4f8d-9a21-8006f5cb2820', 5, '1646623515', 1, 'renewed', 'waiting', 'google', '2022-03-07 03:25:18', '2022-03-07 03:25:18', '2022-03-07 05:25:55');
INSERT INTO tc_app.purchases (id, u_id, app_id, receipt, is_active, status, status_callback, os_validation_url, created_at, updated_at, expire_date) VALUES (8, '3555b7a5-11f4-4f8d-9a21-8006f5cb2820', 4, '1646623557', 1, 'renewed', 'waiting', 'google', '2022-03-07 03:25:59', '2022-03-07 03:25:59', '2022-03-07 05:25:55');
INSERT INTO tc_app.purchases (id, u_id, app_id, receipt, is_active, status, status_callback, os_validation_url, created_at, updated_at, expire_date) VALUES (9, '3555b7a5-11f4-4f8d-9a21-8006f5cb2820', 2, '1646623581', 1, 'renewed', 'waiting', 'ios', '2022-03-07 03:26:23', '2022-03-07 03:26:23', '2022-03-07 05:25:55');
INSERT INTO tc_app.purchases (id, u_id, app_id, receipt, is_active, status, status_callback, os_validation_url, created_at, updated_at, expire_date) VALUES (10, 'ff7172cd-3dfc-4c04-ad38-1a21acc6e0f8', 2, '1646623751', 1, 'pending', 'waiting', 'ios', '2022-03-07 03:29:13', '2022-03-07 03:29:13', '2022-03-07 05:25:55');
INSERT INTO tc_app.purchases (id, u_id, app_id, receipt, is_active, status, status_callback, os_validation_url, created_at, updated_at, expire_date) VALUES (11, 'ff7172cd-3dfc-4c04-ad38-1a21acc6e0f8', 3, '1646623763', 1, 'cancelled', 'waiting', 'ios', '2022-03-07 03:29:25', '2022-03-07 03:29:25', '2022-03-07 05:25:55');
INSERT INTO tc_app.purchases (id, u_id, app_id, receipt, is_active, status, status_callback, os_validation_url, created_at, updated_at, expire_date) VALUES (12, '0a6d8c36-cb7c-4018-aebc-642f249be329', 3, '1646623789', 1, 'renewed', 'waiting', 'ios', '2022-03-07 03:29:53', '2022-03-07 03:29:53', '2022-03-07 05:25:55');
INSERT INTO tc_app.purchases (id, u_id, app_id, receipt, is_active, status, status_callback, os_validation_url, created_at, updated_at, expire_date) VALUES (13, 'b5157459-c920-40db-b0e1-9a1abdf7c0c5', 3, '1646623819', 1, 'cancelled', 'waiting', 'ios', '2022-03-07 03:30:21', '2022-03-07 03:30:21', '2022-03-07 05:25:55');
INSERT INTO tc_app.purchases (id, u_id, app_id, receipt, is_active, status, status_callback, os_validation_url, created_at, updated_at, expire_date) VALUES (14, '68ee601f-91ba-4649-bfdb-d89d0018b451', 1, '1646623863', 1, 'cancelled', 'waiting', 'google', '2022-03-07 03:31:05', '2022-03-07 03:31:05', '2022-03-07 05:25:55');
INSERT INTO tc_app.purchases (id, u_id, app_id, receipt, is_active, status, status_callback, os_validation_url, created_at, updated_at, expire_date) VALUES (15, '68ee601f-91ba-4649-bfdb-d89d0018b451', 4, '1646623891', 1, 'pending', 'waiting', 'google', '2022-03-07 03:31:33', '2022-03-07 03:31:33', '2022-03-07 05:25:55');
INSERT INTO tc_app.purchases (id, u_id, app_id, receipt, is_active, status, status_callback, os_validation_url, created_at, updated_at, expire_date) VALUES (16, '68ee601f-91ba-4649-bfdb-d89d0018b451', 5, '1646623907', 1, 'renewed', 'waiting', 'google', '2022-03-07 03:31:50', '2022-03-07 03:31:50', '2022-03-07 05:25:55');
INSERT INTO tc_app.purchases (id, u_id, app_id, receipt, is_active, status, status_callback, os_validation_url, created_at, updated_at, expire_date) VALUES (17, '049d7b43-e51e-4159-95a4-deb3b11cd749', 5, '1646623965', 1, 'cancelled', 'waiting', 'google', '2022-03-07 03:32:48', '2022-03-07 03:32:48', '2022-03-07 05:25:55');
INSERT INTO tc_app.purchases (id, u_id, app_id, receipt, is_active, status, status_callback, os_validation_url, created_at, updated_at, expire_date) VALUES (18, '049d7b43-e51e-4159-95a4-deb3b11cd749', 1, '1646623979', 1, 'renewed', 'waiting', 'google', '2022-03-07 03:33:02', '2022-03-07 03:33:02', '2022-03-07 05:25:55');
