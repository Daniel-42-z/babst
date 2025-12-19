#let baba-level(
	size: (10, 10), 
	objects: (:), 
	sprite-dir: "sprites/", 
	cell-size: 30pt, 
	bg-color: rgb("#101010"),
	img-extension: ".jpg"
) = {
	let (width, height) = size

	block(
		width: width * cell-size,
		height: height * cell-size,
		fill: bg-color,
		inset: 0pt,
		{
			// Grid Lines
			place(top + left, grid(
				columns: (cell-size,) * width,
				rows: (cell-size,) * height,
				stroke: 0.5pt + gray.darken(30%),
				..range(width * height).map(_ => []) 
			))

			// Objects
			for (name, coords) in objects {
				for (x, y) in coords {
					// CHECK: Is the name completely UPPERCASE (allowing underscores)?
					let is-text = name.match(regex("^[A-Z_]+$")) != none
					
					let content = if is-text {
						// Render as Text
						text(fill: white, size: cell-size * 0.35, weight: "bold", font: "Fira Code", name)
					} else {
						// Render as Image
						image(sprite-dir + name + img-extension, width: 80%, fit: "contain")
					}

					place(
						top + left,
						dx: (x - 1) * cell-size,
						dy: (height - y) * cell-size,
						box(
							width: cell-size,
							height: cell-size,
							align(center + horizon, content)
						)
					)
				}
			}
		}
	)
}


#let bobject(
	name,
	sprite-dir: "sprites/",
	height: 1em,
	img-extension: ".jpg"
) = context {
	let img = image(sprite-dir + name + img-extension, height: height)

	let h-img = measure(img).height
	// Measure a standard character to estimate the line height / visual center
	let h-ref = measure(text("X")).height

	// Align geometric centers:
	let b = h-img / 2 - h-ref / 2

	box(baseline: b, img)
}

#let bext(body) = text(font: "Fira Code", body)

// Generates a filled rectangle between two coordinates (inclusive)
#let rectf(x1, y1, x2, y2) = {
	let xs = calc.min(x1, x2)
	let xe = calc.max(x1, x2)
	let ys = calc.min(y1, y2)
	let ye = calc.max(y1, y2)

	let coords = ()
	// range() in Typst is exclusive at the end, so we add +1
	for x in range(xs, xe + 1) {
		for y in range(ys, ye + 1) {
			coords.push((x, y))
		}
	}
	coords
}

// Generates a rectangle border between two coordinates
#let rectb(x1, y1, x2, y2) = {
	let xs = calc.min(x1, x2)
	let xe = calc.max(x1, x2)
	let ys = calc.min(y1, y2)
	let ye = calc.max(y1, y2)

	let coords = ()
	for x in range(xs, xe + 1) {
		for y in range(ys, ye + 1) {
			// Add point if it is on any of the four edges
			if x == xs or x == xe or y == ys or y == ye {
				coords.push((x, y))
			}
		}
	}
	coords
}

// Generates a vertical stack of text strings, centered vertically relative to a single line of text.
// Useful for Baba Is You text stacks (e.g. "BABA IS MELT\nSHIFT").
#let text-stack(spacing: 2pt, ..items) = context {
	let items = items.pos()
	if items.len() == 0 { return }

	// Convert strings to text content if needed
	let content-items = items.map(it => if type(it) == str { text(it) } else { it })

	let s = stack(dir: ttb, spacing: spacing, ..content-items)
	let h-stack = measure(s).height

	// Measure a single item to estimate the line height / visual center
	let h-ref = measure(content-items.first()).height

	// Align geometric centers:
	// Center of stack is at h-stack/2 from top.
	// Center of ref line is at h-ref/2 from top.
	// We want to shift the baseline (which is usually at bottom of ref line?)
	// b = h-stack/2 - h-ref/2
	let b = h-stack / 2 - h-ref / 2

	box(baseline: b, s)
}
