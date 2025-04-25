SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college` (
  `collegeID` int(11) NOT NULL,
  `collegeName` varchar(200) NOT NULL COMMENT '课程名',
  PRIMARY KEY (`collegeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES ('1', '计算机学院');
INSERT INTO `college` VALUES ('2', '电子信息学院');
INSERT INTO `college` VALUES ('3', '机电工程学院');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `courseID` int(11) NOT NULL,
  `courseName` varchar(200) NOT NULL COMMENT '课程名称',
  `teacherID` int(11) NOT NULL,
  `courseTime` varchar(200) DEFAULT NULL COMMENT '开课时间',
  `classRoom` varchar(200) DEFAULT NULL COMMENT '开课地点',
  `courseWeek` int(200) DEFAULT NULL COMMENT '学时',
  `courseType` varchar(20) DEFAULT NULL COMMENT '课程类型',
  `collegeID` int(11) NOT NULL COMMENT '所属院系',
  `score` int(11) NOT NULL COMMENT '学分',
  PRIMARY KEY (`courseID`),
  KEY `collegeID` (`collegeID`),
  KEY `teacherID` (`teacherID`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`collegeID`) REFERENCES `college` (`collegeID`) ON DELETE CASCADE ON UPDATE CASCADE ,
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'C语言程序设计', '1111', '周二', '厚B607', '16', '必修课', '1', '3');
INSERT INTO `course` VALUES ('2', 'Python', '1111', '周四', '厚B605', '16', '必修课', '1', '3');
INSERT INTO `course` VALUES ('3', '数据结构', '1111', '周四', '厚B604', '16', '必修课', '1', '2');
INSERT INTO `course` VALUES ('4', 'Java程序设计', '2222', '周五', '厚B603', '16', '必修课', '1', '2');
INSERT INTO `course` VALUES ('5', '材料力学', '2222', '周四', '厚A607', '16', '必修课', '3', '2');
INSERT INTO `course` VALUES ('6', '通信工程', '3333', '周一', '厚A605', '16', '选修课', '2', '2');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleID` int(11) NOT NULL,
  `roleName` varchar(20) NOT NULL,
  `permissions` varchar(255) DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('0', 'admin', null);
INSERT INTO `role` VALUES ('1', 'teacher', null);
INSERT INTO `role` VALUES ('2', 'student', null);

-- ----------------------------
-- Table structure for selectedcourse
-- ----------------------------
DROP TABLE IF EXISTS `selectedcourse`;
CREATE TABLE `selectedcourse` (
  `courseID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `mark` int(11) DEFAULT NULL COMMENT '成绩',
  KEY `courseID` (`courseID`),
  KEY `studentID` (`studentID`),
  CONSTRAINT `selectedcourse_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE ,
  CONSTRAINT `selectedcourse_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of selectedcourse
-- ----------------------------
INSERT INTO `selectedcourse` VALUES ('2', '4506', '12');
INSERT INTO `selectedcourse` VALUES ('1', '4506', '95');
INSERT INTO `selectedcourse` VALUES ('1', '4507', '66');
INSERT INTO `selectedcourse` VALUES ('1', '4508', null);
INSERT INTO `selectedcourse` VALUES ('2', '4508', '99');
INSERT INTO `selectedcourse` VALUES ('5', '4506', null);
INSERT INTO `selectedcourse` VALUES ('3', '4506', null);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) NOT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `birthYear` date DEFAULT NULL COMMENT '出生日期',
  `grade` date DEFAULT NULL COMMENT '入学时间',
  `collegeID` int(11) NOT NULL COMMENT '院系id',
  PRIMARY KEY (`userID`),
  KEY `collegeID` (`collegeID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`collegeID`) REFERENCES `college` (`collegeID`)  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('4506', '小黄', '男', '2002-09-02', '2021-09-02', '1');
INSERT INTO `student` VALUES ('4507', '小米', '女', '2001-09-14', '2021-09-02', '3');
INSERT INTO `student` VALUES ('4508', '小陈', '女', '2002-09-02', '2021-09-02', '2');
INSERT INTO `student` VALUES ('4509', '小华', '男', '2002-09-02', '2021-09-02', '2');
INSERT INTO `student` VALUES ('4501', '小左', '女', '2002-09-02', '2021-09-02', '2');
INSERT INTO `student` VALUES ('4502', '小拉', '女', '2002-09-02', '2021-09-02', '1');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) NOT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `birthYear` date NOT NULL,
  `degree` varchar(20) DEFAULT NULL COMMENT '学历',
  `title` varchar(255) DEFAULT NULL COMMENT '职称',
  `grade` date DEFAULT NULL COMMENT '入职时间',
  `collegeID` int(11) NOT NULL COMMENT '院系',
  PRIMARY KEY (`userID`),
  KEY `collegeID` (`collegeID`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`collegeID`) REFERENCES `college` (`collegeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1111', '何老师', '男', '1990-01-01', '硕士', '副教授', '2010-09-02', '1');
INSERT INTO `teacher` VALUES ('2222', '侯老师', '男', '1990-01-01', '本科', '普通教师', '2010-09-02', '3');
INSERT INTO `teacher` VALUES ('3333', '李老师', '女', '1990-01-01', '硕士', '助教', '2010-07-07', '2');

-- ----------------------------
-- Table structure for userlogin
-- ----------------------------
DROP TABLE IF EXISTS `userlogin`;
CREATE TABLE `userlogin` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '2' COMMENT '角色权限',
  PRIMARY KEY (`userID`),
  KEY `role` (`role`),
  CONSTRAINT `userlogin_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`roleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlogin
-- ----------------------------
INSERT INTO `userlogin` VALUES ('1', 'admin', '123', '0');
INSERT INTO `userlogin` VALUES ('8', '4506', '123', '2');
INSERT INTO `userlogin` VALUES ('9', '4507', '123', '2');
INSERT INTO `userlogin` VALUES ('10', '4508', '123', '2');
INSERT INTO `userlogin` VALUES ('11', '4501', '123', '2');
INSERT INTO `userlogin` VALUES ('12', '4509', '123', '2');
INSERT INTO `userlogin` VALUES ('13', '4502', '123', '2');
INSERT INTO `userlogin` VALUES ('14', '1111', '123', '1');
INSERT INTO `userlogin` VALUES ('15', '2222', '123', '1');
INSERT INTO `userlogin` VALUES ('16', '3333', '123', '1');
SET FOREIGN_KEY_CHECKS=1;
-- ----------------------------
-- Table structure for studentinfo
-- ----------------------------
DROP TABLE IF EXISTS `studentinfo`;
CREATE TABLE `studentinfo` (
   `userID`      int(11) NOT NULL AUTO_INCREMENT,
   `userName`    varchar(200) NOT NULL,
   `sex`         varchar(20) DEFAULT NULL,
   `birthYear`   date DEFAULT NULL COMMENT '出生日期',
   `grade`       date DEFAULT NULL COMMENT '入学时间',
   `collegeID`   int(12) NOT NULL COMMENT '院系id',
   `phone`       varchar(11) NOT NULL COMMENT '电话号码',
   `nation`      varchar(200) NOT NULL COMMENT '名族',
   `postcode`    varchar(10) DEFAULT NULL COMMENT '邮政编码',
   `hometown`    varchar(200) NOT NULL COMMENT '籍贯',
    `language`   varchar(20) NOT NULL COMMENT '语言',
    `address`    varchar(200) NOT NULL COMMENT '家庭住址',
    `email`      varchar(50) NOT NULL COMMENT '电子邮箱',
   PRIMARY KEY (`userID`),
   KEY `collegeID` (`collegeID`),
   CONSTRAINT `studentinfo_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `student` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE ,
   CONSTRAINT `studentinfo_ibfk_2` FOREIGN KEY (`collegeID`) REFERENCES `college` (`collegeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentinfo
-- ----------------------------
INSERT INTO `studentinfo` VALUES ('4506', '小黄', '男', '2002-09-02', '2021-09-02', '1','15360184889','汉族','527300','广东中山','中文','学院路12栋','17507662339@163.com');
INSERT INTO `studentinfo` VALUES ('4507', '小米', '女', '2001-09-14', '2021-09-02', '3','15360184889','汉族','527300','广东中山','中文','学院路12栋','gtx10086@qq.com');
INSERT INTO `studentinfo` VALUES ('4508', '小陈', '女', '2002-09-02', '2021-09-02', '2','15360184889','汉族','527300','广东中山','中文','学院路12栋','gtx10086@qq.com');
INSERT INTO `studentinfo` VALUES ('4509', '小强', '男', '2002-09-02', '2021-09-02', '2','15360184889','汉族','527300','广东中山','中文','学院路12栋','gtx10086@qq.com');
INSERT INTO `studentinfo` VALUES ('4501', '小冯', '女', '2002-09-02', '2021-09-02', '2','15360184889','汉族','527300','广东中山','中文','学院路12栋','gtx10086@qq.com');
INSERT INTO `studentinfo` VALUES ('4502', '小詹', '女', '2002-09-02', '2021-09-02', '1','15360184889','汉族','527300','广东中山','中文','学院路12栋','gtx10086@qq.com');