LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY StateMacheneTest IS
	PORT (Clk, Rn, w : IN 	STD_LOGIC ;
			z	    : OUT STD_LOGIC ) ;
END StateMacheneTest ; 

ARCHITECTURE Behavior OF StateMacheneTest IS
	TYPE State_type IS (A, B, C, D) ; -- define a new type
	SIGNAL y : State_type ;
BEGIN
	PROCESS ( Rn, Clk )
	BEGIN
		IF Rn <= '0' THEN
			y <= A ;
		ELSIF (Clk'EVENT AND Clk = '1') THEN
			CASE y IS
				WHEN A =>
					IF w = '0' THEN
						y <= A ;
					ELSE
						y <= B ;
					END IF ;
				WHEN B =>
					IF w = '0' THEN
						y <= C ;
					ELSE
						y <= B ;
					END IF ;
				WHEN C =>
					IF w = '0' THEN
						y <= A ;
					ELSE
						y <= D ;
					END IF ;
				WHEN D =>
					IF w = '0' THEN
						y <= C ;
					ELSE
						y <= B ;
					END IF ;
					
			END CASE ;
		END IF ;
	END PROCESS ;
	
	z <= '1' WHEN Y = D ELSE '0' ;
END Behavior ; 
