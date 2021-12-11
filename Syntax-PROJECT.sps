* Encoding: UTF-8.
**PROJECT SYNTAX**

*RECODE TOTAL

RECODE Total ('0.0'=0) ('10.0'=10) ('100.0'=100) ('15.0'=15) ('20.0'=20) ('25.0'=25) ('30.0'=30) ('35.0'=35)
    ('40.0'=40) ('45.0'=45) ('5.0'=5) ('50.0'=50) ('55.00000000000001'=55) ('60.0'=60) ('65.0'=65) 
    ('70.0'=70) ('75.0'=75) ('80.0'=80) ('85.0'=85) ('90.0'=90) ('95.0'=95) ('10'=10) ('15'=15) 
    ('20'=20) ('25'=25) ('30'=30) ('35'=35) ('40'=40) ('45'=45) ('5'=5) ('50'=50) ('55'=55) 
    ('60'=60) ('65'=65) ('70'=70) ('75'=75) ('80'=80) ('85'=85) ('90'=90) ('95'=95) (MISSING=SYSMIS) 
    INTO TOTAL_PERCENT. 
EXECUTE.

*RECODE Major

RECODE Major ('Accounting'=0) ('Agriculture'=1) ('Anthropology'=2) 
    ('Business Administration'=3) ('Communication Studies'=4) 
    ('Computer Information System'=5) ('Computer Science'=6)
    ('Criminal Justice'=7) ('Early Childhood, Elementary Education'=8) 
    ('Elementary Education'=8) ('English (Undergrad)'=9) ('English &amp; ESL'=9)
    ('Fine Arts/Music'=10) ('General Science, Secondary Education'=88) 
    ('Health Science'=11) ('History'=12) ('Mathematics'=13) ('Nursing'=14) 
    ('Philosophy'=15) ('Physical Education / School Health'=88) ('Political Science'=16) 
    ('Pre Engineering'=17) ('Pre Nursing'=14) ('Psychology'=18) ('Secondary Education'=88) 
    ('Secondary Education: ESL'=88) ('Social Work'=19) ('Sociology'=20) 
    ('Undeclared'=21) ('Undeclared Education'=21) ('Chamoru Language, Secondary Education'=88) 
    (MISSING=SYSMIS) 
    INTO MAJOR_RECODE. 
EXECUTE.
FREQUENCIES VARIABLES=MAJOR_RECODE 
  /ORDER=ANALYSIS.

*GRAPH OF MPT SCORES

GRAPH 
  /HISTOGRAM=TOTAL_PERCENT.
