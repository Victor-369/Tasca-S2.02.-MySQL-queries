-- 1. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
select apellido1, apellido2, nombre
from persona
where tipo = 'alumno'
order by apellido1, apellido2, nombre asc;

-- 2. Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades. (nombre, apellido1, apellido2)
select nombre, apellido1, apellido2
from persona
where tipo = 'alumno'
    and telefono is null;

-- 3. Retorna el llistat dels alumnes que van néixer en 1999. (id, nombre, apellido1, apellido2, fecha_nacimiento)
select id, nombre, apellido1, apellido2, fecha_nacimiento
from persona
where tipo = 'alumno'
    and year(fecha_nacimiento) = 1999;

-- 4. Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K. (nombre, apellido1, apellido2, nif)
select nombre, apellido1, apellido2, nif
from persona
where tipo = 'profesor'
    and telefono is null
    and right(nif, 1) = 'K';

-- 5. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7. (id, nombre, cuatrimestre, curso, id_grado)
select id, nombre, cuatrimestre, curso, id_grado
from asignatura
where cuatrimestre = 1
    and curso = 3
    and id_grado = 7;

-- 6. Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom. (apellido1, apellido2, nombre, departamento)
select per.apellido1, per.apellido2, per.nombre, dep.nombre as departamento
from persona per
    join profesor prof on prof.id_profesor = per.id
    join departamento dep on dep.id = prof.id_departamento
where per.tipo = 'profesor'
order by per.apellido1, per.apellido2, per.nombre asc;

-- 7. Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M. (nombre, anyo_inicio, anyo_fin)
select asig.nombre, ce.anyo_inicio, ce.anyo_fin
from persona per
    join alumno_se_matricula_asignatura ama on ama.id_alumno = per.id
    join asignatura asig on asig.id = ama.id_asignatura
    join curso_escolar ce on ce.id = ama.id_curso_escolar
where per.tipo = 'alumno'
    and per.nif = '26902806M';

-- 8. Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015). (nombre)
select distinct dep.nombre as nombre
from grado g
    join asignatura asig on asig.id_grado = g.id
    join profesor prof on prof.id_profesor = asig.id_profesor
    join departamento dep on dep.id = prof.id_departamento
where g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- 9. Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019. (nombre, apellido1, apellido2)
select distinct p.nombre, p.apellido1, p.apellido2
from persona p
    join alumno_se_matricula_asignatura ama on ama.id_alumno = p.id
    join curso_escolar ce on ce.id = ama.id_curso_escolar
where p.tipo = 'alumno'
    and ce.anyo_inicio = 2018
    and ce.anyo_fin = 2019;

-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.
-- 10. Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom. (departamento, apellido1, apellido2, nombre)
select d.nombre as departamento
       ,p.apellido1
       ,p.apellido2
       ,p.nombre
from profesor as pr
left join departamento as d on pr.id_departamento = d.id
left join persona as p on pr.id_profesor = p.id
order by d.nombre asc, p.apellido1 asc, p.apellido2 asc, p.nombre asc;


-- 11. Retorna un llistat amb els professors/es que no estan associats a un departament. (apellido1, apellido2, nombre)
select p.apellido1, p.apellido2, p.nombre
from departamento dep
    right join profesor prof on prof.id_departamento = dep.id
    right join persona p on p.id = prof.id_profesor
where p.tipo = 'profesor'
    and dep.id is null;

-- 12. Retorna un llistat amb els departaments que no tenen professors/es associats. (nombre)
select dep.nombre
from departamento dep
    left join profesor prof on prof.id_departamento = dep.id
where prof.id_profesor is null;

-- 13. Retorna un llistat amb els professors/es que no imparteixen cap assignatura. (apellido1, apellido2, nombre)
select p.apellido1, p.apellido2, p.nombre
from persona p
    right join profesor prof on prof.id_profesor = p.id
    left join asignatura asig on asig.id_profesor = prof.id_profesor
where p.tipo = 'profesor'
    and asig.id_profesor is null;

-- 14. Retorna un llistat amb les assignatures que no tenen un professor/a assignat. (id, nombre)
select assig.id, assig.nombre
from asignatura assig
    left join profesor prof on prof.id_profesor = assig.id_profesor
where prof.id_profesor is null;

-- 15. Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar. (nombre)
select distinct dep.nombre
from departamento dep
    left join profesor prof on prof.id_departamento = dep.id
    left join asignatura asig on asig.id_profesor = prof.id_profesor
    left join alumno_se_matricula_asignatura ama on ama.id_asignatura = asig.id
    left join curso_escolar ce on ce.id = ama.id_curso_escolar
where ce.id is null;

-- 16. Retorna el nombre total d'alumnes que hi ha. (total)
select count(1) as total
from persona
where tipo = 'alumno';

-- 17. Calcula quants alumnes van néixer en 1999. (total)
select count(1) as total
from persona
where tipo = 'alumno'
    and year(fecha_nacimiento) = 1999;

-- 18. Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es. (departamento, total)
select dep.nombre as departamento
       ,count(p.id_profesor) as total
from departamento as dep
    join profesor as p on dep.id = p.id_departamento
group by dep.nombre
order by total desc;

-- 19. Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat. (departamento, total)
select dep.nombre as departamento
       ,count(prof.id_profesor) as total
from departamento as dep
    left join profesor as prof on dep.id = prof.id_departamento
group by dep.id, dep.nombre;

-- 20. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures. (grau, total)
select gr.nombre as grau, count(asig.id) as total
from grado gr
    left join asignatura asig on asig.id_grado = gr.id
group by gr.id, gr.nombre
order by total desc;

-- 21. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades. (grau, total)
select gr.nombre as grau, count(asig.id) as total
from grado gr
    left join asignatura asig on asig.id_grado = gr.id
group by gr.id, gr.nombre
having total > 40
order by total desc;

-- 22. Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus. (grau, tipus, total_creditos)
select gr.nombre as grau, asig.tipo as tipo, sum(asig.creditos) as total_creditos
from grado gr
    join asignatura asig on asig.id_grado = gr.id
group by gr.nombre, asig.tipo;

-- 23. Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats. (anyo_inicio, total)
select ce.anyo_inicio, count(distinct ama.id_alumno) as total
from curso_escolar as ce
    left join alumno_se_matricula_asignatura as ama on ama.id_curso_escolar = ce.id
group by ce.id, ce.anyo_inicio
having total > 0
order by ce.anyo_inicio asc;

-- 24. Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures. (id, nombre, apellido1, apellido2, total)
select per.id, per.nombre, per.apellido1, per.apellido2
    ,count(asig.id) as total
from profesor prof
    join persona per on per.id = prof.id_profesor
    left join asignatura asig on asig.id_profesor = prof.id_profesor
where per.tipo = 'profesor'
group by per.id, per.nombre, per.apellido1, per.apellido2
order by total desc;

-- 25. Retorna totes les dades de l'alumne/a més jove. (*)
select id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo
from persona
where tipo = 'alumno'
order by fecha_nacimiento desc
limit 1;

-- 26. Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura. (apellido1, apellido2, nombre)
select per.apellido1, per.apellido2, per.nombre
from profesor prof
    join persona per on per.id = prof.id_profesor
    join departamento dep on dep.id = prof.id_departamento
    left join asignatura asig on asig.id_profesor = prof.id_profesor
where asig.id is null;
