create table devices
(
    id           bigint unsigned auto_increment
        primary key,
    u_id         varchar(255)         not null,
    lang         varchar(255)         not null,
    os_id        int                  not null,
    client_token varchar(80)          null,
    is_active    tinyint(1) default 1 not null,
    created_at   timestamp            null,
    updated_at   timestamp            null,
    constraint devices_client_token_unique
        unique (client_token),
    constraint devices_u_id_unique
        unique (u_id)
)
    collate = utf8_unicode_ci;

INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (1, '3555b7a5-11f4-4f8d-9a21-8006f5cb2820', 'en', 1, 'ZhS7rnZg47ctiYrjuBALsAhi3DUfYjpMkaDDOdZrfHm1fBM0VH5xgugooifr', 1, '2022-03-02 10:04:08', '2022-03-02 10:04:08');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (2, '09381eb0-fa1b-49d5-a5e4-38b4647e1c43', 'en', 1, 'yGh6OlbvoTP8W3ntssX5PeUrkZYLCneKTgAbeMxyHV3g9tG7MdPOXubVYOEF', 1, '2022-03-04 08:26:36', '2022-03-04 08:26:36');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (3, '74580d85-45e2-4161-aa43-71b6bae33365', 'en', 1, 'QcYeqZK6dqFuz3Yc791S5txOsofAPziVSqs3UFIPOSokH1cTZOadV6ifEPO7', 1, '2022-03-04 08:27:09', '2022-03-04 08:27:09');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (4, 'eb268fnd-897b-43c1-9b66-2fb41de40980', 'en', 1, 'rb5u4kZbmyGTtOligNyjz8jnptmDramPb77QYBzOaGB5cqhJregcUXRg5sAw', 1, '2022-03-04 09:23:14', '2022-03-04 09:23:14');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (5, 'eb26865d-898b-43e1-9bb9-2fb41de4008c', 'fr', 1, 'PLbXL1T4R8p0DtL9RPm7AQC2G0j0aiZEQJfJ4SF6cXpVOAUBhjX4G43NwWXH', 1, '2022-03-06 16:18:39', '2022-03-06 16:18:39');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (6, 'e312ced6-b7e9-434a-83b1-ea2de711a7c0', 'fr', 1, 'JcNTSLLqFcGGmNMDyGWkiwLTkXVt4DKFe2EsWWGdxPJ5af5jWEtYZW6KLdwp', 1, '2022-03-06 16:21:42', '2022-03-06 16:21:42');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (7, '3c5816fd-7afe-4d29-92d8-dd0c24d6c2c6', 'tr', 1, 'VRb7ljzJtk7q187ubzEg0jcd0tpHZ81L3mSOJqP86GynKyHZX5yzoTrzRa4k', 1, '2022-03-06 17:05:28', '2022-03-06 17:05:28');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (8, 'ff7172cd-3dfc-4c04-ad38-1a21acc6e0f8', 'tr', 2, 'rhMxvTN35cKc4IEDpRgxImqO8kqykVOYLIQKhqeUB4yhJa6GjRHIDtsB9DDQ', 1, '2022-03-06 17:09:55', '2022-03-06 17:09:55');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (9, '0a6d8c36-cb7c-4018-aebc-642f249be329', 'tr', 2, 'I5ZaQnrj486eadV8qfbW5hlFT9m1hFcLmPRO0xiDQ3wb2fK6dVWoPxyKVjgp', 1, '2022-03-06 18:00:28', '2022-03-06 18:00:28');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (10, '3e4fdb8e-e229-4b9a-b0ac-c2ac797ff4da', 'tr', 2, 'yvbUMEn2nlnMX15h7Rbip63jRpdrlQgeDOa9Z5dAi9wEW9fXtkTusYL5xmkL', 1, '2022-03-06 20:10:18', '2022-03-06 20:10:18');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (11, '399cee78-ee21-4a1a-ae2c-0132cfa472ce', 'tr', 2, 'VZoxhuyi5a9CxpDjYpO3sdgOu4NJXhDE75lA7HpIzn94bcnOGcBM1EpZSJfF', 1, '2022-03-06 20:10:20', '2022-03-06 20:10:20');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (12, 'b5157459-c920-40db-b0e1-9a1abdf7c0c5', 'tr', 2, 'HGEYLwXekcG5h6FVUtLYgYEpA10DPKaUScGzA5Ocgg6SggzoSjWUasZIF9yT', 1, '2022-03-06 20:10:23', '2022-03-06 20:10:23');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (13, '264e1129-9461-4a1a-9f02-0eee253561f3', 'tr', 1, 'ZqmluJbZsXSrI03HDCp3CSJNoDwBsqK4eeUonOtfnyfAbNDGZBNdLOFJN8P5', 1, '2022-03-06 20:10:32', '2022-03-06 20:10:32');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (14, 'cd2f9388-253a-4b27-a987-1ea0a7929152', 'tr', 1, 'Y9PLrbOmVXKlV4Abz46eA1sFHsOFPOmQ61cEyActOkWb8OOUQpDukPjSoCSF', 1, '2022-03-06 20:10:35', '2022-03-06 20:10:35');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (15, 'fa32914d-90e1-470d-a4d8-ead95fa71ed5', 'tr', 1, '41B97NGWURxhvaqaWy8pMxiZMBpUIBPAmfYKdiR81s2P2IR0LcR5GXrfCv2H', 1, '2022-03-06 20:10:37', '2022-03-06 20:10:37');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (16, '411a4657-0560-4e07-afad-2ceaca1eb1a6', 'tr', 1, 'nKOqfd2FLe2QHGyfiNckFYN4rPq4evCOl4EdO2noapxVg3toBIcCrLf2Eifs', 1, '2022-03-06 20:10:39', '2022-03-06 20:10:39');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (17, 'f9fff466-ef0f-4125-be0e-a3ae16456373', 'tr', 1, 'ELbLWE4J7idqdDSU7gFk90JDv3Pre4GjzcFfAUjT4FV2OwLObRcG2qyoDbim', 1, '2022-03-06 20:10:41', '2022-03-06 20:10:41');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (18, '68ee601f-91ba-4649-bfdb-d89d0018b451', 'tr', 1, 'EYaAxqpxz2g9JyXI20lXwIOcFya3hvt4wH2M5BEVhBVNI209aVjLZchvO8QF', 1, '2022-03-06 20:10:43', '2022-03-06 20:10:43');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (19, '0c7e8bc4-13a6-4366-8bb7-1c5c2865c28d', 'tr', 1, 'sEW9iG8IB7LQFqctd1OWsOyPWL5ulj4TQPsmVYieXwE4tn2ZDhceL1MxdvDm', 1, '2022-03-06 20:10:52', '2022-03-06 20:10:52');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (20, '36b956b3-97ab-4dd7-9963-1f35c79f3631', 'en', 1, 'MjQCOYHhCdyyfGDJ5RLpszgiIoxx3dET39YsIOFNtFc6pDF4c11KSuWaxTAW', 1, '2022-03-06 20:10:57', '2022-03-06 20:10:57');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (21, '6e8ef902-4c67-43be-8ddf-8e0d635be2b0', 'en', 1, 'INfrmL1cXXuIxzo1V3WiSSeIk01eGZC2xh6sS9YsIpgwFcwMGcAYV4kwspK5', 1, '2022-03-06 20:11:01', '2022-03-06 20:11:01');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (22, '049d7b43-e51e-4159-95a4-deb3b11cd749', 'en', 1, 'WPiSkBgoxVESzzBKKlodS6ZTNPeQF6SWJWSmPaL0wSLOjO7EzOlvkTcJTKMd', 1, '2022-03-06 20:11:04', '2022-03-06 20:11:04');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (23, '0753364b-0fbe-404e-ae3f-f3f51fa75b70', 'it', 1, '2o42t8shlvI5Uyvy5ce0CNn8CVFUY6mTRMCrNbf8lpDsfMgvYNgZZXmM9tAq', 1, '2022-03-06 20:11:09', '2022-03-06 20:11:09');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (24, 'c18ce2c5-59d4-4ebc-998b-ca1fd1da5cd2', 'it', 1, 'y7wontqYZSfuxpdxr1gaYJwxbduEsP7q1s2WmLlI3SHZlLRUtaLIIhzDqGi6', 1, '2022-03-06 20:11:18', '2022-03-06 20:11:18');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (25, '7150dae8-9ffc-420c-8c69-9ba209f5fea0', 'tr', 1, 'pusHF7fgwOrncwYMFKrjj2Hc28OP5kCvh99jEdUmLC7rr2mISW5QywXZtOMj', 1, '2022-03-06 20:11:24', '2022-03-06 20:11:24');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (26, '0976673f-229d-4fa9-ae2b-801da28566d4', 'tr', 2, 'MQlV6N9oSK6KSYfYvyiAtD6Oy3619T9h3Eysz5SD8D7kqzzbqBcgIjsEbMhK', 1, '2022-03-06 20:11:41', '2022-03-06 20:11:41');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (27, '4af283e7-14e5-4399-ad21-f64ab0b730e0', 'fr', 2, 'Sv2V0Txfu7bhv5EwHJwg6BmwbaD3EFM6pH3JAHwKRqE8oiKmF6gzCH6Olz0S', 1, '2022-03-06 20:11:46', '2022-03-06 20:11:46');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (28, 'e8d90e35-8b99-4242-91f1-6015d6d459fb', 'en', 2, 'ezczTWg2YEoXMHOSQ2JA9WCvD2biKwvMnlGi4MI5DlhuaXpGlIxTePhwCqVJ', 1, '2022-03-06 20:11:55', '2022-03-06 20:11:55');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (29, '566573b3-2a64-4914-b7c2-cf9e2554accc', 'en', 1, '6ZQaJfRuFpo6EGlQ2nmXw9E21atZfkguKIHtvOMzRahzcCYzQRNVeacU1i0A', 1, '2022-03-06 20:12:07', '2022-03-06 20:12:07');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (30, '3e1e0041-bdd3-49bf-bb22-6f1f9f2c372e', 'it', 1, 's0jfuJLo9eoQQorIpQ7W5JVbk0Mj92IPPYiWfnIpxNHlx9lDIKDfvD1Po5wy', 1, '2022-03-06 20:12:22', '2022-03-06 20:12:22');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (31, '2616a811-904e-45d7-9a0e-3872991a5f5c', 'tr', 1, 'FSfNEhx6OPnBPZWZStnEdbh9ES4iWhEBieu4tSDFZicCaHFx1PjKgMNSLcUO', 1, '2022-03-06 20:12:27', '2022-03-06 20:12:27');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (32, '0326e30e-2f61-443e-bed5-905374bf71d6', 'tr', 1, 'EH7XypUWNzxg5VgvnVOf8ctOLS6GXB6WAMcnNxWH1TvMHq8kTKFEkREOO4gq', 1, '2022-03-06 20:16:16', '2022-03-06 20:16:16');
INSERT INTO tc_app.devices (id, u_id, lang, os_id, client_token, is_active, created_at, updated_at) VALUES (33, '8311e52a-10fa-4f00-81fa-3ed928d20854', 'tr', 1, 'ImoKUOy6st2vgVuYRtEUDEkJ9CNapc2hgvXOtqDcFDuDnAqYZhklunQef3aM', 1, '2022-03-07 03:02:54', '2022-03-07 03:02:54');
