/* Random
 * Author: adisson
 * Creation date: 12/07/2025
 */
MACHINE
  Random

OPERATIONS
  vv <-- getRandomInt(n1, n2) =
  PRE n1 : NAT & n2 : NAT & n1 <= n2
  THEN vv :: n1..n2
  END

END
