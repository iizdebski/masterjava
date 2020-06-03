CREATE TABLE mail_hist
(
    id       SERIAL PRIMARY KEY,
    list_to  TEXT      NULL,
    list_cc  TEXT      NULL,
    subject  TEXT      NULL,
    state    TEXT      NOT NULL,
    datetime TIMESTAMP NOT NULL
);

COMMENT ON TABLE mail_hist IS 'История отправки email';
COMMENT ON COLUMN mail_hist.datetime IS 'Время отправки';