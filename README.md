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
