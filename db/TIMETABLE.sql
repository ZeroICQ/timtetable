/******************** TABLES **********************/
RECREATE TABLE SCHED_ITEMS
(
  ID Integer GENERATED BY DEFAULT AS IDENTITY,
  LESSON_ID Integer,
  SUBJECT_ID Integer,
  AUDIENCE_ID Integer,
  GROUP_ID Integer,
  TEACHER_ID Integer,
  TYPE_ID Integer,
  WEEKDAY_ID Integer,
  PRIMARY KEY (ID)
);

RECREATE TABLE AUDIENCES
(
  ID Integer GENERATED BY DEFAULT AS IDENTITY,
  NAME Varchar(64) NOT NULL,
  PRIMARY KEY (ID)
);

RECREATE TABLE SUBJECT_GROUP
(
  ID Integer GENERATED BY DEFAULT AS IDENTITY,
  SUBJECT_ID Integer NOT NULL,
  GROUP_ID Integer NOT NULL,
  PRIMARY KEY (ID),
  CONSTRAINT UNIQ_SUBJECTID_GROUPID UNIQUE (SUBJECT_ID,GROUP_ID)
);

RECREATE TABLE GROUPS
(
  ID Integer GENERATED BY DEFAULT AS IDENTITY,
  NAME Varchar(64),
  PRIMARY KEY (ID)
);

RECREATE TABLE LESSONS
(
  ID Integer GENERATED BY DEFAULT AS IDENTITY,
  NAME Varchar(255),
  ORDER_NUMBER Integer,
  PRIMARY KEY (ID),
  CONSTRAINT UNIQ_LESSON_ORDER UNIQUE (ORDER_NUMBER)
);

RECREATE TABLE LESSON_TYPES
(
  ID Integer GENERATED BY DEFAULT AS IDENTITY,
  NAME Varchar(255),
  PRIMARY KEY (ID)
);


RECREATE TABLE SUBJECT_TEACHER
(
  ID Integer GENERATED BY DEFAULT AS IDENTITY,
  SUBJECT_ID Integer NOT NULL,
  TEACHER_ID Integer NOT NULL,
  PRIMARY KEY (ID),
  CONSTRAINT UNIQ_SUBJECTID_TEACHERID UNIQUE (SUBJECT_ID,TEACHER_ID)
);

RECREATE TABLE SUBJECTS
(
  ID Integer GENERATED BY DEFAULT AS IDENTITY,
  NAME Varchar(255),
  PRIMARY KEY (ID)
);

RECREATE TABLE TEACHERS
(
  ID Integer GENERATED BY DEFAULT AS IDENTITY,
  NAME Varchar(255),
  PRIMARY KEY (ID)
);

RECREATE TABLE WEEKDAYS
(
  ID Integer GENERATED BY DEFAULT AS IDENTITY,
  NAME Varchar(64) NOT NULL,
  ORDER_NUMBER Integer NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE (ORDER_NUMBER)
);

RECREATE TABLE LOG
(
  ID Integer GENERATED BY DEFAULT AS IDENTITY,
  STATUS Integer NOT NULL,
  TABLE_NAME Varchar(64) NOT NULL,
  TABLE_PK Integer NOT NULL,
  CHANGE_TIME TIMESTAMP DEFAULT 'NOW' NOT NULL,
  PRIMARY KEY (ID)
);

RECREATE TABLE LOG_STATUS
(
  ID Integer GENERATED BY DEFAULT AS IDENTITY,
  NAME Varchar(64) NOT NULL,
  PRIMARY KEY (ID)
);

-- RECREATE TABLE SCHED_CONFLICTS
-- (
--   ID Integer GENERATED BY DEFAULT AS IDENTITY,
--   CONFLICT_ID Integer NOT NULL,
--   SCHED_ID Integer NOT NULL,
--   PRIMARY KEY (ID)
-- );

-- RECREATE TABLE CONFLICTS
-- (
--   ID Integer NOT NULL,
--   NAME Varchar(255) NOT NULL,
--   PRIMARY KEY (ID)
-- );

COMMIT WORK;

/******************* CONSTRAINTS  *******************/

ALTER TABLE SCHED_ITEMS ADD CONSTRAINT FK_SCHED_ITEMS_1
  FOREIGN KEY (LESSON_ID) REFERENCES LESSONS (ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE SCHED_ITEMS ADD CONSTRAINT FK_SCHED_ITEMS_2
  FOREIGN KEY (SUBJECT_ID) REFERENCES SUBJECTS (ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE SCHED_ITEMS ADD CONSTRAINT FK_SCHED_ITEMS_3
  FOREIGN KEY (AUDIENCE_ID) REFERENCES AUDIENCES (ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE SCHED_ITEMS ADD CONSTRAINT FK_SCHED_ITEMS_4
  FOREIGN KEY (GROUP_ID) REFERENCES GROUPS (ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE SCHED_ITEMS ADD CONSTRAINT FK_SCHED_ITEMS_5
  FOREIGN KEY (TYPE_ID) REFERENCES LESSON_TYPES (ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE SCHED_ITEMS ADD CONSTRAINT FK_SCHED_ITEMS_6
  FOREIGN KEY (WEEKDAY_ID) REFERENCES WEEKDAYS (ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE SCHED_ITEMS ADD CONSTRAINT FK_SCHED_ITEMS_7
  FOREIGN KEY (TEACHER_ID) REFERENCES TEACHERS (ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE SUBJECT_GROUP ADD
  FOREIGN KEY (SUBJECT_ID) REFERENCES SUBJECTS (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE SUBJECT_GROUP ADD
  FOREIGN KEY (GROUP_ID) REFERENCES GROUPS (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE SUBJECT_TEACHER ADD
  FOREIGN KEY (SUBJECT_ID) REFERENCES SUBJECTS (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE SUBJECT_TEACHER ADD
  FOREIGN KEY (TEACHER_ID) REFERENCES TEACHERS (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE LOG ADD
  FOREIGN KEY (STATUS) REFERENCES LOG_STATUS (ID);

-- ALTER TABLE SCHED_CONFLICTS ADD
--   FOREIGN KEY (CONFLICT_ID) REFERENCES CONFLICTS (ID)
--     ON DELETE CASCADE
--     ON UPDATE CASCADE;

-- ALTER TABLE SCHED_CONFLICTS ADD
--   FOREIGN KEY (SCHED_ID) REFERENCES SCHED_ITEMS (ID)
--   ON DELETE CASCADE
--   ON UPDATE CASCADE;


COMMIT WORK;

/******************* DATA  *******************/

/******************* LOG_STATUS *******************/

INSERT INTO LOG_STATUS (NAME) values ('DELETED');
INSERT INTO LOG_STATUS (NAME) values ('MODIFIED');

/******************* AUDIENCES  *******************/

INSERT INTO AUDIENCES (NAME) values ('D732');
INSERT INTO AUDIENCES (NAME) values ('D549a');
INSERT INTO AUDIENCES (NAME) values ('D547');
INSERT INTO AUDIENCES (NAME) values ('D548');
INSERT INTO AUDIENCES (NAME) values ('D549');
INSERT INTO AUDIENCES (NAME) values ('D743');
INSERT INTO AUDIENCES (NAME) values ('D412/542');
INSERT INTO AUDIENCES (NAME) values ('D945');
INSERT INTO AUDIENCES (NAME) values ('D741');
INSERT INTO AUDIENCES (NAME) values ('D654/752');
INSERT INTO AUDIENCES (NAME) values ('D818');
INSERT INTO AUDIENCES (NAME) values ('D738');
INSERT INTO AUDIENCES (NAME) values ('D733a');
INSERT INTO AUDIENCES (NAME) values ('S');
INSERT INTO AUDIENCES (NAME) values ('D949');

/******************* WEEKDAYS  *******************/

INSERT INTO WEEKDAYS (NAME,ORDER_NUMBER) values ('понедельник', 0);
INSERT INTO WEEKDAYS (NAME,ORDER_NUMBER) values ('вторник', 1);
INSERT INTO WEEKDAYS (NAME,ORDER_NUMBER) values ('среда', 2);
INSERT INTO WEEKDAYS (NAME,ORDER_NUMBER) values ('четверг', 3);
INSERT INTO WEEKDAYS (NAME,ORDER_NUMBER) values ('пятница', 4);
INSERT INTO WEEKDAYS (NAME,ORDER_NUMBER) values ('суббота', 5);
INSERT INTO WEEKDAYS (NAME,ORDER_NUMBER) values ('воскресенье', 6);

/******************* GROUPS  *******************/

INSERT INTO GROUPS (NAME) values ('Б8203а');
INSERT INTO GROUPS (NAME) values ('Б8203б');

/******************* LESSONS  *******************/

INSERT INTO LESSONS (NAME,ORDER_NUMBER) values ('1 пара', 1);
INSERT INTO LESSONS (NAME,ORDER_NUMBER) values ('2 пара', 2);
INSERT INTO LESSONS (NAME,ORDER_NUMBER) values ('3 пара', 3);
INSERT INTO LESSONS (NAME,ORDER_NUMBER) values ('4 пара', 4);
INSERT INTO LESSONS (NAME,ORDER_NUMBER) values ('5 пара', 5);
INSERT INTO LESSONS (NAME,ORDER_NUMBER) values ('6 пара', 6);
INSERT INTO LESSONS (NAME,ORDER_NUMBER) values ('7 пара', 7);

/******************* LESSON_TYPES  *******************/

INSERT INTO LESSON_TYPES (NAME) values ('ПЗ');
INSERT INTO LESSON_TYPES (NAME) values ('Л');
INSERT INTO LESSON_TYPES (NAME) values ('ЛР');

/******************* SUBJECTS  *******************/

INSERT INTO SUBJECTS (NAME) values ('Иностранный язык');
INSERT INTO SUBJECTS (NAME) values ('Дискретная математика и математическая логика');
INSERT INTO SUBJECTS (NAME) values ('Архитектура компьютеров');
INSERT INTO SUBJECTS (NAME) values ('Математический анализ');
INSERT INTO SUBJECTS (NAME) values ('Основы современных образовательных технологий');
INSERT INTO SUBJECTS (NAME) values ('Обыкновенные дифференциальные уравнения');
INSERT INTO SUBJECTS (NAME) values ('Элективные курсы по физической культуре');
INSERT INTO SUBJECTS (NAME) values ('Численные методы');
INSERT INTO SUBJECTS (NAME) values ('Базы данных');
INSERT INTO SUBJECTS (NAME) values ('Теория вероятностей и математическая статистика');

/******************* SUBJECT_GROUP  *******************/

INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (1, 1);
INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (1, 2);
INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (2, 1);
INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (2, 2);
INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (3, 1);
INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (3, 2);
INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (4, 1);
INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (4, 2);
INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (5, 1);
INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (5, 2);
INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (6, 1);
INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (6, 2);
INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (7, 1);
INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (7, 2);
INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (8, 1);
INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (8, 2);
INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (9, 1);
INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (9, 2);
INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (10, 1);
INSERT INTO SUBJECT_GROUP (SUBJECT_ID,GROUP_ID) values (10, 2);

/******************* TEACHERS  *******************/

INSERT INTO TEACHERS (NAME) values ('Василенко Н.Ю.');
INSERT INTO TEACHERS (NAME) values ('Баранов А.А.');
INSERT INTO TEACHERS (NAME) values ('Шепелева Р.П.');
INSERT INTO TEACHERS (NAME) values ('Клевчихин Ю.А.');
INSERT INTO TEACHERS (NAME) values ('Колобов А.Г.');
INSERT INTO TEACHERS (NAME) values ('Кузнецова Н.В.');
INSERT INTO TEACHERS (NAME) values ('Лиховидов В.Н.');
INSERT INTO TEACHERS (NAME) values ('Кленин А.С.');
INSERT INTO TEACHERS (NAME) values ('Ефремов Е.Л.');
INSERT INTO TEACHERS (NAME) values ('Колосова В.Е.');
INSERT INTO TEACHERS (NAME) values ('Веремеева Ирина Феликсовна');

/******************* SUBJECT_TEACHER  *******************/

INSERT INTO SUBJECT_TEACHER (SUBJECT_ID,TEACHER_ID) values (2, 1);
INSERT INTO SUBJECT_TEACHER (SUBJECT_ID,TEACHER_ID) values (3, 2);
INSERT INTO SUBJECT_TEACHER (SUBJECT_ID,TEACHER_ID) values (3, 8);
INSERT INTO SUBJECT_TEACHER (SUBJECT_ID,TEACHER_ID) values (4, 4);
INSERT INTO SUBJECT_TEACHER (SUBJECT_ID,TEACHER_ID) values (4, 9);
INSERT INTO SUBJECT_TEACHER (SUBJECT_ID,TEACHER_ID) values (5, 10);
INSERT INTO SUBJECT_TEACHER (SUBJECT_ID,TEACHER_ID) values (6, 3);
INSERT INTO SUBJECT_TEACHER (SUBJECT_ID,TEACHER_ID) values (8, 5);
INSERT INTO SUBJECT_TEACHER (SUBJECT_ID,TEACHER_ID) values (8, 6);
INSERT INTO SUBJECT_TEACHER (SUBJECT_ID,TEACHER_ID) values (9, 8);
INSERT INTO SUBJECT_TEACHER (SUBJECT_ID,TEACHER_ID) values (10, 7);

/******************* SCHED_ITEMS  *******************/

INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (1, 2, 2, 1, 1, 2, 1);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (2, 1, 3, 1, NULL, 1, 1);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (2, 1, 4, 1, NULL, 1, 1);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (2, 1, 15, 1, NULL, 1, 1);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (3, 3, 1, 1, 2, 3, 1);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (4, 3, 1, 1, 2, 3, 1);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (1, 8, 13, 1, 6, 3, 5);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (1, 4, 6, 1, 9, 1, 2);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (3, 6, 7, 1, 3, 1, 2);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (2, 3, 13, 1, 2, 3, 5);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (4, 6, 7, 1, 3, 2, 2);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (3, 10, 9, 1, 7, 1, 5);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (5, 7, 14, 1, NULL, 1, 2);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (4, 10, 9, 1, 7, 2, 5);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (5, 7, 14, 1, NULL, 1, 5);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (2, 2, 8, 1, 1, 1, 3);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (3, 4, 7, 1, 4, 2, 3);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (4, 3, 12, 1, 8, 2, 3);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (5, 8, 10, 1, 5, 2, 3);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (1, 9, 5, 1, 8, 3, 4);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (2, 9, 5, 1, 8, 3, 4);
INSERT INTO SCHED_ITEMS (LESSON_ID,SUBJECT_ID,AUDIENCE_ID,GROUP_ID,TEACHER_ID,TYPE_ID,WEEKDAY_ID) values (3, 9, 11, 1, 8, 2, 4);

/********************** CONFLICTS *********************/
-- INSERT INTO CONFLICTS (ID, NAME) values (1, 'Совпадение аудиторий');
-- INSERT INTO CONFLICTS (ID, NAME) values (2, 'Совпадение преподавателей');