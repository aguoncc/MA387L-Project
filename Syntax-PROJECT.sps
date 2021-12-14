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
  
*RECODE TO STEM MAJOR? YES/NO

RECODE MAJOR_RECODE (5=1) (6=1) (13=1) (17=1) (1=1) (MISSING=SYSMIS) (ELSE=0) INTO MAJOR_STEM. 
VARIABLE LABELS  MAJOR_STEM 'Stem major or not'. 
EXECUTE.

**RECODE SURVERYS 1-5 INTO NON-STRINGS**
SURVEYS1,3,&4 into 1-(strongly) agree and 0-(strongly) disagree
assuming higher scorers would have answered with strongly agree to agree
SURVEYS2&5 into 1-(strongly) disagree and 0-(strongly) agree
- unsure if no opinion should be in missing or code into 0 as well

RECODE SURVEY1 ('1'=1) ('1.0'=1) ('2'=2) ('2.0'=2) ('4'=4) ('4.0'=4) ('5'=5) ('5.0'=5)
    (MISSING=SYSMIS) INTO SURVEY1_RECODE. 
EXECUTE.
RECODE SURVEY2 ('1'=0) ('1.0'=0) ('2'=0) ('2.0'=0) ('4'=1) ('4.0'=1) ('5'=1) ('5.0'=1)  
    (MISSING=SYSMIS) INTO SURVEY2_RECODE. 
EXECUTE.
RECODE SURVEY3 ('1'=1) ('1.0'=1) ('2'=1) ('2.0'=1) ('4'=0) ('4.0'=0) ('5'=0) ('5.0'=0)
     (MISSING=SYSMIS) INTO SURVEY3_RECODE. 
EXECUTE.
RECODE SURVEY4 ('1'=1) ('1.0'=1) ('2'=1) ('2.0'=1) ('4'=0) ('4.0'=0) ('5'=0) ('5.0'=0)
    ('5.0'=5) (MISSING=SYSMIS) INTO SURVEY4_RECODE. 
EXECUTE.
RECODE SURVEY5 ('1'=0) ('1.0'=0) ('2'=0) ('2.0'=0) ('4'=1) ('4.0'=1) ('5'=1) ('5.0'=1)
    ('5.0'=5) (MISSING=SYSMIS) INTO SURVEY5_RECODE. 
EXECUTE.

*INDEPENDENT T-TEST
significant at both 0.05 and 0.01

T-TEST GROUPS=Gender(1 0) 
  /MISSING=ANALYSIS 
  /VARIABLES=TOTAL_PERCENT 
  /CRITERIA=CI(.95).
T-TEST GROUPS=Gender(1 0) 
  /MISSING=ANALYSIS 
  /VARIABLES=TOTAL_PERCENT 
  /CRITERIA=CI(.99).



























