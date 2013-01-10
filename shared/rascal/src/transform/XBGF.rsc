@contributor{Vadim Zaytsev - vadim@grammarware.net - SWAT, CWI}
module transform::XBGF

import lib::Rascalware;
import syntax::BGF;
import syntax::XBGF;
import normal::BGF;
import diff::GDT;
import transform::library::Associativity; // assoc, iterate
import transform::library::Brutal; // replace
import transform::library::Factoring; // factor, distribute
import transform::library::Folding; // fold, unfold, extract, inline
import transform::library::Massage; // massage
import transform::library::Util;
import transform::library::Nonterminals; // renameN, equate, splitN, clone
import transform::library::Sequential; // appear, disappear, inject, permute, project
import transform::library::Terminals; // renameT, splitT, concatT, abstractize, concretize
import transform::library::Labels; // renameL, unlabel, designate, renameS
import transform::library::Width; // narrow, widen
import transform::library::Yacc;
import export::BNF;
import transform::Results;

public XBGFResult transform(abridge(BGFProduction p), BGFGrammar g)
	= runAbridge(p,g);
public XBGFResult transform(abstractize(BGFProduction p), BGFGrammar g)
	= transform::library::Terminals::runAbstractize(p,g);
public XBGFResult transform(addH(BGFProduction p), BGFGrammar g)
	= runAddH(p,g);
public XBGFResult transform(addV(BGFProduction p), BGFGrammar g)
	= runAddV(p,g);
public XBGFResult transform(anonymize(BGFProduction p), BGFGrammar g)
	= runAnonymize(p,g);
public XBGFResult transform(appear(BGFProduction p), BGFGrammar g)
	= transform::library::Sequential::runAppear(p,g);
public XBGFResult transform(chain(BGFProduction p), BGFGrammar g)
	= runChain(p,g);
public XBGFResult transform(clone(str x, str y, XBGFScope w), BGFGrammar g)
	= runClone(x,y,w,g);
public XBGFResult transform(concatT(list[str] xs, str y, XBGFScope w), BGFGrammar g)
	= transform::library::Terminals::runConcatT(xs,y,w,g);
public XBGFResult transform(concretize(BGFProduction p), BGFGrammar g)
	= transform::library::Terminals::runConcretize(p,g);
public XBGFResult transform(deanonymize(BGFProduction p), BGFGrammar g)
	= runDeanonymize(p,g);
public XBGFResult transform(define(list[BGFProduction] ps), BGFGrammar g)
	= runDefine(ps,g);
public XBGFResult transform(designate(BGFProduction p), BGFGrammar g)
	= transform::library::Labels::runDesignate(p,g);
public XBGFResult transform(detour(BGFProduction p), BGFGrammar g)
	= runDetour(p,g);
public XBGFResult transform(deyaccify(str x), BGFGrammar g)
	= runDeyaccify(x,g);
public XBGFResult transform(disappear(BGFProduction p), BGFGrammar g)
	= transform::library::Sequential::runDisappear(p,g);
public XBGFResult transform(distribute(XBGFScope w), BGFGrammar g)
	= transform::library::Factoring::runDistribute(w,g);
public XBGFResult transform(downgrade(BGFProduction p1,BGFProduction p2), BGFGrammar g)
	= runDowngrade(p1,p2,g);
public XBGFResult transform(eliminate(str x), BGFGrammar g)
	= runEliminate(x,g);
public XBGFResult transform(equate(str x, str y), BGFGrammar g)
	= transform::library::Nonterminals::runEquate(x,y,g);
public XBGFResult transform(extract(BGFProduction p, XBGFScope w), BGFGrammar g)
	= transform::library::Folding::runExtract(p,w,g);
public XBGFResult transform(factor(BGFExpression e1, BGFExpression e2, XBGFScope w), BGFGrammar g)
	= transform::library::Factoring::runFactor(e1,e2,w,g);
public XBGFResult transform(fold(str x, XBGFScope w), BGFGrammar g)
	= transform::library::Folding::runFold(x,w,g);
public XBGFResult transform(horizontal(XBGFScope w), BGFGrammar g)
	= runHorizontal(w,g);
public XBGFResult transform(importG(list[BGFProduction] ps), BGFGrammar g)
	= runImportG(ps,g);
public XBGFResult transform(inject(BGFProduction p), BGFGrammar g)
	= transform::library::Sequential::runInject(p,g);
public XBGFResult transform(inline(str x), BGFGrammar g)
	= transform::library::Folding::runInline(x,g);
public XBGFResult transform(introduce(list[BGFProduction] ps), BGFGrammar g)
	= runIntroduce(ps,g);
public XBGFResult transform(iterate(BGFProduction p), BGFGrammar g)
	= transform::library::Associativity::runIterate(p,g);
public XBGFResult transform(lassoc(BGFProduction p), BGFGrammar g)
	= transform::library::Associativity::runLAssoc(p,g);
public XBGFResult transform(massage(BGFExpression e1, BGFExpression e2, XBGFScope w), BGFGrammar g)
	= transform::library::Massage::runMassage(e1,e2,w,g);
public XBGFResult transform(narrow(BGFExpression e1, BGFExpression e2, XBGFScope w), BGFGrammar g)
	= transform::library::Width::runNarrow(e1,e2,w,g);
public XBGFResult transform(permute(BGFProduction p), BGFGrammar g)
	= transform::library::Sequential::runPermute(p,g);
public XBGFResult transform(project(BGFProduction p), BGFGrammar g)
	= transform::library::Sequential::runProject(p,g);
public XBGFResult transform(rassoc(BGFProduction p), BGFGrammar g)
	= transform::library::Associativity::runRAssoc(p,g);
public XBGFResult transform(redefine(list[BGFProduction] ps), BGFGrammar g)
	= runRedefine(ps,g);
public XBGFResult transform(removeH(BGFProduction p), BGFGrammar g)
	= runRemoveH(p,g);
public XBGFResult transform(removeV(BGFProduction p), BGFGrammar g)
	= runRemoveV(p,g);
public XBGFResult transform(renameL(str x, str y), BGFGrammar g)
	= transform::library::Labels::runRenameL(x,y,g);
public XBGFResult transform(renameN(str x, str y), BGFGrammar g)
	= transform::library::Nonterminals::runRenameN(x,y,g);
public XBGFResult transform(renameS(str x, str y, XBGFScope w), BGFGrammar g)
	= transform::library::Labels::runRenameS(x,y,w,g);
public XBGFResult transform(renameT(str x, str y), BGFGrammar g)
	= transform::library::Terminals::runRenameT(x,y,g);
public XBGFResult transform(XBGFCommand::replace(BGFExpression e1, BGFExpression e2, XBGFScope w), BGFGrammar g)
	= transform::library::Brutal::runReplace(e1,e2,w,g);
public XBGFResult transform(reroot(list[str] xs), BGFGrammar g)
	= runReroot(xs,g);
public XBGFResult transform(splitN(str x, list[BGFProduction] ps, XBGFScope w), BGFGrammar g)
	= transform::library::Nonterminals::runSplitN(x,ps,w,g);
public XBGFResult transform(splitT(str x, list[str] ys, XBGFScope w), BGFGrammar g)
	= transform::library::Terminals::runSplitT(x,ys,w,g);
public XBGFResult transform(unchain(BGFProduction p), BGFGrammar g)
	= runUnchain(p,g);
public XBGFResult transform(undefine(list[str] xs), BGFGrammar g)
	= runUndefine(xs,g);
public XBGFResult transform(unfold(str x, XBGFScope w), BGFGrammar g)
	= transform::library::Folding::runUnfold(x,w,g);
public XBGFResult transform(unite(str x, str y), BGFGrammar g)
	= runUnite(x,y,g);
public XBGFResult transform(unlabel(str x), BGFGrammar g)
	= transform::library::Labels::runUnlabel(x,g);
public XBGFResult transform(upgrade(BGFProduction p1, BGFProduction p2), BGFGrammar g)
	= runUpgrade(p1,p2,g);
public XBGFResult transform(vertical(XBGFScope w), BGFGrammar g)
	= runVertical(w,g);
public XBGFResult transform(widen(BGFExpression e1, BGFExpression e2, XBGFScope w), BGFGrammar g)
	= transform::library::Width::runWiden(e1,e2,w,g);
public XBGFResult transform(yaccify(list[BGFProduction] ps), BGFGrammar g)
	= runYaccify(ps,g);
public XBGFResult transform(atomic(list[XBGFCommand] steps), BGFGrammar g)
	= transform(steps,g); // NB: different from the rest
public XBGFResult transform(strip(str a), BGFGrammar g)
	= runStrip(a,g); // semi-deprecated
public default BGFGrammar transform(XBGFCommand x, BGFGrammar g) {throw "Unknown XBGF command <x>";}

public BGFGrammar transform(XBGFSequence xbgf, BGFGrammar g)
{
	XBGFResult out = <ok(),normalise(g)>;
	for (XBGFCommand step <- xbgf)
	{
		out = transform(step,out.g);
		thw(out.r);
		out.g = normalise(out.g);
	}
	return out.g;
}


XBGFResult runAbridge(BGFProduction p1, BGFGrammar g)
{
	XBGFOutcome r = ok();
	if (production(_,x,nonterminal(x)) !:= p1)
		r = add(r,problemProd("Production cannot be abridged.",p1));
	if (!inProds(p1,g.prods))
		r = notFoundP(r,p1);
	return <r,grammar(g.roots, g.prods - p1)>;
}

XBGFResult runAddH(BGFProduction p1, BGFGrammar g)
{
	XBGFOutcome r = ok();
	p2 = unmark(p1);
	p3 = demarkH(p1);
	if (!inProds(p3,g.prods))
		r = notFoundP(r,p3);
	return <r,grammar(g.roots, replaceP(g.prods,p3,p2))>;
}

XBGFResult runAddV(BGFProduction p1, BGFGrammar g)
{
	XBGFOutcome r = ok();
	if (production(_,str x,_) := p1)
	{
		<ps1,ps2,ps3> = splitPbyW(g.prods,innt(x));
		if (isEmpty(ps2))
			r = add(r,problemStr("Nonterminal must be defined",x));
		if (p1 in ps2)
			r = add(r,problemProd("Production rule is already present",p1));
		if (production(str l,_,_) := p1 && l != "")
			if (production(str l,_,_) <- ps)
				r = add(r,problemStr("Another production rule with the same label is already present",l));
		return <r,grammar(g.roots, ps1 + ps2 + p1 + ps3)>;
	}
}

XBGFResult runAnonymize(BGFProduction p1, BGFGrammar g)
{
	XBGFOutcome r = ok();
	p2 = unmark(p1);
	p3 = demarkS(p1);
	if (!inProds(p2,g.prods))
		r = notFoundP(r,p1);
	return <r,grammar(g.roots, replaceP(g.prods,p2,p3))>;
}

XBGFResult runChain(BGFProduction p, grammar(rs, ps))
{
	XBGFOutcome r = ok();
	if (production(str l,str n1,nonterminal(str n2)) := p)
		{
			if (n1 == n2)
				r = add(r,problem("Do not introduce reflexive chain productions with chain, use detour instead"));
			if (n2 in allNs(ps))
				r = add(r,problemStr("Nonterminal must be fresh",n2));
			list[BGFProduction] ps1,ps2,ps3;
			if (l != "") <ps1,ps2,ps3> = splitPbyW(ps,inlabel(l));
			else <ps1,ps2,ps3> = splitPbyW(ps,innt(n1));
			if ([production(l,n1,e)] := ps2)
				return <r,grammar(rs, ps1 + p + production("",n2,e) + ps3)>;
			else
				return <add(r,problemProds("Production rule has unexpected form",ps2)),g>;
		}
	else
		return <problemProd("Not a chain production rule.",p),g>;
}

XBGFResult runDeanonymize(BGFProduction p1, BGFGrammar g)
{
	XBGFOutcome r = ok();
	p2 = unmark(p1);
	p3 = demarkS(p1);
	if (!inProds(p3,g.prods))
		r = notFoundP(r,p1);
	return <r,grammar(g.roots, replaceP(g.prods,p3,p2))>;
}

XBGFResult runDefine(list[BGFProduction] ps1, BGFGrammar g)
{
	XBGFOutcome r = ok();
	if ({str n} := definedNs(ps1))
	{
		if (n notin usedNs(g.prods))
			r = add(r,problemStr("Nonterminal must not be fresh, use introduce instead",n));
		return <r,grammar(g.roots, g.prods + ps1)>;
	}
	else
		return <problem("Multiple defined nonterminals found"),g>;
}

XBGFResult runDetour(BGFProduction p, BGFGrammar g)
{
	XBGFOutcome r = ok();
	if (production(_,x,nonterminal(x)) := p)
	{
		// xbgf1.pro only aksed for x to be used, not necessarily defined; we're more strict here
		if (x notin definedNs(g.prods))
			r = freshN(r,x);
		<ps1,ps2,ps3> = splitPbyW(g.prods,innt(x));
		return <r,grammar(g.roots, ps1 + ps2 + p + ps3)>;
	}
	else
		return <problemProd("Not a reflexive chain production rule",p),g>;
}

XBGFResult runDeyaccify(str n, BGFGrammar g)
{
	XBGFOutcome r = ok();
	if (n notin definedNs(g.prods))
		r = add(r,problemStr("Nonterminal is not defined",n));
	<ps1,ps2,ps3> = splitPbyW(g.prods,innt(n));
	if (len(ps2) < 2)
		r = add(r,problemStr("Nonterminal must be defined vertically for deyaccification to work",n));
	if (len(ps2) > 2)
		r = add(r,problemProds("No deyaccification patterns for <len(ps2)> production rules known",ps2));
	if (ok() := r)
		return <r,grammar(g.roots, ps1 + transform::library::Yacc::deyaccify(toSet(ps2)) + ps3)>;
	else
		return <r,g>;
}

XBGFResult runDowngrade(BGFProduction p1, BGFProduction p2, grammar(rs, ps))
{
	XBGFOutcome r = ok();
	if (/marked(nonterminal(str x)) := p1)
		if (production(str l,x,BGFExpression e) := p2)
		{
			p3 = visit(p1){case marked(_) => e};
			return <r,grammar(rs,replaceP(ps,unmark(p1),normalise(p3)))>;
		}
		else
			return <problemProd2("Production rules do not agree on nonterminal",p1,p2),g>;
	else
		return <problemProd("Production rule does not have a single nonterminal marked",p1),g>;
}

XBGFResult runEliminate(str x, BGFGrammar g)
{
	XBGFOutcome r = ok();
	// TODO: can we eliminate root?
	if (x in g.roots)
		r = add(r,problemStr("Cannot eliminate root nonterminal",x));
	if (x notin definedNs(g.prods))
		r = add(r,problemStr("Nonterminal must be defined",x));
	<ps1,_,ps3> = splitPbyW(g.prods,innt(x));
	if (x in usedNs(ps1+ps3))
		r = add(r,problemStr("Nonterminal must not be used",x));
	return <r,grammar(g.roots, ps1 + ps3)>;
}

XBGFResult runHorizontal(XBGFScope w, BGFGrammar g)
{
	XBGFOutcome r = ok();
	// For xbgf1.pro, the context must be strictly vertical. Here we are more relaxed. 
	<ps1,ps2,ps3> = splitPbyW(g.prods,w);
	list[BGFExpression] es4 = [];
	for (production(str l, str x, BGFExpression e) <- ps2)
		if (choice(L) := e)
			es4 += L;
		elseif (l == "")
			es4 += e;
		else
			es4 += selectable(l,e);
	if (innt(str x) := w)
		return <r,grammar(g.roots,ps1 + production("",x,choice(es4)) + ps3)>;
	else
		return <problemScope("Scope for horizontal must be a nonterminal",w),g>;
}

XBGFResult runImportG(list[BGFProduction] ps1, BGFGrammar g)
{
	XBGFOutcome r = ok();
	defs1 = definedNs(ps1);
	defs12 = defs1 & definedNs(g.prods);
	du12 = defs1 & usedNs(g.prods);
	if (!isEmpty(defs12))
		r = add(r,problemProds("Import clashes with existing definitions", defs12));
	if (!isEmpty(du12))
		r = add(r,problemProds("Import clashes with existing definitions", du12));
	return <r,grammar(g.roots, ps1 + g.prods)>;
}

XBGFResult runIntroduce(list[BGFProduction] ps, BGFGrammar g)
{
	XBGFOutcome r = ok();
	if ({str n} := definedNs(ps))
	{
		if (n in usedNs(g.prods))
			r = notFreshN(r,n);
		if (n in definedNs(g.prods))
			r = add(r,problemStr("Definition for nonterminal clashes with existing definition",n));
		return <r,grammar(g.roots, g.prods + ps)>;
	}
	else
		return <problem("Multiple defined nonterminals found"),g>;
}

XBGFResult runRedefine(list[BGFProduction] ps1, BGFGrammar g)
{
	XBGFOutcome r = ok();
	// inlined superposition of undefine and define, with two exceptional details:
	// (1) if ps1.n is a root, undefine would have stripped it from this status
	// (2) redefine preserves original order of production rules
	if ({str x} := definedNs(ps1))
	{
		if (x notin definedNs(g.prods))
			r = add(r,problemStr("Nonterminal must be defined",x));
		if (x notin usedNs(g.prods))
			r = add(r,problemStr("Nonterminal must be used",x));
		<ps3,_,ps4> = splitPbyW(g.prods,innt(x));
		return <r,grammar(g.roots, ps3 + ps1 + ps4)>; 
	}
}

XBGFResult runRemoveH(BGFProduction p1, BGFGrammar g)
{
	XBGFOutcome r = ok();
	p2 = unmark(p1);
	if (!inProds(p2, g.prods))
		r = notFoundP(r,p2);
	return <r,grammar(g.roots, replaceP(g.prods,p2,demarkH(p1)))>;
}

XBGFResult runRemoveV(BGFProduction p, BGFGrammar g)
{
	XBGFOutcome r = ok();
	<_,ps2,_> = splitPbyW(g.prods, innt(p.lhs));
	if (isEmpty(ps2))
		r = freshN(r, p.lhs);
	if (!inProds(p,ps2))
		r = notFoundP(r,p);
	if ([p] == ps2)
		r = add(r,problemStr("Cannot remove the last production rule with removeV, use undefine or eliminate",p.lhs));
	return <r,grammar(g.roots, g.prods - p)>;
}

XBGFResult runReroot(list[str] xs, BGFGrammar g)
{
	XBGFOutcome r = ok();
	if (toSet(xs) == toSet(g.roots))
		r = add(r,problemStrs("Vacuous reroot",xs));
	// xbgf1.pro only asked for it to be a subset of allNs, not definedNs; we're more strict here
	if (toSet(xs) <= definedNs(g.prods))
		return <r,grammar(xs, g.prods)>;
	else
		return <add(r,problemStrs("Not all nonterminals are defined",xs)),g>;
}

XBGFResult runUnchain(BGFProduction p, BGFGrammar g)
{
	XBGFOutcome r = ok();
	if (production(str l,str n1,nonterminal(str n2)) := p)
		{
			if (n1 == n2)
				r = add(r,problem("Do not remove reflexive chain productions with chain, use abridge instead"));
			if (n2 in g.roots)
				r = add(r,problemStr("Nonterminal must not be root",n2));
			if (!inProds(p,g.prods))
				r = notFoundP(r,p);
			//if (n2 in allNs(ps)) r = notFreshN(r,n2);
			list[BGFProduction] ps1,ps2,ps3;
			<ps1,ps2,ps3> = splitPbyW(g.prods - p,innt(n2));
			if (len(ps2) != 1)
				r = add(r,problemStr("Nonterminal must occur exactly once",n2));
			if (l == "")
				l = n2;
			if ([production(_,n2,e)] := ps2)
				return <r,grammar(g.roots, ps1 + production(l,n1,e) + ps3)>;
			else
				return <add(r,problemProds("Production rules have unexpected form",ps2)),g>;
		}
	else
		return <add(r,problemProd("Not a chain production rule",p)),g>;
}

//TODO: undefine only one nonterminal per transformation
XBGFResult runUndefine(list[str] xs, BGFGrammar g)
{
	XBGFOutcome r = ok();
	list[BGFProduction] myps = g.prods;
	list[str] rs = g.roots;
	for (str x <- xs)
	{
		if (x notin definedNs(g.prods))
			r = add(r,"Nonterminal must be defined.",x);
		if (x notin usedNs(g.prods))
			r = add(r,"Nonterminal must be used.",x);
		//throw "Cannot undefine root nonterminal <x>."; // check was not in xbgf1.pro
		rs -= x;
		<ps1,_,ps3> = splitPbyW(myps,innt(x));
		myps = ps1 + ps3;
	}
	return <r,grammar(g.roots,myps)>;
}

XBGFResult runUnite(str x, str y, BGFGrammar g)
{
	XBGFOutcome r = ok();
	if (x == y)
		r = add(r,problemStr("Nonterminal is already united with itself",x));
	used = allNs(g.prods);
	if (x notin used)
		r = freshN(r,x);
	if (y notin used)
		r = freshN(r,y);
	<ps1x,ps2x,ps3x> = splitPbyW(g.prods, innt(x));
	list[BGFProduction] ps4x = ps1x + [production(l,y,e) | p <- ps2x, production(str l,x,BGFExpression e) := p] + ps3x;
	if (x in usedNs(ps4x))
		return <r,transform::library::Brutal::runReplace(nonterminal(x),nonterminal(y),globally(),grammar(g.roots,ps4x))>;
	else
		return <r,grammar(g.roots,ps4x)>;
}

XBGFResult runUpgrade(BGFProduction p1, BGFProduction p2, BGFGrammar g)
{
	XBGFOutcome r = ok();
	if (/marked(nonterminal(str x)) := p1)
		if (production(str l,x,BGFExpression e) := p2)
		{
			p3 = visit(p1){case marked(_) => e};
			p3 = normalise(p3);
			return <r,grammar(g.roots,replaceP(g.prods,p3,unmark(p1)))>;
		}
		else
			return <problemProd2("Production rules do not agree on nonterminal",p1,p2),g>;
	else
		return <problemProd("Production rule must have one single nonterminal marked",p1),g>;
}

XBGFResult runVertical(XBGFScope w, BGFGrammar g)
{
	XBGFOutcome r = ok();
	<ps1,ps2,ps3> = splitPbyW(g.prods, w);
	ps4 = [];
	for (production(str l, str x, BGFExpression e) <- ps2)
		if (choice(L) := e)
			for (se <- L)
				if (selectable(str s, BGFExpression e2) := se)
					if (/production(s,_,_) := g.prods)
						r = add(r,problemStr("Outermost selector clashes with an existing label",s));
					elseif (/production(s,_,_) := ps4)
						r = add(r,problemStr("Outermost selectors ambiguous",s));
					else
						ps4 += production(s,x,e2);
				else
					ps4 += production("",x,se);
		else ps4 += production(l,x,e);
	return <r,grammar(g.roots, ps1 + ps4 + ps3)>;
}

XBGFResult runYaccify(list[BGFProduction] ps1, BGFGrammar g)
{
	XBGFOutcome r = ok();
	if ({str x} := definedNs(ps1))
	{
		<ps3,ps4,ps5> = splitPbyW(g.prods,innt(x));
		if ([dyp1] := ps4 && [yp1,yp2] := ps1 && transform::library::Yacc::yaccification(dyp1,{yp1,yp2}))
			return <r,grammar(g.roots, ps3 + ps1 + ps5)>;
		else
			return <problemProds2("Unsuitable yaccification",ps1,ps4),g>;
	}
	else 
		return <problem("Production rules must define just one nonterminal."),g>;
}

XBGFResult runStrip(str a, BGFGrammar g)
{
	XBGFOutcome r = ok();
	// TODO: semi-deprecated
	list[BGFProduction] ps2;
	if (a=="allLabels")
		ps2 = visit(g.prods){case production(_,str x,BGFExpression e) => production("",x,e)}
	elseif (a=="allSelectors")
		ps2 = visit(g.prods){case selectable(_,BGFExpression e) => e}
	elseif (a=="allTerminals")
		{ // deprecated, please use a mutation that generates abstractize commands
			ps2 = visit(g.prods){case terminal(_) => epsilon()};
			ps2 = normalise(ps2);
		}
	else
		return <problemStr("Unknown strip parameter",a),g>;
	return <r,grammar(g.roots,ps2)>;
}
