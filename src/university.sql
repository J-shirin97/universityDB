create table university
(
    id   serial primary key not null,
    name character varying  not null
);


create table college
(
    id           serial primary key not null,
    name         character varying  not null,
    universityId integer references university (id)
);

create table course
(
    id           serial primary key not null,
    title        character varying  not null,
    courseNumber integer unique     not null,
    unit         integer            not null
);


create table class
(
    id          serial primary key not null,
    classNumber integer unique     not null,
    floor       integer unique     not null
);

create table teacher
(
    id            serial primary key not null,
    name          character varying  not null,
    family        character varying  not null,
    nationalCode  character varying  not null unique,
    teacherNumber character varying  not null unique
);

create table student
(
    id            serial primary key not null,
    name          character varying  not null,
    family        character varying  not null,
    nationalCode  character varying  not null unique,
    studentNumber character varying  not null unique
);

create table student_course
(
    studentId integer references student (id),
    courseId  integer references course (id),
    teacherId integer references teacher (id),
    classId   integer references class (id),
    collegeId integer references college (id)
);
