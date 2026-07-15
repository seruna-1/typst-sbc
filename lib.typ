#let brazilian-computing-society-article(
	title: [],
	authors: (),
	abstract: "",
	resumo: "",
	doc,
) = {
	set page(
		paper: "a4",
		header: none,
		columns: 1,
		margin: (top: 3.5cm, bottom: 2.5cm, left: 3cm, right: 3cm),
	)
	set text(
		lang: "pt",
		region: "BR",
		font: "Liberation Serif",
		size: 12pt,
	)
	set par(
		justify: true,
		spacing: 0.21cm,
		first-line-indent: 1.25cm
	)
	set heading(numbering: "1.1.1.  ")
	show heading: set text(size: 12pt)
	show heading: set block(above: 0.42cm)
	[
		#align(center, text(size: 16pt, weight: "bold", title))

		#align(center, block(
			above: 0.42cm,
			text(
				weight: "bold",
				authors.map(
					author => author.name + super[#(authors.position(affiliated => affiliated.affiliation == author.affiliation)+1)]
				).join(", ")
			)
		))

		#align(center, block(
			above: 0.42cm,
			authors.enumerate().map(pair => [
				#let (index, author) = pair
				#super[#(1+index)]#author.affiliation
			]).join(", ")
		))

		#align(center, block(
			above: 0.42cm,
			below: 0.21cm,
			text(size: 10pt, font: "Liberation Mono")[#authors.map(author => author.email).join(", ")]
		))

		#pad(left: 0.8cm, right: 0.8cm)[
			#v(0.42cm)
			#if abstract != "" [ #emph[*Abstract.* #abstract] ]
			#emph[*Resumo.* #resumo]
			#v(0.42cm)
		]

		#doc
	]
}
