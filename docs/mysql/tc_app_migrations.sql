create table migrations
(
    id        int unsigned auto_increment
        primary key,
    migration varchar(255) not null,
    batch     int          not null
)
    collate = utf8_unicode_ci;

INSERT INTO tc_app.migrations (id, migration, batch) VALUES (90, '2014_10_12_000000_create_users_table', 1);
INSERT INTO tc_app.migrations (id, migration, batch) VALUES (91, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO tc_app.migrations (id, migration, batch) VALUES (92, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO tc_app.migrations (id, migration, batch) VALUES (93, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO tc_app.migrations (id, migration, batch) VALUES (94, '2022_02_21_145006_devices', 1);
INSERT INTO tc_app.migrations (id, migration, batch) VALUES (95, '2022_02_23_110211_purchase', 1);
INSERT INTO tc_app.migrations (id, migration, batch) VALUES (96, '2022_02_27_120127_applications', 1);
INSERT INTO tc_app.migrations (id, migration, batch) VALUES (97, '2022_02_27_135657_device_to_app', 1);
INSERT INTO tc_app.migrations (id, migration, batch) VALUES (98, '2022_02_27_141651_os', 1);
INSERT INTO tc_app.migrations (id, migration, batch) VALUES (99, '2022_03_02_124343_create_jobs_table', 2);
