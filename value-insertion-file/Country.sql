
create table tbl_Country
(
CountryId                int not null identity(1,1) primary key,	
OrderNo             int not null,
Code                nvarchar(254),
CountryName          nvarchar(254),
Status              bit not null,

CreateBy             int not null constraint fk_Country_CreateBy foreign key references tbl_User(UserId),
ModifyBy                 int null constraint fk_Country_ModifyBy foreign key references tbl_User(UserId),
UpdateLogDateTime        datetime,
LogDateTime              datetime not null default current_timestamp
)
 
GO



INSERT INTO tbl_DistrictList (OrderNo, Code, CountryName , Status , CreateBy, UpdateLogDateTime)
VALUES 
(1, 'CN001' , N'अजरबैजान', 1, 1, GETDATE()),
(2, 'CN002' , N'नाइजर', 1 , 1, GETDATE()),
(3, 'CN003' , N'नाइजेरिया', 1 , 1, GETDATE()),
(4, 'CN004' , N'निकारागुवा', 1 , 1, GETDATE()),
(5, 'CN005' , N'नेदरल्याण्ड', 1 , 1, GETDATE()),
(6, 'CN006' , N'नर्वे', 1 , 1, GETDATE()),
(7, 'CN007' , N'नेपाल', 1 , 1, GETDATE()),
(8, 'CN008' , N'न्यूजिल्याण्ड', 1 , 1, GETDATE()),
(9, 'CN009' , N'अनुमोज', 1 , 1, GETDATE()),


(10, 'CN010' , N'पनामा', 1, 1, GETDATE()),
(11, 'CN011' , N'पेरु', 1 , 1, GETDATE()),
(12, 'CN012' , N'बोस्निया', 1 , 1, GETDATE()),
(13, 'CN013' , N'फिलिपिन्स', 1 , 1, GETDATE()),
(14, 'CN014' , N'पाकिस्तान', 1 , 1, GETDATE()),
(15, 'CN015' , N'पोल्याण्ड', 1 , 1, GETDATE()),
(16, 'CN016' , N'पोर्चुगल', 1 , 1, GETDATE()),
(17, 'CN017' , N'नाइजेरीया', 1 , 1, GETDATE()),
(18, 'CN018' , N'पोर्टोरिको', 1 , 1, GETDATE()),
(19, 'CN019' , N'पाराग्वे', 1 , 1, GETDATE()),


(20, 'CN020' , N'कतार', 1, 1, GETDATE()),
(21, 'CN021' , N'इन्टरपोल', 1 , 1, GETDATE()),
(22, 'CN022' , N'रोमानिया', 1 , 1, GETDATE()),
(23, 'CN023' , N'बंगलादेश', 1 , 1, GETDATE()),
(24, 'CN024' , N'रूस', 1 , 1, GETDATE()),
(25, 'CN025' , N'साउदी अरेबिया', 1 , 1, GETDATE()),
(26, 'CN026' , N'सेसेल्स', 1 , 1, GETDATE()),
(27, 'CN027' , N'सुडान', 1 , 1, GETDATE()),
(28, 'CN028' , N'स्वीडेन', 1 , 1, GETDATE()),
(29, 'CN029' , N'सिंगापुर', 1 , 1, GETDATE()),


(30, 'CN030' , N'सियरा लियोन', 1, 1, GETDATE()),
(31, 'CN031' , N'सानमारिनो', 1 , 1, GETDATE()),
(32, 'CN032' , N'सेनेगल', 1 , 1, GETDATE()),
(33, 'CN033' , N'सोमालिया', 1 , 1, GETDATE()),
(34, 'CN034' , N'बेल्जियम', 1 , 1, GETDATE()),
(35, 'CN035' , N'सिरिया', 1 , 1, GETDATE()),
(36, 'CN036' , N'चाड', 1 , 1, GETDATE()),
(37, 'CN037' , N'टोगो', 1 , 1, GETDATE()),
(38, 'CN038' , N'थाइल्याण्ड', 1 , 1, GETDATE()),
(39, 'CN039' , N'ताजिकस्तान', 1 , 1, GETDATE()),



(40, 'CN040' , N'टोक्यो', 1, 1, GETDATE()),
(41, 'CN041' , N'ट्युनिसिया', 1 , 1, GETDATE()),
(42, 'CN042' , N'टोडगा', 1 , 1, GETDATE()),
(43, 'CN043' , N'पुर्वी टिमोर', 1 , 1, GETDATE()),
(44, 'CN044' , N'टर्की', 1 , 1, GETDATE()),
(45, 'CN045' , N'बुल्गेरिया', 1 , 1, GETDATE()),
(46, 'CN046' , N'ताइवान', 1 , 1, GETDATE()),
(47, 'CN047' , N'तान्जानिया', 1 , 1, GETDATE()),
(48, 'CN048' , N'इङ्गल्याण्ड', 1 , 1, GETDATE()),
(49, 'CN049' , N'युक्रेन', 1 , 1, GETDATE()),



(50, 'CN050' , N'युगान्डा', 1, 1, GETDATE()),
(51, 'CN051' , N'संयुक्त राष्ट्र संघ', 1 , 1, GETDATE()),
(52, 'CN052' , N'रसिया', 1 , 1, GETDATE()),
(53, 'CN053' , N'संयुक्त राज्य अमेरिका', 1 , 1, GETDATE()),
(54, 'CN054' , N'उरुग्वे', 1 , 1, GETDATE()),
(55, 'CN055' , N'उज्वेकिस्तान', 1 , 1, GETDATE()),
(56, 'CN056' , N'बहराईन', 1 , 1, GETDATE()),
(57, 'CN057' , N'भ्याटिकन सिटी', 1 , 1, GETDATE()),
(58, 'CN058' , N'भेनेजुएला', 1 , 1, GETDATE()),
(59, 'CN059' , N'भियतनाम', 1 , 1, GETDATE()),




(60, 'CN060' , N'भानुआटा', 1, 1, GETDATE()),
(61, 'CN061' , N'वेल्स', 1 , 1, GETDATE()),
(62, 'CN062' , N'पश्चमी समोआ', 1 , 1, GETDATE()),
(63, 'CN063' , N'यमन', 1 , 1, GETDATE()),
(64, 'CN064' , N'टोकियो', 1 , 1, GETDATE()),
(65, 'CN065' , N'युगोस्लाभिया', 1 , 1, GETDATE()),
(66, 'CN066' , N'दक्षिण अफ्रिका', 1 , 1, GETDATE()),
(67, 'CN067' , N'बुरुन्डी', 1 , 1, GETDATE()),
(68, 'CN068' , N'जाम्बिया', 1 , 1, GETDATE()),
(69, 'CN069' , N'जायर', 1 , 1, GETDATE()),



(70, 'CN070' , N'जिम्बावे', 1, 1, GETDATE()),
(71, 'CN071' , N'कोसोभो', 1 , 1, GETDATE()),
(72, 'CN072' , N'नेपाल', 1 , 1, GETDATE()),
(73, 'CN073' , N'ब्रुनाई', 1 , 1, GETDATE()),
(74, 'CN074' , N'बोलिभिया', 1 , 1, GETDATE()),
(75, 'CN075' , N'ब्राजिल', 1 , 1, GETDATE()),
(76, 'CN076' , N'संयुक्त अरब ईमिरेट्स', 1 , 1, GETDATE()),
(77, 'CN077' , N'बहामास', 1 , 1, GETDATE()),
(78, 'CN078' , N'भुटान', 1 , 1, GETDATE()),
(79, 'CN079' , N'बोत्स्वाना', 1 , 1, GETDATE()),



(80, 'CN080' , N'बेलारुस', 1, 1, GETDATE()),
(81, 'CN081' , N'क्यानडा', 1 , 1, GETDATE()),
(82, 'CN082' , N'कम्बोडीया', 1 , 1, GETDATE()),
(83, 'CN083' , N'कंगो', 1 , 1, GETDATE()),
(84, 'CN084' , N'स्विट्जरल्याण्ड', 1 , 1, GETDATE()),
(85, 'CN085' , N'क्रोएसिया', 1 , 1, GETDATE()),
(86, 'CN086' , N'चिली', 1 , 1, GETDATE()),
(87, 'CN087' , N'अफ्गानिस्तान', 1 , 1, GETDATE()),
(88, 'CN088' , N'क्यामरुन', 1 , 1, GETDATE()),
(89, 'CN089' , N'चीन', 1 , 1, GETDATE()),


(90, 'CN090' , N'कोलम्बीया', 1, 1, GETDATE()),
(91, 'CN091' , N'कोष्टारिका', 1 , 1, GETDATE()),
(92, 'CN092' , N'क्युवा', 1 , 1, GETDATE()),
(93, 'CN093' , N'साईप्रस', 1 , 1, GETDATE()),
(94, 'CN094' , N'चेकोस्लोभाकिया', 1 , 1, GETDATE()),
(95, 'CN095' , N'जर्मनी', 1 , 1, GETDATE()),
(96, 'CN096' , N'दुवैई', 1 , 1, GETDATE()),
(97, 'CN097' , N'डेनमार्क', 1 , 1, GETDATE()),
(98, 'CN098' , N'अल्बानिया', 1 , 1, GETDATE()),
(99, 'CN099' , N'डोमिनीका', 1 , 1, GETDATE()),


(100, 'CN100' , N'अल्जेरिया', 1, 1, GETDATE()),
(101, 'CN101' , N'इक्वेडर', 1 , 1, GETDATE()),
(102, 'CN102' , N'इजिप्ट', 1 , 1, GETDATE()),
(103, 'CN103' , N'स्पेन', 1 , 1, GETDATE()),
(104, 'CN104' , N'इथियोपिया', 1 , 1, GETDATE()),
(105, 'CN105' , N'फिन्ल्याण्ड', 1 , 1, GETDATE()),
(106, 'CN106' , N'फिजी', 1 , 1, GETDATE()),
(107, 'CN107' , N'फ्रान्स', 1 , 1, GETDATE()),
(108, 'CN108' , N'संयुक्त अधिराज्य बेलायत', 1 , 1, GETDATE()),
(109, 'CN109' , N'अर्मेनिया', 1 , 1, GETDATE()),



(110, 'CN110' , N'घाना', 1, 1, GETDATE()),
(111, 'CN111' , N'गाम्बिया', 1 , 1, GETDATE()),
(112, 'CN112' , N'गिनी', 1 , 1, GETDATE()),
(113, 'CN113' , N'ग्रीस', 1 , 1, GETDATE()),
(114, 'CN114' , N'ग्वाटेमाला', 1 , 1, GETDATE()),
(115, 'CN115' , N'हङकङ', 1 , 1, GETDATE()),
(116, 'CN116' , N'हवाई', 1 , 1, GETDATE()),
(117, 'CN117' , N'हाईटी', 1 , 1, GETDATE()),
(118, 'CN118' , N'हङ्गेरि', 1 , 1, GETDATE()),
(119, 'CN119' , N'ईण्डोनेसिया', 1 , 1, GETDATE()),



(120, 'CN120' , N'अङ्गोला', 1, 1, GETDATE()),
(121, 'CN121' , N'आयरल्याण्ड रिपब्लीक', 1 , 1, GETDATE()),
(122, 'CN122' , N'ईजरायल', 1 , 1, GETDATE()),
(123, 'CN123' , N'भारत', 1 , 1, GETDATE()),
(124, 'CN124' , N'इराक', 1 , 1, GETDATE()),
(125, 'CN125' , N'ईरान', 1 , 1, GETDATE()),
(126, 'CN126' , N'आईसल्याण्ड', 1 , 1, GETDATE()),
(127, 'CN127' , N'ईटाली', 1 , 1, GETDATE()),
(128, 'CN128' , N'जमैका', 1 , 1, GETDATE()),
(129, 'CN129' , N'जोर्डन', 1 , 1, GETDATE()),



(130, 'CN130' , N'जापान', 1, 1, GETDATE()),
(131, 'CN131' , N'अर्जेन्टिना', 1 , 1, GETDATE()),
(132, 'CN132' , N'केन्या', 1 , 1, GETDATE()),
(133, 'CN133' , N'कम्बोडिया', 1 , 1, GETDATE()),
(134, 'CN134' , N'उत्तर कोरिया', 1 , 1, GETDATE()),
(135, 'CN135' , N'दक्षिण कोरिया', 1 , 1, GETDATE()),
(136, 'CN136' , N'काठमाडौं', 1 , 1, GETDATE()),
(137, 'CN137' , N'कुवेत', 1 , 1, GETDATE()),
(138, 'CN138' , N'काजकस्तान', 1 , 1, GETDATE()),
(139, 'CN139' , N'अष्ट्रिया', 1 , 1, GETDATE()),


(140, 'CN140' , N'लेवनान', 1, 1, GETDATE()),
(141, 'CN141' , N'हर्जगोभिना', 1 , 1, GETDATE()),
(142, 'CN142' , N'अष्ट्रेलिया', 1 , 1, GETDATE()),
(143, 'CN143' , N'श्रीलंका', 1 , 1, GETDATE()),
(144, 'CN144' , N'लाईबेरिया', 1 , 1, GETDATE()),
(145, 'CN145' , N'लिसोथो', 1 , 1, GETDATE()),
(146, 'CN146' , N'लक्जेम्वर्ग', 1 , 1, GETDATE()),
(147, 'CN147' , N'लियोन', 1 , 1, GETDATE()),
(148, 'CN148' , N'लिबिया', 1 , 1, GETDATE()),
(149, 'CN149' , N'मोरक्को', 1 , 1, GETDATE()),



(150, 'CN150' , N'मोनाको', 1, 1, GETDATE()),
(151, 'CN151' , N'माडागास्कर', 1 , 1, GETDATE()),
(152, 'CN152' , N'माली', 1 , 1, GETDATE()),
(153, 'CN153' , N'अरुबा', 1 , 1, GETDATE()),
(154, 'CN154' , N'म्यानमार', 1 , 1, GETDATE()),
(155, 'CN155' , N'मंगोलिया', 1 , 1, GETDATE()),
(156, 'CN156' , N'मकाउ', 1 , 1, GETDATE()),
(157, 'CN157' , N'माल्टा', 1 , 1, GETDATE()),
(158, 'CN158' , N'मौरीसस', 1 , 1, GETDATE()),
(159, 'CN159' , N'माल्दिभ्स', 1 , 1, GETDATE()),



(160, 'CN160' , N'मेक्सिको', 1, 1, GETDATE()),
(161, 'CN161' , N'मलेशिया', 1 , 1, GETDATE()),
(162, 'CN162' , N'मोजाम्बिक', 1 , 1, GETDATE()),
(163, 'CN163' , N'नामीबिया', 1 , 1, GETDATE());


GO