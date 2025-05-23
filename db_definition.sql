CREATE TABLE pomouser (
    id_user INT AUTO_INCREMENT PRIMARY KEY, 
    fullname VARCHAR(50) NOT NULL, 
    password_HASH VARCHAR(255) NOT NULL, 
    username VARCHAR(50) NOT NULL, 
    email VARCHAR(50) NOT NULL
    
);
CREATE TABLE activity_status (
    id_activity_status INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
    
);

CREATE TABLE activity_type (
    id_activity_type INT AUTO_INCREMENT,
    name VARCHAR NOT NULL
    PRIMARY KEY (id_activity_type)
);

CREATE TABLE activity(
    id_activity INT AUTO_INCREMENT PRIMARY KEY,
    estimated_effort VARCHAR(50) NOT NULL,
    start_datetime DATETIME NOT NULL,
    end_datetime DATETIME NOT NULL,
    notes TEXT,
    distractions_count INT,
    actual_pomodoros INT NOT NULL,
    id_activity_type INT NOT NULL,
    id_activity_status INT NOT NULL,
    id_user INT NOT NULL,
    CONSTRAINT FK_id_activity_type FOREIGN KEY (id_activity_type) REFERENCES activity_type(id_activity_type),
    CONSTRAINT FK_id_activity_status FOREIGN KEY (id_activity_status) REFERENCES activity_status(id_activity_status),
    CONSTRAINT FK_id_user FOREIGN KEY (id_user) REFERENCES pomouser(id_user)
);

CREATE TABLE pomodoro_status (
    id_pomodoro_status INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
    
);
CREATE TABLE pomodoro (
    id_pomodoro INT AUTO_INCREMENT PRIMARY KEY,
    duration INT NOT NULL,
    rest_duration INT NOT NULL,
    id_activity INT NOT NULL,
    start_datetime DATETIME NOT NULL,
    id_pomodoro_status INT NOT NULL,
    CONSTRAINT FK_id_activity FOREIGN KEY (id_activity) REFERENCES activity(id_activity),
    CONSTRAINT FK_id_pomodoro_status FOREIGN KEY (id_pomodoro_status) REFERENCES pomodoro_status(id_pomodoro_status)
);  
