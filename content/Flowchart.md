---
---

## Tags

#tags, #meta

## Content

Oval - Terminal - staring or ending

Flow lines - direction of flow

Parallelogram - IO / used for input output operation. Indicates that the computer is to obtain or output data

Rhombus - Decision - if/else blah

Rectangle - Process - internal operation inside the Processor or Memory


```mermaid
flowchart
    a([Start]) --> b[/READ r/] --> c[area = 3.1415926 * r * r] --> d[/output area/] --> f([end])
```

```mermaid
flowchart
    a([START]) --> b[/READ a, b/] --> c{a > b}
    c -- TRUE --> d[/PRINT a/] --> f([END])
    c -- FALSE --> e[/PRINT b/] --> f
```

```mermaid
flowchart
    a([START]) --> b[/READ math_grade, as_grade/] --> c{math_grade in 'b', 'a', 'a*'}
    c -- True --> d{as_grade in 'a'}
    c -- False --> app[/READ approval/]
    d -- False --> app --> check{approval == 'yes'} -- True --> yes
    check -- False --> no[/PRINT 'No'/] --> gend
    d -- True --> yes[/PRINT 'Yes'/] --> gend([END])
    app --> gend
```

```mermaid
flowchart
    s([START]) --> i[/READ year/] --> l{year MOD 400 == 0}
    l -- False --> ll{year MOD 100 == 0}
    ll -- True --> lll{year MOD 4 == 0}
    lll -- False --> no[/PRINT no/]
    l -- True --> yes[/PRINT yes/]
    ll -- False --> yes
    lll -- True --> yes --> e([END])
    no --> e
```

