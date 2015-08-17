SELECT highbloodseqn
	, highbloodstatus
	, alcnumberperday
	, weight
	, overweight
	, waist
	, gender
	, ageyear
	, vigoractivity
	, moderactivity
	, sedenminutes
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
INTO raw_data
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
	, highbloodstatus
	, alcnumberperday
	, weight
	, overweight
	, waist
	, gender
	, ageyear
	, vigoractivity
	, moderactivity
	, sedenminutes
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