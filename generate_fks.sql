.if (%.U13:REFRCODE% == "RELATIONSHIP_") 
    FK_%.U12:CHILD%_%.U12:PARENT% 
.else 
    FK_%REFRCODE% 
.endif

[%.U13:REFRCODE%=RELATIONSHIP_?[%.U12:CHILD%_%.U12:PARENT%_FK]:[%REFRCODE%_FK]]

%.U23:REFR%_%.U3:CHILD%_FK
--123