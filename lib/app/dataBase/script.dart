final createTable = '''
CREATE TABLE taskTable(
id INTEGER NOT NULL PRIMARY KEY, 
title VARCHAR(200) NOT NULL, 
description VARCHAR(50) NOT NULL, 
selectDate VARCHAR(50) NOT NULL, 
dateNow VARCHAR(50), 
public VARCHAR(100)
)
''';