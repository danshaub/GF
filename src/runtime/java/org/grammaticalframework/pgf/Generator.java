package org.grammaticalframework.pgf;

import java.util.Iterator;

class Generator implements Iterable<ExprProb> {
	private PGF gr;
	private String startCat;
	private ExprIterator iter;

	public Generator(PGF gr, String startCat) {
		this.gr       = gr;
		this.startCat = startCat;
		this.iter     = generateAll(gr, startCat);
	}

	public Iterator<ExprProb> iterator() {
		if (iter == null) {
			// If someone has asked for a second iterator over
			// the same parse results then we have to parse again.
			return generateAll(gr, startCat);
		} else {
			ExprIterator tmp_iter = iter;
			iter = null;
			return tmp_iter;
		}
	}

	static native ExprIterator generateAll(PGF gr, String startCat);
}
