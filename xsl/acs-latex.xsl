<?xml version='1.0'?>
<!-- **********************************************************************-->
<!-- Copyright 2012-2017                                                   -->
<!-- Matthew Boelkins                                                      -->
<!--                                                                       -->
<!-- This file is part of Active Calculus.                                 -->
<!--                                                                       -->
<!-- Permission is granted to copy, distribute and/or modify this document -->
<!-- under the terms of the Creative Commons BY-NC-SA license.  The work   -->
<!-- may be used for free by any party so long as attribution is given to  -->
<!-- the author(s), the work and its derivatives are used in the spirit of -->
<!-- "share and share alike"; no party may sell this work or any of its    -->
<!-- derivatives for profit.  All trademarks are the registered marks of   -->
<!-- their respective owners.                                              -->
<!-- **********************************************************************-->

<!-- ACS customizations for all LaTeX runs -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- Assumes current file is in mathbook/user, so it must be copied there -->
<xsl:import href="../xsl/mathbook-latex.xsl" />
<!-- Assumes next file can be found in mathbook/user, so it must be copied there -->
<!--<xsl:import href="acs-common.xsl" />-->

<!-- List Chapters and Sections in printed Table of Contents -->
<xsl:param name="toc.level" select="'2'" />


<!-- Exercises have hint (sporadically), answer, and solution -->
<!-- Put answers in backmatter -->
<xsl:param name="exercise.text.statement" select="'yes'" />
<xsl:param name="exercise.text.hint" select="'yes'" />
<xsl:param name="exercise.text.answer" select="'no'" />
<xsl:param name="exercise.text.solution" select="'no'" />
<xsl:param name="exercise.backmatter.statement" select="'no'" />
<xsl:param name="exercise.backmatter.hint" select="'no'" />
<xsl:param name="exercise.backmatter.answer" select="'yes'" />
<xsl:param name="exercise.backmatter.solution" select="'no'" />

<!-- activity is a project-like, so we need to set those stringparams -->
<!-- to control hints, answers, and solutions -->
<xsl:param name="project.text.hint" select="'no'" />
<xsl:param name="project.text.answer" select="'no'" />
<xsl:param name="project.text.solution" select="'no'" />

<!-- LaTeX formatting commands we can inject here without incident -->

<xsl:param name="latex.geometry" select="'paperwidth=7.44in,paperheight=9.69in,tmargin=.5in,bmargin=.3in,hmargin=.75in,bindingoffset=.4in,includeheadfoot '" />

<xsl:param name="latex.preamble.early">
       <xsl:text>%% Customized to load Palatino fonts&#xa;</xsl:text>
   <xsl:text>\usepackage[T1]{fontenc}&#xa;</xsl:text>
   <xsl:text>\renewcommand{\rmdefault}{zpltlf} %Roman font for use in math mode&#xa;</xsl:text>
   <xsl:text>\usepackage[scaled=.85]{beramono}% used only by \mathtt&#xa;</xsl:text>
   <xsl:text>\usepackage[type1]{cabin}%used only by \mathsf&#xa;</xsl:text>
   <xsl:text>\usepackage{amsmath,amssymb,amsthm}%load before newpxmath&#xa;</xsl:text>
   <xsl:text>\usepackage[varg,cmintegrals,bigdelims,varbb]{newpxmath}&#xa;</xsl:text>
   <xsl:text>\usepackage[scr=rsfso]{mathalfa}&#xa;</xsl:text>
   <xsl:text>\usepackage{bm} %load after all math to give access to bold math&#xa;</xsl:text>
   <xsl:text>% Now load the otf text fonts using fontspec--wont affect math&#xa;</xsl:text>
   <xsl:text>\usepackage[no-math]{fontspec}&#xa;</xsl:text>
   <xsl:text>\setmainfont{TeXGyrePagellaX}&#xa;</xsl:text>
   <xsl:text>\defaultfontfeatures{Ligatures=TeX,Scale=1,Mapping=tex-text}&#xa;</xsl:text>
   <xsl:text>\linespread{1.02}&#xa;</xsl:text>
</xsl:param>

<xsl:param name="latex.preamble.late">

<xsl:text>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&#xa;</xsl:text>
<xsl:text>% Modified from Mitch Keller's chapter handling &#xa;</xsl:text>
<xsl:text>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% &#xa;</xsl:text>
<xsl:text>\definecolor{ActiveBlue}{cmyk}{1, 0.5, 0, 0.35}&#xa;</xsl:text>
<xsl:text>\colorlet{chaptercolor}{ActiveBlue}&#xa;</xsl:text>
<xsl:text>\setkomafont{chapter}{\normalfont\color{chaptercolor}\Huge\itshape}&#xa;</xsl:text>
<xsl:text>\setkomafont{chapterprefix}{\normalfont\Large}&#xa;</xsl:text>
<xsl:text>\renewcommand*{\raggedchapter}{\raggedleft}&#xa;</xsl:text>
<xsl:text>\renewcommand*{\chapterformat}{\MakeUppercase{\chapappifchapterprefix{}}&#xa;</xsl:text>
<xsl:text>\rlap{\enskip\resizebox{!}{1.2cm}{\thechapter} \rule{15cm}{1.2cm} }}&#xa;</xsl:text>
<xsl:text>\RedeclareSectionCommand[beforeskip=30pt,afterskip=20pt]{chapter}&#xa;</xsl:text>
<xsl:text>\renewcommand*\chapterheadmidvskip{\par\nobreak\vspace{10pt}}&#xa;</xsl:text>
<xsl:text>\setkomafont{captionlabel}{}&#xa;</xsl:text>
<xsl:text>\setkomafont{caption}{}&#xa;</xsl:text>
<xsl:text>\setcapindent{0em}&#xa;</xsl:text>
<xsl:text>\addtokomafont{disposition}{\rmfamily\bfseries}&#xa;</xsl:text>
<xsl:text>\addtokomafont{descriptionlabel}{\rmfamily\bfseries}&#xa;</xsl:text>
<xsl:text>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% &#xa;</xsl:text>
<xsl:text>% CC icon at bottom of each page &#xa;</xsl:text>
<xsl:text>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% &#xa;</xsl:text>
<xsl:text>\usepackage[automark,headsepline]{scrpage2}&#xa;</xsl:text>
<xsl:text>\deftripstyle{ccfooter}&#xa;</xsl:text>
<xsl:text>  {}&#xa;</xsl:text>
<xsl:text>  {}&#xa;</xsl:text>
<xsl:text>  {}&#xa;</xsl:text>
<xsl:text>  {}&#xa;</xsl:text>
<xsl:text>  {}&#xa;</xsl:text>
<xsl:text>  {\includegraphics[height=1pc]{images/CClicense.pdf}}&#xa;</xsl:text>
<xsl:text>\renewcommand{\chapterpagestyle}{ccfooter}&#xa;</xsl:text>
<xsl:text>&#xa;</xsl:text>
<xsl:text>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% &#xa;</xsl:text>
<xsl:text>% Start sections on new page, just not the first one &#xa;</xsl:text>
<xsl:text>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% &#xa;</xsl:text>
<xsl:text>\let\oldsection\section &#xa;</xsl:text>
<xsl:text>\renewcommand\section{\znewpage\oldsection}&#xa;</xsl:text>
<xsl:text>&#xa;</xsl:text>
<xsl:text>\let\oldchapter\chapter &#xa;</xsl:text>
<xsl:text>\renewcommand\chapter{\clearpage\gdef\znewpage{\global\let\znewpage\clearpage}\oldchapter}&#xa;</xsl:text>
<xsl:text>&#xa;</xsl:text>
<xsl:text>\global\let\znewpage\clearpage &#xa;</xsl:text>
<xsl:text>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% &#xa;</xsl:text>
<xsl:text>% Basic paragraph parameters &#xa;</xsl:text>
<xsl:text>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% &#xa;</xsl:text>
<xsl:text>\setlength{\parindent}{0mm}&#xa;</xsl:text>
<xsl:text>\setlength{\parskip}{0.5pc}&#xa;</xsl:text>
<xsl:text>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% &#xa;</xsl:text>
<xsl:text>% Greg's L &#xa;</xsl:text>
<xsl:text>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% &#xa;</xsl:text>
<xsl:text>%% Package for breakable highlight boxes &#xa;</xsl:text>
<xsl:text>\usepackage[framemethod=tikz]{mdframed}&#xa;</xsl:text>
<xsl:text>\newtheorem{mdactivity}[cpjt]{Activity}&#xa;</xsl:text>
<xsl:text>\newtheorem{mdexploration}[cpjt]{Preview Activity}&#xa;</xsl:text>
<xsl:text>\renewenvironment{activity}[1][]% &#xa;</xsl:text>
<xsl:text>  {\begin{mdframed}[linecolor=ActiveBlue,topline=false, &#xa;</xsl:text>
<xsl:text>    rightline=false, &#xa;</xsl:text>
<xsl:text>    bottomline=false, &#xa;</xsl:text>
<xsl:text>    linewidth=3pt, &#xa;</xsl:text>
<xsl:text>    innerleftmargin=15pt, &#xa;</xsl:text>
<xsl:text>    innerrightmargin=0pt, &#xa;</xsl:text>
<xsl:text>    skipabove=\baselineskip, &#xa;</xsl:text>
<xsl:text>    skipabove=1.2\baselineskip,]\begin{mdactivity}[#1]}&#xa;</xsl:text>
<xsl:text>  {\end{mdactivity}\end{mdframed}}&#xa;</xsl:text>
<xsl:text>\renewenvironment{exploration}[1][]% &#xa;</xsl:text>
<xsl:text>  {\begin{mdframed}[linecolor=ActiveBlue,topline=false, &#xa;</xsl:text>
<xsl:text>    rightline=false, &#xa;</xsl:text>
<xsl:text>    bottomline=false, &#xa;</xsl:text>
<xsl:text>    linewidth=3pt, &#xa;</xsl:text>
<xsl:text>    innerleftmargin=15pt, &#xa;</xsl:text>
<xsl:text>    innerrightmargin=0pt, &#xa;</xsl:text>
<xsl:text>    skipabove=\baselineskip, &#xa;</xsl:text>
<xsl:text>    skipabove=1.2\baselineskip,]\begin{mdexploration}[#1]}&#xa;</xsl:text>
<xsl:text>  {\end{mdexploration}\end{mdframed}}&#xa;</xsl:text>
<xsl:text>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% &#xa;</xsl:text>
<xsl:text>% In print, trying to reduce color use &#xa;</xsl:text>
<xsl:text>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% &#xa;</xsl:text>
<xsl:text>\hypersetup{colorlinks=true,linkcolor=black,citecolor=black,filecolor=black,urlcolor=black}&#xa;</xsl:text>
</xsl:param>

<xsl:template match="exercise[webwork-reps]">
    <xsl:text>\marginnote{\tiny \includegraphics[width=0.25in]{images/webwork-logo.png}}</xsl:text>
    <xsl:apply-imports />
</xsl:template>

</xsl:stylesheet>
