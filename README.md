1. Copiar README de https://github.com/uqbar-project/eg-nplus1problem-xtend
2. Hablar de la configuración EAGER, que produce n + 1 queries
3. Estamos paginando, eso permite esconder el problema pero conceptualmente no está bien, si traemos 1000 resultados se empieza a notar la degradación de performance.
4. Volvemos a paginar y lo ponemos LAZY, ahora tenemos un Session closed
5. Último toque, el Entity Graph tiene que considerar el set de proveedores en la relación many-to-many dentro del mismo query.
