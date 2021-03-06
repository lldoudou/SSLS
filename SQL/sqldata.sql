CREATE DATABASE SSLS
USE [SSLS]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/24/2016 20:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([Id], [Code], [Name], [Description]) VALUES (6, N'1001', N'教育', N'教育')
INSERT [dbo].[Category] ([Id], [Code], [Name], [Description]) VALUES (7, N'1002', N'小说', N'小说')
INSERT [dbo].[Category] ([Id], [Code], [Name], [Description]) VALUES (8, N'1003', N'文艺', N'文艺')
INSERT [dbo].[Category] ([Id], [Code], [Name], [Description]) VALUES (9, N'1004', N'青春', N'青春')
INSERT [dbo].[Category] ([Id], [Code], [Name], [Description]) VALUES (10, N'1005', N'童书', N'童书')
INSERT [dbo].[Category] ([Id], [Code], [Name], [Description]) VALUES (11, N'1006', N'人文社科', N'人文社科')
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[Borrow]    Script Date: 10/24/2016 20:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrow](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BorrowDate] [datetime] NOT NULL,
	[ReturnDate] [datetime] NOT NULL,
	[ShouldReturnDate] [datetime] NOT NULL,
	[Reader_Id] [int] NOT NULL,
	[Renew] [bit] NOT NULL,
 CONSTRAINT [PK_Borrow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reader]    Script Date: 10/24/2016 20:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reader](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Reader] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Reader] ON
INSERT [dbo].[Reader] ([Id], [Email], [Password], [Balance], [Name]) VALUES (1, N'123456789@126.com', N'123456', CAST(100.00 AS Decimal(18, 2)), N'小明')
INSERT [dbo].[Reader] ([Id], [Email], [Password], [Balance], [Name]) VALUES (2, N'123456789@qq.com', N'123456', CAST(200.00 AS Decimal(18, 2)), N'小红')
INSERT [dbo].[Reader] ([Id], [Email], [Password], [Balance], [Name]) VALUES (3, N'123456789@163.com', N'123456', CAST(300.00 AS Decimal(18, 2)), N'小刚')
SET IDENTITY_INSERT [dbo].[Reader] OFF
/****** Object:  Table [dbo].[Fine]    Script Date: 10/24/2016 20:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Borrow_Id] [int] NOT NULL,
	[FineMoney] [decimal](18, 2) NOT NULL,
	[FineDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Fine_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 10/24/2016 20:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Authors] [nvarchar](100) NOT NULL,
	[Press] [nvarchar](100) NOT NULL,
	[ImageUrl] [nvarchar](1000) NULL,
	[Description] [nvarchar](2000) NULL,
	[PublishDate] [datetime] NULL,
	[Price] [decimal](18, 2) NULL,
	[Status] [nvarchar](100) NULL,
	[Category_Id] [int] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (2, N'1001', N'经济学原理 （第7版）', N'（美）曼昆', N'北京大学出版社', N'1.jpg', N'哈佛大学曼昆教授扛鼎之作，广受欢迎的经济学入门读物，带你迈进经济学的殿堂！', CAST(0x0000A48B00000000 AS DateTime), CAST(89.60 AS Decimal(18, 2)), N'在库', 6)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (5, N'1002', N'刑法学（第五版 上下册）', N'张明楷', N'法律出版社', N'2.jpg', N'张明楷教授代表作，新增刑九相关内容，增删、修改与全新阐释犯罪论、法律后果论、罪刑各论等方面的诸多重大问题', CAST(0x0000A63600000000 AS DateTime), CAST(88.00 AS Decimal(18, 2)), N'在库', 6)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (7, N'1003', N'心理学基础课系列教材:普通心理学(第4版)', N'彭聃龄', N'北京师范大学出版社', N'3.jpg', N'新世纪高等学校教材 心理学基础课系列教材:普通心理学(第4版)', CAST(0x0000A04400000000 AS DateTime), CAST(43.20 AS Decimal(18, 2)), N'在库', 6)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (9, N'1004', N'管理学（第11版）（工商管理经典译丛）', N'斯蒂芬P罗宾斯，玛丽库尔特 ', N'中国人民大学出版社', N'4.jpg', N'管理应该回归它的本源，且不要为自己的愚昧寻找所谓的“盲人摸象”的开脱。管理没有什么丛林，那只是我们思考管理的一个方法或方式。', CAST(0x0000A06300000000 AS DateTime), CAST(44.30 AS Decimal(18, 2)), N'在库', 6)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (10, N'1005', N'Java编程思想（第4版）', N'[美] Bruce Eckel', N'机械工业出版社', N'5.jpg', N'Java学习必读经典,殿堂级著作！赢得了全球程序员的广泛赞誉。', CAST(0x0000994000000000 AS DateTime), CAST(70.20 AS Decimal(18, 2)), N'在库', 6)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (12, N'1006', N'西方经济学（微观部分·第六版）', N'高鸿业', N'中国人民大学出版社', N'6.jpg', N'本书是国家教育部组织统编的高校《西方经济学》教科书，多年来已经成为国内最为流行的“西方经济学”教材之一，也是绝大多数高等院校经管类研究生入学考试的指定参考书。', CAST(0x0000A35B00000000 AS DateTime), CAST(26.00 AS Decimal(18, 2)), N'在库', 6)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (24, N'1007', N'高等数学同济七版', N'同济大学数学系', N'高等教育出版社,水利水电出版社', N'7.jpg', N'高等数学同济七版 高等数学教材上下册 同步辅导及习题全解 全套4本 同济大学第七版 高等教育出版社 考研数学教材全解 高等数学同济7版', CAST(0x0000A35B00000000 AS DateTime), CAST(88.00 AS Decimal(18, 2)), N'在库', 6)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (25, N'1008', N'内科学 第8版', N'葛均波，徐永健', N'人民卫生出版社', N'8.jpg', N'内科学 第8版——本科临床十二五规划教材 人卫八版', CAST(0x0000A17400000000 AS DateTime), CAST(76.10 AS Decimal(18, 2)), N'在库', 6)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (26, N'1009', N'巨人的陨落', N'[英]肯·福莱特(Ken Follett )', N'江苏文艺出版社', N'9.jpg', N'（全球读者平均3个通宵读完的超级巨著。全球每三秒卖出一本！十年来，横扫欧美16国排行榜的超级小说。碾压全球畅销榜的伟大故事，18次登上10国畅销榜第1名！首次登陆中国！）读客出品', CAST(0x0000A5DB00000000 AS DateTime), CAST(89.50 AS Decimal(18, 2)), N'在库', 7)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (27, N'1010', N'假面饭店', N'东野圭吾', N'南海出版公司', N'10.jpg', N'东野圭吾出道25周年纪念作品！全新译本。富丽堂皇的五星级大饭店，难解的连环杀人案即将在此展开。', CAST(0x0000A67400000000 AS DateTime), CAST(28.70 AS Decimal(18, 2)), N'在库', 7)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (28, N'1011', N'钓鱼的男孩', N'奇戈希·奥比奥玛', N'湖南文艺出版社', N'11.jpg', N'所有时代的写给男人的好书——ＧＱ杂志。令人伤痛却终获救赎的成长故事，媲美《追风筝的人》。入围布克奖，被《纽约时报》等17家媒体评为年度best of the year。', CAST(0x0000A67400000000 AS DateTime), CAST(24.80 AS Decimal(18, 2)), N'在库', 7)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (29, N'1012', N'单恋（2016版）', N'【日】东野圭吾', N'南海出版公司', N'12.jpg', N'东野圭吾令人动容的长篇小说杰作，质疑世俗评判标准，关怀现代人焦虑不安的灵魂。和自己真正达成和解，这一生才能活得心安。随书附赠《鬼的足音》1本', CAST(0x0000A65500000000 AS DateTime), CAST(35.70 AS Decimal(18, 2)), N'在库', 7)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (30, N'1013', N'黑锅：我和罪犯玩命的日子', N'常书欣', N'江苏人民出版社', N'13.jpg', N'《余罪》作者常书欣全新力作！故事、人物、场景热血升级！更残酷！更真实！首印数破纪录！下一部现象级畅销书！口碑更胜一筹！在每一个改编自真实案件的故事背后，感受残酷的警匪交锋和人性挣扎！', CAST(0x0000A67400000000 AS DateTime), CAST(30.60 AS Decimal(18, 2)), N'在库', 7)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (31, N'1014', N'岛上书店', N'同道大叔', N'江苏文艺出版社', N'14.jpg', N'（现象级全球畅销书！一年内畅销全球30国！2014感动全球千万读者的阳光治愈小说！美国独立书商选书第1名！美国图书馆推荐阅读第1名！每个人的生命中，都有超艰难的那一年，将人生变得美好而辽阔）读客出品', CAST(0x0000A67400000000 AS DateTime), CAST(24.10 AS Decimal(18, 2)), N'在库', 7)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (32, N'1015', N'羊脂球', N'莫泊桑', N'北京联合出版公司', N'15.jpg', N'本书是19世纪法国现实主义文学代表作家莫泊桑的短篇小说精选集，收录了 《羊脂球》《项链》等27篇短篇小说。', CAST(0x0000A69200000000 AS DateTime), CAST(24.70 AS Decimal(18, 2)), N'在库', 7)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (35, N'1016', N'地狱', N'丹.布朗', N'人民文学出版社', N'16.jpg', N'根据《地狱》拍摄的、汤姆?汉克斯主演电影《但丁密码》将于10月28日在国内上映', CAST(0x0000A6B100000000 AS DateTime), CAST(33.20 AS Decimal(18, 2)), N'在库', 7)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (36, N'1017', N'人生最美是清欢', N'林清玄', N'北京十月文艺出版社', N'17.jpg', N'（在复杂的世界里，做一个简单的人，以清静心看世界，以欢喜心过生活。首次手绘古风配图，精美四色印刷，附赠作者亲笔题字书签！）', CAST(0x0000A5BC00000000 AS DateTime), CAST(42.10 AS Decimal(18, 2)), N'在库', 8)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (40, N'1018', N'在人群中消失的日子', N'沈熹微', N'人民文学出版社', N'18.jpg', N'作家沈熹微记录日常、人情、心事的生活美学笔记。人总要沉下心来过一段宁静自省的日子，整理自己。', CAST(0x0000A69200000000 AS DateTime), CAST(25.20 AS Decimal(18, 2)), N'在库', 8)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (41, N'1019', N'我明白你会来，所以我等', N'沈从文', N'江苏文艺出版社', N'19.jpg', N'看了沈从文，才知道原来写爱情的境界是谁也没说。', CAST(0x0000A54300000000 AS DateTime), CAST(31.00 AS Decimal(18, 2)), N'在库', 8)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (42, N'1020', N'非洲手记', N'严歌苓', N'人民出版社', N'20.jpg', N'一部好的游记散文，不在于有多少典丽的辞句，而在于她能够勾起读者宛若身临其境的思绪。比如严歌苓的这部《非洲手记》……', CAST(0x0000A69200000000 AS DateTime), CAST(23.80 AS Decimal(18, 2)), N'在库', 8)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (43, N'1021', N'最初不过你好', N'鹿人三千', N'长江文艺出版社', N'21.jpg', N'芸芸众生，山盟海誓，都是从“你好”二字开始——中文在线*年轻的签约作者鹿人三千，首部短篇小说集。20个看似随意实则深情的小故事，每一个90后都能这本书里找到曾经的自己。', CAST(0x0000A69200000000 AS DateTime), CAST(25.20 AS Decimal(18, 2)), N'在库', 8)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (44, N'1022', N'书在别处（签名版）', N'刘忆斯', N'海豚出版社', N'22.jpg', N'中国三大书评版之一《晶报·深港书评》主编访谈辑录，涉及他与董桥、童方元、李敖、陈冠中等采访对话，胜似一场他主持的“华山论剑”', CAST(0x0000A65500000000 AS DateTime), CAST(38.40 AS Decimal(18, 2)), N'在库', 8)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (45, N'1023', N'曾文正公全集 全16册', N'曾国藩', N'北京日报出版社（原同心出版社）', N'23.jpg', N'曾国藩讲透做人、做事、做学问的方方面面！传忠书局刻本简体版，权威定本！', CAST(0x0000A39900000000 AS DateTime), CAST(186.00 AS Decimal(18, 2)), N'在库', 8)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (46, N'1024', N'三毛典藏全集', N'三毛', N'北京十月文艺出版社', N'24.jpg', N'雨季不再来/撒哈拉的故事/稻草人手记/温柔的夜/梦里花落知多少', CAST(0x0000A13900000000 AS DateTime), CAST(231.30 AS Decimal(18, 2)), N'在库', 8)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (47, N'1025', N'最好的我们', N'八月长安', N'湖南文艺出版社', N'25.jpg', N'刘昊然谭松韵主演同名影视剧正在热播！属于80、90的共同青春。继《你好，旧时光》《暗恋·橘生淮南》后第三部长篇！这一次，和整个青春作别。随书附赠杨炅翰同名主打歌CD、记忆明信片，收录精美彩插！', CAST(0x0000A1EE00000000 AS DateTime), CAST(37.80 AS Decimal(18, 2)), N'在库', 9)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (48, N'1026', N'夏目友人帐', N'（日）村井贞之', N'百花洲文艺出版社', N'26.jpg', N'只要有想见的人，就不再会是孤身一人了。日本殿堂级漫画家绿川幸感动千万网友的超治愈系神作。中国首次日方正版授权，初次小说化。夏目、猫老师等原班人马崭新回归！酷威文化', CAST(0x0000A67400000000 AS DateTime), CAST(24.60 AS Decimal(18, 2)), N'在库', 9)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (49, N'1027', N'一起长大慢慢变老', N'水淼', N'沈阳出版社', N'27.jpg', N'爱情没有早晚，我们终究会幸福。蠢萌老公养成记！', CAST(0x0000A5DB00000000 AS DateTime), CAST(20.20 AS Decimal(18, 2)), N'在库', 9)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (50, N'1028', N'你是最好的自己', N'杨杨，张皓宸', N'湖南文艺出版社', N'28.jpg', N'给年轻人信心的故事，一个app微博豆瓣人人网人气火热作者杨杨、张皓宸联合打造温情励志故事集加超人气手机摄影&创意插图', CAST(0x0000A2E100000000 AS DateTime), CAST(25.30 AS Decimal(18, 2)), N'在库', 9)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (51, N'1029', N'亲爱的弗洛伊德', N'玖月晞', N'百花洲文艺出版社', N'29.jpg', N'玖月晞经典推理言情系列“亲爱的”第二部，多动症×孤独症。律政|悬疑|心理学。作者全新修订版。这世上，我只喜欢两样东西：星空和甄意。一样因为你，一样就是你。', CAST(0x0000A69200000000 AS DateTime), CAST(38.90 AS Decimal(18, 2)), N'在库', 9)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (52, N'1030', N'我的曼达林', N'墨宝非宝', N'江苏文艺出版社', N'30.jpg', N'“一个迷倒万千的偶像明星，有段不为人知的初恋……”墨宝非宝 甜蜜力作 青梅竹马甜宠文。随书附赠：唯美卡片1张', CAST(0x0000A65500000000 AS DateTime), CAST(24.20 AS Decimal(18, 2)), N'在库', 9)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (53, N'1031', N'微微一笑很倾城（豪华典藏版）', N'顾漫', N'花山文艺出版社', N'31.jpg', N'游戏定制版、豪华典藏版随机发放。游戏定制版另送同名手游大礼包。越看越开心的网游爱情！随手翻一页，快乐就翻倍！随书附赠历年所有番外 ENO手绘人设卡 明信片 海报。同名电影、电视剧8月齐上线！读客出品', CAST(0x0000A37A00000000 AS DateTime), CAST(20.60 AS Decimal(18, 2)), N'在库', 9)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (54, N'1032', N'余生，请多指教', N'柏林石匠', N'百花洲文艺出版社', N'32.jpg', N'当当独家限量签名版随机发送。万千读者口碑相传的暖心之作，让人不由自主就会幸福得笑出声来。网络原名《写给医生的报告》，新增十万字全新内容《时光里的零零碎碎》,随书附赠时光日记本。酷威文化', CAST(0x0000A69200000000 AS DateTime), CAST(20.80 AS Decimal(18, 2)), N'在库', 9)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (55, N'1033', N'和朋友们一起想办法·启蒙版（全10册）', N'加比·戈尔德萨克', N'长江少年儿童出版社', N'33.jpg', N'中国畅销600万册、32万读者好评）低幼版，培养0~4岁孩子学习“想办法，解决问题”的纸板书，包括10个智慧故事、10种解决问题小绝招、10个智慧父母小课堂', CAST(0x0000A6B100000000 AS DateTime), CAST(99.20 AS Decimal(18, 2)), N'在库', 10)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (56, N'1034', N'小狗巴利（共26册）', N'（法）马格达莱纳 文，(法) 洛朗·里夏尔 图', N'中国中福会出版社', N'34.jpg', N'畅销十余年的经典幼儿成长绘本，帮助家庭成员彼此理解、共同成长的欢乐故事', CAST(0x0000A65500000000 AS DateTime), CAST(104.00 AS Decimal(18, 2)), N'在库', 10)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (57, N'1035', N'超能恐龙队(套装共4册)', N'潘妮 戴尔', N'河北少年儿童出版社', N'35.jpg', N'让所有爱恐龙、爱汽车、爱太空的小朋友都为之着迷！激发孩子更多想象力！附赠2页精美恐龙和汽车贴纸', CAST(0x0000A69200000000 AS DateTime), CAST(41.40 AS Decimal(18, 2)), N'在库', 10)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (58, N'1036', N'皮皮鲁和鲁西西第二辑(套装共9册)', N'郑渊洁', N'浙江少年儿童出版社', N'36.jpg', N'郑渊洁经典童话图文并茂新版，获选联合国评选的全球十大图书。本辑收录了《复活的恐龙》《大侦探乔麦皮》《教室里的隐身人》等经典作品。皮皮鲁总动员出品。', CAST(0x0000A61800000000 AS DateTime), CAST(77.00 AS Decimal(18, 2)), N'在库', 10)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (60, N'1037', N'美国经典专注力培养大书（幼儿版）', N'HIGHLIGHTS', N'湖南少年儿童出版社', N'37.jpg', N'（全6册，专为0-3岁儿童量身打造的幼儿版专注力培养大书！美国权威教育机构数十年悉心研究创作，通过与儿童不断互动，充分了解孩子的学习喜好！设计出助力学习、快速有效提升专注力的系统游戏。）', CAST(0x0000A67400000000 AS DateTime), CAST(42.50 AS Decimal(18, 2)), N'在库', 10)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (61, N'1038', N'小青虫的梦', N'文/冰波', N'湖南少年儿童出版社', N'38.jpg', N'全1册，承受生命之低处，才有生命的高处！五个一工程奖,国际儿童读物联盟中国分会CBBY第二届小松树奖，畅销十年经典获奖作品重版归来，小蛋壳童书馆出品', CAST(0x0000A63600000000 AS DateTime), CAST(25.20 AS Decimal(18, 2)), N'在库', 10)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (62, N'1039', N'论语画外话', N'李路', N'青岛出版社', N'39.jpg', N'《论语》温润民族性格。这是一本家长和孩子一起读、一起学的亲子书。', CAST(0x0000A65500000000 AS DateTime), CAST(27.20 AS Decimal(18, 2)), N'在库', 10)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (63, N'1040', N'杜莱百变创意玩具书（第二辑，套装5册）', N'[法]埃尔维·杜莱', N'接力出版社', N'40.jpg', N'法国童书大师埃尔维·杜莱创新性的系列代表作，兼具艺术感与功能性，点、线、面的涂鸦，光线，空间、造型等多维启发，颠覆宝宝阅读体验，培养感知力、想象力、创造力、逻辑力和审美力', CAST(0x0000A5F900000000 AS DateTime), CAST(142.40 AS Decimal(18, 2)), N'在库', 10)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (64, N'1041', N'我的第一本生活认知小词典', N'萨拉·莫拉兹 ', N'贵州人民出版社', N'41.jpg', N'中英文双语，宝宝的情景认知书，从幼儿认知的专业角度出发，在宝宝认知的黄金期，轻松储备1000个词汇（蒲公英童书馆出品）', CAST(0x0000A46D00000000 AS DateTime), CAST(33.80 AS Decimal(18, 2)), N'在库', 10)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (65, N'1042', N'中华文明的核心价值', N'陈来', N'生活·读书·新知三联书店', N'42.jpg', N'本书作者是著名哲学家，又身兼多种社会职务，多次应相关部门及国内外高校之邀对这两个问题进行座谈、演讲，书中多篇文字均经此形成，故全书内容既有学术性，又有针对性；文辞既重准确性，亦不乏通俗性。', CAST(0x0000A46D00000000 AS DateTime), CAST(29.80 AS Decimal(18, 2)), N'在库', 11)
INSERT [dbo].[Book] ([Id], [Code], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (66, N'1043', N'菊与刀', N'鲁思·本尼迪克特', N'浙江文艺出版社', N'43.jpg', N'畅销全球70年，销量过3000万，亲切易懂的日本国民性格说明书', CAST(0x0000A61800000000 AS DateTime), CAST(27.00 AS Decimal(18, 2)), N'在库', 11)
SET IDENTITY_INSERT [dbo].[Book] OFF
/****** Object:  ForeignKey [FK_Book_Category]    Script Date: 10/24/2016 20:24:09 ******/
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO
/****** Object:  ForeignKey [FK_Fine_Fine]    Script Date: 10/24/2016 20:24:09 ******/
ALTER TABLE [dbo].[Fine]  WITH CHECK ADD  CONSTRAINT [FK_Fine_Fine] FOREIGN KEY([Borrow_Id])
REFERENCES [dbo].[Borrow] ([Id])
GO
ALTER TABLE [dbo].[Fine] CHECK CONSTRAINT [FK_Fine_Fine]
GO
