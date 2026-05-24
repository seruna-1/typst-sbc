#let brazilian-computing-society-article(
	title: [],
	authors: (),
	abstract: [],
	doc,
) = {
	set page(
		paper: "a4",
		header: none,
		columns: 1,
	)
	set heading(numbering: "1.1.1")
	show heading: set text(size: 12pt)
	set par(justify: true, spacing: 1.25em)
	set text(size: 12pt, font: "Liberation Serif")
	[
		#align(center, text(size: 14pt)[*#title*])

		#align(
			center,
			text(weight: "bold")[
				#authors.map(author => [
						#author.name#super[#authors.position(affiliated => affiliated.affiliation == author.affiliation)]
					]
				).join(", ")
			]
		)

		#align(
			center,
			text(weight: "bold")[
				#authors.enumerate().map(pair => [
					#let (index, author) = pair
					#super[#index]#author.affiliation
				]).join(", ")
			]
		)

		#align(center, text(size: 10pt, font: "Liberation Mono")[#authors.map(author => author.email).join(", ")])

		#emph[*Abstract.* #abstract]

		#emph[*Resumo.* #abstract]

		#doc
	]
}
