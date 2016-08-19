drop table UserInfo;
create table UserInfo (
	UID TEXT PRIMARY KEY NOT NULL,
	Name TEXT NOT NULL,
	Sex  Text NOT NULL,
	Birthday Text NOT NULL,
	CertificateNO INT NOT NULL,
	CertificateDate TEXT NOT NULL,
	IdNo TEXT NOT NULL,
	Phone TEXT NOT NULL,
	Email TEXT NOT NULL,
	Address TEXT,
	Others TEXT
);

drop table Assessment;
create table Assessment (
	CertificateNO INT PRIMARY KEY NOT NULL,
	AssessmentRecord TEXT,
	AssessDate TEXT,
	AssessmentName CHAR(20),
	AssessmentDesc TEXT,
	AssessmentType INT
);

drop table Work;
create table Work (
	UID TEXT PRIMARY KEY NOT NULL,
	StartDate TEXT,
	EndDate TEXT,
	Company TEXT,
	Position TEXT,
	Prover TEXT
);
