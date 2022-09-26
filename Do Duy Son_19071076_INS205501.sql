CREATE DATABASE TIENTHO;
USE TIENTHO;

CREATE TABLE StoreManager (
	ManID 		VARCHAR(6),
    ManName 	VARCHAR(50),
 	Address 	VARCHAR(200),
 	PRIMARY KEY (ManID)
	);
	CREATE TABLE ManagerPNum (
		ManID 		VARCHAR(6),
		PhoneNum 	Numeric(10),
		PRIMARY KEY (PhoneNum),
		FOREIGN KEY (ManID) REFERENCES StoreManager(ManID)
		);
    
CREATE TABLE Store (
	StoreID 	VARCHAR(3) PRIMARY KEY,
    Address 	VARCHAR(200)
    );
	CREATE TABLE StorePNum (
		StoreID 	VARCHAR(3),
		PhoneNum 	NUMERIC(10) PRIMARY KEY,
		FOREIGN KEY (StoreID) 	REFERENCES Store(StoreID)
		);
    
CREATE TABLE Employees (
	EmpID 		VARCHAR(6) PRIMARY KEY,
    EmpName 	VARCHAR(50),
    Address 	VARCHAR(200),
    EmpRole 	VARCHAR(30),
    Gender 		VARCHAR(1)
    );
	CREATE TABLE EmpPNum (
		EmpID 		VARCHAR(6),
		PhoneNum 	NUMERIC(10) PRIMARY KEY,
		FOREIGN KEY (EmpID) 	REFERENCES Employees(EmpID)
		);
    
CREATE TABLE Working (
	EmpID 		VARCHAR(6) PRIMARY KEY,
    StoreID 	VARCHAR(3),
    ManID 		VARCHAR(6),
    FOREIGN KEY (EmpID) 	REFERENCES Employees(EmpID),
    FOREIGN KEY (StoreID) 	REFERENCES Store(StoreID),
    FOREIGN KEY (ManID) 	REFERENCES StoreManager(ManID)
    );
    
CREATE TABLE Goods (
	GoodsID 	VARCHAR(15) PRIMARY KEY,
    GoodsName 	VARCHAR(100),
    Quantity 	NUMERIC(4),
    Price 		NUMERIC(10,2)
    );
	CREATE TABLE Stationery (
		GoodsID 	VARCHAR(15) PRIMARY KEY,
		SType 		VARCHAR(30),
		FOREIGN KEY (GoodsID) REFERENCES Goods(GoodsID)	
		);
	CREATE TABLE Books (
		GoodsID 			VARCHAR(15) PRIMARY KEY,
		BookName			VARCHAR(100),
		Category			VARCHAR(50),
		Author				VARCHAR(40),
        PublishingCompany	VARCHAR(30),
		FOREIGN KEY (GoodsID) REFERENCES Goods(GoodsID)
		);
    
CREATE TABLE Customer (
	CustID		VARCHAR(6) PRIMARY KEY,
    CustName	VARCHAR(30),
    Address		VARCHAR(100),
    Gender		VARCHAR(1)
    );
	CREATE TABLE CustPNum (
		CustID		VARCHAR(6),
		PhoneNum	NUMERIC(10)  PRIMARY KEY,
		FOREIGN KEY (CustID) REFERENCES Customer(CustID)
		);
    
CREATE TABLE Receipt (
	RecID	VARCHAR(6) PRIMARY KEY,
    RecDate		DATE
    );
    
CREATE TABLE Sale (
	SaleID		VARCHAR(6) PRIMARY KEY,
	StoreID 	VARCHAR(3),
	EmpID 		VARCHAR(6),
    CustID		VARCHAR(6),
    GoodsID 	VARCHAR(15),
    RecID		VARCHAR(6),
    Quantity	NUMERIC(4),
    FOREIGN KEY (StoreID) 	REFERENCES Store(StoreID),
    FOREIGN KEY (EmpID) 	REFERENCES Employees(EmpID),
    FOREIGN KEY (CustID) 	REFERENCES Customer(CustID),
    FOREIGN KEY (GoodsID) 	REFERENCES Goods(GoodsID),
    FOREIGN KEY (RecID) 	REFERENCES Receipt(RecID)	
    );

CREATE TABLE Suppliers (
	SupID	VARCHAR(6) PRIMARY KEY,
	SupName	VARCHAR(40),
    Address	VARCHAR(200)
	);
	CREATE TABLE SupPNum (
		SupID		VARCHAR(6),
		PhoneNum	NUMERIC(10) PRIMARY KEY,
		FOREIGN KEY (SupID) REFERENCES Suppliers(SupID)
		);
    
CREATE TABLE Warehouse (
	WHID		VARCHAR(6) PRIMARY KEY,
	SupID 		VARCHAR(6),
    WHName		VARCHAR(30),
    Address		VARCHAR(200),
    FOREIGN KEY (SupID) REFERENCES Suppliers(SupID)
	);

CREATE TABLE ImpRec (
	ImpRecID	VARCHAR(6) PRIMARY KEY,
    ImpRecDate	DATE
    );
    
CREATE TABLE Importing (
	ImpID		VARCHAR(6) PRIMARY KEY,
    GoodsID 	VARCHAR(15),
    EmpID 		VARCHAR(6),
    SupID		VARCHAR(6),
    WHID	 	VARCHAR(30),
    ImpRecID	VARCHAR(6),
    Quantity	NUMERIC(4),
    FOREIGN KEY (GoodsID) 	REFERENCES Goods(GoodsID),
    FOREIGN KEY (EmpID)		REFERENCES Employees(EmpID),
    FOREIGN KEY (SupID)		REFERENCES Suppliers(SupID),
    FOREIGN KEY (WHID)		REFERENCES Warehouse(WHID),
    FOREIGN KEY (ImpRecID)	REFERENCES ImpRec(ImpRecID)
    );
    
-- Insert data

INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG001', 'Do Duy Son', 'Ha Dong, Ha Noi');
INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG002', 'Nguyen Duc Toan', 'Xuan Thuy, Cau Giay, Ha Noi');
INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG003', 'Nguyen Huu Huan', 'Thanh Xuan, Ha Noi');
INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG004', 'Vu Trong Phat', 'Duong Quang Ham, Cau Giay, Ha Noi');
INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG005', 'Bui Xuan Huan', 'Bac Giang');
INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG006', 'Ha Dinh Duong', 'Dong Da, Ha Noi');
INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG007', 'Do Cao Phet', 'Cao Bang');
INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG008', 'Hai Phat', 'Ba Dinh, Ha Noi');
INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG009', 'Tran Tung Lam', 'Ha Dong, Ha Noi');
INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG010', 'Tran Thanh Tam', 'Lach Tray, Hai Phong');
INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG011', 'Pham Nguyet Nhi', 'Ha Dinh, Thanh Xuan, Ha Noi');
INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG012', 'Do Duy Bach', 'Ha Dong, Ha Noi');
INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG013', 'Nguyen Duc Trong', 'Xuan Thuy, Cau Giay, Ha Noi');
INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG014', 'Nguyen Huu Truong', 'Thanh Xuan, Ha Noi');
INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG015', 'Vu Trong Tung', 'Duong Quang Ham, Cau Giay, Ha Noi');
INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG016', 'Bui Xuan Huan', 'Bac Giang');
INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG017', 'Ha Dinh Khoi', 'Dong Da, Ha Noi');
INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG018', 'Do Cao Bang', 'Cao Bang');
INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG019', 'Hai Yen', 'Ba Dinh, Ha Noi');
INSERT INTO StoreManager (ManID, ManName, Address) VALUES ('MNG020', 'Tran Tung Thanh', 'Ha Dong, Ha Noi');

INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG001', '0866875436');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG001', '0982736394');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG002', '0482823883');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG003', '0949685838');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG003', '0758592934');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG004', '0827375392');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG005', '0938382744');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG005', '0956663333');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG005', '0958573834');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG006', '0738349493');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG007', '0793030403');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG008', '0902929305');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG009', '0987653729');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG010', '0938485523');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG011', '0929238347');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG012', '0827374647');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG013', '0938462345');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG014', '0912837959');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG014', '0985633283');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG015', '0685593034');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG016', '0944872394');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG017', '0948857339');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG018', '0928283744');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG019', '0938374753');
INSERT INTO ManagerPNum (ManID, PhoneNum) VALUES ('MNG020', '0948476362');

-- Based on real data of Tien Tho stores branch 
INSERT INTO Store (StoreID, Address) VALUES ('001', '828 Đường Láng, Đống Đa, Hà Nội');
INSERT INTO Store (StoreID, Address) VALUES ('002', '36 Xuân Thủy, Cầu Giấy, Hà Nội');
INSERT INTO Store (StoreID, Address) VALUES ('003', '424 Nguyễn Trãi, Thanh Xuân, Hà Nội');
INSERT INTO Store (StoreID, Address) VALUES ('004', '697 Giải Phóng, Hoàng Mai, Hà Nội');
INSERT INTO Store (StoreID, Address) VALUES ('005', '50 Nguyễn Thị Lưu, T.P Bắc Giang');
INSERT INTO Store (StoreID, Address) VALUES ('006', '282a Lương Ngọc Quyến, Thái Nguyên');

-- Based on real data from nhasachtientho.vn
INSERT INTO StorePNum (StoreID, PhoneNum) VALUES ('001', '0941234828');
INSERT INTO StorePNum (StoreID, PhoneNum) VALUES ('002', '0934173636');
INSERT INTO StorePNum (StoreID, PhoneNum) VALUES ('003', '0966688424');
INSERT INTO StorePNum (StoreID, PhoneNum) VALUES ('004', '0933695697');
INSERT INTO StorePNum (StoreID, PhoneNum) VALUES ('005', '0948555050');
INSERT INTO StorePNum (StoreID, PhoneNum) VALUES ('006', '0906233282');

-- Sale employees
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP001', 'Do Tuan Dung', 'Thanh Xuan, Ha Noi', 'Sale', 'M');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP002', 'Dao Thanh Hang', 'Tu Liem, Ha Noi', 'Sale', 'F');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP003', 'Pham Hoang Hiep', 'Dong Da, Ha Noi', 'Sale', 'M');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP004', 'Nghiem Xuan Toan', 'Thanh Xuan, Ha Noi', 'Sale', 'M');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP005', 'Luu Linh Linh', 'Dong Da, Ha Noi', 'Sale', 'F');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP006', 'Han Mac Tu', 'Thanh Xuan, Ha Noi', 'Sale', 'F');
-- Service employees
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP101', 'Nguyen Tan Dung', 'Dong Da, Ha Noi', 'Service', 'M');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP102', 'Nguyen Quy', 'Dong Da, Ha Noi', 'Service', 'M');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP103', 'Tran Nhan Tong', 'Tay Ho, Ha Noi', 'Service', 'M');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP104', 'Ly Nam De', 'Thanh Xuan, Ha Noi', 'Service', 'M');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP105', 'Toc Tien', 'District 1, TPHCM', 'Service', 'F');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP106', 'Elon Musk', 'America', 'Service', 'M');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP107', 'Bill Gates', 'America', 'Service', 'M');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP108', 'Jeff Bezos', 'Cau Giay, Ha Noi', 'Service', 'M');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP109', 'Y Lan Vien', 'Hoan Kiem, Ha Noi', 'Service', 'F');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP110', 'Tran Hong Quan', 'Long Bien, Ha Noi', 'Service', 'M');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP111', 'Quang Huy', 'Dong Da, Ha Noi', 'Service', 'M');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP112', 'Nguyen Hong Hanh', 'Hai Ba Trung, Ha Noi', 'Service', 'F');
-- Importing employees
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP201', 'Mark Zuckerberg', 'Tay Ho, Ha Noi', 'Import', 'M');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP202', 'Ly Tu Trong', 'Cau Giay, Ha Noi', 'Import', 'M');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP203', 'Tran Binh Trong', 'Thanh Xuan, Ha Noi', 'Import', 'M');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP204', 'Nguyen Xuan Hoa', 'Cau Giay, Ha Noi', 'Import', 'F');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP205', 'Hai Son', 'Tay Ho, Ha Noi', 'Import', 'M');
INSERT INTO Employees (EmpID, EmpName, Address, EmpRole, Gender) VALUES ('EMP206', 'Pham Nguyet Nhan', 'Le Chan, Hai Phong', 'Import', 'F');

INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP001', '0928837429');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP001', '0495858723');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP002', '0384764588');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP003', '0309837949');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP003', '0877643738');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP004', '0924829334');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP004', '0775839494');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP004', '0986784394');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP101', '0934820396');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP102', '0984733820');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP103', '0328837878');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP104', '0493823823');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP105', '0866754384');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP106', '0986584734');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP005', '0828837428');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP006', '0984764580');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP107', '0439384857');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP108', '0709837941');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP109', '0424829338');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP110', '0834820393');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP111', '0784733823');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP112', '0928837874');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP201', '0393823825');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP202', '0366754386');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP203', '0386584737');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP204', '0584473845');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP205', '0359583834');
INSERT INTO EmpPNum (EmpID, PhoneNum) VALUES ('EMP206', '0758384934');

INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP001', '001', 'MNG001');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP002', '001', 'MNG001');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP003', '001', 'MNG001');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP004', '001', 'MNG002');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP005', '001', 'MNG002');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP006', '001', 'MNG002');

INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP101', '001', 'MNG003');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP102', '001', 'MNG003');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP103', '001', 'MNG003');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP104', '001', 'MNG003');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP105', '001', 'MNG003');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP106', '001', 'MNG003');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP107', '001', 'MNG004');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP108', '001', 'MNG004');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP109', '001', 'MNG004');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP110', '001', 'MNG004');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP111', '001', 'MNG004');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP112', '001', 'MNG004');

INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP201', '001', 'MNG005');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP202', '001', 'MNG005');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP203', '001', 'MNG005');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP204', '001', 'MNG006');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP205', '001', 'MNG006');
INSERT INTO Working(EmpID, StoreID, ManID) VALUES ('EMP206', '001', 'MNG006');

-- Based on real data of Tien Tho bookstores
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('S62', 'Red Shiny Stamp Ink S62', '100', '38000');
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('S63', 'Blue Shiny Stamp Ink S63', '100', '38000');
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('TL108', 'Plastic Card Holder 1 Side Horizontal', '200', '2000');
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('MDD', 'Leather Vertical Card Cover', '200', '5000');
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('PVN1923', 'Photo Paper Double A A4 / 70 gsm', '30', '89000');
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('PVN1935', 'Giấy Paper one A4/70', '30', '87000');
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('PVN1864', '1912 oil wax 12 colors', '20', '58000');
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('CM15BRS', 'Set of 15 Colormate Brushes CM-15BRS', '100', '106000');
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('7418', '18 Color Crayons With Eraser', '500', '33000');
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('PVN2539', 'Electrical Study Table Lamp LDL04 4W B650', '18', '695000');
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('PVN905', 'Don Quixote', '75', '139500');
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('PVN2275', 'Demons', '10', '85500');
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('DRMHTNC', 'Doraemon Learning - Multiply and Divide', '200', '30000');
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('DOCL-1', 'Selected Doraemon - 45 Chapters Opening the Doraemon Short Story', '50', '40000');
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('100QLBBDTCTKD', '100 Immutable Laws for Business Success', '20', '73800');
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('100YTBHTH', '100 Great Selling Ideas', '20', '91800');
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('PVN2635', 'IC3 Spark - Simple Computer Episode 2', '40', '50000');
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('PVN2634', 'IC3 Spark - Online Life', '50', '43000');
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('PVN1357', 'The Rats Sing Love Songs And Strange Stories From The World Of Science', '20', '162000');
INSERT INTO Goods(GoodsID, GoodsName, Quantity, Price) VALUES('PVN955', 'Do Robots Dream About Electric Sheep?', '15', '103500');

INSERT INTO Stationery(GoodsID, SType) VALUES ('S62', 'Seal - Seal box');
INSERT INTO Stationery(GoodsID, SType) VALUES ('S63', 'Seal - Seal box');
INSERT INTO Stationery(GoodsID, SType) VALUES ('TL108', 'Other stationery products');
INSERT INTO Stationery(GoodsID, SType) VALUES ('MDD', 'Other stationery products');
INSERT INTO Stationery(GoodsID, SType) VALUES ('PVN1923', 'Paper products');
INSERT INTO Stationery(GoodsID, SType) VALUES ('PVN1935', 'Paper products');
INSERT INTO Stationery(GoodsID, SType) VALUES ('PVN1864', 'Drawing instruments');
INSERT INTO Stationery(GoodsID, SType) VALUES ('CM15BRS', 'Drawing instruments');
INSERT INTO Stationery(GoodsID, SType) VALUES ('7418', 'Drawing instruments');
INSERT INTO Stationery(GoodsID, SType) VALUES ('PVN2539', 'Lamp - Study table');

INSERT INTO Books(GoodsID, Category, Author, PublishingCompany) VALUES('PVN905', 'Literature', 'Miguel De Cervantes', 'Literary Publishing');
INSERT INTO Books(GoodsID, Category, Author, PublishingCompany) VALUES('PVN2275', 'Literature', 'Vũ Khúc', 'Youth Publishing');
INSERT INTO Books(GoodsID, Category, Author, PublishingCompany) VALUES('DRMHTNC', 'Children stories', 'Fujiko F. Fujio', 'Kim Dong Publishing');
INSERT INTO Books(GoodsID, Category, Author, PublishingCompany) VALUES('DOCL-1', 'Children stories', 'Fujiko F. Fujio', 'Kim Dong Publishing');
INSERT INTO Books(GoodsID, Category, Author, PublishingCompany) VALUES('100QLBBDTCTKD', 'Business - Economics', 'Brian Tracy', 'General Publishing');
INSERT INTO Books(GoodsID, Category, Author, PublishingCompany) VALUES('100YTBHTH', 'Business - Economics', 'Patrick Forsyth', 'General Publishing');
INSERT INTO Books(GoodsID, Category, Author, PublishingCompany) VALUES('PVN2635', 'Information Technology', 'IIG Vietnam', 'General Publishing');
INSERT INTO Books(GoodsID, Category, Author, PublishingCompany) VALUES('PVN2634', 'Information Technology', 'IIG Vietnam', 'General Publishing');
INSERT INTO Books(GoodsID, Category, Author, PublishingCompany) VALUES('PVN1357', 'Science', 'Rick Deckard', 'Literary Publishing');
INSERT INTO Books(GoodsID, Category, Author, PublishingCompany) VALUES('PVN955', 'Science', 'Lliana Bird & Dr. Jack', 'Young Publishing');

INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00001', 'Thanh Nam', 'Ha Dong, Ha Noi', 'M');
INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00002', 'Xuan', 'Tu Liem, Ha Noi', 'F');
INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00003', 'Bach', 'Cau Giay, Ha Noi', 'M');
INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00004', 'Trinh Thuy', 'Hung Yen', 'F');
INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00005', 'Dam Hai Yen', 'Hung Yen', 'F');
INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00006', 'Tung Bach', 'Ha Noi', 'M');
INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00007', 'Hoang Long', 'Dong Da, Ha Noi', 'M');
INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00008', 'Phuc Thinh', 'Tran Duy Hung, Cau Giay, Ha Noi', 'M');
INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00009', 'Thanh Nhan', 'Dao Duy Tu, Hoan Kiem, Ha Noi', 'F');
INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00010', 'Hai Long', 'Phu Xuyen', 'M');
INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00011', 'Duc Anh', 'Vinh Phuc', 'M');
INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00012', 'Do Viet Anh', 'Long Bien, Ha Noi', 'M');
INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00013', 'Pham Tran Kieu Anh', 'Ba Dinh, Ha Noi', 'F');
INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00014', 'Ha', 'Yen Bai', 'F');
INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00015', 'Dinh Toan', 'Lang Son', 'M');
INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00016', 'Tung', 'Bac Giang', 'M');
INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00017', 'Hoa', 'Tu Liem, Ha Noi', 'F');
INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00018', 'Thanh Tu', 'Tay Ho, Ha Noi', 'F');
INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00019', 'Quynh', 'Lai Chau', 'F');
INSERT INTO Customer(CustID, CustName, Address, Gender) VALUES ('C00020', 'Phuong', 'Ha Dong, HN', 'F');

INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00001', '0987263643');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00002', '0982838442');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00002', '0458939230');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00003', '0987263302');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00004', '0374728394');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00005', '0394752348');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00005', '0876753438');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00006', '0936748399');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00007', '0912938382');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00008', '0988888888');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00009', '0966338328');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00010', '0955263643');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00011', '0383233823');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00011', '0762383949');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00012', '0872374623');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00013', '0938327332');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00014', '0785939432');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00015', '0928383495');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00016', '0823273749');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00017', '0928337472');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00018', '0857563643');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00019', '0782383923');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00020', '0823772312');
INSERT INTO CustPNum(CustID, PhoneNum) VALUES ('C00020', '0493230348');

INSERT INTO Receipt (RecID, RecDate) VALUES ('REC001', '20211019');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC002', '20211019');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC003', '20211020');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC004', '20211020');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC005', '20211021');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC006', '20211022');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC007', '20211022');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC008', '20211022');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC009', '20211023');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC010', '20211023');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC011', '20211023');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC012', '20211023');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC013', '20211101');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC014', '20211102');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC015', '20211103');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC016', '20211104');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC017', '20211119');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC018', '20211120');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC019', '20211205');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC020', '20211205');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC021', '20211206');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC022', '20211206');
INSERT INTO Receipt (RecID, RecDate) VALUES ('REC023', '20211207');

INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00001', '001', 'EMP001', 'C00001', 'PVN1923', 'REC001', '2');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00002', '001', 'EMP001', 'C00002', 'PVN905', 'REC002', '1');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00003', '001', 'EMP001', 'C00002', 'PVN2275', 'REC002', '1');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00004', '001', 'EMP002', 'C00003', 'S62', 'REC003', '3');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00005', '001', 'EMP002', 'C00004', 'S63', 'REC004', '1');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00006', '001', 'EMP003', 'C00005', 'TL108', 'REC005', '100');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00007', '001', 'EMP003', 'C00006', '100QLBBDTCTKD', 'REC006', '1');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00008', '001', 'EMP003', 'C00007', 'CM15BRS', 'REC007', '1');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00009', '001', 'EMP004', 'C00008', 'PVN1923', 'REC008', '1');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00010', '001', 'EMP004', 'C00009', '7418', 'REC009', '1');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00011', '001', 'EMP004', 'C00009', 'PVN905', 'REC010', '1');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00012', '001', 'EMP001', 'C00010', 'PVN905', 'REC011', '1');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00013', '001', 'EMP001', 'C00011', 'CM15BRS', 'REC012', '1');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00014', '001', 'EMP001', 'C00011', 'MDD', 'REC012', '2');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00015', '001', 'EMP005', 'C00012', 'PVN1923', 'REC013', '1');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00016', '001', 'EMP005', 'C00013', 'S63', 'REC014', '1');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00017', '001', 'EMP005', 'C00013', 'PVN1935', 'REC015', '4');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00018', '001', 'EMP001', 'C00014', '7418', 'REC016', '5');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00019', '001', 'EMP001', 'C00014', 'PVN1935', 'REC016', '10');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00020', '001', 'EMP004', 'C00015', 'CM15BRS', 'REC017', '1');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00021', '001', 'EMP001', 'C00015', '100YTBHTH', 'REC018', '1');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00022', '001', 'EMP003', 'C00016', 'PVN905', 'REC019', '1');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00023', '001', 'EMP002', 'C00016', 'TL108', 'REC020', '20');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00024', '001', 'EMP002', 'C00017', 'PVN905', 'REC020', '1');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00025', '001', 'EMP005', 'C00018', 'DOCL-1', 'REC021', '1');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00026', '001', 'EMP006', 'C00019', 'PVN2539', 'REC022', '1');
INSERT INTO Sale (SaleID, StoreID, EmpID, CustID, GoodsID, RecID, Quantity) VALUES ('S00027', '001', 'EMP006', 'C00020', 'PVN2539', 'REC023', '2');

INSERT INTO Suppliers (SupID, SupName, Address) VALUES ('SUP001', 'Young Publishing', 'Ha Dong, Ha Noi');
INSERT INTO Suppliers (SupID, SupName, Address) VALUES ('SUP002', 'Agency 18 Thien Long group', 'Long Bien, Ha Noi');
INSERT INTO Suppliers (SupID, SupName, Address) VALUES ('SUP003', 'Literary Publishing', 'Ba Dinh, Ha Noi');
INSERT INTO Suppliers (SupID, SupName, Address) VALUES ('SUP004', 'Youth Publishing', 'Hoan Kiem, Ha Noi');
INSERT INTO Suppliers (SupID, SupName, Address) VALUES ('SUP005', 'Kim Dong Publishing', 'Hai Ba Trung, Ha Noi');
INSERT INTO Suppliers (SupID, SupName, Address) VALUES ('SUP006', 'General Publishing', 'District 1, HCMC');
INSERT INTO Suppliers (SupID, SupName, Address) VALUES ('SUP007', 'VNU Publishing', 'Hoang Mai, Ha Noi');
INSERT INTO Suppliers (SupID, SupName, Address) VALUES ('SUP008', 'Dstamp Printer', 'Go Vap, HCMC');
INSERT INTO Suppliers (SupID, SupName, Address) VALUES ('SUP009', 'Colormate', 'District 7, HCMC');
INSERT INTO Suppliers (SupID, SupName, Address) VALUES ('SUP010', 'Viet Future', 'Go Vap, HCMC');
INSERT INTO Suppliers (SupID, SupName, Address) VALUES ('SUP011', 'Dien Quang', 'District 1, HCMC');
INSERT INTO Suppliers (SupID, SupName, Address) VALUES ('SUP012', 'Vinh Thinh Production and Trading JSC.', 'Go Vap, HCMC');
INSERT INTO Suppliers (SupID, SupName, Address) VALUES ('SUP013', 'Quoc Huy Anh JSC.', 'Tran Quang Khai, Nam Dinh');
INSERT INTO Suppliers (SupID, SupName, Address) VALUES ('SUP014', 'Hoang Minh Limited Liability Company.', 'Tu Liem, Ha Noi');
INSERT INTO Suppliers (SupID, SupName, Address) VALUES ('SUP015', 'Thu Huong Stationery Company.', 'Kien An, Hai Phong');

INSERT INTO SupPNum (SupID, PhoneNum) VALUES ('SUP001', '0240585832');
INSERT INTO SupPNum (SupID, PhoneNum) VALUES ('SUP002', '0243843847');
INSERT INTO SupPNum (SupID, PhoneNum) VALUES ('SUP003', '0248384723');
INSERT INTO SupPNum (SupID, PhoneNum) VALUES ('SUP004', '0248383826');
INSERT INTO SupPNum (SupID, PhoneNum) VALUES ('SUP005', '0243456456');
INSERT INTO SupPNum (SupID, PhoneNum) VALUES ('SUP006', '0246668888');
INSERT INTO SupPNum (SupID, PhoneNum) VALUES ('SUP007', '0245599999');
INSERT INTO SupPNum (SupID, PhoneNum) VALUES ('SUP008', '0243949357');
INSERT INTO SupPNum (SupID, PhoneNum) VALUES ('SUP009', '0248366438');
INSERT INTO SupPNum (SupID, PhoneNum) VALUES ('SUP010', '0243598578');
INSERT INTO SupPNum (SupID, PhoneNum) VALUES ('SUP011', '0248389234');
INSERT INTO SupPNum (SupID, PhoneNum) VALUES ('SUP012', '0989668888');
INSERT INTO SupPNum (SupID, PhoneNum) VALUES ('SUP013', '0240034938');
INSERT INTO SupPNum (SupID, PhoneNum) VALUES ('SUP014', '0243843266');
INSERT INTO SupPNum (SupID, PhoneNum) VALUES ('SUP015', '0986568999');

INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH001', 'SUP001', 'Warehouse 1', 'Thanh Xuan, Ha Noi');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH002', 'SUP001', 'Warehouse 2', 'Bac Tu Liem, Ha Noi');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH003', 'SUP001', 'Warehouse 3', 'Ha Dong, Ha Noi');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH004', 'SUP002', 'Warehouse 1', 'Tu Liem, Ha Noi');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH005', 'SUP003', 'Warehouse 1', 'Hai Ba Trung, Ha Noi');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH006', 'SUP003', 'Warehouse 2', 'Bac Tu Liem, Ha Noi');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH007', 'SUP004', 'Warehouse 2', 'Tu Son, Bac Ninh');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH008', 'SUP004', 'Warehouse 1', 'Hoan Kiem, Ha Noi');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH009', 'SUP005', 'Warehouse 1', 'Thanh Xuan, Ha Noi');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH010', 'SUP005', 'Warehouse 2', 'Bac Tu Liem, Ha Noi');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH011', 'SUP006', 'Warehouse 1', 'Ha Dong, Ha Noi');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH012', 'SUP006', 'Warehouse 2', 'Me Linh, Ha Noi');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH013', 'SUP006', 'Warehouse 3', 'Hoang Mai, Ha Noi');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH014', 'SUP007', 'Warehouse 1', 'Van Giang, Hung Yen');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH015', 'SUP008', 'Warehouse 1', 'Tu Son, Bac Ninh');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH016', 'SUP009', 'Warehouse 1', 'Nam Dinh');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH017', 'SUP010', 'Warehouse 1', 'Long Bien, Ha Noi');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH018', 'SUP011', 'Warehouse 1', 'Bac Tu Liem, Ha Noi');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH019', 'SUP012', 'Warehouse 1', 'Ha Dong, Ha Noi');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH020', 'SUP013', 'Warehouse 1', 'Tu Liem, Ha Noi');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH021', 'SUP013', 'Warehouse 2', 'Cau Giay, Ha Noi');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH022', 'SUP014', 'Warehouse 1', 'Nam Tu Liem, Ha Noi');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH023', 'SUP014', 'Warehouse 2', 'Bac Giang');
INSERT INTO Warehouse (WHID, SupID, WHName, Address) VALUES ('WH024', 'SUP015', 'Warehouse 1', 'Hai Phong');

INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0001', '20210828');
INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0002', '20210901');
INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0003', '20210901');
INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0004', '20210902');
INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0005', '20210903');
INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0006', '20210905');
INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0007', '20210905');
INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0008', '20210905');
INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0009', '20210905');
INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0010', '20210905');
INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0011', '20210907');
INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0012', '20210907');
INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0013', '20210907');
INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0014', '20210907');
INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0015', '20210907');
INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0016', '20210910');
INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0017', '20210910');
INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0018', '20210910');
INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0019', '20210915');
INSERT INTO ImpRec (ImpRecID, ImpRecDate) VALUES ('IR0020', '20210915');

INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0001', 'S62', 'EMP201', 'SUP015', 'WH024', 'IR0001', '70');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0002', 'S63', 'EMP201', 'SUP015', 'WH024', 'IR0001', '100');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0003', 'TL108', 'EMP201', 'SUP015', 'WH024', 'IR0002', '100');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0004', 'MDD', 'EMP201', 'SUP015', 'WH024', 'IR0002', '150');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0005', 'PVN1923', 'EMP202', 'SUP008', 'WH015', 'IR0003', '30');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0006', 'PVN1935', 'EMP202', 'SUP008', 'WH015', 'IR0003', '30');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0007', 'PVN1864', 'EMP201', 'SUP010', 'WH017', 'IR0004', '20');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0008', 'CM15BRS', 'EMP201', 'SUP010', 'WH017', 'IR0004', '50');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0009', '7418', 'EMP203', 'SUP010', 'WH017', 'IR0005', '400');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0010', 'PVN2539', 'EMP203', 'SUP011', 'WH018', 'IR0006', '18');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0011', 'PVN905', 'EMP203', 'SUP003', 'WH005', 'IR0007', '25');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0012', 'PVN2275', 'EMP203', 'SUP004', 'WH008', 'IR0008', '10');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0013', 'DRMHTNC', 'EMP203', 'SUP005', 'WH011', 'IR0009', '50');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0014', 'DOCL-1', 'EMP203', 'SUP005', 'WH011', 'IR0009', '50');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0015', '100QLBBDTCTKD', 'EMP204', 'SUP006', 'WH012', 'IR0010', '20');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0016', '100YTBHTH', 'EMP204', 'SUP006', 'WH012', 'IR0010', '20');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0017', 'PVN2635', 'EMP204', 'SUP006', 'WH011', 'IR0011', '40');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0018', 'PVN2634', 'EMP204', 'SUP006', 'WH011', 'IR0011', '50');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0019', 'PVN1357', 'EMP204', 'SUP003', 'WH005', 'IR0012', '20');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0020', 'PVN955', 'EMP205', 'SUP001', 'WH001', 'IR0013', '15');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0021', 'MDD', 'EMP205', 'SUP015', 'WH024', 'IR0014', '50');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0022', '7418', 'EMP205', 'SUP010', 'WH017', 'IR0015', '100');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0023', 'TL108', 'EMP205', 'SUP015', 'WH024', 'IR0016', '100');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0024', 'S62', 'EMP206', 'SUP015', 'WH024', 'IR0017', '30');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0025', 'CM15BRS', 'EMP206', 'SUP010', 'WH017', 'IR0018', '50');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0026', 'DRMHTNC', 'EMP206', 'SUP005', 'WH011', 'IR0019', '150');
INSERT INTO Importing (ImpID, GoodsID, EmpID, SupID, WHID, ImpRecID, Quantity) VALUES ('IM0027', 'PVN905', 'EMP206', 'SUP003', 'WH005', 'IR0020', '50');

-- Question 1: How much does Don Quixote cost?
SELECT 	GoodsName, Price
FROM 	Goods
WHERE 	GoodsName = 'Don Quixote';

/* Question 2: The bookstore wants to find the nearer warehouse of General Publishing (GP)
for the products PVN2635 and PVN2634 than the last order at GP for the products 100QLBBDTCTKD and 100YTBHTH */
SELECT 	*
FROM 		Warehouse
WHERE		SupID = 'SUP006'
ORDER BY 	WHID ASC;

-- Question 3: Customer ID 'C00002' just bought 2 products 'PVN905' and 'PVN2275' want to create a receipt, so what information will be printed on the receipt?
SELECT 		S.SaleID, R.RecID, S.StoreID, S.CustID, S.GoodsID, G.GoodsName, S.Quantity, G.Price
FROM 		Sale S, Receipt R, Goods G			
WHERE 		S.CustID = 'C00002'
AND			S.RecID = R.RecID
AND 		S.GoodsID = G.GoodsID 
ORDER BY	RecDate ASC;

-- Question 4: The author of the book has ID: PVN2275 want to contact the customers who bought this book to show gratitude and need to retrieve the customer's phone number
SELECT		S.CustID, C.PhoneNum
FROM		Sale S, CustPNum C
WHERE		S.GoodsID = 'PVN2275'
AND			C.CustID = S.CustID
ORDER BY	CustID ASC;

-- Question 5: Count the gender of employees in store
SELECT 		Gender, COUNT(*)
FROM		Employees
GROUP BY	Gender;

-- Question 6: Find the best saler of the October
SELECT		S.EmpID, E.EmpName, COUNT(*)
FROM		Sale S, Employees E, Receipt R
WHERE		S.EmpID LIKE 'EMP00%'
AND			S.EmpID = E.EmpID
AND			R.RecID = S.RecID
AND			RecDate BETWEEN '2021/10/01' AND '2021/10/31'
GROUP BY	S.EmpID, E.EmpName;

-- Question 7: The total number of customers who have visited the store in November
SELECT 		COUNT(*)
FROM		Receipt
WHERE		RecDate BETWEEN '2021/11/01' AND '2021/11/30';

-- Question 8: Find the name and phone number of customer who has the most pays in December at store to create a Premium Membership card
SELECT		S.CustID, C.CustName, CP.PhoneNum, COUNT(*)
FROM		Sale S, Customer C, CustPNum CP, Receipt R
WHERE 		S.RecID = R.RecID
AND			C.CustID = S.CustID
AND			CP.CustID = S.CustID
AND			RecDate BETWEEN '2021/11/30' AND '2021/12/31'
GROUP BY 	S.CustID, C.CustName, CP.PhoneNum;

-- Question 9: Bookstore plan to promote best-selling products to increase sales. Find out top best-selling products in November
SELECT		S.GoodsID, G.GoodsName, COUNT(*)
FROM		Sale S, Goods G, Receipt R
WHERE		R.RecDate BETWEEN '2021/11/30' AND '2021/12/31'
AND			S.GoodsID = G.GoodsID
AND			S.RecID = R.RecID
GROUP BY 	S.GoodsID, G.GoodsName
ORDER BY	COUNT(*) DESC;

-- Question 10: Find where have the least customer to create a marketing campaign in that place to boost the sale
SELECT 		Address, COUNT(*)
FROM 		Customer
GROUP BY	Address
ORDER BY	COUNT(*) ASC;
