USE db35group;

CREATE TABLE IF NOT EXISTS `manager`
(
    `id`            INT(11)         NOT NULL AUTO_INCREMENT,
    `manager_name`  VARCHAR(255)    NOT NULL ,
    `password`      VARCHAR(255)    NOT NULL ,
    `email`         VARCHAR(255)    NOT NULL ,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `roles`
(
    `id`    INT(11)             NOT NULL AUTO_INCREMENT,
    `name`  VARCHAR(255)        NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `task`
(
    `id`            INT(11)         NOT NULL AUTO_INCREMENT,
    `task_name`     VARCHAR(255)    NOT NULL,
    `description`   VARCHAR(255)    NOT NULL,
    `create_date`   DATETIME,
    `last_update`   DATETIME,
    `deadline`      DATETIME,
    `status`        ENUM('OPEN','CLOSE','OnHold')  NOT NULL,
    `manager_id`    INT(11),
    FOREIGN KEY (`manager_id`) REFERENCES `manager` (`id`),
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `manager_role`
(
    `manager_id`    INT(11) NOT NULL,
    `role_id`       INT(11) NOT NULL ,
    FOREIGN KEY (`manager_id`) REFERENCES `manager` (`id`),
    FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
    PRIMARY KEY (`manager_id`, `role_id`)
);

ALTER TABLE roles
    ADD UNIQUE (name);

ALTER TABLE manager
    ADD UNIQUE (manager_name, password,email);

INSERT IGNORE INTO `roles` (`name`)
VALUES ('Admin'),
       ('User');

INSERT IGNORE INTO `manager` (`manager_name`, `password`,`email`)
VALUES ('Administrator','pass12345','admin@company.com');

INSERT IGNORE INTO `manager_role` (`manager_id`, `role_id`)
VALUES (1,1);

