#set page(header: align(right)[Lenguaje Typst], footer: [Lesmes])
#set par(justify: true)
#set text(size: 12pt)
#set heading(numbering: "1.")
#show link: set text(fill: blue)
#show link: underline
#set table(
  fill: (_, y) => if calc.odd(y) { rgb("EAF2F5") },)
#show heading: set text(blue)

#show title: set align(center)
#title[Lenguaje de programación Typst]
#linebreak()
Viendo Typst como un lenguaje de programación.

= Modos 

Typst tiene tres modos sintácticos: #highlight("Etiquetado") (Markup), #highlight("Matemático") y #highlight("Código"). En un documento Typst el  modo etiquetado(Markup) es el modo por defecto. El modo matemático permite escribir fórmulas y ecuaciones Matemáticas y el modo código permite escribir instrucciones del lenguaje Typst.

== Etiquetado
Typst tiene muchas etiquetas para los elementos de un documento. Por ejemplo para poner en negrilla una palabra o frase, escriba: `*negrilla*` y obtiene: *negrilla*

== Matemático
Las ecuaciones y/o fórmulas matemáticas se deben escribir entre signos \$\$. Una ecuación en línea, se escribe: `$x^2$` y se obtiene: $x^2$ y una ecuación centrada en la siguiente línea se escribe: `$ (x+1)^2 $` y se obtiene: $ (x+1)^2 $ Note que se deja un espacio antes y después de los signos \$.

== Código
Inicia con \#. Por ejemplo, al escribir: `#(3+4)`, obtiene: #(3+4). También puede escribir bloques de código entre corchetes { }:
```Typst
#{
  let a = [amo ]
  let b = [*Typst*]
  [Hola, ]
  a  + b
}
```
obteniendo:\
#{
  let a = [amo ]
  let b = [*Typst*]
  [Hola, ]
  a  + b
}

Note que dentro del bloque ya no se escribe \# para `let`.


== Comentarios
Dentro de un documento Typst puede insertar comentarios iniciando con `//`

= Medidas usadas en Typst
#linebreak()
Para seleccionar tamaños se usan puntos(pt), centímetros(cm), milímetros(mm) y pulgadas(in). Por ejemplo para espacios verticales usamos: `\#v(5pt) \#linebreak()`, para tamaños de letra 12pt,... Se tiene 

#align(center,[1 in = 72 pt = 2.54 cm= 25.54 mm])

= Fracción `fr`
#linebreak()
Define como distribuir el espacio en un diseño. En el siguiente ejemplo: toda la línea es 100%=3fr y así 33.3% es 1fr y 66% es 2fr del espacio respectivamente. Es decir `fr` determina la fracción de espacio a usar dentro de una línea u otro espacio.

== Ejemplo
#linebreak()
```Typst
Negro #h(1fr)  Gris #h(2fr) Blanco
```
Negro #h(1fr)  Gris #h(2fr) Blanco

== Otro ejemplo
#linebreak()
```Typst
Primero #h(1fr) Segundo \
Primero #h(1fr) Segundo #h(1fr) Tercero \
Primero #h(2fr) Segundo #h(1fr) Tercero \
Uno #h(1fr) Dos #h(1fr) Tres #h(2fr) Cinco
```

Primero #h(1fr) Segundo \
Primero #h(1fr) Segundo #h(1fr) Tercero \
Primero #h(2fr) Segundo #h(1fr) Tercero \
Uno #h(1fr) Dos #h(1fr) Tres #h(2fr) Cinco

= Tipos en  Typst
#linebreak()
En typst los objetos tienen _tipos_:

#grid(columns: 2, column-gutter: 5cm,align: center,
[```typ
#type(12) \
#type(14.7) \
#type("hola") \
#type(<glacier>) \
#type([Hola]) \
#type(x => x + 1) \
#type(type) \
#type(true)
```],
[#type(12) \
#type(14.7) \
#type("hola") \
#type(<glacier>) \
#type([Hola]) \
#type(x => x + 1) \
#type(type)\
#type(true)])
#pagebreak()
= Funciones incluidas en Typst
#linebreak()
Una función de typst empieza con \#. Algunas funciones son:
#grid(columns: 2, column-gutter: 5cm,align: center,
[```Typst
#emph[Hola] \
#emoji.car \
#strong[Hola] \
#"Murcielago".len() \
#(2+3) \
#false \
#true \
#(1 < 2)
#(1in == 72pt)
```],
[#emph[Hola] \
#emoji.car \
#strong[Hola] \
#"Murcielago".len() \
#(2+3) \
#false \
#true \
#(1 < 2) \
#(1in == 72pt)
])

= Creación de variables
#linebreak()
#grid(columns: 2, column-gutter: 3cm,align: center,
[```Typst
#let editor="Typst"
Documento escrito con #editor.
```],
[#let editor="Typst"
Documento escrito con #editor.])

= Funciones creadas por el usuario
#linebreak()
Se pueden crear funciones matemáticas:
#grid(columns: 2, column-gutter: 5cm,align: center,
[```Typst
#let suma(x,y)=x+y
La suma es #suma(4,5) 
```],
[#let suma(x,y)=x+y
La suma es #suma(4,5)])

#grid(columns: 2, column-gutter: 3cm,align: center,
[```Typst
#let f(x,y)= calc.sqrt(x-y)
La función f en 6,4 es #f(6,4) 
```],
[#let f(x,y)=calc.sqrt(x - y)
La función f en 6,4 es #f(6,4)])


= Funciones que se aplican al contenido
#linebreak()

Aquí se crea la función `alerta` que crea un rectángulo rojo, el argumento será el texto debajo de `OJO`
#grid(columns: 2, column-gutter: 3cm,align: center,
[```Typst
  #let alerta(contenido, fill:red)={
  set text(white)
  set align(center)
  rect(fill: fill,
    inset: 8pt,
    radius: 4pt,
    [*OJO : \ #contenido *]       
)}
#alerta[Peligro inminente!]
```],
[#let alerta(contenido, fill:red)={
  set text(white)
  set align(center)
  rect(fill: fill,
    inset: 8pt,
    radius: 4pt,
    [*OJO : \ #contenido *]       
)}
#alerta[Peligro inminente!]
])
#pagebreak()
= Bloques
#linebreak()
Se pueden crear bloques de código. 
#grid(columns: 2, column-gutter: 5cm,align: center,
[```Typst
#{ let x = 1; x + 2 }
```
],
[#{ let x = 1; x + 2 }])

#{ let x = 1; x + 2 }

= Arreglos
#linebreak()
Creación de vectores:
#grid(columns: 2, column-gutter: 5cm,align: center,
[```Typst
#let vector = (1, 7, 4, -3, 2)
#vector.at(0) \
#(vector.at(0) = 3)
#vector.at(-1) \
#vector.first() \
#vector.last() \
#vector.find(calc.even) \
#vector.filter(calc.odd) \
#vector.map(calc.abs) \
#vector.rev() \
#(1, (2, 3)).flatten() \
#(("A", "B", "C").join(", ", last: " y ")) \
#(1, 2, 3).contains(2)
```],
[#let vector = (1, 7, 4, -3, 2)
#vector.at(0) \
#(vector.at(0) = 3)
#vector.at(-1) \
#vector.first() \
#vector.last() \
#vector.find(calc.even) \
#vector.filter(calc.odd) \
#vector.map(calc.abs) \
#vector.rev() \
#(1, (2, 3)).flatten() \
#(("A", "B", "C").join(", ", last: " y ")) \
#(1, 2, 3).contains(2)])

= Más arreglos
Algunas funciones que se aplican a los arreglos:
#grid(columns: 2, column-gutter: 4cm,align: center,
[```Typst
#let v1 = (1, 2, 3, 4, 5, 6, 7, 8)
#v1.chunks(3) \
#v1.chunks(3, exact: true)
```],
[#let v1 = (1, 2, 3, 4, 5, 6, 7, 8)
#v1.chunks(3) \
#v1.chunks(3, exact: true)])

= Más arreglos
Creación de matrices:
#grid(columns: 2, column-gutter: 3cm,align: center,
[```Typst
#let data = ((1, 2, 3), (4, 5, 6))
#let matriz = math.mat(..data)
$ M := matriz $
```],
[#let data = ((1, 2, 3), (4, 5, 6))
#let matriz = math.mat(..data)
$ M := matriz $])

= Rangos
Funcionan muy al estilo _Python_:
#grid(columns: 2, column-gutter: 5cm,align: center,
[```typ
#range(5) \
#range(2, 5) \
#range(20, step: 4) \
#range(21, step: 4) \
#range(5, 2, step: -1)
```],
[#range(5) \
#range(2, 5) \
#range(20, step: 4) \
#range(21, step: 4) \
#range(5, 2, step: -1)])
#pagebreak()
= Intervenir las tablas
#linebreak()
El siguiente código colorea las filas impares de todas las tablas del documento:

#grid(columns: 2, column-gutter: 5cm,align: center,
[```typ
#set table(
  fill: (_, y) => if calc.odd(y) { rgb("EAF2F5") },
)
```],
[#set table(
  fill: (_, y) => if calc.odd(y) { rgb("EAF2F5") },
)])

#align(center,
table(columns:2,align: center+horizon,
[*Uno*],[*Dos*],
[1.234],["Color"],
[$sqrt(1+x)$],[0],
[$(x^2+y^2)^2$],["No aplica"]))

= Calculadora de typst

#set rect(
  inset: 5pt,
  fill: rgb("e4e5ea"),
  width: 100%,
  height: 100%,
)

== Funciones matemáticas
#linebreak()
Módulo de cálculos y proceso de valores numéricos:
#grid(
  columns: (1fr, 1fr),
  rows: (200pt),
  gutter: 2pt,
  align: center+horizon,
  rect[```Typst 
#calc.pi \
#calc.e \
#calc.abs(-5) \
#calc.abs(5pt - 2cm) \
#calc.abs(2fr) \
#calc.abs(decimal("-342.440"))
#calc.pow(2, 3) \
#calc.pow(decimal("2.5"), 2) \
#calc.exp(1) \
#calc.sqrt(16) \
#calc.sqrt(2.5) \
#calc.root(16.0, 4) \
#calc.root(27.0, 3)
  ```],
  rect[#calc.pi\
#calc.e\
#calc.abs(-5) \
#calc.abs(5pt - 2cm) \
#calc.abs(2fr) \
#calc.abs(decimal("-342.440"))
#calc.pow(2, 3) \
#calc.pow(decimal("2.5"), 2) \
#calc.exp(1) \
#calc.sqrt(16) \
#calc.sqrt(2.5) \
#calc.root(16.0, 4) \
#calc.root(27.0, 3)
],
)
#pagebreak()
== Funciones trigonométricas y logarítmicas
#linebreak()
#grid(
  columns: (1fr, 1fr),
  rows: (260pt),
  gutter: 2pt,
  align: center+horizon,
  rect[```Typst 
#calc.sin(1.5) \
#calc.sin(90deg) \
#calc.cos(1.5) \
#calc.cos(90deg) \
#calc.tan(1.5) \
#calc.tan(90deg) \
#calc.asin(0) \
#calc.asin(1) \
#calc.acos(0) \
#calc.acos(1) \
#calc.atan(0) \
#calc.atan(1) \
#calc.atan2(1, 1) \
#calc.atan2(-2, -3)
  ```],
  rect[#calc.sin(1.5) \
#calc.sin(90deg) \
#calc.cos(1.5) \
#calc.cos(90deg) \
#calc.tan(1.5) \
#calc.tan(90deg) \
#calc.asin(0) \
#calc.asin(1) \
#calc.acos(0) \
#calc.acos(1) \
#calc.atan(0) \
#calc.atan(1) \
#calc.atan2(1, 1) \
#calc.atan2(-2, -3)
],
)

== Funcioneshiperbólicas
#linebreak()
#grid(
  columns: (1fr, 1fr),
  rows: (100pt),
  gutter: 2pt,
  align: center+horizon,
  rect[```Typst 
  #calc.sinh(0) \
#calc.sinh(1.5) \
#calc.cosh(0) \
#calc.cosh(1.5) \
#calc.tanh(0) \
#calc.tanh(1.5)
  ```],
  rect[#calc.sinh(0) \
#calc.sinh(1.5) \
#calc.cosh(0) \
#calc.cosh(1.5) \
#calc.tanh(0) \
#calc.tanh(1.5)
],
)

== Ejemplo de cálculo

$ (e + sqrt(5))/pi $
#grid(
  columns: (1fr, 1fr),
  rows: (100pt),
  gutter: 2pt,
  align: center+horizon,
  rect[```Typst 
#((calc.e + calc.sqrt(5))/calc.pi)
  ```],
  rect[#((calc.e + calc.sqrt(5))/calc.pi)
],
)



== Otras funciones matemáticas
#linebreak()
#grid(
  columns: (1fr, 1fr),
  rows: (650pt),
  gutter: 2pt,
  align: center+horizon,
  rect[```Typst 
#calc.log(100) \
#calc.ln(calc.e) \
#calc.fact(5) \
$ "perm"(n, k) &= n!/((n - k)!) \
  "perm"(5, 3) &= #calc.perm(5, 3) $
#calc.binom(10, 5) \
#calc.gcd(7, 42) \
#calc.lcm(96, 13) \
#calc.floor(500.1) \
#calc.ceil(500.1) \
#calc.trunc(15.9) \
#calc.fract(-3.1) \
#calc.round(3.1415, digits: 2) \
#calc.clamp(5, 0, 4) \
#calc.min(1, -3, -5, 20, 3, 6) \
#calc.min("typst", "is", "cool") \
#calc.max(1, -3, -5, 20, 3, 6) \
#calc.max("typst", "is", "cool") \
#calc.even(4) \
#calc.even(5) \
#calc.odd(4) \
#calc.odd(5) \
#calc.rem(7, 3) \
#calc.div-euclid(7, 3) \
#calc.div-euclid(decimal("1.75"), decimal("0.5")) \
#calc.rem-euclid(7, 3) \
#calc.rem-euclid(1.75, 0.5) \
#calc.rem-euclid(decimal("1.75"), decimal("0.5")) \
#calc.norm(1, 2, -3, 0.5) \
#calc.norm(p: 3, 1, 2)
  ```],
  rect[
#calc.log(100) \
#calc.ln(calc.e) \
#calc.fact(5) \
$ "perm"(n, k) &= n!/((n - k)!) \
  "perm"(5, 3) &= #calc.perm(5, 3) $
#calc.binom(10, 5) \
#calc.gcd(7, 42) \
#calc.lcm(96, 13) \
#calc.floor(500.1) \
#calc.ceil(500.1) \
#calc.trunc(15.9) \
#calc.fract(-3.1) \
#calc.round(3.1415, digits: 2) \
#calc.clamp(5, 0, 4) \
#calc.min(1, -3, -5, 20, 3, 6) \
#calc.min("typst", "is", "cool") \
#calc.max(1, -3, -5, 20, 3, 6) \
#calc.max("typst", "is", "cool") \
#calc.even(4) \
#calc.even(5) \
#calc.odd(4) \
#calc.odd(5) \
#calc.rem(7, 3) \
#calc.div-euclid(7, 3) \
#calc.div-euclid(decimal("1.75"), decimal("0.5")) \
#calc.rem-euclid(7, 3) \
#calc.rem-euclid(decimal("1.75"), decimal("0.5")) \
#calc.norm(1, 2, -3, 0.5) \
#calc.norm(p: 3, 1, 2)
],
)
Vea más en #link("https://typst.app/docs/reference/foundations/calc/")

= Ejemplo: Sucesión de Fibonacci
La sucesión de Fibonacci estádefinida por la relación de recurrencia $F_n = F_(n-1) + F_(n-2)$. También se puede expresar:

$ F_n = round(1/sqrt(5) phi.alt^n), quad phi.alt = (1 + sqrt(5))/2 $

```Typst
#let count=8
#let nums= range(1, count +1)
#let fib(n)=(
  if n <= 2 {1}
  else { fib(n - 1) + fib(n - 2)}
)

Los primeros #count términos de la sucesión son:
#align(center, table( 
  columns: count,
  ..nums.map(n => $F_#n$),
  ..nums.map(n => str(fib(n))),
))
```
#let count=8
#let nums= range(1, count +1)
#let fib(n)=(
  if n <= 2 {1}
  else { fib(n - 1) + fib(n - 2)}
)

Los primeros #count términos de la sucesión son:
#align(center, table( 
  columns: count,
  ..nums.map(n => $F_#n$),
  ..nums.map(n => str(fib(n))),
))
= Control de flujo
== Ciclo `if`
Puede calcular diferentes cosas dependiendo de si se cumple o no una condición:
#grid(
  columns: (1fr, 1fr),
  rows: (80pt),
  gutter: 2pt,
  align: center+horizon,
  rect[```Typst 
  #if 1 < 2 [
  Verdad
] else [
  Falso.
]
  ```],
  rect[#if 1 < 2 [
  Verdad
] else [
  Falso.
]
],
)


== Ciclo `for`
Typst soporta dos tipos de ciclos: `for` y `while`. El primero itera sobre una colección específica y el segundo, itera mientras se cumpla una condición. 
#grid(
  columns: (1fr, 1fr),
  rows: (70pt),
  gutter: 2pt,
  align: center+horizon,
  rect[```Typst 
  #for c in "ABC" [
  #c es una letra.
]
  ```],
  rect[#for c in "ABC" [
  #c es una letra.
]
],
)
#pagebreak()
== Ciclo `while`

#let n = 2
```Typst
#let n = 2
```

#grid(
  columns: (1fr, 1fr),
  rows: (70pt),
  gutter: 2pt,
  align: center+horizon,
  rect[```Typst 
  #while n < 10 {
  n = (n * 2) - 1
  (n,)
}
  ```],
  rect[#while n < 10 {
  n = (n * 2) - 1
  (n,)
}
],
)

= Operadores
#linebreak()
La siguiente tabla presenta los operadores de Typst, su paridad y el nivel de precedencia:
#align(center,
table(columns: 4, align: center+horizon,
[*Operador*],[*Efecto*], [*Ario*], [*Precedencia*],
[-],	[Negación],	[Unitario],	[7],
[+],	[No tiene efecto (existe por symetría)],	[Unitario],	[7],
[\*],	[Multiplicación],	[Binario],	[6],
[/],	[División],	[Binario],	[6],
[+],	[Adición],	[Binario],	[5],
[-],	[Sustracción],	[Binario],	[5],
[==],	[Verifica igualdad],	[Binario],	[4],
[!=],	[Verifica desigualdad],	[Binario],	[4],
[<],	[Verifica menor que],	[Binario],	[4],
[<=],	[Verifica menor o igual que],	[Binario],	[4],
[>],	[Verifica mayor que],	[Binario],	[4],
[>=],	[Verific mayor o igual que],	[Binario],	[4],
[in],	[Verifica si está en una colección],	[Binario],	[4],
[not in],	[Verifica si no está en una colección],	[Binario],	[4],
[not],	["no" lógico],	[Unitario],	[3],
[and],	[Short-circuiting "y" lógico],	[Binario],	[3],
[or],	[Short-circuiting "o" lógico],	[Binario],	[2],
[=],	[Asignación],	[Binario],	[1],
[+=],	[Asignación-más],	[Binario],	[1],
[-=],	[Asignación-menos],	[Binario],	[1],
[\*=],	[Asignación-multiplicación],	[Binario],	[1],
[/=],	[Asignación-división],	[Binario],	[1],
))
#pagebreak()
= Diccionarios
#linebreak()
En Typst se pueden construir diccionarios:
#grid(
  columns: (1fr, 1fr),
  rows: (240pt),
  gutter: 2pt,
  align: center+horizon,
rect[```Typst
#let dicc = (
  uno: "1",
  dos: "2",
  tres: "3",
)
#dicc.uno \
#(dicc.cuatro = "4") \
#dicc.len() \
#dicc.keys() \
#dicc.values() \
#dicc.at("dos") \
#dicc.insert("cinco", "5")\
#("uno" in dicc)\
#dicc
``` ],
rect[#let dicc = (
  uno: "1",
  dos: "2",
  tres: "3",
)
#dicc.uno \
#(dicc.cuatro = "4") \
#dicc.len() \
#dicc.keys() \
#dicc.values() \
#dicc.at("dos") \
#dicc.insert("cinco", "5")\
#("uno" in dicc)\
#dicc])

= Campos
#linebreak()
Se puede usar la notación punto (.) para acceder a los campos de un item:
#let it = [= Título]
```Typst
#let it = [= Título]
```

#grid(
  columns: (1fr, 1fr),
  rows: (70pt),
  gutter: 2pt,
  align: center+horizon,
  rect[```Typst 
  #it.body \
#it.depth \
#it.fields()
  ```],
  rect[#it.body \
#it.depth \
#it.fields()
],
)


#let dict = (greet: "Hola")
```Typst
#let dict = (greet: "Hola")```

#grid(
  columns: (1fr, 1fr),
  rows: (70pt),
  gutter: 2pt,
  align: center+horizon,
  rect[```Typst 
  #dict.greet \
#emoji.face
  ```],
  rect[#dict.greet \
#emoji.face
],
)
#pagebreak()
= Métodos
#linebreak()
Hay varios métodos para llamar la función `.len`
#grid(
  columns: (1fr, 1fr),
  rows: (70pt),
  gutter: 2pt,
  align: center+horizon,
  rect[```Typst 
  #str.len("abc") es lo mismo que
#"abc".len()
  ```],
  rect[#str.len("abc") es lo mismo que
#"abc".len()
],
)

```Typst
#let valores = (1, 2, 3, 4)
```
#let valores = (1, 2, 3, 4)

#grid(
  columns: (1fr, 1fr),
  rows: (150pt),
  gutter: 2pt,
  align: center+horizon,
  rect[```Typst 
#valores.pop() \
#valores.len() \
#("a, b, c"
    .split(", ")
    .join[ --- ])
#"abc".len() es lo mismo que
#str.len("abc")
  ```],
rect[#valores.pop() \
#valores.len() \

#("a, b, c"
    .split(", ")
    .join[ --- ])

#"abc".len() es lo mismo que
#str.len("abc")
],
)

= Paquetes
#linebreak()
Un paquete de Typst es un bloque de código que se puede reutilizar. Para utilizar bloques de código ya elaborados se debe importar:

#grid(
  columns: (1fr, 1fr),
  rows: (70pt),
  gutter: 2pt,
  align: center+horizon,
  rect[```Typst 
  #import "@preview/example:0.1.0": add
#add(2, 7)
  ```],
  rect[#import "@preview/example:0.1.0": add
#add(2, 7)
],
)
Se pueden encontrar todos los paquetes de la comunidad Typst en #link("https://typst.app/universe/search/?kind=packages")