CREATE TABLE machine (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    age TINYINT NOT NULL,
    model_id INTEGER NOT NULL,
    FOREIGN KEY (model_id) REFERENCES model(id)
);

CREATE TABLE error (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    datetime TEXT NOT NULL,
    error_type_id INTEGER NOT NULL,
    machine_id INTEGER NOT NULL,
    FOREIGN KEY(error_type_id) REFERENCES error_type(id),
    FOREIGN KEY(machine_id) REFERENCES machine(id)
);

CREATE TABLE error_type (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR(9) NOT NULL
);

CREATE TABLE telemetry (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    datetime TEXT NOT NULL,
    volt DOUBLE,
    rotate DOUBLE,
    pressure DOUBLE,
    vibration DOUBLE,
    machine_id INTEGER NOT NULL,
    FOREIGN KEY(machine_id) REFERENCES machine(id)
);

CREATE TABLE model (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR(8) NOT NULL
);

CREATE TABLE maintenance (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    datetime TEXT NOT NULL,
    failure TINYINT NOT NULL,
    machine_id INTEGER NOT NULL,
    component_id INTEGER NOT NULL,
    FOREIGN KEY(machine_id) REFERENCES machine(id),
    FOREIGN KEY(component_id) REFERENCES component(id)
);

CREATE TABLE component (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR(7) NOT NULL
);
