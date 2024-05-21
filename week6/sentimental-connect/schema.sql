CREATE TABLE `users` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(24) NOT NULL UNIQUE,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL UNIQUE,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    `year` SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL UNIQUE,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `connections_between_users` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_a_id` INT UNSIGNED NOT NULL,
    `user_b_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_a_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`user_b_id`) REFERENCES `users`(`id`)
);

CREATE TABLE `connections_between_user_and_school` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `school_id` INT UNSIGNED NOT NULL,
    `type` VARCHAR(16),
    `start_date` DATE,
    `end_date` DATE,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`)
);

CREATE TABLE `connections_between_user_and_company` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `company_id` INT UNSIGNED NOT NULL,
    `start_date` DATE,
    `end_date` DATE,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);

