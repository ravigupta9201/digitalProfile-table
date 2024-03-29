
create table tbl_VocationalTrainingOrSkill 
(
VocationalId                int not null identity(1,1) primary key,	
OrderNo                     int not null,
Code                        nvarchar(254),
TrainingSubjectName         nvarchar(254), 
TrainingAreasName           nvarchar(254), 
Status              bit not null,

CreateBy             int not null constraint fk_VocationalTrainingOrSkill_CreateBy foreign key references tbl_User(UserId),
ModifyBy                 int null constraint fk_VocationalTrainingOrSkill_ModifyBy foreign key references tbl_User(UserId),
UpdateLogDateTime        datetime,
LogDateTime              datetime not null default current_timestamp
)
 
GO






INSERT INTO tbl_VocationalTrainingOrSkill (OrderNo, Code, TrainingSubjectName, TrainingAreasName , Status , CreateBy, UpdateLogDateTime)
VALUES 
(1, 'VT001' , N'मेसन ',         N'निर्माण क्षेत्र ',1, 1, GETDATE()),
(2, 'VT002' , N'स्काफोल्डिङ्ग ',         N'निर्माण क्षेत्र ', 1 , 1, GETDATE()),
(3, 'VT003' , N'सटरिङ्ग कार्पेन्ट',          N'निर्माण क्षेत्र', 1, 1, GETDATE()),
(4, 'VT004' , N'स्टिल फिक्स्चर ',           N'निर्माण क्षेत्र ', 1 , 1, GETDATE()),


(5, 'VT005' , N'पशु स्वास्थ्य कार्यकर्ता',                N'कृषि क्षेत्र', 1, 1, GETDATE()),
(6, 'VT006' , N'कृषि कार्यकता ',                  N'कृषि क्षेत्र ', 1 , 1, GETDATE()),
(7, 'VT007' , N'तरकारी खेती ',               N'कृषि क्षेत्र ', 1, 1, GETDATE()),
(8, 'VT008' , N'नगदे बाली ',                N'कृषि क्षेत्र ', 1 , 1, GETDATE()),
(9, 'VT009' , N'कृषिजन्य पदार्थको प्रशोधन ',     N'कृषि क्षेत्र ', 1, 1, GETDATE()),
(10, 'VT010' , N'खाद्य सामाग्री उत्पादन ' ,      N'कृषि क्षेत्र  ',1, 1, GETDATE()),
(11, 'VT011' , N'च्याउ खेती',                N'कृषि क्षेत्र', 1 , 1, GETDATE()),
(12, 'VT012' , N'मौरी पालन',                N'कृषि क्षेत्र', 1, 1, GETDATE()),
(13, 'VT013' , N'बंगुर पालन ',                  N'कृषि क्षेत्र ', 1 , 1, GETDATE()),
(14, 'VT014' , N'कुखुरा पालन ',                  N'कृषि क्षेत्र ', 1 , 1, GETDATE()),
(15, 'VT015' , N'जडिबुटी खेती ',                  N'कृषि क्षेत्र',1, 1, GETDATE()),
(16, 'VT016' , N'जडिबुटी प्रशोधन',                N'कृषि क्षेत्र', 1 , 1, GETDATE()),


(17, 'VT017' , N'अल्लो प्रशोधन ',                 N'कृषि क्षेत्र ', 1 , 1, GETDATE()),
(18, 'VT018' , N'हाते कागज निर्माण ',             N'कृषि क्षेत्र ', 1 , 1, GETDATE()),

(19, 'VT019' , N'प्लम्बिङ्ग ',                            N'सेवा क्षेत्र ', 1 , 1, GETDATE()),
(20, 'VT020' , N'विधुत जडान  ',                        N'सेवा क्षेत्र  ',1, 1, GETDATE()),
(21, 'VT021' , N'अटोमेकानिक्स ',                         N'सेवा क्षेत्र', 1 , 1, GETDATE()),
(22, 'VT022' , N'मोटरसाइकल मर्मत',                         N'सेवा क्षेत्र', 1, 1, GETDATE()),
(23, 'VT023' , N'ब्यूटी पार्लर ',                            N'सेवा क्षेत्र ', 1 , 1, GETDATE()),
(24, 'VT024' , N'सेक्युरिटी गाड  ',                       N'सेवा क्षेत्र  ',1, 1, GETDATE()),
(25, 'VT025' , N'ड्राईभिङ्ग',                               N'सेवा क्षेत्र', 1 , 1, GETDATE()),
(26, 'VT026' , N'केयर गिभर',                                N'सेवा क्षेत्र', 1, 1, GETDATE()),
(27, 'VT027' , N'जनरल  मेकानिक्स्  ' ,                         N'सेवा क्षेत्र',1, 1, GETDATE()),
(28, 'VT028' , N'वेल्डिङ्ग',                                  N'सेवा क्षेत्र', 1 , 1, GETDATE()),
(29, 'VT029' , N'पम्पसेट  मेकानिक्स् ',                          N'सेवा क्षेत्र', 1, 1, GETDATE()),
(30, 'VT030' , N'इलेक्ट्रोनिक्स्मर्मत (मोबाइल, टि.भि. आदि)  ',        N'सेवा क्षेत्र ', 1 , 1, GETDATE()),
(31, 'VT031' , N'कम्प्युटर, इन्भर्टर निर्माण, मर्मत  ',                 N'सेवा क्षेत्र ',1, 1, GETDATE()),
(32, 'VT032' , N'सेक्रेटरी ' ,                                   N'सेवा क्षेत्र', 1 , 1, GETDATE()),

(33 , 'VT033' , N'थाङ्का',                              N'कला क्षेत्र', 1, 1, GETDATE()),
(34 , 'VT034' , N'मूर्तिकला  ',                              N'कला क्षेत्र  ',1, 1, GETDATE()),
(35 , 'VT035' , N'वेतबाँस',                                 N'कला क्षेत्र', 1 , 1, GETDATE()),
(36 , 'VT036' , N'मिथिला पेन्टिङ्ग',                                N'कला क्षेत्र', 1, 1, GETDATE()),
(37 , 'VT037' , N'वुड कार्भिङ्ग ',                                N'कला क्षेत्र ', 1 , 1, GETDATE()),
(38 , 'VT038' , N'स्टोन कार्भिङ्ग',                                N'कला क्षेत्र ', 1 , 1, GETDATE()),
(39 , 'VT039' , N'छवाली कला ',                              N'कला क्षेत्र ', 1 , 1, GETDATE()),
(40 , 'VT040' , N'कपडामा जरी भर्ने र पेण्टिङ्ग गर्ने ',                              N'कला क्षेत्र ', 1 , 1, GETDATE()),
(41 , 'VT041' , N'माला, थैली, पर्स बनाउन',                                 N'कला क्षेत्र', 1 , 1, GETDATE()),
(42 , 'VT042' , N'पेन्टिङ्ग',                                               N'कला क्षेत्र', 1, 1, GETDATE()),
(43 , 'VT043' , N'फोटो फ्रेम लेमिनेशन ',                                N'कला क्षेत्र ', 1 , 1, GETDATE()),
(44 , 'VT044' , N'पोते माला ',                                        N'कला क्षेत्र', 1 , 1, GETDATE()),
(45 , 'VT045' , N'सजावटका सामान उत्पादन गर्ने  ',                                N'कला क्षेत्र ', 1 , 1, GETDATE()),

(46 , 'VT046' , N'कुक',                           N'पर्यटन क्षेत्र', 1 , 1, GETDATE()),
(47 , 'VT047' , N'वेटर /वेट्रेस',                            N'पर्यटन क्षेत्र', 1, 1, GETDATE()),
(48 , 'VT048' , N'हाउस किपिङ्ग ',                            N'पर्यटन क्षेत्र ', 1 , 1, GETDATE()),
(49 , 'VT049' , N'केयर गिभर ',                             N'पर्यटन क्षेत्र ', 1 , 1, GETDATE()),
(50 , 'VT050' , N'हाउस मेड ',                          N'पर्यटन क्षेत्र ', 1 , 1, GETDATE()),
(51 , 'VT051' , N'बार मैन',                            N'पर्यटन क्षेत्र', 1 , 1, GETDATE()),
(52 , 'VT052' , N'सेल्स पर्सन',                             N'पर्यटन क्षेत्र', 1, 1, GETDATE()),
(53 , 'VT053' , N'फ्रन्ट अफिस म्यानेजमेन्ट ',                            N'पर्यटन क्षेत्र ', 1 , 1, GETDATE()),

(54 , 'VT054' , N'सिलाई कटाई  ',                    N'होजियारी तथा तयारी पोशाक ', 1 , 1, GETDATE()),
(55 , 'VT055' , N'ढाका बुनाई ',                  N'होजियारी तथा तयारी पोशाक ', 1 , 1, GETDATE()),
(56 , 'VT056' , N'गार्मेण्ट्स',                   N'होजियारी तथा तयारी पोशाक', 1 , 1, GETDATE()),
(57 , 'VT057' , N'गलैंचा',                  N'होजियारी तथा तयारी पोशाक', 1, 1, GETDATE()),
(58 , 'VT058' , N'राडी पाखी बुनाइ ',                   N'होजियारी तथा तयारी पोशाक ', 1 , 1, GETDATE()),
(59 , 'VT059' , N'इम्ब्रोईडरी ',                     N'होजियारी तथा तयारी पोशाक ', 1 , 1, GETDATE()),
(60 , 'VT060' , N'फेशन डिजाईन',                     N'होजियारी तथा तयारी पोशाक', 1 , 1, GETDATE()),
(61 , 'VT061' , N'बक्रम बनाउने ',                   N'होजियारी तथा तयारी पोशाक', 1, 1, GETDATE()),


(62 , 'VT062' , N'कुकिज ',             N'खाद्य सामाग्री प्रशोधन ', 1 , 1, GETDATE()),
(63 , 'VT063' , N'पउरोटी ',            N'खाद्य सामाग्री प्रशोधन ', 1 , 1, GETDATE()),
(64 , 'VT064' , N'जुस',           N'खाद्य सामाग्री प्रशोधन', 1 , 1, GETDATE()),
(65 , 'VT065' , N'बिस्कुट',             N'खाद्य सामाग्री प्रशोधन', 1, 1, GETDATE()),
(66 , 'VT066' , N'अचार ',             N'खाद्य सामाग्री प्रशोधन ', 1 , 1, GETDATE()),
(67 , 'VT067' , N'सस ',          N'खाद्य सामाग्री प्रशोधन ', 1 , 1, GETDATE()),
(68 , 'VT068' , N'वारिष्ट्रा ',           N'खाद्य सामाग्री प्रशोधन ', 1 , 1, GETDATE()),

(69 , 'VT069' , N'मैनबत्ती ',               N'अन्य क्षेत्र', 1 , 1, GETDATE()),
(70 , 'VT070' , N'अगरबत्ती',               N'अन्य क्षेत्र', 1, 1, GETDATE()),
(71 , 'VT071' , N'खाम बनाउने ',                 N'अन्य क्षेत्र ', 1 , 1, GETDATE()),
(72 , 'VT072' , N'विक्रेट निर्माण ',               N'अन्य क्षेत्र ', 1 , 1, GETDATE()),
(73 , 'VT073' , N'प्लाष्टिक मोल्डिङ्ग ',                 N'अन्य क्षेत्र ', 1 , 1, GETDATE()),
(74 , 'VT074' , N'बुक बाईण्डिङ्ग',                N'अन्य क्षेत्र', 1 , 1, GETDATE()),
(75 , 'VT075' , N'अन्य',              N'अन्य क्षेत्र', 1, 1, GETDATE());



GO