CREATE TABLE demographic
(
	SEQN INT PRIMARY KEY, --respondent sequence number
	SDDSRVYR INT, --data release cycle
	RIAGENDR INT, --gender
	RIDAGEYR INT, --age in years at screening
	RIDAGEMN INT --age in months 0-24
);

CREATE TABLE dietary
(
	SEQN INT NOT NULL,
	DRDINT INT, --get 1 only
	DR1CCMNM INT, --Combination food number
	DR1CCMTX INT, --Combination food type
	DR1FS INT, --Source of food
	DR1_040Z INT, --Did you eat this meal at home?
	DR1IFDCD INT, --USDA food code
	DR1IPROT NUMERIC(10,4), --protein (gm)
	DR1ICARB NUMERIC(10,4), --carbohydrate (gm)
	DR1ISUGR NUMERIC(10,4), --total sugars (gm)
	DR1IFIBE NUMERIC(10,4), --fiber (gm)
	DR1ITFAT NUMERIC(10,4), --Total fat (gm)
 	DR1ICHOL NUMERIC(10,4), --cholesterol (mg)
 	DR1ISFAT NUMERIC(10,4), --Total saturated fatty acids (gm)
	DR1IMFAT NUMERIC(10,4), --Total monounsaturated fatty acids (gm)
	DR1IPFAT NUMERIC(10,4), --Total polyunsaturated fatty acids (gm)
	DR1ISODI NUMERIC(10,4), --Sodium (mg)
	DR1ICAFF NUMERIC(10,4), --Caffeine (mg)
	DR1IALCO NUMERIC(10,4), --Alcohol (gm)
	DR1IVD NUMERIC(10,4), --Vitamin D (mcg)
	DR1IPOTA NUMERIC(10,4) --Potassium (mg)
);

CREATE TABLE body_measure
(
	SEQN INT NOT NULL,
	BMXWT NUMERIC(10, 2), --weight (kg)
	BMIWT INT, --weight comment
	BMIRECUM NUMERIC(10,2), --recumbent length (cm)
	BMXHEAD NUMERIC(10,2), --head circumference (cm)
	BMXHT NUMERIC(10,2), --standing height (cm)
	BMXBMI NUMERIC(10,2), --body mass index (kg/m**2)
	BMDBMIC INT, --bmi category
	BMXLEG NUMERIC(10,2), --upper leg length (cm)
	BMXARML NUMERIC(10,2), --upper arm length (cm)
	BMXARMC NUMERIC(10,2), --arm circumference (cm)
	BMXWAIST NUMERIC(10,2), --waist circumference (cm)
	BMXSAD1 NUMERIC(10,2), --sagittal abdominal diameter 1st (cm)
	BMXSAD2 NUMERIC(10,2), --sagittal abdominal diameter 2nd (cm)
	BMXSAD3 NUMERIC(10,2), --sagittal abdominal diameter 3rd (cm)
	BMXSAD4 NUMERIC(10,2) --sagittal abdominal diameter 4th (cm)
);

CREATE TABLE muscle_strength
(
	SEQN INT NOT NULL,
	MGXH1T1 NUMERIC(6,2), --grip strength (kg) hand 1 test 1
	MGXH1T2 NUMERIC(6,2), --grip strength (kg), hand 1, test 2
	MGXH1T3 NUMERIC(6,2), --grip strength (kg), hand 1, test 3
	MGDCGSZ NUMERIC(10,2) --combined grip strength (kg)
);

CREATE TABLE alcohol_use
(
	SEQN INT NOT NULL,
	ALQ120Q INT, --# drink alcohol over past 12 mos - 0-350 only
	ALQ120U INT, --# days drink alcohol per 1wk, 2mo, 3yr
	ALQ130 INT, --# alcoholic drinks/day - past 12 mos 1-82 only
	ALQ141Q INT, --days have 4/5 drinks - past 12 mos 0-220 only
	ALQ141U INT --# days per 1week, 2month, 3year?
);

CREATE TABLE consumer_behavior
(
	SEQN INT NOT NULL,
	CBD070 NUMERIC(10,2), --Money spent at supermarket/grocery store $
	CBD110 NUMERIC(10,2), --Money spent on food at other stores
	CBD120 NUMERIC(10,2), --Money spent on eating out
	CBD130 NUMERIC(10,2) --Money spent on carryout/delivered foods
);

/*CREATE TABLE creatine_kinase
(
	SEQN INT NOT NULL,
	CKQ010 INT, --strenous exercise in the past 3 days?
	CKQ020 INT, --did exercise make muscles sore/painful?
	CKQ030 INT, --past 3 days muscle injury
	CKQ040 INT, --injury made muscles sore/painful
	CKD060 INT, --other muscle pain/soreness last 3 days
	CKQ070Q INT, --how long pain/soreness? number
	CKQ070U INT --unit: how long pain/soreness?
); */

CREATE TABLE current_health_status
(
	SEQN INT NOT NULL,
	HSD010 INT, --general health condition
	HSQ470 INT, --no. of days physical health not good
	HSQ480 INT, --no. of days mental health was not good
	HSQ490 INT, --inactive days due to phys/mental health
	HSQ496 INT, --how many days feel anxious
	HSAQUEX INT --source of health status data
);

CREATE TABLE diabetes
(
	SEQN INT NOT NULL,
	DIQ010 INT, --doctor told have diabetes
	DID040 INT, --age first told had diabetes
	DIQ170 INT, --ever told have health risk for diabetes
	DIQ172 INT, --feel could be at risk for diabetes
	DIQ175A INT, --family history
	DIQ175B INT, --overweight -valid value
	DIQ175D INT, --poor diet -valid value
	DIQ175G INT, --lack of physical activity
	DIQ175I INT, --High blood sugar
	DIQ175K INT, --Hypoglycemic
	DIQ175V INT --Craving for sweet/eating a lot of sugar
);

CREATE TABLE blood_pressure
(
	seqn INT NOT NULL,
	bpq020 INT --has high blood pressure
);

CREATE TABLE diet_behavior
(
	SEQN INT NOT NULL,
	DBQ700 INT, --how healthy is the diet
	DBQ197 INT, --past 30 day milk product consumption
	DBQ223A INT, --drinks whole or regular milk
	DBQ223B INT, --drinks 2% fat milk
	DBQ223C INT, --drinks 1% fat milk
	DBQ223D INT, --drinks fat free milk
	DBQ223E INT, --drinks soy milk
	DBQ229 INT, --regular milk drinker
	DBD895 INT, --# of meals not home prepared 0-21 and 5555 = >21
	DBD900 INT, --# of meals from fast food or pizza place
	DBD905 INT, --# of ready-to-eat foods in past 30 days
	DBD910 INT --# of frozen meals/pizza in past 30 days
);

CREATE TABLE medical_condition
(
	SEQN INT NOT NULL,
	MCQ080 INT, --doctor said your were overweight
	MCQ086 INT, --are you on gluten free diet?
	MCQ300c INT, --close relative had diabetes?
	MCQ370a INT, --are you now controlling or losing weight
	MCQ370b INT, --increasing exercise?
	MCQ370c INT, --Are you now reducing salt in diet
	MCQ370d INT --Are you now reducing fat in diet
);

CREATE TABLE mental_health
(
	SEQN INT NOT NULL,
	DPQ030 INT --Trouble sleeping or sleeping too much 0,1,2,3
);

CREATE TABLE physical_activity
(
	SEQN INT NOT NULL,
	PAQ706 INT, --days physically active at least 60mins in a week 0-7
	PAQ605 INT, --vigorous work activity
	PAQ610 INT, --days vigorous work
	PAD615 INT, --minutes vigorous-intensity work
	PAQ620 INT, --moderate work activity
	PAQ625 INT, --number of days moderate work
	PAD630 INT, --minutes moderate intensity work
	PAQ635 INT, --walk or bicycle
	PAQ640 INT, --number of days walk or bicycle
	PAD645 INT, --minutes walk/bicycle for transportation
	PAQ650 INT, --vigorous recreational activities
	PAQ655 INT, --days vigorous recreational activities
	PAD660 INT, --minutes vigorous recreational activities
	PAQ665 INT, --moderate recreational activities
	PAQ670 INT, --days moderate recreational activities
	PAD675 INT, --minutes moderate recreational
	PAD680 INT, --sedentary activity
	PAQ710 INT, --hours watch tv or videos past 30 days
	PAQ715 INT, --hours use computer past 30 days
	PAAQUEX INT --questionnaire source flag for weighting
);

CREATE TABLE physical_functioning
(
	SEQN INT NOT NULL,
	PFQ063A INT, --health problems causing difficulty 1
	PFQ063B INT, --health problems causing difficulty 2
	PFQ063C INT, --health problems causing difficulty 3
	PFQ063D INT, --health problems causing difficulty 4
	PFQ063E INT --health problems causing difficulty 5
);

CREATE TABLE sleep_disorder
(
	SEQN INT NOT NULL,
	SLD010H INT, --How much sleep do you get (hours) weekdays? 2-12 
	SLQ050 INT --Ever told doctor had trouble sleeping?
);

CREATE TABLE smoking_cigarette
(
	SEQN INT NOT NULL,
	SMQ020 INT, --Smoked at least 100 cigarettes in life
	SMD641 INT, --# days smoked cigs during past 30 days 0-30
	SMD650 INT --Avg # cigarettes/day during past 30 days 1-80, 95
);

CREATE TABLE tobacco
(
	SEQN INT NOT NULL,
	SMQ680 INT --Used tobacco/nicotine last 5 days?
);

CREATE TABLE weight_history
(
	SEQN INT NOT NULL,
	WHD010 INT, --Current self-reported height (inches)
	WHD020 INT, --Current self-reported weight (pounds)
	WHQ070 INT, --Tried to lose weight in past year
	WHD080A INT, --Ate less to lose weight
	WHD080B INT, --Switched to foods with lower calories
	WHD080C INT, --Ate less fat to lose weight
	WHD080D INT, --Exercised to lose weight
	WHD080E INT, --Skipped meals
	WHD080F INT, --Ate diet foods or products
	WHD080G INT, --Used a liquid diet formula
	WHD080H INT, --Joined a weight loss program
	WHD080I INT, --Took prescription diet pills
	WHD080J INT, --Took non-RX suppl. to lose weight
	WHD080K INT, --Took laxatives or vomited
	WHD080M INT, --Drank a lot of water
	WHD080N INT, --Followed a special diet
	WHD080O INT, --Ate fewer carbohydrates
	WHD080P INT, --Started to smoke or began to smoke again
	WHD080Q INT, --Ate more fruits, vegetables, salads
	WHD080R INT, --Changed eating habits
	WHD080S INT, --Ate less sugar, candy, sweets
	WHD080T INT, --Ate less junk food or fast food
	WHD080L INT --Other
);