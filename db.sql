USE [master]
GO
/****** Object:  Database [DBForumAsp]    Script Date: 9/23/2021 7:54:34 PM ******/
CREATE DATABASE [DBForumAsp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBForumAsp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DBForumAsp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBForumAsp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DBForumAsp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBForumAsp] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBForumAsp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBForumAsp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBForumAsp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBForumAsp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBForumAsp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBForumAsp] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBForumAsp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBForumAsp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBForumAsp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBForumAsp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBForumAsp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBForumAsp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBForumAsp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBForumAsp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBForumAsp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBForumAsp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBForumAsp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBForumAsp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBForumAsp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBForumAsp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBForumAsp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBForumAsp] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DBForumAsp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBForumAsp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBForumAsp] SET  MULTI_USER 
GO
ALTER DATABASE [DBForumAsp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBForumAsp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBForumAsp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBForumAsp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBForumAsp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBForumAsp] SET QUERY_STORE = OFF
GO
USE [DBForumAsp]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/23/2021 7:54:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/23/2021 7:54:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[level] [int] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 9/23/2021 7:54:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[status] [int] NOT NULL,
	[Post_id] [int] NULL,
	[User_id] [int] NULL,
 CONSTRAINT [PK_dbo.Comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 9/23/2021 7:54:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[image] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[Category_id] [int] NULL,
	[User_id] [int] NULL,
 CONSTRAINT [PK_dbo.Posts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/23/2021 7:54:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202109131539030_create-db', N'forumAspMVC.Migrations.Configuration', 0x1F8B0800000000000400ED5CDB6EDC36107D2FD07F10F458382BDB4180D6D84DE06CE2C2681D1B5927E89B414BDC3551DD2A52AE8DA25FD6877E527FA1A4484924454994B45E5F101408BA14E7708673E17038C97FFFFC3B7F771785CE2DCC304AE2857B30DB771D18FB4980E2CDC2CDC9FAD58FEEBBB7DF7F37FF184477CED772DE6B368F52C678E1DE10921E791EF66F6004F02C427E96E0644D667E12792048BCC3FDFD9FBC83030F5208976239CEFC731E1314C1E207FDB94C621FA62407E15912C0108B71FA6555A03A9F4004710A7CB870D7499647C7383DFBBA9CF1D9AE731C22403959C170ED3A208E130208E5F3E80B862B9225F16695D201105EDEA790CE5B831043C1FF513DDD5694FD43268A571396507E8E49120D043C782DF6C6D3C947EDB05BED1DDDBD8F7497C93D93BAD8C185BB04046E92ECDE75F4C58E9661C6269A36785692ED39D2C7BDCA1CA8D5B0FFF69C651E923C838B18E62403E19E73915F87C8FF05DE5F26BFC37811E76128334859A4DF94013A74912529CCC8FD67B8166CA3C0753C95CED3092B3289860B741A93D787AEF3892E0EAE4358E95F127E45920CFE0C63985149830B4008CCA8FA4E0358EC6063756DAD98FE59AE460D8EFA8EEB9C81BB5F61BC21370BF7F0CD1BD739417730284704075F62445D8D12912C87060EBB570DE12D0CFB84EC86C054FE1C0FC4F8046ED1A6D8370DED22C184827D8661F115DFA0943BE58C7DB9AA8DEF244BA2CF492848AA0F579720DB4042D9494C5F57499EF91A3B73AFB6F14ECB675003AD9E917CB378F35A744EF808268F22B07984650388FD0CA53C28EF7AF1513EAA61F819646A3E2625CC07FAF3124516DCB47A7BEDCEE31DBE7469B3C397E1C09AA3248AA8F99A4390F878C50341CD903CDE0840CA4753FCE96287661F999115F6E14A04CB9A917AB4C186F469521014E20C3DFD39D5B750D8120AE11DD97D5498E0D10F9E038CF73F3D1E189D733BFE57070BCD05CB0F662FACBE4E7244CEDA202F6424DF5CD0BC16BD16A170F73E98028CFF4CB2E099E404E3CE4D4B67D13DD7EC4AD36F12BD67A79111F558B571D9638C131F15AB4B3CD5298D2AC8C738703AF31B6E1F6566444D847A2A4AA96FD2A517EE0F8D9D6903AC62520D5867592AE8FE6C76A0CB2A49D52DAC12ADDB5833876E89B332DDB097D69C8D75EFDE244155F36E63ABC5D66BBE7840EFE3AB03D3A458ABED1B2A2BF79D4EA634479A2EA596D50E728656F9B8DF2E939800440F0E21E3093B203FBC67C3455ED638632943E298C522F8EAAC33D8152465A2C5DD0B411A70EA50D1F0BDC606A828298F580D00BE013DC47E157D9B0C9436D20391533598E8B946356269C36B04ED4627CD315EF9F4A4A22F42560C577BE5D94294762541C84AD31317553A0BC9D5CCB529787BACEC8F9632CF95963B2437C6C7BEBD1B21B376EA3785EE889B169153E258586687CCE64069B17363E516E9458BD08600DA1742878BAB46CC090A2EF39B2A4ED66F2B1E7F5C291F61BC965798F91948539AD74AAF3262C459F12799E5ABD5F0B78A8863783E363C5954DC562BD10B02D840ED2BF387009EA00C137AFD05D78065BDCB206A4CD34E859658592ED608FC4D659561B42461FFCFC93A9E4F749C7A274FA870CC840B39A1A4EE76D2E2710C842033DCBB9649984771DBDDAD8B9ABF64C8F47CC41E41BC4AC81062C81EA3BCDEC820E5581365EE69BBA8ABCB6BE84BF31EDD02ACEC236D8903834CC3746658988599EC614C4294FA650031648F21EAF60A137CC81E4329C2CB48CA878732B23614A90E270349C34FC660FDF6D37A58381339E78868D646F940965BDC0014C32D461E56BBCF3AA8F1F464A28114978AE1D661267B18D310154319400CD963D4E53F19A61E7DAEA6A1E692AA7D68B7C0DEB34D9A6B7386B134D8500A6CDCF59A7B626523158CC958D8B6548B0FE54B64FA23F91ACC0E4D64035454764E312BFB56255F4B69F50BC3603B50EFC436C785986A79241836DC74F51DB9DF05C4166CC074A57F5226D022E864F56BE581DED3409A3BDE008CA58491DB5D606DC1028CB5892765022D926EC70444A5A45FFF62E2C833A05952790A6A576A342F43E78D6A913EA5CA3DAAAA91561D9A8B4A4D7F236FA374C3A7B80E15FD1605AC6CB3BAC70446333661B6FA235C86A8A8759713CE408CD61013FEB8ED1EEE1F1C6ABDC04FA72FD7C338080D952E5373AEAAB41DBCD0A3B83C99BBDEE007BE51F3C2115F20BE05997F03B2E6DBF8949ED782ED492FE7FD08C31A4C5F86E694E6CEADA94EE9DDDC1AAAA135736BD8436DA589D0E8D20AE84F32A64B4B49E625861AEF9BA77100EF16EE5F05DD9173FADB9544BAE79C6734701E39FBCEDF320BBC09A59B83EA5019B6BA20B35F797037E30B713AA98D706B16BC3DFB9BEE0BD55D6498FD08B21765B9CD4AD7B3355BA5F56E6B76AB77D63D5A48DF767B985A3A1BDCC1E5E85D10235ACBA839C18C691B8434CDC724A3897EA3847891A1D847290875BE9BF71C1B33651B5941EA5F3EC014C6CCFE64B96CD6E929E755B89AC7F46DC0B6DBE4ACF4D4A3EBAACF674C7BDD288D5B6B61A2B6DB5F939A4B75D4ED76A06CFB56C1A94D73BBD776CB93CDA36ABBA358B32B6DF7374B4E55F52E83F8AE946C1D3A76A96173BB68B37F485794DA47591FD51DBDA0BC904593EDEB84AA96E716CBF68E447D0D6E012DADA226EC0B634F5883F53280B437911A196F6BAED3F1B9F1B774989A90BF985AE11EB8F954D79FDA64D5D773AA50195B771FADBBD48A3DF32163788C79620DA40A8FA696E55D0B36BD43749848538D6F401768B37E4F83AEF4CF75D0688FD1A686602F1231F495705BCD398DD74919F6358ECA29DA05ED0C1210D0587C9C11B4063EA19F7D8871F1F7AABE8230A7533E46D730388DCF7392E6848A0CA3EB50F15D767A74AD5FB4BAAA3CCFCF8B1222DE8608944DC4EA2CE7F1FB1C8541C5F789E17AD902C18E25714967BA24ECB2BEB9AF903E25B12590D8BEEA34BD84511A52307C1EAFC02D1CC31B35D65FE106F8F7E5334C3B48BF22D46D9F7F40609381080B8C9A9EFEA4361C44776FFF074B3F0B38B5460000, N'6.4.4')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (3, N'Giải trí', 1, 1)
INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (4, N'Thời trang', 1, 1)
INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (5, N'Công nghệ', 1, 1)
INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (6, N'Du lịch', 1, 1)
INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (7, N'Cuộc sống', 1, 1)
INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (8, N'Thể Thao', 3, 1)
INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (9, N'Game', 3, 1)
INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (10, N'Thời trang Nam', 4, 1)
INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (11, N'Thời trang Nữ', 4, 1)
INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (12, N'Điện tử', 5, 1)
INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (13, N'Kĩ thuật', 5, 1)
INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (14, N'Phần mềm', 5, 1)
INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (15, N'Khách sạn', 6, 1)
INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (16, N'Khu nghĩ dưỡng', 6, 1)
INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (17, N'Sức khỏe', 7, 1)
INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (18, N'Kinh nghiệm', 7, 1)
INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (19, N'Bóng đá', 8, 1)
INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (20, N'Khoa học máy tính', 12, 1)
INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (22, N'Website', 14, 1)
INSERT [dbo].[Categories] ([id], [name], [level], [status]) VALUES (23, N'ASP .NET, JAVA', 14, 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([id], [title], [image], [description], [status], [createdAt], [Category_id], [User_id]) VALUES (32, N'Hỏi về dựng layouts', N'forum.jpg', N'<p>Ch&agrave;o mn. M&igrave;nh đang muốn dựng layouts như h&igrave;nh dưới th&igrave; n&ecirc;n d&ugrave;ng g&igrave; cho hợp l&yacute; nhỉ? Mong mọi người gợi &yacute; ạ<img alt="" src="https://images.viblo.asia/8f2beee5-3770-4056-a0be-be9bcb74e3f4.jpg" /></p>

<p><strong>M&igrave;nh đang thử d&ugrave;ng flex th&igrave; n&oacute; bị khoảng trắng như thế n&agrave;y ạ&nbsp;<img alt="😕" src="https://twemoji.maxcdn.com/2/72x72/1f615.png" /></strong></p>

<p><img alt="" src="https://images.viblo.asia/c37b0e8b-fa04-4322-8c66-5e996337e5e7.jpg" /></p>
', 1, CAST(N'2021-09-23T19:34:32.000' AS DateTime), 22, 2)
INSERT [dbo].[Posts] ([id], [title], [image], [description], [status], [createdAt], [Category_id], [User_id]) VALUES (33, N'Tạo template trong Laravel', N'forum.jpg', N'<p>C&aacute;c b&aacute;c cho e hỏi với ạ. Hiện tại em đang l&agrave;m dự &aacute;n Laravel + Vuejs L&agrave;m thế n&agrave;o để tạo template Client v&agrave; template Admin c&ugrave;ng 1 project Laravel ạ. C&aacute;c b&aacute;c chỉ em c&aacute;ch l&agrave;m với ạ. Em cảm ơn.</p>
', 1, CAST(N'2021-09-23T19:35:26.000' AS DateTime), 23, 2)
INSERT [dbo].[Posts] ([id], [title], [image], [description], [status], [createdAt], [Category_id], [User_id]) VALUES (34, N'hỏi về mailtrap trong việc send mail của laravel', N'forum.jpg', N'<p>Em đang l&agrave;m task thực hiện gửi mail ch&agrave;o mừng khi đăng k&iacute;. (gửi cả view). Em code v&agrave; test mọi thứ đ&atilde; hoạt động cho đến khi code phần html, css. Th&igrave; gửi mail, template lại ko c&oacute; css. em thấy do mailtrap ko lấy đc file css từ local l&ecirc;n em đ&atilde; d&ugrave;ng ngrok để mở server v&agrave; nối c&aacute;c link css của web serve từ ngrok v&agrave;o trong link stype nhưng vẫn ko hoạt động đc.</p>
', 1, CAST(N'2021-09-23T19:35:58.000' AS DateTime), 23, 2)
INSERT [dbo].[Posts] ([id], [title], [image], [description], [status], [createdAt], [Category_id], [User_id]) VALUES (35, N'Serverless nên hay không ?', N'forum.jpg', N'<ul>
	<li>Em thắc mắc c&aacute;c cty hiện nay c&oacute; d&ugrave;ng serverless hay vẫn tiếp tục theo traditional ạ?</li>
	<li>C&aacute;c trường hợp n&ecirc;n d&ugrave;ng serverless ạ ?</li>
</ul>

<p><strong>Em cảm ơn m.n :&lt; !</strong></p>
', 1, CAST(N'2021-09-23T19:36:48.000' AS DateTime), 20, 1)
INSERT [dbo].[Posts] ([id], [title], [image], [description], [status], [createdAt], [Category_id], [User_id]) VALUES (36, N'CR7 và M10, ai vô địch cúp C1 mùa này nào ', N'post43615125.jpg', N'<p>Cristiano Ronaldo đ&atilde; ghi b&agrave;n 3 trận li&ecirc;n tiếp, trong đ&oacute; m&agrave;n ra mắt của anh thậm ch&iacute; c&ograve;n l&agrave; một c&uacute; đ&uacute;p. Nhờ v&agrave;o m&agrave;n tr&igrave;nh diễn đỉnh cao đ&oacute;, MU giờ đ&acirc;y đang được đ&aacute;nh gi&aacute; cao hơn rất nhiều trong cuộc đua v&ocirc; địch&nbsp;<a href="https://www.24h.com.vn/bong-da-ngoai-hang-anh-c149.html" title="Ngoại hạng Anh">Ngoại hạng Anh</a>.</p>

<p>&nbsp;</p>

<p><img alt="Ronaldo Messi 4-0: Cuộc đua Quả bóng vàng đổi chiều, CR7 mơ hồi sinh ở MU - 1" src="https://cdn.24h.com.vn/upload/3-2021/images/2021-09-21/Ronaldo-4-0-Messi-Cuoc-dua-Qua-bong-vang-doi-chieu-MU-cuu-roi-CR7-48168493-0-image-m-8_1632179405623-1632237374-721-width660height372.jpg" /></p>

<p>&nbsp;</p>

<p>M&agrave;n tr&igrave;nh diễn của Ronaldo giai đoạn vừa qua ấn tượng hơn Messi rất nhiều</p>

<p>Đổi lại, MU cũng đang gi&uacute;p Cristiano Ronaldo sống lại hy vọng cho cuộc đua&nbsp;<a href="https://www.24h.com.vn/bau-chon-qbv-2012-c48e2345.html" title="Quả bóng vàng">Quả b&oacute;ng v&agrave;ng</a>&nbsp;tưởng chừng đ&atilde; tắt lịm. Tr&ecirc;n thực tế, m&agrave;n tr&igrave;nh diễn của CR7 trong m&ugrave;a giải 2020/21 kh&aacute; tệ, ch&iacute; &iacute;t l&agrave; về mặt danh hiệu. Anh v&agrave; Juventus thất bại ở c&aacute;c đấu trường quan trọng l&agrave; Serie A v&agrave; Champions League. Cơ hội quan trọng ở v&ograve;ng chung kết EURO 2020, ĐT Bồ Đ&agrave;o Nha cũng phải sớm dừng ch&acirc;n.</p>

<p>Do vậy, theo lẽ th&ocirc;ng thường, Ronaldo ho&agrave;n to&agrave;n kh&ocirc;ng c&ograve;n cơ hội để đua tranh danh hiệu Quả b&oacute;ng v&agrave;ng 2020/21. Đ&atilde; thế, k&igrave;nh địch Lionel Messi lại được đ&aacute;nh gi&aacute; cao hơn&nbsp;CR7 v&agrave; nếu si&ecirc;u sao người Argentina gi&agrave;nh danh hiệu thứ 7 trong sự nghiệp, Ronaldo gần như kh&ocirc;ng c&ograve;n khả năng bắt kịp.</p>

<p>Nhưng thật may cho Ronaldo, đ&oacute; l&agrave; Messi lại đang chơi kh&aacute; tệ kể từ khi gia nhập PSG. Si&ecirc;u sao người Argentina đến PSG trước khi Ronaldo về MU, v&agrave; hiện cũng đ&atilde; chơi 3 trận. Tuy nhi&ecirc;n, m&agrave;n tr&igrave;nh diễn của &ldquo;El Pulga&rdquo; kh&ocirc;ng thuyết phục được người h&acirc;m mộ. Cho đến nay, Messi chưa c&oacute; bất cứ b&agrave;n thắng hay kiến tạo n&agrave;o cho g&atilde; nh&agrave; gi&agrave;u th&agrave;nh Paris.</p>

<p>Trong sự suy yếu của Messi, cơ hội phần n&agrave;o được trao cho Ronaldo. Người đang được đ&aacute;nh gi&aacute; cao nhất l&uacute;c n&agrave;y l&agrave; Jorginho - nh&agrave; v&ocirc; địch Champions League c&ugrave;ng CLB Chelsea v&agrave; EURO 2020 với ĐT Italia. V&agrave; ở chặng đường đ&atilde; qua của m&ugrave;a giải 2021/22, Jorginho cũng chơi rất tốt, gi&uacute;p Chelsea hiện đang đứng đầu Ngoại hạng Anh.</p>

<p><img alt="Ronaldo Messi 4-0: Cuộc đua Quả bóng vàng đổi chiều, CR7 mơ hồi sinh ở MU - 3" src="https://cdn.24h.com.vn/upload/3-2021/images/2021-09-21/Ronaldo-4-0-Messi-Cuoc-dua-Qua-bong-vang-doi-chieu-MU-cuu-roi-CR7-afp_fr_63d41a811f32a37e4a17c7418b270ad16c88ff27-1632237374-383-width660height438.jpg" /></p>

<p>Ronaldo v&agrave; Messi đang trở lại cuộc đua Quả b&oacute;ng v&agrave;ng?</p>

<p>Do vậy, muốn vượt qua cả Messi lẫn Jorginho, Ronaldo thực sự phải bứt ph&aacute; một c&aacute;ch tuyệt vời trong giai đoạn then chốt n&agrave;y. V&agrave; những m&agrave;n tr&igrave;nh diễn đỉnh cao như thế phải được duy tr&igrave; từ nay đến khi c&oacute; kết quả cuối c&ugrave;ng.</p>

<p>Trong những năm qua, Messi kỳ thực cũng thi đấu kh&ocirc;ng th&agrave;nh c&ocirc;ng. Lần cuối c&ugrave;ng &ldquo;Leo&rdquo; v&ocirc; địch Champions League l&agrave; v&agrave;o năm 2015. May mắn cho Messi l&agrave; năm nay&nbsp;anh kịp gi&agrave;nh danh hiệu Copa America c&ugrave;ng ĐT Argentina.</p>

<p>Nhưng c&oacute; thể thấy trong giai đoạn ấy, Ronaldo đ&atilde; bứt ph&aacute; kh&ocirc;ng đủ tốt, m&agrave; đặc biệt l&agrave; sai lầm khi đến Juventus v&agrave; trải qua 3 m&ugrave;a giải kh&ocirc;ng gi&agrave;nh được Champions League cũng như Quả b&oacute;ng v&agrave;ng tại đ&acirc;y. V&agrave;o l&uacute;c n&agrave;y, c&oacute; lẽ Ronaldo đang ước anh trở lại MU sớm hơn.</p>
', 1, CAST(N'2021-09-23T19:39:35.000' AS DateTime), 19, 1)
INSERT [dbo].[Posts] ([id], [title], [image], [description], [status], [createdAt], [Category_id], [User_id]) VALUES (37, N'Covid diễn biến như thế nào trong hôm nay ??', N'post1901249860.jpg', N'<p>T&iacute;nh từ 17h ng&agrave;y 22/9 đến 17h ng&agrave;y 23/9, tr&ecirc;n Hệ thống Quốc gia quản l&yacute; ca bệnh&nbsp;<a href="https://www.24h.com.vn/dich-covid-19-c62e6058.html" title="COVID-19">COVID-19</a>&nbsp;<strong>ghi nhận 9.472 ca nhiễm mới</strong>, trong đ&oacute; 07 ca nhập cảnh v&agrave; 9.465 ca ghi nhận trong nước (giảm 2.060 ca so với ng&agrave;y trước đ&oacute;) tại 33 tỉnh, th&agrave;nh phố (c&oacute; 5.344 ca trong cộng đồng).</p>

<p><strong>C&aacute;c tỉnh, th&agrave;nh phố ghi nhận ca bệnh như sau:</strong>&nbsp;TP. Hồ Ch&iacute; Minh (5.052), B&igrave;nh Dương (2.764), Đồng Nai (760), Long An (190), Ki&ecirc;n Giang (163), An Giang (109), T&acirc;y Ninh (86), Tiền Giang (67), Cần Thơ (53), Đắk N&ocirc;ng (33), Đắk Lắk (25), Kh&aacute;nh H&ograve;a (20), Quảng B&igrave;nh (20), Đồng Th&aacute;p (19), H&agrave; Nam (14), Ninh Thuận (9), Thừa Thi&ecirc;n Huế (9), B&igrave;nh Định (9), B&igrave;nh Phước (8 ), Bạc Li&ecirc;u (7), C&agrave; Mau (7), B&igrave;nh Thuận (7), Ph&uacute; Y&ecirc;n (6), Quảng Nam (5), H&agrave; Nội (5), Quảng Ng&atilde;i (4), B&agrave; Rịa - Vũng T&agrave;u (3), Đ&agrave; Nẵng (3), Gia Lai (2), Tr&agrave; Vinh (2), Quảng Trị (2), Hải Dương (1), Thanh H&oacute;a (1).</p>

<p>C&aacute;c địa phương ghi nhận&nbsp;<strong>số ca nhiễm giảm nhiều nhất</strong>&nbsp;so với ng&agrave;y trước đ&oacute;: B&igrave;nh Dương (-1.415), TP. Hồ Ch&iacute; Minh (-383), Đồng Nai (-170).</p>

<p>C&aacute;c địa phương ghi nhận&nbsp;<strong>số ca nhiễm tăng cao nhất so</strong>&nbsp;với ng&agrave;y trước đ&oacute;: T&acirc;y Ninh (38), Ki&ecirc;n Giang (26), Đắk Lắk (25).</p>

<p>Trung b&igrave;nh số ca nhiễm mới trong nước ghi nhận trong 7 ng&agrave;y qua: 10.319 ca/ng&agrave;y.</p>

<p><strong>Kể từ đầu dịch đến nay Việt Nam c&oacute; 728.435 ca nhiễm</strong>, đứng thứ 46/222 quốc gia v&agrave; v&ugrave;ng l&atilde;nh thổ, trong khi với tỷ lệ số ca nhiễm/1 triệu d&acirc;n, Việt Nam đứng thứ 155/222 quốc gia v&agrave; v&ugrave;ng l&atilde;nh thổ (b&igrave;nh qu&acirc;n cứ 1 triệu người c&oacute; 7.402 ca nhiễm).</p>
', 1, CAST(N'2021-09-23T19:41:11.000' AS DateTime), 17, 1)
INSERT [dbo].[Posts] ([id], [title], [image], [description], [status], [createdAt], [Category_id], [User_id]) VALUES (38, N'Mọi người ai biết Đảo này ở đâu ko', N'post80007295.jpg', N'<p>Martinique l&agrave; một h&ograve;n đảo nhỏ nằm tại v&ugrave;ng biển ph&iacute;a đ&ocirc;ng Caribbean, với tổng diện t&iacute;ch khoảng 1090 km vu&ocirc;ng v&agrave; d&acirc;n số tr&ecirc;n đảo chỉ khoảng 315.000 người. Nơi đ&acirc;y trở th&agrave;nh thuộc địa của nước Ph&aacute;p kể từ năm 1635.</p>

<p><img alt="Hòn đảo kỳ lạ có thể khiến mọi vật trở nên cao lớn hơn - 1" src="https://cdn.24h.com.vn/upload/2-2021/images/2021-05-06/3-552be-1620318238-876-width640height359.jpg" /></p>

<p>Martinique được ca ngợi l&agrave; một trong những h&ograve;n đảo hấp dẫn nhất của v&ugrave;ng biển Caribbean. Với những b&atilde;i biển trải d&agrave;i tuyệt đẹp, l&agrave;n nước trong vắt c&ugrave;ng hệ động thực vật phong ph&uacute;, h&ograve;n đảo c&oacute; thể khiến mọi du kh&aacute;ch m&ecirc; say ngay từ lần đầu đặt ch&acirc;n tới.</p>

<p>B&ecirc;n cạnh khung cảnh thơ mộng của một h&ograve;n đảo nhiệt đới, điều khiến nơi đ&acirc;y trở n&ecirc;n đặc biệt v&agrave; thu h&uacute;t lượng lớn kh&aacute;ch&nbsp;<a href="https://www.24h.com.vn/du-lich-24h-c76.html" title="du lịch">du lịch</a>&nbsp;l&agrave; v&igrave; h&ograve;n đảo n&agrave;y được cho l&agrave; c&oacute; thể gi&uacute;p tăng trưởng chiều cao.</p>
', 1, CAST(N'2021-09-23T19:42:52.000' AS DateTime), 16, 1)
INSERT [dbo].[Posts] ([id], [title], [image], [description], [status], [createdAt], [Category_id], [User_id]) VALUES (39, N'Phong cách mới như này hợp trend ko mn', N'post1515005195.jpg', N'<p>Một trong những m&oacute;n đồ phổ biến l&agrave; bộ đồ nỉ hoặc quần thể thao/&aacute;o nỉ. Sự pha trộn cotton/polyester ấm c&uacute;ng đ&oacute; đ&atilde; tạo n&ecirc;n một niềm vui th&iacute;ch th&uacute;. Bạn gần như kh&ocirc;ng ngại việc phải n&oacute;i chuyện tr&ecirc;n Zoom cả ng&agrave;y nếu nửa dưới của bạn chỉ mặc quần nỉ. Nhiều người nghĩ rằng trang phục nỉ sẽ hết thời sau khi dịch bệnh qua, nhưng liệu c&oacute; phải kh&ocirc;ng?.</p>
', 1, CAST(N'2021-09-23T19:43:50.000' AS DateTime), 11, 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [email], [password], [status]) VALUES (1, N'minhnha2308@gmail.com', N'cc175b9c0f1b6a831c399e269772661', 1)
INSERT [dbo].[Users] ([id], [email], [password], [status]) VALUES (2, N'a@gmail.com', N'cc175b9c0f1b6a831c399e269772661', 1)
INSERT [dbo].[Users] ([id], [email], [password], [status]) VALUES (3, N'ab@gmail.com', N'cc175b9c0f1b6a831c399e269772661', 0)
INSERT [dbo].[Users] ([id], [email], [password], [status]) VALUES (4, N'levanc@gmail.com', N'156d64253c9a871dd9cbc43da8494b5', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Post_id]    Script Date: 9/23/2021 7:54:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Post_id] ON [dbo].[Comments]
(
	[Post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_id]    Script Date: 9/23/2021 7:54:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_id] ON [dbo].[Comments]
(
	[User_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Category_id]    Script Date: 9/23/2021 7:54:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_Category_id] ON [dbo].[Posts]
(
	[Category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_id]    Script Date: 9/23/2021 7:54:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_id] ON [dbo].[Posts]
(
	[User_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comments_dbo.Posts_Post_id] FOREIGN KEY([Post_id])
REFERENCES [dbo].[Posts] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_dbo.Comments_dbo.Posts_Post_id]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comments_dbo.Users_User_id] FOREIGN KEY([User_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_dbo.Comments_dbo.Users_User_id]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Posts_dbo.Categories_Category_id] FOREIGN KEY([Category_id])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_dbo.Posts_dbo.Categories_Category_id]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Posts_dbo.Users_User_id] FOREIGN KEY([User_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_dbo.Posts_dbo.Users_User_id]
GO
USE [master]
GO
ALTER DATABASE [DBForumAsp] SET  READ_WRITE 
GO
