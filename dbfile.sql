-- Create the lottery database
CREATE DATABASE lottery;

-- Connect to the lottery database
\c lottery

-- Set up the tokens schema and table
CREATE SCHEMA tokens;

ALTER SCHEMA tokens OWNER TO postgres;

CREATE TABLE tokens.token (
    username character varying(100) NOT NULL,
    tokenvalue character varying(100),
    CONSTRAINT token_pkey PRIMARY KEY (username)
);

ALTER TABLE tokens.token OWNER TO postgres;

-- Insert data into tokens.token table
COPY tokens.token (username, tokenvalue) FROM stdin;
haha    haha
test    738332002
ron 310090549
\.
