
CREATE TABLE public.Sprint (
                SP_ID NUMERIC NOT NULL,
                SP_DUR NUMERIC NOT NULL,
                SP_EST CHAR(3) NOT NULL,
                CONSTRAINT sprint_pk PRIMARY KEY (SP_ID)
);


CREATE TABLE public.User_Story (
                US_ID NUMERIC NOT NULL,
                US_DESC VARCHAR(100) NOT NULL,
                US_PRIORIDAD VARCHAR(20) NOT NULL,
                US_DUR NUMERIC NOT NULL,
                CONSTRAINT user_story_pk PRIMARY KEY (US_ID)
);


CREATE TABLE public.Backlog (
                US_ID NUMERIC NOT NULL,
                SP_ID NUMERIC NOT NULL,
                CONSTRAINT backlog_pk PRIMARY KEY (US_ID, SP_ID)
);


CREATE TABLE public.Usuario (
                USUARIO_ID NUMERIC NOT NULL,
                NOM_CUENTA VARCHAR(30) NOT NULL,
                PASS VARCHAR(20) NOT NULL,
                ROL VARCHAR NOT NULL,
                CONSTRAINT usuario_pk PRIMARY KEY (USUARIO_ID)
);


CREATE TABLE public.Proyecto (
                P_ID NUMERIC NOT NULL,
                US_ID NUMERIC NOT NULL,
                USUARIO_ID NUMERIC NOT NULL,
                P_NOM VARCHAR(50) NOT NULL,
                P_FECHA_INI DATE NOT NULL,
                P_FECHA_FIN DATE NOT NULL,
                CONSTRAINT proyecto_pk PRIMARY KEY (P_ID, US_ID, USUARIO_ID)
);


ALTER TABLE public.Backlog ADD CONSTRAINT sprint_backlog_fk
FOREIGN KEY (SP_ID)
REFERENCES public.Sprint (SP_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Proyecto ADD CONSTRAINT user_story_proyecto_fk
FOREIGN KEY (US_ID)
REFERENCES public.User_Story (US_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Backlog ADD CONSTRAINT user_story_backlog_fk
FOREIGN KEY (US_ID)
REFERENCES public.User_Story (US_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Proyecto ADD CONSTRAINT usuario_proyecto_fk
FOREIGN KEY (USUARIO_ID)
REFERENCES public.Usuario (USUARIO_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
