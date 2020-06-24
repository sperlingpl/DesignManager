-- Create tables

CREATE TABLE System (
    version INTEGER
);

CREATE TABLE Clients (
    id          INTEGER       PRIMARY KEY,
    name        VARCHAR (100) NOT NULL,
    description TEXT,
    domain      INTEGER       REFERENCES ClientDomains (id) 
                              NOT NULL
);

CREATE TABLE Projects (
    id           INTEGER       PRIMARY KEY,
    name         VARCHAR (100) NOT NULL,
    description  TEXT,
    clientId     INTEGER       REFERENCES Clients (id) 
                               NOT NULL,
    completed    BOOLEAN       NOT NULL
                               DEFAULT (FALSE),
    startDate    DATE,
    endDate      DATE,
    deadlineDate DATE
);

CREATE TABLE ClientDomains (
    id   INTEGER      PRIMARY KEY,
    name VARCHAR (50) NOT NULL
                      UNIQUE
);


-- Insert data

INSERT INTO ClientDomains (
                        name
                    )
                    VALUES (
                        'Logo'
                    );

INSERT INTO ClientDomains (
                        name
                    )
                    VALUES (
                        'Website'
                    );

INSERT INTO Clients (
                        name,
                        description,
                        domain
                    )
                    VALUES (
                        'Design Company',
                        'Small company creating some logos',
                        1
                    );

INSERT INTO Clients (
                        name,
                        description,
                        domain
                    )
                    VALUES (
                        'Paulo Coelho',
                        'Some guy that needs website layouts',
                        2
                    );
