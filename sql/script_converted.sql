SELECT highbloodseqn
	, highbloodstatus
	, CASE WHEN alcnumberperday > 1 THEN 1 ELSE 0 END AS highAlcohol
	, weight
	, overweight
	, CASE WHEN (gender = 1 AND waist > 102) THEN 1
  		WHEN (gender = 1 AND waist <= 102) THEN 0
  		WHEN (gender = 2 AND waist > 88) THEN 1
  		WHEN (gender = 2 AND waist <= 88) THEN 0 END AS atRiskWaist 
	, CASE WHEN gender = 1 THEN 1 ELSE 0 END AS male
	, CASE WHEN ageyear >= 45 THEN 1 ELSE 0 END AS Older
	, CASE WHEN vigoractivity = 1 THEN 1
		WHEN (moderactivity = 1 OR sedenminutes <= 240) THEN 2
		WHEN sedenminutes > 240 THEN 3 END AS activityLevel
	, CASE WHEN sedenminutes > 240 THEN 1
		WHEN sedenminutes <= 240 THEN 0 END AS sedentary
	, sleepNormal
	, slp.sleepTrouble
	, smoke100
	, smokeTobacco
	, daysAnxious
	, glutenfree
	, losingweight
	, incexercise
	, reducesalt
	, reducefat
	, regmilk
	, twomilk
	, onemilk
	, freemilk
	, soymilk
	, foodnothomecooked
	, foodreadyeat
	, foodfrozen
	, SUM(protein) AS protein
	, SUM(carbs) AS carbs
	, SUM(sugar) AS sugar
	, SUM(fiber) AS fiber
	, SUM(totalFat) AS totalFat
	, SUM(cholesterol) AS cholesterol
	, SUM(satFat) AS satFat
	, SUM(monoFat) AS monoFat
	, SUM(polyFat) AS polyFat
	, SUM(sodium) AS sodium
	, SUM(caffeine) AS caffeine
	, SUM(alcohol) AS alcohol
	, SUM(vitaminD) AS vitaminD
	, SUM(potassium) AS potassium	
INTO public.r_converted_data
FROM public.fin_blood_pressure bp JOIN
	public.fin_alcohol_use alc ON highbloodseqn = alcseqn JOIN
	public.fin_body_measure bod ON highbloodseqn = bodseqn JOIN
	public.fin_demographic demo ON highbloodseqn = demo.seqn JOIN
	public.fin_diet_behavior beh ON highbloodseqn = behseqn JOIN
	public.fin_medical_condition ON highbloodseqn = medseqn JOIN
	public.fin_mental_health ON highbloodseqn = mentalseqn JOIN
	public.fin_physical_activity ON highbloodseqn = physseqn JOIN
	public.fin_sleep_disorder slp ON highbloodseqn = sleepseqn JOIN
	public.fin_smoking_cigarette ON highbloodseqn = smokeseqn JOIN
	public.fin_tobacco ON highbloodseqn = tobseqn JOIN
	public.fin_current_health_status ON highbloodseqn = seqngen JOIN
	public.fin_dietary ON highbloodseqn = dietSeqn
GROUP BY highbloodseqn
	, highbloodstatus
	, CASE WHEN alcnumberperday > 1 THEN 1 ELSE 0 END
	, weight
	, overweight
	, CASE WHEN (gender = 1 AND waist > 102) THEN 1
  		WHEN (gender = 1 AND waist <= 102) THEN 0
  		WHEN (gender = 2 AND waist > 88) THEN 1
  		WHEN (gender = 2 AND waist <= 88) THEN 0 END 
	, CASE WHEN gender = 1 THEN 1 ELSE 0 END
	, CASE WHEN ageyear >= 45 THEN 1 ELSE 0 END
	, CASE WHEN vigoractivity = 1 THEN 1
		WHEN (moderactivity = 1 OR sedenminutes <= 240) THEN 2
		WHEN sedenminutes > 240 THEN 3 END
	, CASE WHEN sedenminutes > 240 THEN 1
		WHEN sedenminutes <= 240 THEN 0 END
	, sleepNormal
	, slp.sleepTrouble
	, smoke100
	, smokeTobacco
	, daysAnxious
	, glutenfree
	, losingweight
	, incexercise
	, reducesalt
	, reducefat
	, regmilk
	, twomilk
	, onemilk
	, freemilk
	, soymilk
	, foodnothomecooked
	, foodreadyeat
	, foodfrozen