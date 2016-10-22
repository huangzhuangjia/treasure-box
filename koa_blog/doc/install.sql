CREATE DATABASE IF NOT EXISTS junebox DEFAULT CHARSET UTF8;

USE junebox;

# 清除表结构
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS blog;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS share;

# 用户表
CREATE TABLE user
(
    id               BIGINT NOT NULL AUTO_INCREMENT,
    username         VARCHAR(50) NOT NULL DEFAULT "" COMMENT "用户名",
    password         VARCHAR(50) NOT NULL DEFAULT "" COMMENT "密码",
    email            VARCHAR(50) NOT NULL DEFAULT "" COMMENT "邮箱",
    head             VARCHAR(50) NOT NULL DEFAULT "" COMMENT "头像地址",
    description      VARCHAR(400) NULL DEFAULT "" COMMENT "描述",
    sex              TINYINT NOT NULL DEFAULT 2 COMMENT "性别，1为男，0为女，2为不详",
    PRIMARY KEY (id),
    UNIQUE KEY uk_user_username(username)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT "用户表";

# 博客表
CREATE TABLE blog
(
    id               BIGINT NOT NULL AUTO_INCREMENT,
    name             VARCHAR(50) NOT NULL DEFAULT "" COMMENT "名称",
    user_id          BIGINT NOT NULL DEFAULT 0 COMMENT "作者",
    create_time      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "创建时间",
    content          TEXT NOT NULL COMMENT "内容",
    type             VARCHAR(50) NOT NULL DEFAULT "" COMMENT "分类",
    PRIMARY KEY (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT "博客表";

# 评论表
CREATE TABLE comment
(
    id               BIGINT NOT NULL AUTO_INCREMENT,
    user_id          BIGINT NOT NULL DEFAULT 0 COMMENT "作者",
    reply_id         BIGINT NOT NULL DEFAULT 0 COMMENT "被回复者id，如无被回复者则为0",
    parent_id        BIGINT NOT NULL DEFAULT 0 COMMENT "评论所属id",
    create_time      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "创建时间",
    content          VARCHAR(300) NOT NULL DEFAULT "" COMMENT "内容",
    PRIMARY KEY (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT "评论表";

# 转载记录表
CREATE TABLE share
(
    id               BIGINT NOT NULL AUTO_INCREMENT,
    user_id          BIGINT NOT NULL DEFAULT 0 COMMENT "作者",
    create_time      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "创建时间",
    parent_id        BIGINT NOT NULL DEFAULT 0 COMMENT "转载记录所属id",
    PRIMARY KEY (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT "转载记录表";

# 初始化数据
INSERT INTO user
    (id, username, password, email, head, description, sex)
VALUES
    (10000, "admin", "e10adc3949ba59abbe56e057f20f883e", "admin123@123.com", "/res/img/head.jpg", "管理员", 1),
    (10001, "小明", "e10adc3949ba59abbe56e057f20f883e", "xiaoming123@123.com", "/res/img/head.jpg", "你真天真~~", 1),
    (10002, "阿黄", "e10adc3949ba59abbe56e057f20f883e", "ahuang123@123.com", "/res/img/head.jpg", "我是来打酱油的……", 0),
    (10003, "danzong", "e10adc3949ba59abbe56e057f20f883e", "danzong123@123.com", "/res/img/head.jpg", "船到桥头自然直", 1);

INSERT INTO blog
    (id, name, user_id, content, type)
VALUES
	(10000, "三国演义-宴桃园豪杰三结义 斩黄巾英雄首立功", 10001, "%3Cp%3E滚滚长江东逝水，浪花淘尽英雄。是非成败转头空。青山依旧在，几度夕阳红。 白发渔樵江渚上，惯看秋月春风。一壶浊酒喜相逢。古今多少事，都付笑谈中。——调寄《临江仙》斋%3C/p%3E%3Cp%3E话说天下大势，分久必合，合久必分。周末七国分争，并入于秦。及秦灭之后，楚、汉分争，又并入于汉。汉朝自高祖斩白蛇而起义，一统天下，后来光武中兴，传至献帝，遂分为三国。推其致乱之由，殆始于桓、灵二帝。桓帝禁锢善类，崇信宦官。及桓帝崩，灵帝即位，大将军窦武、太傅陈蕃，共相辅佐。时有宦官曹节等弄权，窦武、陈蕃谋诛之，机事不密，反为所害，中涓自此愈横。%3C/p%3E%3Cp%3E建宁二年四月望日，帝御温德殿。方升座，殿角狂风骤起。只见一条大青蛇，从梁上飞将下来，蟠于椅上。帝惊倒，左右急救入宫，百官俱奔避。须臾，蛇不见了。忽然大雷大雨，加以冰雹，落到半夜方止，坏却房屋无数。建宁四年二月，洛阳地震；又海水泛溢，沿海居民，尽被大浪卷入海中。光和元年，雌鸡化雄。六月朔，黑气十余丈，飞入温雄殿中。秋七月，有虹现于玉堂；五原山岸，尽皆崩裂。种种不祥，非止一端。帝下诏问群臣以灾异之由，议郎蔡邕上疏，以为蜺堕鸡化，乃妇寺干政之所致，言颇切直。帝览奏叹息，因起更衣。曹节在后窃视，悉宣告左右；遂以他事陷邕于罪，放归田里。后张让、赵忠、封谞、段珪、曹节、侯览、蹇硕、程旷、夏惲、郭胜十人朋比为奸，号为“十常侍”。帝尊信张让，呼为“阿父”。朝政日非，以致天下人心思乱，盗贼蜂起。%3C/p%3E%3Cp%3E时巨鹿郡有兄弟三人，一名张角，一名张宝，一名张梁。那张角本是个不第秀才，因入山采药，遇一老人，碧眼童颜，手执藜杖，唤角至一洞中，以天书三卷授之，曰：“此名《太平要术》，汝得之，当代天宣化，普救世人；若萌异心，必获恶报。”角拜问姓名。老人曰：“吾乃南华老仙也。”言讫，化阵清风而去。角得此书，晓夜攻习，能呼风唤雨，号为“太平道人”。中平元年正月内，疫气流行，张角散施符水，为人治病，自称“大贤良师”。角有徒弟五百余人，云游四方，皆能书符念咒。次后徒众日多，角乃立三十六方，大方万余人，小方六七千，各立渠帅，称为将军；讹言：“苍天已死，黄天当立；岁在甲子，天下大吉。”令人各以白土，书“甲子”二字于家中大门上。青、幽、徐、冀、荆、扬、兖、豫八州之人，家家侍奉大贤良师张角名字。角遣其党马元义，暗赍金帛，结交中涓封谞，以为内应。角与二弟商议曰：“至难得者，民心也。今民心已顺，若不乘势取天下，诚为可惜。”遂一面私造黄旗，约期举事；一面使弟子唐周，驰书报封谞。唐周乃径赴省中告变。帝召大将军何进调兵擒马元义，斩之；次收封谞等一干人下狱。张角闻知事露，星夜举兵，自称“天公将军”，张宝称“地公将军”，张梁称“人公将军”。申言于众曰：“今汉运将终，大圣人出。汝等皆宜顺天从正，以乐太平。”四方百姓，裹黄巾从张角反者四五十万。贼势浩大，官军望风而靡。何进奏帝火速降诏，令各处备御，讨贼立功。一面遣中郎将卢植、皇甫嵩、朱俊，各引精兵、分三路讨之。%3C/p%3E%3Cp%3E且说张角一军，前犯幽州界分。幽州太守刘焉，乃江夏竟陵人氏，汉鲁恭王之后也。当时闻得贼兵将至，召校尉邹靖计议。靖曰：“贼兵众，我兵寡，明公宜作速招军应敌。”刘焉然其说，随即出榜招募义兵。%3C/p%3E%3Cp%3E榜文行到涿县，引出涿县中一个英雄。那人不甚好读书；性宽和，寡言语，喜怒不形于色；素有大志，专好结交天下豪杰；生得身长七尺五寸，两耳垂肩，双手过膝，目能自顾其耳，面如冠玉，唇若涂脂；中山靖王刘胜之后，汉景帝阁下玄孙，姓刘，名备，字玄德。昔刘胜之子刘贞，汉武时封涿鹿亭侯，后坐酎金失侯，因此遗这一枝在涿县。玄德祖刘雄，父刘弘。弘曾举孝廉，亦尝作吏，早丧。玄德幼孤，事母至孝；家贫，贩屦织席为业。家住本县楼桑村。其家之东南，有一大桑树，高五丈余，遥望之，童童如车盖。相者云：“此家必出贵人。”玄德幼时，与乡中小儿戏于树下，曰：“我为天子，当乘此车盖。”叔父刘元起奇其言，曰：“此儿非常人也！”因见玄德家贫，常资给之。年十五岁，母使游学，尝师事郑玄、卢植，与公孙瓚等为友。%3C/p%3E%3Cp%3E及刘焉发榜招军时，玄德年已二十八岁矣。当日见了榜文，慨然长叹。随后一人厉声言曰：“大丈夫不与国家出力，何故长叹？”玄德回视其人，身长八尺，豹头环眼，燕颔虎须，声若巨雷，势如奔马。玄德见他形貌异常，问其姓名。其人曰：“某姓张，名飞，字翼德。世居涿郡，颇有庄田，卖酒屠猪，专好结交天下豪杰。恰才见公看榜而叹，故此相问。”玄德曰：“我本汉室宗亲，姓刘，名备。今闻黄巾倡乱，有志欲破贼安民，恨力不能，故长叹耳。”飞曰：“吾颇有资财，当招募乡勇，与公同举大事，如何。”玄德甚喜，遂与同入村店中饮酒。%3C/p%3E%3Cp%3E正饮间，见一大汉，推着一辆车子，到店门首歇了，入店坐下，便唤酒保：“快斟酒来吃，我待赶入城去投军。”玄德看其人：身长九尺，髯长二尺；面如重枣，唇若涂脂；丹凤眼，卧蚕眉，相貌堂堂，威风凛凛。玄德就邀他同坐，叩其姓名。其人曰：“吾姓关，名羽，字长生，后改云长，河东解良人也。因本处势豪倚势凌人，被吾杀了，逃难江湖，五六年矣。今闻此处招军破贼，特来应募。”玄德遂以己志告之，云长大喜。同到张飞庄上，共议大事。飞曰：“吾庄后有一桃园，花开正盛；明日当于园中祭告天地，我三人结为兄弟，协力同心，然后可图大事。”玄德、云长齐声应曰：“如此甚好。”%3C/p%3E%3Cp%3E次日，于桃园中，备下乌牛白马祭礼等项，三人焚香再拜而说誓曰：“念刘备、关羽、张飞，虽然异姓，既结为兄弟，则同心协力，救困扶危；上报国家，下安黎庶。不求同年同月同日生，只愿同年同月同日死。皇天后土，实鉴此心，背义忘恩，天人共戮！”誓毕，拜玄德为兄，关羽次之，张飞为弟。祭罢天地，复宰牛设酒，聚乡中勇士，得三百余人，就桃园中痛饮一醉。来日收拾军器，但恨无马匹可乘。正思虑间，人报有两个客人，引一伙伴当，赶一群马，投庄上来。玄德曰：“此天佑我也！”三人出庄迎接。原来二客乃中山大商：一名张世平，一名苏双，每年往北贩马，近因寇发而回。玄德请二人到庄，置酒管待，诉说欲讨贼安民之意。二客大喜，愿将良马五十匹相送；又赠金银五百两，镔铁一千斤，以资器用。%3C/p%3E%3Cp%3E玄德谢别二客，便命良匠打造双股剑。云长造青龙偃月刀，又名“冷艳锯”，重八十二斤。张飞造丈八点钢矛。各置全身铠甲。共聚乡勇五百余人，来见邹靖。邹靖引见太守刘焉。三人参见毕，各通姓名。玄德说起宗派，刘焉大喜，遂认玄德为侄。不数日，人报黄巾贼将程远志统兵五万来犯涿郡。刘焉令邹靖引玄德等三人，统兵五百，前去破敌。玄德等欣然领军前进，直至大兴山下，与贼相见。贼众皆披发，以黄巾抹额。当下两军相对，玄德出马，左有云长，右有翼德，扬鞭大骂：“反国逆贼，何不早降！”程远志大怒，遣副将邓茂出战。张飞挺丈八蛇矛直出，手起处，刺中邓茂心窝，翻身落马。程远志见折了邓茂，拍马舞刀，直取张飞。云长舞动大刀，纵马飞迎。程远志见了，早吃一惊，措手不及，被云长刀起处，挥为两段。后人有诗赞二人曰：英雄露颖在今朝，一试矛兮一试刀。初出便将威力展，三分好把姓名标。%3C/p%3E%3Cp%3E众贼见程远志被斩，皆倒戈而走。玄德挥军追赶，投降者不计其数，大胜而回。刘焉亲自迎接，赏劳军士。次日，接得青州太守龚景牒文，言黄巾贼围城将陷，乞赐救援。刘焉与玄德商议。玄德曰：“备愿往救之。”刘焉令邹靖将兵五千，同玄德、关、张，投青州来。贼众见救军至，分兵混战。玄德兵寡不胜，退三十里下寨。%3C/p%3E%3Cp%3E玄德谓关、张曰：“贼众我寡；必出奇兵，方可取胜。”乃分关公引一千军伏山左，张飞引一千军伏山右，鸣金为号，齐出接应。次日，玄德与邹靖引军鼓噪而进。贼众迎战，玄德引军便退。贼众乘势追赶，方过山岭，玄德军中一齐鸣金，左右两军齐出，玄德麾军回身复杀。三路夹攻，贼众大溃。直赶至青州城下，太守龚景亦率民兵出城助战。贼势大败，剿戮极多，遂解青州之围。后人有诗赞玄德曰：运筹决算有神功，二虎还须逊一龙。初出便能垂伟绩，自应分鼎在孤穷。%3C/p%3E%3Cp%3E龚景犒军毕，邹靖欲回。玄德曰：“近闻中郎将卢植与贼首张角战于广宗，备昔曾师事卢植，欲往助之。”于是邹靖引军自回，玄德与关、张引本部五百人投广宗来。至卢植军中，入帐施礼，具道来意。卢植大喜，留在帐前听调。%3C/p%3E%3Cp%3E时张角贼众十五万，植兵五万，相拒于广宗，未见胜负。植谓玄德曰：“我今围贼在此，贼弟张梁、张宝在颍川，与皇甫嵩、朱俊对垒。汝可引本部人马，我更助汝一千官军，前去颍川打探消息，约期剿捕。”玄德领命，引军星夜投颍川来。%3C/p%3E%3Cp%3E时皇甫嵩、朱俊领军拒贼，贼战不利，退入长社，依草结营。嵩与俊计曰：“贼依草结营，当用火攻之。”遂令军士，每人束草一把，暗地埋伏。其夜大风忽起。二更以后，一齐纵火，嵩与俊各引兵攻击贼寨，火焰张天，贼众惊慌，马不及鞍，人不及甲，四散奔走。%3C/p%3E%3Cp%3E杀到天明，张梁、张宝引败残军士，夺路而走。忽见一彪军马，尽打红旗，当头来到，截住去路。为首闪出一将，身长七尺，细眼长髯，官拜骑都尉，沛国谯郡人也，姓曹，名操，字孟德。操父曹嵩，本姓夏侯氏，因为中常侍曹腾之养子，故冒姓曹。曹嵩生操，小字阿瞒，一名吉利。操幼时，好游猎，喜歌舞，有权谋，多机变。操有叔父，见操游荡无度，尝怒之，言于曹嵩。嵩责操。操忽心生一计，见叔父来，诈倒于地，作中风之状。叔父惊告嵩，嵩急视之。操故无恙。嵩曰：“叔言汝中风，今已愈乎？”操曰：“儿自来无此病；因失爱于叔父，故见罔耳。”嵩信其言。后叔父但言操过，嵩并不听。因此，操得恣意放荡。时人有桥玄者，谓操曰：“天下将乱，非命世之才不能济。能安之者，其在君乎？”南阳何颙见操，言：“汉室将亡，安天下者，必此人也。”汝南许劭，有知人之名。操往见之，问曰：“我何如人？”劭不答。又问，劭曰：“子治世之能臣，乱世之奸雄也。”操闻言大喜。年二十，举孝廉，为郎，除洛阳北部尉。初到任，即设五色棒十余条于县之四门，有犯禁者，不避豪贵，皆责之。中常侍蹇硕之叔，提刀夜行，操巡夜拿住，就棒责之。由是，内外莫敢犯者，威名颇震。后为顿丘令，因黄巾起，拜为骑都尉，引马步军五千，前来颍川助战。正值张梁、张宝败走，曹操拦住，大杀一阵，斩首万余级，夺得旗幡、金鼓、马匹极多。张梁、张宝死战得脱。操见过皇甫嵩、朱俊，随即引兵追袭张梁、张宝去了。%3C/p%3E%3Cp%3E却说玄德引关、张来颍川，听得喊杀之声，又望见火光烛天，急引兵来时，贼已败散。玄德见皇甫嵩、朱俊，具道卢植之意。嵩曰：“张梁、张宝势穷力乏，必投广宗去依张角。玄德可即星夜往助。”玄德领命，遂引兵复回。得到半路，只见一簇军马，护送一辆槛车，车中之囚，乃卢植也。玄德大惊，滚鞍下马，问其缘故。植曰：“我围张角，将次可破；因角用妖术，未能即胜。朝廷差黄门左丰前来体探，问我索取贿赂。我答曰：‘军粮尚缺，安有余钱奉承天使？’左丰挟恨，回奏朝廷，说我高垒不战，惰慢军心；因此朝廷震怒，遣中郎将董卓来代将我兵，取我回京问罪。”张飞听罢，大怒，要斩护送军人，以救卢植。玄德急止之曰：“朝廷自有公论，汝岂可造次？”军士簇拥卢植去了。关公曰：“卢中郎已被逮，别人领兵，我等去无所依，不如且回涿郡。”玄德从其言，遂引军北行。行无二日，忽闻山后喊声大震。玄德引关、张纵马上高冈望之，见汉军大败，后面漫山塞野，黄巾盖地而来，旗上大书“天公将军”。玄德曰：“此张角也！可速战！”三人飞马引军而出。张角正杀败董卓，乘势赴来，忽遇三人冲杀，角军大乱，败走五十余里。%3C/p%3E%3Cp%3E三人救了董卓回寨。卓问三人现居何职。玄德曰：“白身。”卓甚轻之，不为礼。玄德出，张飞大怒曰：“我等亲赴血战，救了这厮，他却如此无礼。若不杀之，难消我气！”便要提刀入帐来杀董卓。正是：人情势利古犹今，谁识英雄是白身？安得快人如翼德，尽诛世上负心人！%3C/p%3E%3Cp%3E毕竟董卓性命如何，且听下文分解。%3C/p%3E", "演义"),
    (10001, "水浒传-张天师祈禳瘟疫　洪太尉误走妖魔", 10001, "%3Cp%3E话说大宋仁宗天子在位，嘉祐三年三月三日五更三点，天子驾坐紫宸殿，受百官朝贺。但见：%3C/p%3E%3Cp%3E祥云迷凤阁，瑞气罩龙楼。含烟御柳拂旌旗，带露宫花迎剑戟。天香影里，玉簪朱履聚丹墀；仙乐声中，绣袄锦衣扶御驾。珍珠帘卷，黄金殿上现金轝，凤羽扇开，白玉阶前停宝辇。隐隐净鞭三下响，层层文武两班齐。%3C/p%3E%3Cp%3E当有殿头官喝道：“有事出班早奏，无事卷帘退朝。”只见班部丛中，宰相赵哲、参政文彦博出班奏曰：“目今京师瘟疫盛行，伤损军民甚多。伏望陛下释罪宽恩，省刑薄税，祈禳天灾，救济万民。”天子听奏，急敕翰林院随即草诏，一面降赦天下罪囚，应有民间税赋，悉皆赦免；一面命在京宫观寺院，修设好事禳灾。不料其年瘟疫转盛，仁宗天子闻知，龙体不安，复会百官计议。向那班部中，有一大臣，越班启奏。天子看时，乃是参知政事范仲淹，拜罢起居，奏曰：“目今天灾盛行，军民涂炭，日夕不能聊生。以臣愚意，要禳此灾，可宣嗣汉天师星夜临朝，就京师禁院，修设三千六百分罗天大醮，奏闻上帝，可以禳保民间瘟疫。”仁宗天子准奏，急令翰林学士草诏一道，天子御笔亲书，并降御香一炷，钦差内外提点殿前太尉洪信为天使，前往江西信州龙虎山，宣请嗣汉天师张真人星夜来朝，祈禳瘟疫。就金殿上焚起御香，亲将丹诏付与洪太尉，即便登程前去。%3C/p%3E%3Cp%3E洪信领了圣敕，辞别天子，背了诏书，盛了御香，带了数十人，上了铺马，一行部队，离了东京，取路径投信州贵溪县来。但见：%3C/p%3E%3Cp%3E遥山叠翠，远水澄清。奇花绽锦绣铺林，嫩柳舞金丝拂地。风和日暖，时过野店山村；路直沙平，夜宿邮亭驿馆。罗衣荡漾红尘内，骏马驰驱紫陌中。%3C/p%3E%3Cp%3E且说太尉洪信赍擎御诏，一行人从，上了路途，不止一日，来到江西信州。大小官员，出郭迎接。随即差人报知龙虎山上清宫住持道众，准备接诏。次日，众位官同送太尉到于龙虎山下，只见上清宫许多道众，鸣钟击鼓，香花灯烛，幢幡宝盖，一派仙乐，都下山来迎接丹诏，直至上清宫前下马。太尉看那宫殿时，端的是好座上清宫!但见：%3C/p%3E%3Cp%3E青松屈曲，翠柏阴森。门悬敕额金书，户列灵符玉篆。虚皇坛畔，依稀垂柳名花；炼药炉边，掩映苍松老桧。左壁厢天丁力士，参随着太乙真君；右势下玉女金童，簇捧定紫微大帝。披发仗剑，北方真武踏龟蛇；趿履顶冠，南极老人伏龙虎。前排二十八宿星君，后列三十二帝天子。阶砌下流水潺。墙院后好山环绕。鹤生丹顶，龟长绿毛。树梢头献果苍猿，莎草内衔芝白鹿。三清殿上，击金钟道士步虚；四圣堂前，敲玉罄真人礼斗。献香台砌，彩霞光射碧琉璃；召将瑶坛，赤日影摇红玛瑙。早来门外祥云现，疑是天师送老君。%3C/p%3E%3Cp%3E当下上自住持真人，下及道童侍从，前迎后引，接至三清殿上，请将诏书居中供养着。洪太尉便问监宫真人道：“天师今在何处？”住持真人向前禀道：“好教太尉得知：这代祖师，号曰虚靖天师，性好清高，倦于迎送，自向龙虎山顶，结一茅庵，修真养性。因此不住本宫。”太尉道：“目今天子宣诏，如何得见？”真人答道：“容禀：诏敕权供在殿上，贫道等亦不敢开读。且请太尉到方丈献茶，再烦计议。”当时将丹诏供养在三清殿上，与众官都到方丈。太尉居中坐下，执事人等献茶，就进斋供，水陆俱备。斋罢，太尉再问真人道：“既然天师在山顶庵中，何不着人请将下来相见，开宣丹诏。”真人禀道：“这代祖师，虽在山顶，其实道行非常，能驾雾兴云，踪迹不定。贫道等如常亦难得见，怎生教人请得下来？”太尉道：“似此如何得见?目今京师瘟疫盛行，今上天子特遣下官赍捧御书丹诏，亲奉龙香，来请天师，要做三千六百分罗天大醮，以禳天灾，救济万民。似此怎生奈何？”真人禀道：“天子要救万民，只除是太尉办一点志诚心，斋戒沐浴，更换布衣，休带从人，自背诏书，焚烧御香，步行上山礼拜，叩请天师，方许得见。如若心不志诚，空走一遭，亦难得见。”太尉听说，便道：“俺从京师食素到此，如何心不志诚。既然恁地，依着你说，明日绝早上山。”%3C/p%3E%3Cp%3E当晚各自权歇。次日五更时分，众道士起来，备下香汤，请太尉起来沐浴，换了一身新鲜布衣，脚下穿上麻鞋草履，吃了素斋，取过丹诏，用黄罗包袱背在脊梁上，手里提着银手炉，降降地烧着御香，许多道众人等，送到后山，指与路径。真人又禀道：“太尉要救万民，休生退悔之心，只顾志诚上去。”%3C/p%3E%3Cp%3E太尉别了众人，口诵天尊宝号，纵步上山来。将至半山，望见大顶直侵霄汉，果然好座大山!正是：%3C/p%3E%3Cp%3E根盘地角，顶接天心。远观磨断乱云痕，近看平吞明月魄。高低不等谓之山，侧石通道谓之岫，孤岭崎岖谓之路，上面平极谓之顶。头圆下壮谓之峦，藏虎藏豹谓之穴，隐风隐云谓之岩，高人隐居谓之洞。有境有界谓之府，樵人出没谓之径，能通车马谓之道，流水有声谓之涧，古渡源头谓之溪，岩崖滴水谓之泉。左壁为掩，右壁为映。出的是云，纳的是雾。锥尖像小，崎峻似峭，悬空似险，削如平。千峰竞秀，万壑争流，瀑布斜飞，藤萝倒挂。虎啸时风生谷口，猿啼时月坠山腰。恰似青黛染成千块玉，碧纱笼罩万堆烟。%3C/p%3E%3Cp%3E这洪太尉独自一个行了一回，盘坡转径，揽葛攀藤。约莫走过了数个山头，三二里多路，看看脚酸腿软，正走不动，口里不说，肚里踌躇，心中想道：“我是朝廷贵官，在京师时，重裀而卧，列鼎而食，尚兀自倦怠，何曾穿草鞋，走这般山路!知他天师在那里，却教下官受这般苦！”又行不到三五十步，掇着肩气喘，只见山凹里起一阵风。风过处，向那松树背后，奔雷也似吼了一声，扑地跳出一个吊睛白额锦毛大虫来，洪太尉吃了一惊，叫声：“阿呀！”扑地望后便倒。偷眼看那大虫时，但见：%3C/p%3E%3Cp%3E毛披一带黄金色，爪露银钩十八只。睛如闪电尾如鞭，口似血盆牙似戟。伸腰展臂势狰狞，摆尾摇头声霹雳。山中狐兔尽潜藏，涧下獐皆敛迹。%3C/p%3E%3Cp%3E那大虫望着洪太尉，左盘右旋，咆哮了一回，托地望后山坡下跳了去。洪太尉倒在树根底下，唬的三十六个牙齿捉对儿厮打，那心头一似十五个吊桶，七上八落的响，浑身却如重风麻木，两腿一似斗败公鸡，口里连声叫苦。%3C/p%3E%3Cp%3E大虫去了一盏茶时，方才爬将起来，再收拾地上香炉，还把龙香烧着，再上山来，务要寻见天师。又行过三五十步，口里叹了数口气，怨道：“皇帝御限差俺来这里，教我受这场惊恐。”说犹未了，只觉得那里又一阵风，吹得毒气直冲将来，太尉定睛看时，山边竹藤里簌簌地响，抢出一条吊桶大小雪花也似蛇来。太尉见了，又吃一惊，撇了手炉，叫一声：“我今番死也！”往后便倒在盘陀石边。微闪开眼来看那蛇时，但见：%3C/p%3E%3Cp%3E昂首惊飙起，掣目电光生。动荡则折峡倒冈，呼吸则吹云吐雾。鳞甲乱分千片玉，尾梢斜卷一堆银。%3C/p%3E%3Cp%3E那条大蛇，径抢到盘陀石边，朝着洪太尉盘做一堆，两只眼迸出金光，张开巨口，吐出舌头，喷那毒气在洪太尉脸上，惊得太尉三魂荡荡，七魄悠悠。那蛇看了洪太尉一回，望山下一溜，却早不见了。太尉方才爬得起来，说道：“惭愧!惊杀下官！”看身上时，寒栗子比餶飿儿大小，口里骂那道士：“叵耐无礼，戏弄下官，教俺受这般惊恐!若山上寻不见天师，下去和他别有话说。”再拿了银提炉，整顿身上诏敕，并衣服巾帻，却待再要上山去。正欲移步，只听得松树背后隐隐地笛声吹响，渐渐近来。太尉定睛看时，只见那一个道童，倒骑着一头黄牛，横吹着一管铁笛，转出山凹来。太尉看那道童时：%3C/p%3E%3Cp%3E头绾两枚丫髻，身穿一领青衣，腰间绦结草来编，脚下芒鞋麻间隔。明眸皓齿，飘飘并不染尘埃；绿鬓朱颜，耿耿全然无俗态。昔日吕洞宾有首牧童诗道得好：%3C/p%3E%3Cp%3E草铺横野六七里，笛弄晚风三四声。归来饱饭黄昏后，不脱蓑衣卧月明。%3C/p%3E%3Cp%3E但见那个道童笑吟吟地骑着黄牛，横吹着那管铁笛，正过山来。洪太尉见了，便唤那个道童：“你从那里来?认得我么？”道童不睬，只顾吹笛。太尉连问数声，道童呵呵大笑，拿着铁笛，指着洪太尉说道：“你来此间，莫非要见天师么？”太尉大惊，便道：“你是牧童，如何得知？”道童笑道：“我早间在草庵中伏侍天师，听得天师说道：‘今上皇帝差个洪太尉赍擎丹诏御香，到来山中，宣我往东京做三千六百分罗天大醮，祈禳天下瘟疫，我如今乘鹤驾云去也。’这早晚想是去了，不在庵中。你休上去，山内毒虫猛兽极多，恐伤害了你性命。”太尉再问道：“你不要说谎。”道童笑了一声，也不回应，又吹着铁笛，转过山坡去了。太尉寻思道：“这小的如何尽知此事?想是天师分付他，已定是了。”欲待再上山去；方才惊的苦，争些儿送了性命，不如下山去罢。%3C/p%3E%3Cp%3E太尉拿着提炉，再寻旧路，奔下山来。众道士接着，请至方丈坐下。真人便问太尉道：“曾见天师么？”太尉说道：“我是朝中贵官，如何教俺走得山路，吃了这般辛苦，争些儿送了性命。为头上至半山里，跳出一只吊睛白额大虫，惊得下官魂魄都没了；又行不过一个山嘴，竹藤里抢出一条雪花大蛇来，盘做一堆，拦住去路。若不是俺福分大，如何得性命回京?尽是你这道众戏弄下官。”真人复道：“贫道等怎敢轻慢大臣?这是祖师试探太尉之心。本山虽有蛇虎，并不伤人。”太尉又道：“我正走不动，方欲再上山坡，只见松树旁边转出一个道童，骑着一头黄牛，吹着管铁笛，正过山来，我便问他：‘那里来?识得俺么？’他道：‘已都知了。’说天师分付，早晨乘鹤驾云，往东京去了，下官因此回来。”真人道：“太尉可惜错过，这个牧童，正是天师。”太尉道：“他既是天师，如何这等猥獕？”真人答道：“这代天师，非同小可。虽然年幼，其实道行非常。他是额外之人，四方显化，极是灵验，世人皆称为道通祖师。”洪太尉道：“我直如此有眼不识真师，当面错过！”真人道：“太尉且请放心。既然祖师法旨道是去了，比及太尉回京之日，这场醮事，祖师已都完了。”太尉见说，方才放心。真人一面教安排筵宴，管待太尉，请将丹诏收藏于御书匣内，留在上清宫中，龙香就三清殿上烧了。当日方丈内大排斋供，设宴饮酌，至晚席罢，止宿到晓。%3C/p%3E%3Cp%3E次日早膳以后，真人、道众并提点、执事人等，请太尉游山。太尉大喜。许多人从跟随着，步行出方丈，前面两个道童引路。行至宫前宫后，看玩许多景致。三清殿上，富贵不可尽言。左廊下九天殿、紫微殿、北极殿；右廊下太乙殿、三官殿、驱邪殿。诸宫看遍，行到右廊后一所去处。洪太尉看时，另外一所殿宇：一遭都是捣椒红泥墙；正面两扇朱红格子，门上使着膊大锁锁着，交叉上面贴着十数道封皮，封皮上又是重重叠叠使着朱印；檐前一面朱红漆金字牌额，左书四个金字，写道：“伏魔之殿”。太尉指着门道：“此殿是甚么去处？”真人答道：“此乃是前代老祖天师锁镇魔王之殿。”太尉又问道：“如何上面重重叠叠贴着许多封皮？”真人答道：“此是老祖大唐洞玄国师封锁魔王在此。但是经传一代天师，亲手便添一道封皮，使其子子孙孙，不得妄开。走了魔君，非常利害。今经八九代祖师，誓不敢开。锁用铜汁灌铸，谁知里面的事?小道自来住持本宫三十余年，也只听闻。”%3C/p%3E%3Cp%3E洪太尉听了，心中惊怪，想道：“我且试看魔王一看。”便对真人说道：“你且开门来，我看魔王甚么模样。”真人告道：“太尉，此殿决不敢开!先祖天师叮咛告戒：今后诸人不许擅开。”太尉笑道：“胡说!你等要妄生怪事，煽惑良民，故意安排这等去处，假称锁镇魔王，显耀你们道术。我读一鉴之书，何曾见锁魔之法!神鬼之道，处隔幽冥，我不信有魔王在内。快与我打开，我看魔王如何！”真人三回五次禀说：“此殿开不得，恐惹利害，有伤于人。”太尉大怒，指着道众说道：“你等不开与我看，回到朝廷，先奏你们众道士阻当宣诏，违别圣旨，不令我见天师的罪犯；后奏你等私设此殿，假称锁镇魔王，煽惑军民百姓。把你都追了度牒，刺配远恶军州受苦。”%3C/p%3E%3Cp%3E真人等惧怕太尉权势，只得唤几个火工道人来，先把封皮揭了，将铁锤打开大锁，众人把门推开，看里面时，黑洞洞地，但见：%3C/p%3E%3Cp%3E昏昏默默，杳杳冥冥，数百年不见太阳光，亿万载难瞻明月影。不分南北，怎辨东西。黑烟霭霭扑人寒，冷气阴阴侵体颤。人迹不到之处，妖精往来之乡，闪开双目有如盲，伸出两手不见掌。常如三十夜，却似五更时。%3C/p%3E%3Cp%3E众人一齐都到殿内，黑暗暗不见一物。太尉教从人取十数个火把点着，将来打一照时，四边并无一物，只中央一个石碑，约高五六尺，下面石龟趺坐，大半陷在泥里。照那碑碣上时，前面都是龙章凤篆，天书符籙，人皆不识。照那碑后时，却有四个真字大书，凿着“遇洪而开”。却不是一来天罡星合当出世，二来宋朝必显忠良，三来凑巧遇着洪信，岂不是天数?洪太尉看了这四个字，大喜，便对真人说道：“你等阻当我，却怎地数百年前已注定我姓字在此?遇洪而开，分明是教我开看，却何妨。我想这个魔王，都只在石碑底下。汝等从人，与我多唤几个火工人等，将锄头铁锹来掘开。”%3C/p%3E%3Cp%3E真人慌忙谏道：“太尉不可掘动，恐有利害，伤犯于人，不当稳便。”太尉大怒，喝道：“你等道众，省得甚么?碑上分明凿着遇我教开，你如何阻当?快与我唤人来开。”真人又三回五次禀道：“恐有不好。”太尉那里肯听，只得聚集众人，先把石碑放倒，一齐并力掘那石龟，半日方才掘得起。又掘下去，约有三四尺深，见一片大青石板，可方丈围。洪太尉叫再掘起来，真人又苦禀道：“不可掘动。”太尉那里肯听，众人只得把石板一齐扛起，看时，石板底下，却是一个万丈深浅地穴。只见穴内刮喇喇一声响亮。那响非同小可，恰似：%3C/p%3E%3Cp%3E天摧地塌，岳撼山崩。钱塘江上，潮头浪拥出海门来；泰华山头，巨灵神一劈山峰碎。共工奋怒，去盔撞倒了不周山；力士施威，飞锤击碎了始皇辇。一风撼折千竿竹，十万军中半夜雷。那一声响亮过处，只见一道黑气，从穴里滚将起来，掀塌了半个殿角。那道黑气，直冲到半天里空中，散作百十道金光，望四面八方去了。众人吃了一惊，发声喊，都走了，撇下锄头铁锹，尽从殿内奔将出来，推倒翻无数。惊得洪太尉目睁口呆，罔知所措，面色如土，奔到廊下，只见真人向前叫苦不迭。%3C/p%3E%3Cp%3E太尉问道：“走了的却是甚么妖魔？”那真人言不过数句，话不过一席，说出这个缘由。有分教：一朝皇帝，夜眠不稳，昼食忘餐。直使：宛子城中藏虎豹，蓼儿洼内聚神蛟。%3C/p%3E%3Cp%3E毕竟龙虎山真人说出甚么言语来，且听下回分解。%3C/p%3E", "小说"),
    (10002, "西游记-灵根育孕源流出 心性修持大道生", 10002, "%3Cp%3E詩曰：混沌未分天地亂，茫茫渺渺無人見。自從盤古破鴻蒙，開闢從茲清濁辨。覆載群生仰至仁，發明萬物皆成善。欲知造化會元功，須看西遊釋厄傳。%3C/p%3E%3Cp%3E蓋聞天地之數，有十二萬九千六百歲為一元。將一元分為十二會，乃子、丑、寅、卯、辰、巳、午、未、申、酉、戌、亥之十二支也。每會該一萬八百歲。且就一日而論：子時得陽氣，而丑則雞鳴；寅不通光，而卯則日出；辰時食後，而巳則挨排；日午天中，而未則西蹉；申時晡而日落酉；戌黃昏而人定亥。譬於大數，若到戌會之終，則天地昏蒙而萬物否矣。再去五千四百歲，交亥會之初，則當黑暗，而兩間人物俱無矣，故曰混沌。%3C/p%3E%3Cp%3E又五千四百歲，亥會將終，貞下起元，近子之會，而復逐漸開明。邵康節曰：「冬至子之半，天心無改移。一陽初動處，萬物未生時。」到此，天始有根。再五千四百歲，正當子會，輕清上騰，有日，有月，有星，有辰。日、月、星、辰，謂之四象。故曰，天開於子。又經五千四百歲，子會將終，近丑之會，而逐漸堅實。易曰：「大哉乾元！至哉坤元！萬物資生，乃順承天。」至此，地始凝結。再五千四百歲，正當丑會，重濁下凝，有水，有火，有山，有石，有土。水、火、山、石、土謂之五形。故曰，地辟於丑。又經五千四百歲，丑會終而寅會之初，發生萬物。曆曰：「天氣下降，地氣上升；天地交合，群物皆生。」至此，天清地爽，陰陽交合。再五千四百歲，正當寅會，生人，生獸，生禽，正謂天地人，三才定位。故曰，人生於寅。感盤古開闢，三皇治世，五帝定倫，世界之間，遂分為四大部洲：曰東勝神洲，曰西牛賀洲，曰南贍部洲，曰北俱蘆洲。%3C/p%3E%3Cp%3E這部書單表東勝神洲，海外有一國土，名曰傲來國。國近大海，海中有一座山，喚為花果山。此山乃十洲之祖脈，三島之來龍，自開清濁而立，鴻蒙判後而成。真個好山！有詞賦為證。賦曰：%3C/p%3E%3Cp%3E勢鎮汪洋，威寧瑤海。勢鎮汪洋，潮湧銀山魚入穴；威寧瑤海，波翻雪浪蜃離淵。木火方隅高積上，東海之處聳崇巔。丹崖怪石，削壁奇峰。丹崖上，彩鳳雙鳴；削壁前，麒麟獨臥。峰頭時聽錦雞鳴，石窟每觀龍出入。林中有壽鹿仙狐，樹上有靈禽玄鶴。瑤草奇花不謝，青松翠柏長春。仙桃常結果，修竹每留雲。一條澗壑籐蘿密，四面原堤草色新。正是百川會處擎天柱，萬劫無移大地根。%3C/p%3E%3Cp%3E那座山，正當頂上有一塊仙石。其石有三丈六尺五寸高，有二丈四尺圍圓。三丈六尺五寸高，按周天三百六十五度；二丈四尺圍圓，按政曆二十四氣。上有九竅八孔，按九宮八卦。四面更無樹木遮陰，左右倒有芝蘭相襯。蓋自開闢以來，每受天真地秀，日精月華，感之既久，遂有靈通之意。內育仙胞，一日迸裂，產一石卵，似圓球樣大。因見風，化作一個石猴，五官俱備，四肢皆全。便就學爬學走，拜了四方。目運兩道金光，射沖斗府。驚動高天上聖大慈仁者玉皇大天尊玄穹高上帝，駕座金闕雲宮靈霄寶殿，聚集仙卿，見有金光焰焰，即命千里眼、順風耳開南天門觀看。%3C/p%3E%3Cp%3E二將果奉旨出門外，看得真，聽得明。須臾回報道：「臣奉旨觀聽金光之處，乃東勝神洲海東傲來小國之界，有一座花果山，山上有一仙石，石產一卵，見風化一石猴，在那裏拜四方，眼運金光，射沖斗府。如今服餌水食，金光將潛息矣。」玉帝垂賜恩慈曰：「下方之物，乃天地精華所生，不足為異。」那猴在山中，卻會行走跳躍，食草木，飲澗泉，採山花，覓樹果；與狼蟲為伴，虎豹為群，獐鹿為友，獼猿為親；夜宿石崖之下，朝遊峰洞之中。真是「山中無甲子，寒盡不知年。」%3C/p%3E%3Cp%3E一朝天氣炎熱，與群猴避暑，都在松蔭之下頑耍。你看他一個個：跳樹攀枝，採花覓果；拋彈子，邷么兒；跑沙窩，砌寶塔；趕蜻蜓，撲叭蠟；參老天，拜菩薩；扯葛籐，編草襪；捉虱子，咬又掐；理毛衣，剔指甲；挨的挨，擦的擦；推的推，壓的壓；扯的扯，拉的拉，青松林下任他玩，綠水澗邊隨洗濯。一群猴子耍了一會，卻去那山澗中洗澡。見那股澗水奔流，真個似滾瓜湧濺。古云：「禽有禽言，獸有獸語。」眾猴都道：「這股水不知是哪裏的水？我們今日趕閑無事，順澗邊往上溜頭尋看源流，耍子去耶！」喊一聲，都拖男挈女，呼弟呼兄，一齊跑來，順澗爬山，直至源流之處，乃是一股瀑布飛泉。但見那：%3C/p%3E%3Cp%3E一派白虹起，千尋雪浪飛；海風吹不斷，江月照還依。冷氣分青嶂，餘流潤翠微；潺湲名瀑布，真似掛簾帷。%3C/p%3E%3Cp%3E眾猴拍手稱揚道：「好水！好水！原來此處遠通山腳之下，直接大海之波。」又道：「哪一個有本事的，鑽進去尋個源頭出來，不傷身體者，我等即拜他為王。」連呼了三聲，忽見叢雜中跳出一名石猴，應聲高叫道：「我進去！我進去！」好猴！也是他：%3C/p%3E%3Cp%3E今日芳名顯，時來大運通；有緣居此地，王遣入仙宮。%3C/p%3E%3Cp%3E你看他瞑目蹲身，將身一縱，逕跳入瀑布泉中，忽睜睛抬頭觀看，那裏邊卻無水無波，明明朗朗的一架橋樑。他住了身，定了神，仔細再看，原來是座鐵板橋。橋下之水，沖貫於石竅之間，倒掛流出去，遮閉了橋門。卻又欠身上橋頭，再走再看，卻似有人家住處一般，真個好所在。但見那：%3C/p%3E%3Cp%3E翠蘚堆藍，白雲浮玉，光搖片片煙霞。虛窗靜室，滑凳板生花。乳窟龍珠倚掛，縈迴滿地奇葩。鍋灶傍崖存火跡，樽罍靠案見餚渣。石座石床真可愛，石盆石碗更堪誇。又見那一竿兩竿修竹，三點五點梅花。幾樹青松常帶雨，渾然像個人家。%3C/p%3E%3Cp%3E看罷多時，跳過橋中間，左右觀看，只見正當中有一石碣。碣上有一行楷書大字，鐫著『花果山福地，水簾洞洞天。』石猴喜不自勝，急抽身往外便走，復瞑目蹲身，跳出水外，打了兩個呵呵道：「大造化！大造化！」眾猴把他圍住，問道：「裏面怎麼樣？水有多深？」石猴道：「沒水！沒水！原來是一座鐵板橋。橋那邊是一座天造地設的家當。」眾猴道：「怎見得是個家當？」石猴笑道：「這股水乃是橋下沖貫石橋，倒掛下來遮閉門戶的。橋邊有花有樹，乃是一座石房。房內有石窩、石灶、石碗、石盆、石床、石凳。中間一塊石碣上，鐫著『花果山福地，水簾洞洞天。』真個是我們安身之處。裏面且是寬闊，容得千百口老小。我們都進去住也，省得受老天之氣。」這裏邊：%3C/p%3E%3Cp%3E颳風有處躲，下雨好存身。霜雪全無懼，雷聲永不聞。煙霞常照耀，祥瑞每蒸熏。松竹年年秀，奇花日日新。%3C/p%3E%3Cp%3E眾猴聽得，個個歡喜，都道：「你還先走，帶我們進去，進去！」石猴卻又瞑目蹲身，往裏一跳，叫道：「都隨我進來！進來！」那些猴有膽大的，都跳進去了；膽小的，一個個伸頭縮頸，抓耳撓腮，大聲叫喊，纏一會，也都進去了。跳過橋頭，一個個搶盆奪碗，佔灶爭床，搬過來，移過去，正是猴性頑劣，再無一個寧時，只搬得力倦神疲方止。石猿端坐上面道：「列位啊，人而無信，不知其可。你們才說有本事進得來，出得去，不傷身體者，就拜他為王。我如今進來又出去，出去又進來，尋了這一個洞天與列位安眠穩睡，各享成家之福，何不拜我為王？」眾猴聽說，即拱伏無違。一個個序齒排班，朝上禮拜，都稱「千歲大王」。自此，石猴高登王位，將「石」字兒隱了，遂稱美猴王。有詩為證。詩曰：%3C/p%3E%3Cp%3E三陽交泰產群生，仙石胞含日月精。借卵化猴完大道，假他名姓配丹成。內觀不識因無相，外合明知作有形。歷代人人皆屬此，稱王稱聖任縱橫。%3C/p%3E%3Cp%3E美猴王領一群猿猴、獼等，分派了君臣佐使，朝遊花果山，暮宿水簾洞。合契同情，不入飛鳥之叢，不從走獸之類，獨自為王，不勝歡樂。是以：%3C/p%3E%3Cp%3E春採百花為飲食，夏尋諸果作生涯。秋收芋栗延時節，冬覓黃精度歲華。%3C/p%3E%3Cp%3E美猴王享樂天真，何期有三五百載。一日，與群猴喜宴之間，忽然憂惱，墮下淚來。眾猴慌忙羅拜道：「大王何為煩惱？」猴王道：「我雖在歡喜之時，卻有一點兒遠慮，故此煩惱。」眾猴又笑道：「大王好不知足！我等日日歡會，在仙山福地，古洞神洲，不伏麒麟轄，不伏鳳凰管，又不伏人間王位所拘束，自由自在，乃無量之福，為何遠慮而憂也？」猴王道：「今日雖不歸人王法律，不懼禽獸威嚴，將來年老血衰，暗中有閻王老子管著，一旦身亡，可不枉生世界之中，不得久住天人之內？」眾猴聞此言，一個個掩面悲啼，俱以無常為慮。%3C/p%3E%3Cp%3E只見那班部中，忽跳出一個通背猿猴，厲聲高叫道：「大王若是這般遠慮，真所謂道心開發也！如今五蟲之內，惟有三等名色，不伏閻王老子所管。」猴王道：「你知哪三等人？」猿猴道：「乃是佛與仙與神聖三者，躲過輪迴，不生不滅，與天地山川齊壽。」猴王道：「此三者居與何所？」猿猴道：「他只在閻浮世界之中，古洞仙山之內。」猴王聞之，滿心歡喜，道：「我明日就辭汝等下山，雲遊海角，遠涉天涯，務必訪此三者，學一個不老長生，常躲過閻君之難。」噫！這句話，頓叫跳出輪迴網，致使齊天大聖成。眾猴鼓掌稱揚，都道：「善哉！善哉！我等明日越嶺登山，廣尋些果品，大設筵宴送大王也。」次日，眾猴果去採仙桃，摘異果，刨山藥，斸黃精。芝蘭香蕙，瑤草奇花般般件件，整整齊齊，擺開石凳石桌，排列仙酒仙餚。但見那：%3C/p%3E%3Cp%3E金丸珠彈，紅綻黃肥。金丸珠彈臘櫻桃，色真甘美；紅綻黃肥熟梅子，味果香酸。鮮龍眼，肉甜皮薄；火荔枝，核小囊紅。林檎碧實連枝獻，枇把緗苞帶葉攀。兔頭梨子雞心棗，消渴除煩更解酲。香桃爛杏，美甘甘似玉液瓊漿；脆李楊梅，酸蔭蔭如脂酥膏酪。紅囊黑子熟西瓜，四瓣黃皮大柿子。石榴裂破，丹砂粒現火晶珠；芋栗剖開，堅硬肉團金瑪瑙。胡桃銀杏可傳茶，椰子葡萄能做酒。榛松榧柰滿盤盛，桔蔗柑橙盈案擺。熟煨山藥，爛煮黃精。搗碎茯苓併薏苡，石鍋微火漫炊羹。人間縱有珍羞味，怎比山猴樂更寧！%3C/p%3E%3Cp%3E群猴尊美猴王上坐，各依齒肩排於下邊，一個個輪流上前，奉酒，奉花，奉果，痛飲了一日。次日，美猴王早起，叫：「小的們，替我折些枯松，編作筏子，取個竹竿作篙，收拾些果品之類，我將去也。」果獨自登筏，盡力撐開，飄飄蕩蕩，徑向大海波中，趁天風，來渡南贍部洲地界。這一去，正是那：%3C/p%3E%3Cp%3E天產仙猴道行隆，離山駕筏趁天風。飄洋過海尋仙道，立志潛心建大功。有分有緣休俗願，無憂無慮會元龍。料應必遇知音者，說破源流萬法通。%3C/p%3E%3Cp%3E也是他運至時來，自登木筏之後，連日東南風緊，將他送到西北岸前，乃是南贍部洲地界。持篙試水，棄了筏子，跳上岸來，只見海邊有人捕魚、打雁、穵蛤、淘鹽。他走近前，弄個把戲，妝個剎虎，嚇得那些人丟筐棄網，四散奔跑。將那跑不動的拿住一個，剝了他的衣裳，也學人穿在身上，搖搖擺擺，穿州過府，在市廛中學人禮，學人話。朝餐夜宿，一心裏訪問佛仙神聖之道，覓個長生不老之方。見世人都是為名為利之徒，更無一個為身命者。正是那：%3C/p%3E%3Cp%3E爭名奪利幾時休？早起遲眼不自由！騎著驢騾思駿馬，官居宰相望王侯。只愁衣食耽勞碌，何怕閻君就取勾？濟子蔭孫圖富貴，更無一個肯回頭！%3C/p%3E%3Cp%3E猴王參訪仙道，無緣得遇。在於南贍部洲，串長城，遊小縣，不覺八九年餘。忽行至西洋大海，他想著海外必有神仙。獨自個依前作筏，又飄過西海，直西牛賀洲地界。登岸遍訪多時，忽見一座高山秀麗，林麓幽深。他也不怕狼蟲，不懼虎豹，登山頂上觀看。果是好山：%3C/p%3E%3Cp%3E千峰排戟，萬仞開屏。日映嵐光輕鎖翠，雨收黛色冷含青。瘦籐纏老樹，古渡界幽程。奇花瑞草，修竹喬松。修竹喬松，萬載常青欺福地；奇花瑞草，四時不謝賽蓬瀛。幽鳥啼聲近，源泉溜清。重重谷壑芝蘭繞，處處巉崖苔蘚生。起伏巒頭龍脈好，必有高人隱姓名。%3C/p%3E%3Cp%3E正觀看間，忽聞得林深之外，有人言語，急忙趨步，穿入林中，側耳而聽，原來是歌唱之聲。歌曰：%3C/p%3E%3Cp%3E觀棋柯爛，伐木丁丁，雲邊谷口徐行，賣薪沽酒，狂笑自陶情。蒼徑秋高，對月枕松根，一覺天明。認舊林，登崖過嶺，持斧斷枯籐。收來成一擔，行歌市上，易米三升。更無些子爭競，時價平平，不會機謀巧算，沒榮辱，恬淡延生。相逢處，非仙即道，靜坐講黃庭。%3C/p%3E%3Cp%3E美猴王聽得此言，滿心歡喜道：「神仙原來藏在這裏！」即忙跳入裏面，仔細再看，乃是一個樵子，在那裏舉斧砍柴。但看他打扮非常：頭上戴箬笠，乃是新筍初脫之籜。身上穿布衣，乃是木綿拈就之紗。腰間繫環絛，乃是老蠶口吐之絲。足下踏草履，乃是枯莎槎之爽。手執衠鋼斧，擔挽火麻繩。扳松劈枯樹，爭似此樵能！%3C/p%3E%3Cp%3E猴王近前叫道：「老神仙！弟子起手。」那樵漢慌忙丟了斧，轉身答禮道：「不當人！不當人！我拙漢衣食不全，怎敢當神仙二字？」猴王道：「你不是神仙，如何說出神仙的話來？」樵夫道：「我說甚麼神仙話？」猴王道：「我才來至林邊，只聽得你說：相逢處非仙即道，靜坐講黃庭。黃庭乃道德真言，非神仙而何？」樵夫笑道：「實不瞞你說，這個詞名做《滿庭芳》，乃一神仙教我的。那神仙與我舍下相鄰。他見我家事勞苦，日常煩惱，教我遇煩惱時即把這詞兒唸唸，一則散心，二則解困。我才有些不足處思慮，故此唸唸。不期被你聽了。」猴王道：「你家即與神仙鄰，何不從他修行？學得個不老之方，卻不是好？」樵夫道：「我一生命苦：自幼蒙父母養育之八九歲，才知人事，不幸父喪，母親居孀。再無兄弟姐妹，只我一人，沒奈何，早晚侍奉。如今母老，一發不敢拋離。卻又田園荒蕪，衣食不足，只得斫兩束柴薪，挑向市塵之間，貨幾文錢，糴幾升米，自炊自造，安排些茶飯，供養老母，所以不能修行。」%3C/p%3E%3Cp%3E猴王道：「據你說起來，乃是一個行孝的君子，向後必有好處。但望你指與我那神仙住處，卻好拜訪去也。」樵夫道：「不遠，不遠。此山叫做靈台方寸山。山中有座斜月三星洞。那洞中有一個神仙，稱名須菩提祖師。那祖師出去的徒弟，也不計其數，見今還有三四十人從他修行。你順那條小路兒，向南行七八里遠近，即是他家了。」猴王用手扯住樵夫道：「老兄，你便同我去去。若還得了好處，決不忘你指引之恩。」樵夫道：「你這漢子，甚不通變。我方纔這般與你說了，你還不省？假若我與你去了，卻不誤了我的生意？老母何人奉養？我要斫柴，你自去，自去。」猴王聽說，只得相辭。出深林，找上路徑，過一山坡，約有七八里遠，果然望見一座洞府。挺身觀看，真好去處！但見：%3C/p%3E%3Cp%3E煙霞散彩，日月搖光。千株老柏，萬節修篁。千株老柏，帶雨半空青冉冉；萬節修篁，含煙一壑色蒼蒼。門外奇花布錦，橋邊瑤草噴香。石崖突兀青苔潤，懸壁高張翠蘚長。時聞仙鶴唳，每見鳳凰翔。仙鶴唳時，聲振九皋霄漢遠；鳳凰翔起，翎毛五色彩雲光。玄猿白鹿隨隱見，金獅玉象任行藏。細觀靈福地，真個賽天堂！%3C/p%3E%3Cp%3E又見那洞門緊閉，靜悄悄杳無人跡。忽回頭，見崖頭立一石碑，約有三丈餘高，八尺餘闊，上有一行十個大字，乃是『靈台方寸山斜月三星洞』。美猴王十分歡喜道：「此間人果是樸實。果有此山此洞。」看夠多時，不敢敲門。且去跳上松枝梢頭，摘松子吃了頑耍。少頃間，只聽得呀的一聲，洞門開處，裏面走出一個仙童，真個丰姿英偉，相貌清奇，比尋常俗子不同。但見他：%3C/p%3E%3Cp%3E髽髻雙絲綰，寬袍兩袖風。貌和身自別，心與相俱空。物外長年客，山中永壽童。一塵全不染，甲子任翻騰。%3C/p%3E%3Cp%3E那童子出得門來，高叫道：「甚麼人在此騷擾？」猴王噗的跳下樹來，上前躬身道：「仙童，我是個訪道學仙弟子，更不敢在此騷擾。」仙童笑道：「你是個訪道的麼？」猴王道：「是。」童子道：「我家師父正才下榻，登壇講道，還未說出原由，就叫我出來開門。說：『外面有個修行的來了，可去接待接待。』想必就是你了？」猴王笑道：「是我，是我。」童子道：「你跟我進來。」這猴王整衣端肅，隨童子進入洞天深處觀看：一層層深閣瓊樓，一進進珠宮貝闕，說不盡那靜室幽居，直至瑤台下。見那菩提祖師瑞坐在台上，兩邊有三十個小仙侍立台下。果然是：%3C/p%3E%3Cp%3E大覺金仙沒垢姿，西方妙相祖菩提。不生不滅三三行，全氣全神萬萬慈。空寂自然隨變化，真如本性任為之。與天同壽莊嚴體，歷劫明心大法師。%3C/p%3E%3Cp%3E美猴王一見，倒身下拜，磕頭不計其數，口中只道：「師父！師父！我弟子志心朝禮！志心朝禮！」祖師道：「你是哪方人氏？且說個鄉貫姓名明白，再拜。」猴王道：「弟子乃東勝神洲傲來國花果山水簾洞人氏。」祖師喝令：「趕出去！他本是撒詐搗虛之徒，哪裏修甚麼道果！」猴王慌忙磕頭不住道：「弟子是老實之言，決無虛詐。」祖師道：「你既老實，怎麼說東勝神洲？那去處到我這裏，隔兩重大海，一座南贍部洲，如何就得到此？」猴王叩頭道：「弟子飄洋過海，登界遊方，有十數個年頭，方才訪到此處。」祖師道：「既是逐漸行來的也罷。你姓甚麼？」猴王又道：「我無性。人若罵我，我也不惱；若打我，我也不嗔，只是賠個禮就罷了。一生無性。」祖師道：「不是這個性。你父母原來姓甚麼？」猴王道：「我也無父母。」祖師道：「既無父母，想是樹上生的？」猴王道：「我雖不是樹上生，卻是石裏長的。我只記得花果山上有一塊仙石，其年石破，我便生也。」%3C/p%3E%3Cp%3E祖師聞言暗喜，道：「這等說，卻是個天地生的。你起來走走我看。」猴王縱身跳起，拐呀拐的走了兩遍。祖師笑道：「你身軀雖是鄙陋，卻像個食松果的猢猻。我與你就身上取個姓氏，意思叫你姓『猢』。猢字去了獸旁，乃是個古月。古者，老也；月者，陰也。老陰不能化育，叫你姓『猢』倒好。猻字去了獸旁，乃是個子系。子者，兒男也；系者，嬰細也。正合嬰兒之本論。叫你姓『孫』罷。」猴王聽說，滿心歡喜，朝上叩頭道：「好！好！好！今日方知姓也。萬望師父慈悲！既然有姓，再乞賜個名字，卻好呼喚。」祖師道：「我們中有十二個字，分派起名，到你乃第十輩之小徒矣。」猴王道：「哪十二個字？」祖師道：「乃廣、大、智、慧、真、如、性、海、穎、悟、圓、覺十二個字。排到你，正當『悟』字。與你起個法名叫做『孫悟空』，好麼？」猴王笑道：「好！好！好！自今就叫做孫悟空也！」%3C/p%3E%3Cp%3E正是：鴻蒙初辟原無姓，打破頑空須悟空。畢竟不知向後修些甚麼道果，且聽下回分解。%3C/p%3E", "小说");

INSERT INTO comment
    (id, user_id, reply_id, parent_id, content)
VALUES
    (10000, 10003, 0, 10001, "我点个赞");

INSERT INTO share
    (id, user_id, parent_id)
VALUES
	(10000, 10003, 10000);
