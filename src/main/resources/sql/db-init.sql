CREATE SCHEMA IF NOT EXISTS app;

CREATE TABLE IF NOT EXISTS app.form_config (
	id integer NOT NULL,
	
	name varchar(200) NULL,
	flowable boolean DEFAULT false,
	flow_name varchar(50) NULL,

	privileges text,
	json_ui text,

	creator varchar(20),
	modifier varchar(20),
	create_time timestamp,
	modify_time timestamp,

	primary key(id)
);

CREATE TABLE IF NOT EXISTS app.form (
	id integer NOT NULL,
	
	approval_status varchar(20),
	json_data text,

	product_category varchar(20),
	product_no varchar(30),
	order_no varchar(30),
	client_no varchar(30),
	client_name varchar(30),

	apply_time timestamp,
	complete_time timestamp,
	timestamp_ timestamp,

	creator varchar(20),
	modifier varchar(20),
	create_time timestamp,
	modify_time timestamp,	

	primary key(id)
);

CREATE TABLE IF NOT EXISTS app.config (
	code varchar(60) NOT NULL,
	category varchar(60),
	value_ text, -- value 是 h2 保留字, 不可使用為欄位名稱
	description varchar(200),
	creator varchar(30),
	modifier varchar(30),
	create_time timestamp,
	modify_time timestamp,
	primary key(code)
);

MERGE INTO app.config (`code`,`category`,`value_`,`description`,`creator`,`modifier`,`create_time`,`modify_time`) VALUES ('APPROVAL_STATUS','DROPDOWN','[{"code":"UNSAVED","name":"新文件（未保存）"},{"code":"SAVED","name":"新文件（已保存）"},{"code":"PENDING","name":"審批中"},{"code":"APPROVED","name":"審批通過"},{"code":"REJECTED","name":"審批不通過"},{"code":"FORKED","name":"舊單複製"},{"code":"QA_REVIEW","name":"品保審單Y"},{"code":"IMPORTED","name":"匯入"}]','MPB 訂單審批狀態','ur04192','ur04192','2023-05-31 22:23:08','2023-05-31 22:23:08');
MERGE INTO app.config (`code`,`category`,`value_`,`description`,`creator`,`modifier`,`create_time`,`modify_time`) VALUES ('CATEGORY','DROPDOWN','[{"code":"DROPDOWN","name":"下拉選單"},{"code":"HIERARCHICAL_DROPDOWN","name":"階層式下拉選單"},{"code":"TABLE_SELECT","name":"表格選取"},{"code":"MPB_FORM","name":"MPB 表單"},{"code":"MPB_FORM_LAB","name":"MPB 表單（實驗）"},{"code":"ICON_DROPDOWN","name":"圖示下拉選單"},{"code":"MISC","name":"其他"}]','系統設定分類','ur04192','ur04192','2023-05-29 16:24:39','2023-06-16 14:25:07');
MERGE INTO app.config (`code`,`category`,`value_`,`description`,`creator`,`modifier`,`create_time`,`modify_time`) VALUES ('DATE_FORMAT','DROPDOWN','[{"name":"yyyyMM"},{"name":"yyyy"},{"name":"yyyy/MM/dd"}]','日期格式','ur04192','ur04192','2023-06-08 13:40:06','2023-06-08 13:40:06');
MERGE INTO app.config (`code`,`category`,`value_`,`description`,`creator`,`modifier`,`create_time`,`modify_time`) VALUES ('MPB_PROCESS_ID','MISC','cableMPB.main','MPB 審批流程 ID','ur04192','ur04192','2023-06-01 12:29:10','2023-06-06 11:23:13');
MERGE INTO app.config (`code`,`category`,`value_`,`description`,`creator`,`modifier`,`create_time`,`modify_time`) VALUES ('MPB_SOURCE','DROPDOWN','[{"code":"1","name":"備庫訂單"},{"code":"2","name":"銷售報價"},{"code":"3","name":"銷售訂單"},{"code":"4","name":"新產品開發"}]','單據來源','ur04192','ur04192','2023-06-01 09:10:53','2023-06-01 09:10:53');
MERGE INTO app.config (`code`,`category`,`value_`,`description`,`creator`,`modifier`,`create_time`,`modify_time`) VALUES ('MPB_STATUS','DROPDOWN','[{"code":"UNCLARIFIED","name":"未澄清"},{"code":"AWAITING","name":"需澄清"},{"code":"PENDING","name":"澄清中"},{"code":"CLARIFIED","name":"已澄淸"},{"code":"CONFIRMED","name":"成立"}]','訂單澄清狀態','ur04192','ur04192','2023-06-01 09:09:40','2023-06-01 09:09:40');
MERGE INTO app.config (`code`,`category`,`value_`,`description`,`creator`,`modifier`,`create_time`,`modify_time`) VALUES ('PRINT_COLOR','DROPDOWN','[{"name":"紅"},{"name":"白"},{"name":"黑"},{"name":"綠"},{"name":"黃"}]','印條顏色','ur04192','ur04192','2023-06-01 16:25:31','2023-06-01 16:25:31');
MERGE INTO app.config (`code`,`category`,`value_`,`description`,`creator`,`modifier`,`create_time`,`modify_time`) VALUES ('PRINT_FILE_TYPE','DROPDOWN','[{"name":"客戶名稱"},{"name":"交貨地點"},{"name":"母約案號"},{"name":"指定年份格式"},{"name":"連續米數"},{"name":"耐燃試驗"},{"name":"證號"},{"name":"圖檔"},{"name":"特殊印字"}]','印字檔案類型','ur04192','ur04192','2023-06-12 16:23:09','2023-06-12 16:35:36');
MERGE INTO app.config (`code`,`category`,`value_`,`description`,`creator`,`modifier`,`create_time`,`modify_time`) VALUES ('PRINT_ICON','ICON_DROPDOWN','[{"code":"CNS","name":"data:image/jpeg;base64,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"},{"code":"RPI","name":"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFIAAABPBAMAAACKSo/tAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAhUExURf///97e/5SM/4R792tr91pS9zk5/zEp9wgA997e7wAAAOcT66wAAAALdFJOU/////////////8ASk8B8gAAAAlwSFlzAAAL3AAAC+UBosJ2QgAAA0lJREFUSMeNV01T2zAQlVJ6t00CPSbGgRxJSgaOBJqBY8PUTq50IOYKM419LfmwjuXQ/1tpJdmytYK+AwPW035p9VYQBD4H+Rg0OEuybPUw8j/i3TCF3dV7XBoxA796buIxq2HnotIT1kDhoB4zC7jVNkOw8WxiK8eY7MVmXpSL2SpNq23DJnG/rM0o5GcUjnOHf3qrsr1T9abBXFEndWbHzpXesEJ823qIyaIWFD1HjH6S32aNkBYyUvPbQFakWbxAptU1NkvfdpXlsf2uPhwIHpvZTPoEeVYLFw6T0gZjp3XnzwhRJVW67zhNEvKlVlLI/BUlqsbpmh5OLZI0BGeiCt1q5KdDlCcLOSmHbYfzzqS0szGCvkRCnEN4iypdUc2ii2RzsBaEQZkSnMMWqxFd/OSfPwvmd/g7d9aoIzquVR4L/HaPMnnbDg1LbeQKaOyJBER0a7CZxPFjF2fSC57BQOdB39NLfhlegzAMR7AviKYxt/vt+qvAaBQa2OdBVjl4b8E4eWIWco7a9eqPAp8rdhAlKXNgoivBihl0jh+eJag6qRNcmE1Nuc6kNlumfstqt0/MjsiiQgcImy8mL5ymqFHe8dlqIj37YZRkWKBbCDQKfU9YOprOc0fuO32P3sLxPGNu6MHAazON43gKP2KFhGOZLkGcSwWkxOxiHiwPhXi+J9rBb5lSSUUDeI4O4RJ2xbf5sH4oQnF0HdeFe9JZxo9LQYULfYkzB6LSoG+CCVNjhhI7QnxBYrbgQTBxoXva/FFKCPcI7uYaYx5AY8AMgMaAFtlh8zGDPA+r6AZ48rQ/1MuFWj7EU6JDFSwrdQkCsQP1jdWt2pzrgmGA2FSnS03G9UbNmUtz2wY3KkevXttjwv8pyoSjXGumDBQt/h608nM9aqxL1DSvZEs+axBdllGuqwU1yK30ZdVrp6JeX413FJXvndqcVI+lbe30aZ8xuyNlTmzTs4h5YwDpF9huqF35Y3Xbm6+w8p34gz+sKFdTLb1aPypfpdIUWRynhf4D6Ye/DAXWDicYEX2rqvLXgd/uVoPKI78jOIKFXC/hIvIanpfWRIwT4oYfVRPsoUfehX8klD5bXfc88hGEwPb+518UIdI2CPkHdhRYlstOxTYAAAAASUVORK5CYII="},{"code":"S-JET","name":"data:image/png;base64,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"},{"code":"TUV","name":"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAARCAMAAADnhAzLAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAG2UExURf///9Lb6Nbe6v7+/0NemExnnbO/1gAgbwEicb7J3fb5+zFPjwgodQcmcz1alfr7/ZepyAAUaYWav3yQuAAXaai30evv9Rk6gCFBhfT3+ujs8xUyeyhHh/P1+XmPtwAXaqKyz4eZvQAUZ42fwdrg6wsodT5Zlfv8/e7y9x8/hBU0feXq8lp0pgAdbcLL3pqqyQAVaHCIs8PN3wEdbVdypP7//zVUkQkoddTc6f39/T9blQ0rduDm7+/z+MrU5Km61FlzpQAYalhxpam30AAWaXyRucfR4qGvzHOKtUhknBc5gAAfcAAZawAfbgAhcAAfb7nF2vL2+SdFhidFh56uzAAdbhM0fEFemHCItISbwKizzpChxLnI3oyfwQAZaqe10LLB2ISWvJCixJSnyJCjxXKIsitHiBc6gB4+gjBPj0xkncrS49zj7RAyezNRjkVknURgmCtKiwwwegAbbAAjcgkveho+gxxAhQswegAebjBOjfDz+L3I20JZlQ0xewAkcgAmdBM1fSdIil11pc3W5eXp8fD1+ebr8tPc6aGvzdri7fH0+OTq8tLb6dXe6+nu9Pj6/AAAAEUes9IAAACSdFJOU/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////8AJsmhUgAAAAlwSFlzAAAOwwAADsMBx2+oZAAAALlJREFUKFNFjrEOgjAQhm9xoA9AbrR/OpI0Lkw0DkTDQuLoA7CZ2gk3kiO68s6WUvQb2v+74e6nHWNy+FOHHH7ceily3GGRKceMhdZosyScZyqFsyU6WCINnTVi0h41e7d5pMJ1/SxOSSNXVFt4yt53kia+bjlXOGyTFpeP7SYP9IKtL/MRgA93bdshjWLF4mKHoat5nuvwIGq8cAg89pDxxSNYUVGzF/H8tsYp5ZZ2ParKxah1RYLoC4p1JLC+uQqoAAAAAElFTkSuQmCC"},{"code":"TGI","name":"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAbCAYAAABiFp9rAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAATZSURBVEhLlVZtb1VFEObfSFteJBqgtLctaEWq2EilfDEBC8ZACphSLVapL9Q0fCBaVBACNJUPCtEPJv4ATYx+kESNCSrQFoKlUOh5ufe83Ntz9jw+s3tOb+Fe6nVutjNnd2dnZ+aZ2S5DzZTov+ruDKJfftZfZsZICZn5rk7/wxAPsi0U+vfBeS6H+Z9+4ER6dKLK8iOoJkNyhPLy8I70wVpXD6uxDu62TYinb5kNNVBNhpRtw3/vTdhN9bBzq8hXIBg9BpV3oWamlwxZRhWGEihGQlSNeuLY8A7vpyf0Ivc4rA31CI4fRRLNIzxzAvmXOxH98aveK6Q1dRh5zqJwLulR4hXgD/Xz8AbYLath0RNv8HUkpSKKF85pz6zG5XB3bS+HkYfLT0wabqiqR0LKp5GjA7AbjRF7/XIU+l5DYs3p9fDiF7BbOZ9byYusQGHfTsR3pvWa0MPYqOpR4vvwR4ZgM0x2qwlX/uBuxLN30x0kpRCcHjU5E28JkMKB3UjuzZp1sbTIWIUh5VjwJPHNK+G08BDywsE9UNb9dMciEmMnjmljjni3oQ5+/156Xbl3mVjNYpkUXHhDh2AxTDpcDIv70jOIfvwe8cRVxH9feXBc/Qvx75eRf3VHerHUs4FeDaIyJViWeZcEAfwPB5ngBjiCLt5QFJ3Njchva4fbuQlO58YHhtvZxnpqh93RZPLVZnQEPN67b+iLZ0RD/LEe/OG3mfg6OEys3WxCJh7ZzfyWXAnyNK8cFi+nPaKeDLuJAGFUJDqqkE8NlUoIT38Me0sz3Odb4W41w6HsbOWNZWi5ykj32JS13gttel50ZM3e0oTg/ElgvkRDYYjo2p+IJq5DTXHcMDyenEA0dQ3xjUnK/Ja1qQnNY/Io5WbvIr0p7tf7uDZJfeZRBR4N0bXixXGEZz9FMHYKxfOfI5RBORg7SdnMyVomy3qgh5mTffp7zMzpedE/+wmKX42zhVlEXRyjeOmCycnax5ijeswxH8JNDig3Gj6n8yEyc8k5hzm1KOv88duS4pa9IvMsu20NSt9eAqLI1JEgL/z6S9jta2HlmHwWqdPC0SacKBJQaGBQ1kAxw9WAoSx7qCN6usBl31NPovjdN2nhpAWbfZSkrWx8wihrY2vgdOTg7uiA00WIC8y7NsMhd4SzxtzuZ3nBdQbeYign9bcK4fiZ9FTBtTIFaxqhcIUi46zDyFsKd3u2I7p+hbcoQYUBExvomktCn2iaR/TbZTgvPk0vREc8XI3w3Gc8yvRMfTbHQgtKTWko+seHaURCKDXBhtm7k+/OP9mOBYpvTiG/h12BebPYrqTQg1Mf6ZwI/eczkfDm3sgRnVxHQiFtZX8Pn/JyW4lv3US+p9sAJnunRkdopGQ20IZcPjNVYShbUNL3PngLc80NvC2NEVnB+wP6Eur+PeR7dxGFRJ3kkt5LFFAMtW7CFOhzlvJIlrJ7JOn/CeZNEqSxhw0PwnunD67MCWjIA3qfLBiRnGTcnCZUGTq9VnZZ8aErHD5gQiTQFZgT+hrSzI1Pr+UlNpRqZcploXqOHiZ5iwqH9upClLoSI876BhTYNKWzGCofWo1qMiSkZmf0A2izu8ub49FL5abg0CFammo0ZA5St6eRf6Wb/4x0Qd25reek9rKcPNor4F+4pToxeesDwwAAAABJRU5ErkJggg=="}]','印字檔案圖示','ur04192','ur04192','2023-06-07 17:27:03','2023-06-13 08:55:44');
MERGE INTO app.config (`code`,`category`,`value_`,`description`,`creator`,`modifier`,`create_time`,`modify_time`) VALUES ('PRINT_LABEL_TYPE','DROPDOWN','[{"name":"圖檔"},{"name":"證號"}]','印字標籤類型','ur04192','ur04192','2023-06-12 16:22:24','2023-06-12 16:22:24');
MERGE INTO app.config (`code`,`category`,`value_`,`description`,`creator`,`modifier`,`create_time`,`modify_time`) VALUES ('PRINT_METHOD','DROPDOWN','[{"name":"每米內以不易消失方式印字"},{"name":"指定印凸字(特殊案需求時)"},{"name":"指定 \"油墨噴印\"或\"印字輪\" 或\"色帶轉印\"方式"},{"name":"指定印字顏色 (白色&黑色 or 黃色..等)"},{"name":"指定2行印字: 上,下縱向180°對稱位置"},{"name":"指定印:客戶名稱或Logo或廠商或特殊編號(如:採購號 批號)"},{"name":"印字:字高及字寬等規定"}]','印字方式','ur04192','ur04192','2023-06-01 16:23:47','2023-06-01 16:23:47');
MERGE INTO app.config (`code`,`category`,`value_`,`description`,`creator`,`modifier`,`create_time`,`modify_time`) VALUES ('SEMI_CONDUCTING_MATERIAL','DROPDOWN','[{"name":"外半導電層請用易剝型用料"}]','外半導電層用料','ur04192','ur04192','2023-06-01 16:20:32','2023-06-01 16:20:32');
MERGE INTO app.config (`code`,`category`,`value_`,`description`,`creator`,`modifier`,`create_time`,`modify_time`) VALUES ('SHIELD_MATERIAL','DROPDOWN','[{"name":"白色硬質EVA泡棉"},{"name":"PE泡棉"}]','防護材質','ur04192','ur04192','2023-06-05 15:18:04','2023-06-05 15:18:04');
MERGE INTO app.config (`code`,`category`,`value_`,`description`,`creator`,`modifier`,`create_time`,`modify_time`) VALUES ('TEST','DROPDOWN','[{"code":"A","name":"甲"},{"code":"B","name":"乙"},{"code":"d","name":"丙"},{"name":"1"},{"name":"2"},{"name":"3"},{"name":"4"}]','test2','ur04192','ur04192','2023-06-09 09:24:57','2023-06-16 12:06:32');
MERGE INTO app.config (`code`,`category`,`value_`,`description`,`creator`,`modifier`,`create_time`,`modify_time`) VALUES ('TEST_TABLE','TABLE_SELECT','{"columns":[{"title":"檢測項目","prop":"item"},{"title":"繁體說明","prop":"description"},{"title":"简体说明","prop":"description_cn"},{"title":"單位","prop":"unit"}],"data":[{"item":"巨觀腐蝕","description":"巨觀腐蝕總評","description_cn":"宏观腐蚀总评","unit":"級"},{"item":"一般鬆散","description":"一般鬆散","description_cn":"一般疏松","unit":"級"},{"item":"中心鬆散","description":"中心鬆散","description_cn":"中心疏松","unit":"級"},{"item":"中心偏析","description":"中心偏析","description_cn":"中心偏析","unit":"級"},{"item":"中心縮孔","description":"中心縮孔","description_cn":"中心缩孔","unit":"級"},{"item":"角部裂紋","description":"角部裂紋","description_cn":"角部裂纹","unit":"級"},{"item":"次表面裂紋","description":"次表面裂紋","description_cn":"皮下裂纹","unit":"級"},{"item":"中間裂紋","description":"中間裂紋","description_cn":"中间裂纹","unit":"級"},{"item":"中心裂紋","description":"中心裂紋","description_cn":"中心裂纹","unit":"級"},{"item":"次表面氣孔","description":"次表面氣孔","description_cn":"皮下气泡","unit":"級"},{"item":"非金屬夾雜物","description":"非金屬夾雜物","description_cn":"非金属夹杂物","unit":"級"},{"item":"白帶","description":"白帶","description_cn":"白亮带","unit":"級"},{"item":"中心夾渣","description":"中心夾渣","description_cn":"中心夹渣","unit":"級"},{"item":"次表面夾渣","description":"次表面夾渣","description_cn":"皮下夹渣","unit":"級"},{"item":"異金屬夾雜","description":"異金屬夾雜","description_cn":"异金属夹杂","unit":"級"},{"item":"翻皮","description":"翻皮","description_cn":"翻皮","unit":"級"},{"item":"中間夾渣","description":"中間夾渣","description_cn":"中间夹渣","unit":"級"},{"item":"中間氣孔","description":"中間氣孔","description_cn":"中间气泡","unit":"級"},{"item":"柱狀晶","description":"柱狀晶","description_cn":"柱状晶","unit":"級"},{"item":"等軸晶","description":"等軸晶","description_cn":"等轴晶","unit":"級"},{"item":"錠型偏析","description":"錠型偏析","description_cn":"锭型偏析","unit":"級"},{"item":"錠型鬆散","description":"錠型鬆散","description_cn":"锭型松散","unit":"級"}]}','','ur04192','ur04192','2023-06-09 10:50:58','2023-06-09 10:50:58');
