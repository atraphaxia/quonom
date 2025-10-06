#let manual-synthdiv(
	coefficients,
	divisor,
	stroke: 1pt + black,
	..steps
) = {
	set table(
		stroke: (x, y) => if x == 0 and y < 2 {
			(right: stroke)
		} else if x > 0 and y == 2 {
			(top: stroke)
		}
	)
	align(center, table(
		align: right,
		columns: coefficients.len() + 1,
		none,
		..coefficients.map(x => $#x$),
		$#divisor$,
		none,
		..range(coefficients.len() - 1).map(x => $#steps.at(x * 2 + 1, default: none)$),
		none,
		..range(coefficients.len()).map(x => $#steps.at(x * 2, default: none)$)
	))
}
