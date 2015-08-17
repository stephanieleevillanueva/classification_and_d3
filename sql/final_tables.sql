--alcohol_use
SELECT seqn AS alcSeqn
	, alq130 AS alcNumberPerDay
INTO fin_alcohol_use
FROM public.alcohol_use
WHERE (alq130 BETWEEN 1 AND 82 OR alq130 = 95 OR alq130 IS NULL)

--body measure
SELECT seqn AS bodSeqn
	, bmxwt AS weight
	, bmxht AS height
	, CASE WHEN bmxbmi >= 25 THEN 1 
		WHEN bmxbmi < 25 THEN 0 END AS overweight
	, bmxwaist AS waist --35 or more in woman, 40 in man, see gender
INTO fin_body_measure
FROM public.body_measure
WHERE bmxwaist IS NOT NULL
	AND bmxht IS NOT NULL

--consumer behavior
SELECT seqn AS consSeqn
	, cbd070 AS dollarSupermarket
	, cbd110 AS dollarOtherStore
	, cbd120 AS dollarResto
	, cbd130 AS dollarCarryout
INTO public.fin_consumer_behavior
FROM consumer_behavior
WHERE cbd070 BETWEEN 0 AND 5142
	AND cbd110 BETWEEN 0 AND 2142
	AND cbd120 BETWEEN 0 AND 3000
	AND cbd130 BETWEEN 0 AND 8142

--current health status
SELECT seqn AS seqnGen
	, hsq496 AS daysAnxious
INTO fin_current_health_status
FROM public.current_health_status
WHERE (hsd010 BETWEEN 1 AND 5 OR hsd010 IS NULL)
	AND (hsq496 BETWEEN 0 AND 30 OR hsq496 IS NULL)

--demographic
SELECT seqn
	, riagendr AS gender
	, CASE WHEN ridagemn IS NULL THEN ridageyr
		ELSE CAST(ridagemn AS FLOAT)/12 END AS ageYear
INTO fin_demographic
FROM public.demographic

--diabetes
SELECT seqn AS diabSeqn
	, CASE WHEN diq010 = 1 THEN 1
		WHEN diq010 = 2 THEN 0 END AS diabStatus
	, CASE WHEN diq175b IS NOT NULL THEN 1 ELSE 0 END AS causeOverweight
	, CASE WHEN diq175d IS NOT NULL THEN 1 ELSE 0 END AS causeDiet
	, CASE WHEN diq175g IS NOT NULL THEN 1 ELSE 0 END AS causeLackExercise
	, CASE WHEN diq175v IS NOT NULL THEN 1 ELSE 0 END AS causeSugar
INTO fin_diabetes
FROM public.diabetes

--blood_pressure
SELECT seqn AS highBloodSeqn
	, CASE WHEN bpq020 = 1 THEN 1
		WHEN bpq020 = 2 THEN 0 END AS highBloodStatus
INTO fin_blood_pressure
FROM public.blood_pressure
WHERE bpq020 IN (1,2)

--diet_behavior
SELECT seqn AS behSeqn
	, dbq700 AS healthiness
	, CASE WHEN dbq223a IS NOT NULL THEN 1 ELSE 0 END AS regMilk
	, CASE WHEN dbq223b IS NOT NULL THEN 1 ELSE 0 END AS twoMilk
	, CASE WHEN dbq223c IS NOT NULL THEN 1 ELSE 0 END AS oneMilk
	, CASE WHEN dbq223d IS NOT NULL THEN 1 ELSE 0 END AS freeMilk
	, CASE WHEN dbq223e IS NOT NULL THEN 1 ELSE 0 END AS SoyMilk
	, dbd895 AS foodNotHomecooked
	, dbd905 AS foodReadyEat
	, dbd910 AS foodFrozen
INTO fin_diet_behavior
FROM public.diet_behavior
WHERE (dbq700 BETWEEN 1 AND 5 OR dbq700 IS NULL)
	AND (dbd895 BETWEEN 0 AND 21 OR dbd895 IS NULL)
	AND (dbd905 BETWEEN 0 AND 150 OR dbd905 IS NULL)
	AND (dbd910 BETWEEN 0 AND 180 OR dbd910 IS NULL)

--medical_condition
SELECT *
INTO fin_medical_condition
FROM(
	SELECT seqn AS medSeqn
		, CASE WHEN mcq080 = 1 THEN 1
			WHEN mcq080 = 2 THEN 0 END AS drOverweight
		, CASE WHEN mcq086 = 1 THEN 1
			WHEN mcq086 = 2 THEN 0 END AS glutenFree
		, CASE WHEN mcq370a = 1 THEN 1
			WHEN mcq370a = 2 THEN 0 END AS losingWeight
		, CASE WHEN mcq370b = 1 THEN 1
			WHEN mcq370b = 2 THEN 0 END incExercise
		, CASE WHEN mcq370c= 1 THEN 1
			WHEN mcq370c = 2 THEN 0 END reduceSalt
		, CASE WHEN mcq370d= 1 THEN 1
			WHEN mcq370d = 2 THEN 0 END reduceFat	
	FROM public.medical_condition
) AS A
WHERE drOverweight IS NOT NULL
	OR glutenFree IS NOT NULL
	OR losingWeight IS NOT NULL
	OR incExercise IS NOT NULL
	OR reduceSalt IS NOT NULL
	OR reduceFat IS NOT NULL

--mental health
SELECT seqn AS mentalSeqn
	, CASE WHEN dpq030 IN (1,2,3) THEN 1
		WHEN dpq030 = 0 THEN 0 END AS sleepTrouble
INTO fin_mental_health
FROM public.mental_health

--muscle strength
SELECT seqn AS gripSeqn
	, mgxh1t1 AS gripTest1
	, mgxh1t2 AS gripTest2
	, mgxh1t3 AS gripTest3
	, mgdcgsz AS combinedGrip
INTO fin_muscle_strength
FROM public.muscle_strength
WHERE mgxh1t1 IS NOT NULL
	OR mgxh1t2 IS NOT NULL
	OR mgxh1t3 IS NOT NULL
	OR mgdcgsz IS NOT NULL

--physical activity
SELECT seqn AS physSeqn
	, paq706 AS daysActive
	, CASE WHEN paq605 = 1 THEN 1
		WHEN paq605 = 2 THEN 0 END AS vigorWork
	, CASE WHEN paq610 BETWEEN 1 AND 7 THEN paq610 END AS vigorWorkDays
	, CASE WHEN paq620 = 1 THEN 1
		WHEN paq620 = 2 THEN 0 END AS moderWork
	, CASE WHEN paq625 BETWEEN 1 AND 7 THEN paq625 END AS moderWorkDays
	, CASE WHEN paq650 = 1 THEN 1
		WHEN paq650 = 2 THEN 0 END AS vigorActivity
	, CASE WHEN paq655 BETWEEN 1 AND 7 THEN paq655 END AS vigorActivityDays
	, CASE WHEN paq665 = 1 THEN 1
		WHEN paq665 = 2 THEN 0 END AS moderActivity
	, CASE WHEN paq670 BETWEEN 1 AND 7 THEN paq670 END AS moderActivityDays
	, CASE WHEN pad680 BETWEEN 0 AND 1380 THEN pad680 END AS sedenMinutes
INTO fin_physical_activity
FROM public.physical_activity

--sleep_disorder
SELECT seqn as sleepSeqn
	, CASE WHEN sld010h BETWEEN 6 AND 8 THEN 1
		WHEN sld010h < 13 THEN 0 END AS sleepNormal
	, CASE WHEN slq050 = 1 THEN 1
		WHEN slq050 = 2 THEN 0 END sleepTrouble
INTO fin_sleep_disorder
FROM public.sleep_disorder

--smoking cigarette
SELECT seqn AS smokeSeqn
	, CASE WHEN smq020 = 1 THEN 1
		WHEN smq020 = 2 THEN 0 END AS smoke100
	, CASE WHEN smd641 BETWEEN 0 AND 30 THEN smd641 END AS smokeDays
INTO fin_smoking_cigarette
FROM public.smoking_cigarette
WHERE smq020 IS NOT NULL
	OR smd641 IS NOT NULL

--tobacco
SELECT seqn AS tobSeqn
	, CASE WHEN smq680 = 1 THEN 1 
		WHEN smq680 = 2 THEN 0 END AS smokeTobacco
INTO fin_tobacco
FROM public.tobacco
WHERE smq680 IN (1,2)

--weight history
SELECT seqn AS weightSeqn
	, whd010 AS selfHeight
	, whd020 AS selfWeight
	, CASE WHEN whq070 = 1 THEN 1
		WHEN whq070 = 2 THEN 0 END AS triedLoseWeight
	, CASE WHEN whd080a = 10 THEN 1 END AS loseAteLess
	, CASE WHEN whd080b = 11 THEN 1 END AS loseLowerCal
	, CASE WHEN whd080c = 12 THEN 1 END AS loseLessFat
	, CASE WHEN whd080d = 13 THEN 1 END AS loseExercise
	, CASE WHEN whd080e = 14 THEN 1 END AS loseSkipMeal
	, CASE WHEN whd080f = 15 THEN 1 END AS loseAteDiet
	, CASE WHEN whd080g = 16 THEN 1 END AS loseLiquidDiet
	, CASE WHEN whd080h = 17 THEN 1 END AS loseProgram
	, CASE WHEN whd080i = 31 THEN 1 END AS losePills
	, CASE WHEN whd080j = 32 THEN 1 END AS loseNonrxSupp
	, CASE WHEN whd080k = 33 THEN 1 END AS loseLax
	, CASE WHEN whd080m = 34 THEN 1 END AS loseWater
	, CASE WHEN whd080n = 30 THEN 1 END AS loseSpecialDiet
	, CASE WHEN whd080o = 41 THEN 1 END AS loseFewCarbs
	, CASE WHEN whd080p = 42 THEN 1 END AS loseSmoke
	, CASE WHEN whd080q = 43 THEN 1 END AS loseAteFruit
	, CASE WHEN whd080r = 44 THEN 1 END AS loseEatHabit
	, CASE WHEN whd080s = 45 THEN 1 END AS loseLessSugar
	, CASE WHEN whd080t = 46 THEN 1 END AS loseLessJunk
	, CASE WHEN whd080l = 40 THEN 1 END AS loseOther
INTO fin_weight_history
FROM public.weight_history

--dietary
SELECT DISTINCT seqn AS dietSeqn
	, dr1iprot AS protein
	, dr1icarb AS carbs
	, dr1isugr AS sugar
	, dr1ifibe AS fiber
	, dr1itfat AS totalFat
	, dr1ichol AS cholesterol
	, dr1isfat AS satFat
	, dr1imfat AS monoFat
	, dr1ipfat AS polyFat
	, dr1isodi as sodium
	, dr1icaff as caffeine
	, dr1ialco as alcohol
	, dr1ivd as vitaminD
	, dr1ipota as potassium
INTO fin_dietary
FROM public.dietary


