create table device_to_app
(
    u_id   varchar(255) not null,
    app_id int          not null,
    constraint device_to_app_u_id_app_id_unique
        unique (u_id, app_id)
)
    collate = utf8_unicode_ci;

create index device_to_app_u_id_index
    on device_to_app (u_id);

INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('0326e30e-2f61-443e-bed5-905374bf71d6', 1);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('049d7b43-e51e-4159-95a4-deb3b11cd749', 5);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('0753364b-0fbe-404e-ae3f-f3f51fa75b70', 5);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('09381eb0-fa1b-49d5-a5e4-38b4647e1c43', 4);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('0976673f-229d-4fa9-ae2b-801da28566d4', 2);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('0a6d8c36-cb7c-4018-aebc-642f249be329', 2);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('0c7e8bc4-13a6-4366-8bb7-1c5c2865c28d', 5);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('2616a811-904e-45d7-9a0e-3872991a5f5c', 5);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('264e1129-9461-4a1a-9f02-0eee253561f3', 4);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('3555b7a5-11f4-4f8d-9a21-8006f5cb2820', 4);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('36b956b3-97ab-4dd7-9963-1f35c79f3631', 5);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('399cee78-ee21-4a1a-ae2c-0132cfa472ce', 3);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('3c5816fd-7afe-4d29-92d8-dd0c24d6c2c6', 2);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('3e1e0041-bdd3-49bf-bb22-6f1f9f2c372e', 5);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('3e4fdb8e-e229-4b9a-b0ac-c2ac797ff4da', 3);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('411a4657-0560-4e07-afad-2ceaca1eb1a6', 4);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('4af283e7-14e5-4399-ad21-f64ab0b730e0', 2);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('566573b3-2a64-4914-b7c2-cf9e2554accc', 4);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('68ee601f-91ba-4649-bfdb-d89d0018b451', 4);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('6e8ef902-4c67-43be-8ddf-8e0d635be2b0', 5);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('7150dae8-9ffc-420c-8c69-9ba209f5fea0', 1);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('74580d85-45e2-4161-aa43-71b6bae33365', 4);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('8311e52a-10fa-4f00-81fa-3ed928d20854', 1);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('b5157459-c920-40db-b0e1-9a1abdf7c0c5', 3);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('c18ce2c5-59d4-4ebc-998b-ca1fd1da5cd2', 1);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('cd2f9388-253a-4b27-a987-1ea0a7929152', 4);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('e312ced6-b7e9-434a-83b1-ea2de711a7c0', 1);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('e8d90e35-8b99-4242-91f1-6015d6d459fb', 2);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('eb26865d-898b-43e1-9bb9-2fb41de4008c', 1);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('f9fff466-ef0f-4125-be0e-a3ae16456373', 4);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('fa32914d-90e1-470d-a4d8-ead95fa71ed5', 4);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('ff7172cd-3dfc-4c04-ad38-1a21acc6e0f8', 2);
INSERT INTO tc_app.device_to_app (u_id, app_id) VALUES ('QcYeqZK6dqFuz3Yc791S5txOsofAPziVSqs3UFIPOSokH1cTZOadV6ifEPO7', 4);
