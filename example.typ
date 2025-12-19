#import "@preview/rubber-article:0.5.0": *
#import "babst.typ": *

// Layout and styling
#show: article.with(
	cols: none, // Tip: use #colbreak() instead of #pagebreak() to seamlessly toggle columns
	eq-chapterwise: true,
	eq-numbering: "(1.1)",
	header-display: false,
	header-title: "The Title of the Paper",
	lang: "en",
	page-margins: 1in,
	page-paper: "a4",
)

// Frontmatter
#maketitle(title: "Baba Linguistics Department Entrance Examination", authors: ("Keke",), date: [April 1, 2024]
)

= Baba Is You

== Easy Level (2 points)

#align(center)[
	#baba-level(
		size: (11, 8),
		objects: (
			"baba": ((6, 4),),
			"belt": ((5, 5),),
			"belt-left": ((7, 5),),
			"BELT": ((1, 1), (2, 8)),
			"BABA": ((1, 7),),
			"IS": ((2, 7), (2, 1)),
			"YOU": ((3, 7), (5, 3)),
			"WIN": ((6, 3),),
			"SHIFT": ((2, 6),),
			"DEFEAT": ((3, 1),)
		),
	)
]

== Medium Level (2 points)

#align(center)[
	#baba-level(
		size: (13, 7),
		objects: (
			"baba": ((3, 4),),
			"water": rectf(7, 1, 7, 7),
			"skull": ((10, 6), (10, 7), (11, 6)),
			"flag": ((11, 7),),
			"wall": rectf(12, 2, 12, 7) + rectf(13, 5, 13, 7),
			"WATER": ((1, 6), (1, 4)),
			"IS": ((1, 5), (2, 1), (5, 5), (10, 1), (10, 2), (13, 3)),
			"AND": ((1, 3), (5, 3), (12, 1)),
			"HOT": ((1, 2),),
			"BABA": ((1, 1), (5, 6)),
			"MELT": ((3, 1),),
			"YOU": ((5, 4),),
			"FLOAT": ((5, 2), (11, 1)),
			"FLAG": ((9, 2),),
			"WIN": ((11, 2),),
			"SKULL": ((9, 1),),
			"DEFEAT": ((13, 1),),
			"WALL": ((13, 4),),
			"STOP": ((13, 2),)
		)
	)
]


#set page(flipped: true)

== Hard Level (2 points)

#align(center)[
	#baba-level(
		cell-size: 26.5pt,
		size: (22, 16),
		objects: (
			"wall": (
				rectb(5, 1, 22, 14) + 
				rectb(18, 1, 22, 12) + 
				rectb(19, 12, 21, 14) + 
				rectb(21, 14, 17, 16) + 
				rectf(6, 10, 11, 10) + 
				rectf(13, 11, 16, 12) + 
				rectb(7, 1, 9, 3) + 
				((6, 12), (12, 12), (15, 10))
			).dedup().filter(pt => (
				pt not in ((8, 3), (20, 12), (22, 14), (22, 13), (18, 14))
			)),
			"baba": ((10, 7),),
			"rock": ((10, 5),),
			"flag": ((16, 3),),
			"belt": ((16, 13),),
			"belt-left": ((12, 11),),
			"belt-up": ((12, 10),),
			"key-down": ((20, 13),),
			"key-left": ((15, 13),),
			"WALL": ((1, 13),),
			"IS": ((8, 12), (8, 3), (20, 3), (18, 14), (19, 15), (2, 7), (2, 9), (2, 11), (2, 13), (16, 9)),
			"STOP": ((3, 13), (17, 13)),
			"KEKE": ((8, 2), (12, 6), (1, 11)),
			"MOVE": ((3, 11),),
			"SKULL": ((1, 9), (14, 6)),
			"SWAP": ((3, 9),),
			"ROCK": ((1, 7), (16, 10)),
			"PUSH": ((3, 7),),
			"BABA": ((8, 13),),
			"YOU": ((8, 11),),
			"KEY": ((13, 6),),
			"BELT": ((18, 15),),
			"SHIFT": ((20, 15),),
			"FLAG": ((19, 2),),
			"WIN": ((21, 2),)
		)
	)
]

#pagebreak()

#set page(flipped: false)

= Linguistics

+ #bext[KEY WITHOUT WATER ON KEY WITH BELT ON BELT IS WIN; BABA IS YOU]\
	Draw one of the simplest state that wins. (2 points)
+ Explain the difference between 
	- #bext[BABA IS MELT AND SHIFT AND MOVE]
	- #bext[BABA IS #text-stack("MELT", "SHIFT") AND MOVE]
	- #bext[BABA IS #text-stack("MELT", "SHIFT", "MOVE")]
	And point out which one has a different effect. (2 points)
+ An _infinite loop_ is created when the set of rules parses infinitely, causing the game to show an "infinite loop" screen and restarting the level\
	An example is #bext[FLAG IS WORD] and #bext[#bobject("flag") IS NOT WORD]
	+ Explain why the example causes an infinite loop (1 point)
	+ Make an infinite loop using #bext[GROUP] (1 points)\
		(If #bext[A IS GROUP], #bext[B IS GROUP], and #bext[GROUP IS C], then #bext[A AND B IS C])
