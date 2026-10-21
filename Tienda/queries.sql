-- 1. Llista el nom de tots els productes que hi ha en la taula producto.
select nombre from producto;

-- 2. Llista els noms i els preus de tots els productes de la taula producto.
select nombre, precio from producto;

-- 3. Llista totes les columnes de la taula producto.
select codigo, nombre, precio, codigo_fabricante
from producto;
  
-- 4. Llista el nom dels productes, el preu en euros (precio_eur) i el preu en dòlars estatunidencs (precio_usd) amb un tipus de canvi de 1 € = 1 $.
select nombre, precio as precio_eur, precio as precio_usd
from producto;

-- 5. Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (amb un tipus de canvi de 1 € = 1,1 $ i arrodonint el resultat a dues xifres decimals). Utilitza els següents àlies per a les columnes: nom del producte, euros, dòlars.
select nombre as 'nom del producte', FORMAT(precio, 2) as euros, FORMAT(precio * 1.1, 2) as dòlars
from producto;

-- 6. Llista els noms (nombre) i els preus de tots els productes de la taula producto, convertint els noms a majúscula.
select UPPER(nombre) as nombre, precio
from producto;

-- 7. Llista els noms (nombre) i els preus (precio) dels productes de la taula producto, convertint els noms a minúscula.
select LOWER(nombre) as nombre, precio
from producto;

-- 8. Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant (iniciales).
select nombre, UPPER(SUBSTR(nombre, 1, 2)) iniciales
from fabricante;

-- 9. Llista els noms i els preus dels productes, arrodonint el valor del preu (precio)
select nombre, ROUND(precio) as precio
from producto;

-- 10. Llista els noms i els preus de tots els productes (precio truncado) de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
select nombre, TRUNCATE(precio, 0) as 'precio truncado'
from producto;

-- 11. Mostra una llista amb els codis dels fabricants que apareixen a la taula producto, incloent possibles repeticions.
select codigo_fabricante
from producto;

-- 12. Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
select distinct fab.codigo as codigo_fabricante
from fabricante fab
    join producto prod on fab.codigo = prod.codigo_fabricante;

-- 13. Llista els noms dels fabricants ordenats de manera ascendent
select nombre
from fabricante
order by 1 asc;

-- 14. Llista els noms dels fabricants ordenats de manera descendent
select nombre
from fabricante
order by 1 desc;

-- 15. Llista els noms i els preus dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
select nombre, precio
from producto
order by nombre asc, precio desc;

-- 16. Retorna una llista amb les 5 primeres files de la taula fabricante.
select codigo, nombre
from fabricante
limit 5;

-- 17. Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
select codigo, nombre
from fabricante
limit 3, 2;

-- 18. Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT).
select nombre, precio
from producto
order by precio asc
LIMIT 1;

-- 19. Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT).
select nombre, precio
from producto
order by precio desc
LIMIT 1;

-- 20. Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
select prod.nombre as nombre
from producto prod
    join fabricante fab on prod.codigo_fabricante = fab.codigo
where fab.codigo = 2;

-- 21. Retorna una llista amb el nom del producte, preu i nom de fabricant (nombre del fabricante) de tots els productes de la base de dades.
select prod.nombre, prod.precio
    ,fab.nombre as 'nombre del fabricante'
from producto prod
    join fabricante fab on prod.codigo_fabricante = fab.codigo;

-- 22. Llista tots els productes amb nom, preu i nom del fabricant (nombre del fabricante) ordenats alfabèticament.
select prod.nombre, prod.precio
    ,fab.nombre as 'nombre del fabricante'
from producto prod
    join fabricante fab on prod.codigo_fabricante = fab.codigo
order by fab.nombre asc;

-- 23. Retorna una llista amb el codi del producte, nom del producte, codi del fabricant (codigo fabricante) i nom del fabricant (nombre fabricante), de tots els productes de la base de dades.
select prod.codigo, prod.nombre
    ,fab.codigo as 'codigo fabricante', fab.nombre as 'nombre fabricante'
from producto prod
    join fabricante fab on prod.codigo_fabricante = fab.codigo;

-- 24. Retorna el nom, el preu i el nom del fabricant (fabricante), del producte més barat.
select prod.nombre, prod.precio
    ,fab.nombre as 'fabricant'
from producto prod
    join fabricante fab on prod.codigo_fabricante = fab.codigo
order by prod.precio asc
limit 1;

-- 25. Retorna el nom del producte, el preu i el nom del seu fabricant (fabricante), del producte més car.
select prod.nombre, prod.precio
    ,fab.nombre as 'fabricante'
from producto prod
    join fabricante fab on prod.codigo_fabricante = fab.codigo
order by prod.precio desc
limit 1;

-- 26. Retorna una llista amb nom i preu de tots els productes del fabricant Lenovo.
select prod.nombre, prod.precio
from producto prod
    join fabricante fab on prod.codigo_fabricante = fab.codigo
where fab.nombre = 'Lenovo';

-- 27. Retorna una llista amb nom i preu de tots els productes del fabricant Crucial que tinguin un preu major que 200 €
select prod.nombre, prod.precio
from producto prod
    join fabricante fab on prod.codigo_fabricante = fab.codigo
where fab.nombre = 'Crucial'
    and prod.precio > 200;

-- 28. Retorna un llistat amb nom, preu i nom del fabricant (fabricante) de tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l'operador IN.
select prod.nombre, prod.precio
    ,fab.nombre as 'fabricante'
from producto prod
    join fabricante fab on prod.codigo_fabricante = fab.codigo
where fab.nombre = 'Asus'
    or fab.nombre = 'Hewlett-Packard'
    or fab.nombre = 'Seagate';

-- 29. Retorna un llistat amb nom, preu i nom del fabricant (fabricante) de tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Fent servir l'operador IN.
select prod.nombre, prod.precio
    ,fab.nombre as 'fabricante'
from producto prod
    join fabricante fab on prod.codigo_fabricante = fab.codigo
where fab.nombre in('Asus', 'Hewlett-Packard', 'Seagate');

-- 30. Retorna un llistat amb el nom, el preu i el nom del fabricant (fabricante) dels productes, on el nom del fabricant acabi en la lletra 'e'.
select prod.nombre, prod.precio
    ,fab.nombre as 'fabricante'
from producto prod
    join fabricante fab on prod.codigo_fabricante = fab.codigo
where lower(right(fab.nombre, 1)) = 'e' ;

-- 31. Retorna un llistat amb el nom del producte, el seu preu i el nom del fabricant (fabricante), per a tots aquells productes els fabricants dels quals contenen la lletra 'w' en el seu nom.
select prod.nombre, prod.precio
    ,fab.nombre as 'fabricante'
from producto prod
    join fabricante fab on prod.codigo_fabricante = fab.codigo
where lower(fab.nombre) like '%w%';

-- 32. Retorna un llistat amb el nom del producte, el seu preu i el nom del fabricant (fabricante), per a tots els productes amb un preu igual o superior a 180 €. Ordena els resultats, primer pel preu en ordre descendent i després pel nom del producte en ordre ascendent.
select prod.nombre, prod.precio
    ,fab.nombre as 'fabricante'
from producto prod
    join fabricante fab on prod.codigo_fabricante = fab.codigo
where prod.precio >= 180
order by prod.precio desc, prod.nombre asc;

-- 33. Retorna un llistat amb el codi i el nom de fabricant (fabricante), solament d'aquells fabricants que tenen productes associats en la base de dades.
select distinct fab.codigo, fab.nombre
from fabricante fab
    join producto prod on prod.codigo_fabricante = fab.codigo;

-- 34. Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. Inclou també els fabricants que no tenen cap producte. Mostra el nom del fabricant (fabricante) i el nom del producte (producto).
select fab.nombre as fabricante
    ,prod.nombre as producto
from fabricante fab
    left join producto prod on prod.codigo_fabricante = fab.codigo;

-- 35. Retorna un llistat on només apareguin els noms dels fabricants (fabricante) que no tenen cap producte associat.
select fab.nombre as fabricante
from fabricante fab
    left join producto prod on prod.codigo_fabricante = fab.codigo
where prod.nombre is null;

-- 36. Retorna tots els productes del fabricant Lenovo. (Sense utilitzar INNER JOIN).
select codigo, nombre, precio, codigo_fabricante
from producto
where codigo_fabricante = (select codigo from fabricante where nombre = 'Lenovo');

-- 37. Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).
select codigo, nombre, precio, codigo_fabricante
from producto
where precio = (
    select max(precio)
    from producto
    where codigo_fabricante = (select codigo 
                                from fabricante 
                                where nombre = 'Lenovo')
    );

-- 38. Llista el nom del producte més car del fabricant Lenovo.
select prod.nombre
from producto prod
    join fabricante fab on fab.codigo = prod.codigo_fabricante
where fab.nombre = 'Lenovo'
order by prod.precio desc
limit 1;

-- 39. Llista el nom del producte més barat del fabricant Hewlett-Packard.
select prod.nombre
from producto prod
    join fabricante fab on fab.codigo = prod.codigo_fabricante
where fab.nombre = 'Hewlett-Packard'
order by prod.precio asc
limit 1;

-- 40. Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
select codigo, nombre, precio, codigo_fabricante
from producto
where precio >= (
    select max(precio)
    from producto
    where codigo_fabricante = (select codigo 
                                from fabricante 
                                where nombre = 'Lenovo')
    );


-- 41. Llista tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT codigo, nombre, precio, codigo_fabricante
FROM producto
WHERE codigo_fabricante = (
    SELECT codigo
    FROM fabricante
    WHERE nombre = 'Asus'
)
AND precio > (
    SELECT AVG(precio)
    FROM producto
    WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricante
        WHERE nombre = 'Asus'
    )
);
