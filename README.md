# Task S2.02 – MySQL Queries

It is a set of SQL `SELECT` queries written against two sample MySQL databases, **Tienda** (shop) and **Universidad** (university). They practise everything from simple projections to joins, subqueries and aggregate functions.

## Repository structure

```
.
├── Tienda/
│   └── queries.sql        # 41 queries on the shop database
├── Universidad/
│   └── queries.sql        # 26 queries on the university database
├── LICENSE
└── README.md
```

## Exercise 1 – Tienda (Shop)

**Tables:** `producto`, `fabricante`

There are 41 queries on products and their manufacturers. They cover:

- Basic `SELECT` statements, column aliases and calculated columns (e.g. converting euros to US dollars)
- String functions: `UPPER`, `LOWER`, `SUBSTR`, `RIGHT`
- Numeric functions: `ROUND`, `TRUNCATE`, `FORMAT`
- `DISTINCT`, `ORDER BY` (ascending/descending, several columns) and `LIMIT` with offset
- `INNER JOIN` and `LEFT JOIN` between products and manufacturers
- Filtering with `AND`, `OR`, `IN` and `LIKE`
- Subqueries used instead of joins, including `MAX` and `AVG` inside subqueries

## Exercise 2 – Universidad (University)

**Tables:** `persona`, `profesor`, `departamento`, `asignatura`, `grado`, `curso_escolar`, `alumno_se_matricula_asignatura`

There are 26 queries on students, lecturers, departments, subjects, degrees and enrolments. They cover:

- Filtering by person type (`alumno` / `profesor`), `IS NULL` checks and date functions such as `YEAR()`
- Multi-table `INNER JOIN`s across the university schema
- `LEFT JOIN` and `RIGHT JOIN` to find unmatched rows (queries 10–15), e.g. lecturers with no department or subjects with no lecturer
- Aggregate functions: `COUNT`, `COUNT(DISTINCT …)`, `SUM`
- Grouping and group filtering with `GROUP BY` and `HAVING`

## Notes

- Each query has a numbered comment above it with the original exercise statement (in Catalan).
- Table and column names are in Spanish.
- The scripts that create the databases and load their data are **not** in this repository. They come with the exercise material.

## How to run

1. Install MySQL 8 (or a compatible server) and a client such as MySQL Workbench or the `mysql` CLI.
2. Import the `tienda` and `universidad` schema and data scripts that come with the exercise.
3. Select the matching database and run the queries:

   ```bash
   mysql -u <user> -p tienda < Tienda/queries.sql
   mysql -u <user> -p universidad < Universidad/queries.sql
   ```

   Or open the `.sql` files in MySQL Workbench and run each query individually to see its result.

## Licence

This project is released under the MIT Licence. See [LICENSE](LICENSE) for details.

