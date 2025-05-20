CREATE TABLE user (
    id_user INT AUTO_INCREMENT, 
    name VARCHAR NOT NULL, 
    password VARCHAR NOT NULL, 
    username VARCHAR NOT NULL, 
    email VARCHAR NOT NULL,
    PRIMARY KEY (id_user))
CREATE TABLE activity_status (
    id_activity_status INT AUTO_INCREMENT,
    name VARCHAR NOT NULL,
    PRIMARY KEY(id_activity_status)
)

CREATE TABLE activity_type (
    id_activity_type INT AUTO_INCREMENT,
    name VARCHAR NOT NULL
    PRIMARY KEY (id_activity_type)
)
CREATE TABLE pomodoro (
    id_pomodoro INT AUTO_INCREMENT,
    PRIMARY KEY (id_pomodoro)
    duration INT NOT NULL,
    rest_duration VARCHAR NOT NULL,
    id_activity INT NOT NULL,
    CONSTRAINT FK_id_activity FOREIGN KEY (id_activity),
    REFERENCES activity(id_activity),
    start_datetime DATETIME NOT NULL,
    id_pomodoro_status INT NOT NULL,
    CONSTRAINT FK_id_pomodoro_status FOREIGN KEY (id_pomodoro_status),
    REFERENCES pomodoro_status(id_pomodoro_status)
)    
CREATE TABLE pomodoro_status (
    id_pomodoro_status INT AUTO_INCREMENT,
    name VARCHAR NOT NULL
    PRIMARY KEY (id_pomodoro_status)
)

CREATE TABLE activity(
    id_activity INT AUTO_INCREMENT,
    PRIMARY KEY (id_activity)
    estimated_effort VARCHAR NOT NULL,
    CONSTRAINT FK_id_activity_type FOREIGN KEY (id_activity_type)
    REFERENCES activity_type(id_activity_type),
    CONSTRAINT FK_id_activity_status FOREIGN KEY (id_activity_status)
    REFERENCES activity_status(id_activity_status),
    CONSTRAINT FK_id_user FOREIGN KEY (id_user)
    REFERENCES user(id_user),
    start_datetime DATETIME NOT NULL,
    end_datetime DATETIME NOT NULL,
    notes TEXT,
    distractions_count INT,
    actual_pomodoros INT NOT NULL
);

