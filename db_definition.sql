PGDMP     (                    z            tinyedu    10.20    10.20                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    16730    tinyedu    DATABASE     ?   CREATE DATABASE tinyedu WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE tinyedu;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                       0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            ?            1259    16772    clazz    TABLE     ?   CREATE TABLE public.clazz (
    clazz_id character(8) NOT NULL,
    name character varying(20),
    lecturer_id character(5),
    monitor_id character(8)
);
    DROP TABLE public.clazz;
       public         postgres    false    3            ?            1259    16787 
   enrollment    TABLE     ?   CREATE TABLE public.enrollment (
    student_id character(8) NOT NULL,
    subject_id character(6) NOT NULL,
    semester character(5) NOT NULL,
    midterm_score double precision,
    final_score double precision
);
    DROP TABLE public.enrollment;
       public         postgres    false    3            ?            1259    16752    lecturer    TABLE       CREATE TABLE public.lecturer (
    lecturer_id character(6) NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(20) NOT NULL,
    dob date NOT NULL,
    gender character(1),
    address character varying(30),
    email character varying(40)
);
    DROP TABLE public.lecturer;
       public         postgres    false    3            ?            1259    16731    student    TABLE        CREATE TABLE public.student (
    student_id character(8) NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(20) NOT NULL,
    dob date NOT NULL,
    gender character(2),
    address character varying(30),
    note text,
    clazz_id character(8)
);
    DROP TABLE public.student;
       public         postgres    false    3            ?            1259    16739    subject    TABLE     ?   CREATE TABLE public.subject (
    subject_id character(6) NOT NULL,
    name character varying(30) NOT NULL,
    credit integer NOT NULL,
    percentage_final_exam integer NOT NULL
);
    DROP TABLE public.subject;
       public         postgres    false    3            ?            1259    16757    teaching    TABLE     n   CREATE TABLE public.teaching (
    subject_id character(6) NOT NULL,
    lecturer_id character(5) NOT NULL
);
    DROP TABLE public.teaching;
       public         postgres    false    3                      0    16772    clazz 
   TABLE DATA               H   COPY public.clazz (clazz_id, name, lecturer_id, monitor_id) FROM stdin;
    public       postgres    false    200   ?$                 0    16787 
   enrollment 
   TABLE DATA               b   COPY public.enrollment (student_id, subject_id, semester, midterm_score, final_score) FROM stdin;
    public       postgres    false    201   ?$                 0    16752    lecturer 
   TABLE DATA               c   COPY public.lecturer (lecturer_id, first_name, last_name, dob, gender, address, email) FROM stdin;
    public       postgres    false    198   ?$                 0    16731    student 
   TABLE DATA               j   COPY public.student (student_id, first_name, last_name, dob, gender, address, note, clazz_id) FROM stdin;
    public       postgres    false    196   ?%                 0    16739    subject 
   TABLE DATA               R   COPY public.subject (subject_id, name, credit, percentage_final_exam) FROM stdin;
    public       postgres    false    197   &                 0    16757    teaching 
   TABLE DATA               ;   COPY public.teaching (subject_id, lecturer_id) FROM stdin;
    public       postgres    false    199   .&       ?
           2606    16776    clazz clazz_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clazz
    ADD CONSTRAINT clazz_pkey PRIMARY KEY (clazz_id);
 :   ALTER TABLE ONLY public.clazz DROP CONSTRAINT clazz_pkey;
       public         postgres    false    200            ?
           2606    16791    enrollment enrollment_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_pkey PRIMARY KEY (student_id, subject_id, semester);
 D   ALTER TABLE ONLY public.enrollment DROP CONSTRAINT enrollment_pkey;
       public         postgres    false    201    201    201            ?
           2606    16813    lecturer lecturer_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.lecturer
    ADD CONSTRAINT lecturer_pkey PRIMARY KEY (lecturer_id);
 @   ALTER TABLE ONLY public.lecturer DROP CONSTRAINT lecturer_pkey;
       public         postgres    false    198            ?
           2606    16738    student student_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (student_id);
 >   ALTER TABLE ONLY public.student DROP CONSTRAINT student_pkey;
       public         postgres    false    196            ?
           2606    16743    subject subject_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (subject_id);
 >   ALTER TABLE ONLY public.subject DROP CONSTRAINT subject_pkey;
       public         postgres    false    197            ?
           2606    16761    teaching teaching_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.teaching
    ADD CONSTRAINT teaching_pkey PRIMARY KEY (subject_id, lecturer_id);
 @   ALTER TABLE ONLY public.teaching DROP CONSTRAINT teaching_pkey;
       public         postgres    false    199    199            ?
           2606    16819    clazz clazz_lecturer_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.clazz
    ADD CONSTRAINT clazz_lecturer_id_fkey FOREIGN KEY (lecturer_id) REFERENCES public.lecturer(lecturer_id);
 F   ALTER TABLE ONLY public.clazz DROP CONSTRAINT clazz_lecturer_id_fkey;
       public       postgres    false    2694    198    200            ?
           2606    16792 %   enrollment enrollment_student_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(student_id);
 O   ALTER TABLE ONLY public.enrollment DROP CONSTRAINT enrollment_student_id_fkey;
       public       postgres    false    2690    196    201            ?
           2606    16797 %   enrollment enrollment_subject_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(subject_id);
 O   ALTER TABLE ONLY public.enrollment DROP CONSTRAINT enrollment_subject_id_fkey;
       public       postgres    false    197    2692    201            ?
           2606    16862    student student_clazz_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_clazz_id_fkey FOREIGN KEY (clazz_id) REFERENCES public.clazz(clazz_id) NOT VALID;
 G   ALTER TABLE ONLY public.student DROP CONSTRAINT student_clazz_id_fkey;
       public       postgres    false    196    2698    200            ?
           2606    16814 "   teaching teaching_lecturer_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.teaching
    ADD CONSTRAINT teaching_lecturer_id_fkey FOREIGN KEY (lecturer_id) REFERENCES public.lecturer(lecturer_id);
 L   ALTER TABLE ONLY public.teaching DROP CONSTRAINT teaching_lecturer_id_fkey;
       public       postgres    false    2694    199    198            ?
           2606    16807 !   teaching teaching_subject_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.teaching
    ADD CONSTRAINT teaching_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(subject_id) NOT VALID;
 K   ALTER TABLE ONLY public.teaching DROP CONSTRAINT teaching_subject_id_fkey;
       public       postgres    false    2692    197    199                  x?????? ? ?            x?????? ? ?           x?u?Aj?0E??S?*!9????PJ??KAd??H?eZ??D
??)?d?????T??F؍???i s???Wm%T-T	o??_Gr?d??vR2\?g???t???3??yeO`?o&rv?q?Rh%??g??f?4?*ѳ?Yd%T?e^ﻜ?>??_??????˼Ӳ6G??S8??,?-?tۦr???B睍ɧzP???????u+???p?S?h=Lv??{??~??????C???B??o???nbd?y-??c??(???'??            x?????? ? ?            x?????? ? ?            x?????? ? ?     