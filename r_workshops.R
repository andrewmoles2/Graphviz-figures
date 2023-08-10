library(DiagrammeR)
library(DiagrammeRsvg)
library(magrittr)
library(rsvg)

# make a few diagrams for different routes
# 1) full series: fundamentals -> wrangling+viz -> intermediate
# 2) programming: fundamentals -> intermediate -> option(node with data wrangling + viz)
# 3) Data and analysis: fundamentals -> wrangling+viz

# full series ----
full_R_series <- DiagrammeR::grViz("digraph {
graph [layout = dot, rankdir = TB, nodesep = 0.2, ranksep = 0.45, fontsize = 30, fillcolor = 'Gray95', color = 'Purple3', style = 'filled, rounded, bold', fontname = Avenir]

label = 'Outline of Full R Workshop Series\nEncompassing 15 1-hour worksheets';

# define the global styles of the nodes
node[shape = rectangle, style = 'filled, rounded, bold', fillcolor = mistyrose, fontsize = 25, width = 4.2, height = 1.5, fixedsize = true, fontname = Avenir]

edge [color = Black, arrowhead = vee, fontsize = 16]

newrank=true;

# nodes
rf1 [label='1: Numerical Variables']
rf2 [label='2: Vectors, Functions,\nIndexing']
rf3 [label='3: Strings, Factors,\nType Conversion']
rf4 [label='4: Data Frames']
rf5 [label='5: Loading Data and\nPackages']
rf6 [label='6: Conditional Logic']
rf7 [label='7: Lists and Matrices']

ri1 [label='1: For Loops',fillcolor = LightCyan]
ri2 [label='2: Functional\nProgramming',fillcolor = LightCyan]
ri3 [label='3: Building Functions',fillcolor = LightCyan]

rdw1 [label='1: Selecting Columns,\nFiltering data',fillcolor = AliceBlue]
rdw2 [label='2: Creating, Modifying,\nand Deleting\nColumns',fillcolor = AliceBlue]
rdw3 [label='3: Joining and\nAggregation',fillcolor = AliceBlue]

rdv1 [label='1: Scatter and\nBar Plots',fillcolor = honeyDew]
rdv2 [label='2: Box, Histogram,\nand Line Plots',fillcolor = honeyDew]

# subgraphs

subgraph cluster0{
label = 'R Fundamentals\nSeries';
color = DarkOliveGreen;

rf1->rf2->rf3->rf4->rf5->rf6->rf7
}

subgraph cluster1{
label='R Data Wrangling\nSeries';
color = Orange;
rdw1 -> rdw2 -> rdw3
}

subgraph cluster2{
label='R Data Visualisation\nSeries';
color = Blue;

rdv1 -> rdv2
}

subgraph cluster3{
label='R Intermediate\nSeries';
color = Red;

ri1->ri2->ri3
}

# connections between series
rf7 -> rdw1 [penwidth = 1]
rdw3 -> rdv1 [penwidth = 1]
rdv2 -> ri1 [penwidth = 1]

# ranking for alignment
{rank = same;rf1;rdw1;rdv1;ri1}

}")
full_R_series


# programming series ----

programming_R_series <- DiagrammeR::grViz("digraph {
graph [layout = dot, rankdir = TB, nodesep = 0.5, ranksep = 0.5, fontsize = 30, fillcolor = 'Gray95', color = 'Purple3', style = 'filled, rounded, bold', fontname = Avenir]

label = 'Outline of R Workshops for Programming Knowledge\nEncompassing 10 1-hour Worksheets';

# define the global styles of the nodes
node[shape = rectangle, style = 'filled, rounded, bold', fillcolor = mistyrose, fontsize = 25, width = 4.2, height = 1.5, fixedsize = true, fontname = Avenir]

edge [color = Black, arrowhead = vee, fontsize = 16]

newrank=true;

# nodes
rf1 [label='1: Numerical Variables']
rf2 [label='2: Vectors, Functions,\nIndexing']
rf3 [label='3: Strings, Factors,\nType Conversion']
rf4 [label='4: Data Frames']
rf5 [label='5: Loading Data and\nPackages']
rf6 [label='6: Conditional Logic']
rf7 [label='7: Lists and Matrices']

ri1 [label='1: For Loops',fillcolor = LightCyan]
ri2 [label='2: Functional\nProgramming',fillcolor = LightCyan]
ri3 [label='3: Building Functions',fillcolor = LightCyan]

rdwv [label = 'Optional: Data Wrangling\nand Visualisation\nSeries',fillcolor = Linen]

# subgraphs

subgraph cluster0{
label = 'R Fundamentals\nSeries'
color = DarkOliveGreen

rf1->rf2->rf3->rf4->rf5->rf6->rf7
}

subgraph cluster1{
label='R Intermediate\nSeries'
color = Red;
ri1->ri2->ri3
}

# connections between series
rf7 -> ri1 [penwidth = 3]
ri3 -> rdwv [penwidth = 2]

# ranking for alignment
{rank=same;rf1;ri1;}

}")
programming_R_series

# Data and Viz ----
data_R_series <- DiagrammeR::grViz("digraph {
graph [layout = dot, rankdir = TB, nodesep = 0.3, ranksep = 0.5, fontsize = 30, fillcolor = 'Gray95', color = 'Purple3', style = 'filled, rounded, bold', fontname = Avenir]

label = 'Outline of Data, Analysis, and Visual R Workshops\nEncompassing 12 1-hour Worksheets';

# define the global styles of the nodes
node[shape = rectangle, style = 'filled, rounded, bold', fillcolor = mistyrose, fontsize = 25, width = 4.2, height = 1.5, fixedsize = true, fontname = Avenir]

edge [color = Black, arrowhead = vee, fontsize = 16]

newrank=true;

# nodes
rf1 [label='1: Numerical Variables']
rf2 [label='2: Vectors, Functions,\nIndexing']
rf3 [label='3: Strings, Factors,\nType Conversion']
rf4 [label='4: Data Frames']
rf5 [label='5: Loading Data and\nPackages']
rf6 [label='6: Conditional Logic']
rf7 [label='7: Lists and Matrices']

ri [label='Intermediate Series:\nProgramming with R',fillcolor = Linen]

rdw1 [label='1: Selecting Columns,\nFiltering data',fillcolor = AliceBlue]
rdw2 [label='2: Creating, Modifying,\nand Deleting\nColumns',fillcolor = AliceBlue]
rdw3 [label='3: Joining and\nAggregation',fillcolor = AliceBlue]

rdv1 [label='1: Scatter and\nBar Plots',fillcolor = honeyDew]
rdv2 [label='2: Box, Histogram,\nand Line Plots',fillcolor = honeyDew]

# subgraphs

subgraph cluster0{
label = 'R Fundamentals\nSeries'
color = DarkOliveGreen

rf1->rf2->rf3->rf4->rf5->rf6->rf7
}

subgraph cluster1{
label='R Data Wrangling\nSeries'
color = Orange

rdw1 -> rdw2 -> rdw3
}

subgraph cluster2{
label='R Data Visualisation\nSeries'
rdv1 -> rdv2
}

# connections between series
rf7 -> rdw1 [penwidth = 2]
rdw3 -> rdv1 [penwidth = 2]
rdv2 -> ri [penwidth = 2]

# ranking for alignment
{rank = same; rf1;rdw1;rdv1;}

}")
data_R_series
