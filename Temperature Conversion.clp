;; Abdolrahman Farshgar - ifarshgar@gmail.com
;; Temperature Conversion
;; Spring of 2019

;; Asks the user which type of temperature to convert
(defrule define-temperature-type
	=>
	(printout t 
		crlf crlf
		"What temperature do you want to convert?" crlf
		"k- Kelvin" crlf
		"c- Celsius" crlf
		"f- Fahrenheit" crlf
		"r- Reaumur" crlf
		"Please enter your choice as only a lower case single character: "
	) 
	(bind ?type (read))

	(switch ?type
		(case k
			then
			(assert (temperature Kelvin))
		)
		(case c
			then
			(assert (temperature Celsius))
		)
		(case f
			then
			(assert (temperature Fahrenheit))
		)
		(case r
			then
			(assert (temperature Reaumur))
		)
		(default
			then
			(printout t "wrong input!" crlf crlf)
			(halt)
		)
	)
)

(defrule Kelvin
	(temperature Kelvin)
	=>
	;Asks what is the temperature that the user wants to convert
	(printout t "Enter the temperature in Kelvin: ")
	(bind ?degree (read))

	(bind ?celsius (- ?degree  273.15))
	(bind ?fahrenheit(- 459.67 (* ?degree 1.8)))
	(bind ?reaumur(* (- ?degree 273.15) 0.8))
	(printout t 
		crlf crlf
		?degree " degree Kelvin is equal to: " crlf 
		?celsius " Celsius " crlf  
		?fahrenheit " Fahrenheit " crlf 
		?reaumur " Reaumur " crlf 
		crlf crlf
	)
)

(defrule Celsius
	(temperature Celsius)
	=>
	;Asks what is the temperature that the user wants to convert
	(printout t "Enter the temperature in Celsius: ")
	(bind ?degree (read))
	
	(bind ?fahrenheit(+ 32 (* 1.8 ?degree)))
	(bind ?reaumur(* 0.8 ?degree))
	(bind ?kelvin (+ ?degree 273.15))
	(printout t 
		crlf crlf
		?degree " degree Celsius is equal to: " crlf 
		?fahrenheit " Farenheit " crlf
		?reaumur " Reamur " crlf
		?kelvin " Kelvin " crlf
		crlf crlf
	)
)

(defrule Fahrenheit
	(temperature Fahrenheit)
	=>
	;Asks what is the temperature that the user wants to convert
	(printout t "Enter the temperature in Fahrenheit: ")
	(bind ?degree (read))

	(bind ?kelvin (/ (+ ?degree 459.67) 1.8))
	(bind ?celsius (/ (- ?degree 32) 1.8))
	(bind ?reaumur (/ (- ?degree 32) 2.25))
	(printout t 
		crlf crlf
		?degree " degree Fahrenheit is equal to: " crlf 
		?kelvin " Kelvin" crlf
		?celsius " Celsius" crlf
		?reaumur " Reaumur" crlf
		crlf crlf
	)
)

(defrule Reaumur
	(temperature Reaumur)
	=>
	;Asks what is the temperature that the user wants to convert
	(printout t "Enter the temperature in Kelvin: ")
	(bind ?degree (read))

	(bind ?kelvin (+ (* ?degree 1.25) 273.15))
	(bind ?celsius (* ?degree 1.25))
	(bind ?fahrenheit (+ (* ?degree 2.25) 32))
	(printout t 
		crlf crlf
		?degree " degree Reaumur is equal to: " crlf
		?kelvin " Kelvin " crlf  
		?celsius " Celsius " crlf  
		?fahrenheit " Fahrenheit " crlf 
		crlf crlf
	)
)
