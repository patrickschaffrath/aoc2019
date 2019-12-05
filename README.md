# aoc2019

## Parsing of inputs:
Use
```
curl -sb session=<token> https://adventofcode.com/2019/day/<day>/input
```
with valid \<token> and \<day>, then pipe with `sed` command of the day.

### Day1
```bash
sed ':a;N;$!ba;s/\n/\x20/g;s/^/\(define input \x27\(/;s/$/\)\)/'
```

### Day2
```bash
sed 's/\x2C/\x20/g;s/^/\(define input \x27\(/;s/$/\)\)/'
```

### Day3
```bash
sed -r ':a;N;$!ba;s/([U,D,L,R])([0-9]+)/\(\#\\\1 \2\)/g;s/\x2C/\x20/g;s/(.*)\n(.*)/\(define wire-one \x27\(\1\)\)\n\n\(define wire-two \x27\(\2\)\)/'
```

### Day4
```bash
sed 's/\x2D/\x20/;s/^/\(define input \x27\(/;s/$/\)\)/'
```

### Day5
```bash
sed 's/\x2C/\x20/g;s/^/\(define input \x27\(/;s/$/\)\)/'
```
