# librarys ----
library(DiagrammeR)
library(DiagrammeRsvg)
library(magrittr)
library(rsvg)
library(here)

# text flow diagrammer ----
textA <- DiagrammeR::grViz("digraph {
graph [layout = dot, rankdir = TD, nodesep = 0.5, ranksep = 0.5, fontsize = 35, fillcolor = 'Silver', color = 'Purple3', style = 'filled, rounded, bold', fontname = Avenir]

label = 'Where to start with text analysis';

# define the global styles of the nodes
node [shape = rectangle, style = 'filled, rounded, bold', fillcolor = Gainsboro, fontsize = 25, width = 5, height = 1.5, fixedsize = true, fontname = Avenir]

edge [color = Black, arrowhead = vee, fontsize = 25, fontname = Avenir, penwidth = 2]   
   
# nodes
quantQual [label = 'Are you doing quantitative\n or qualitative text analysis?']                

qual [label = 'Qualitative']
nvivo [label = 'Use NVivo or QDA Miner', fillcolor = Cornsilk]

quant [label = 'Quantitative']
coding [label = 'Do you know, or want to learn,\n how to code in R or Python?']
qda [label = 'Use QDA Miner and WordStat', fillcolor = Cornsilk]

python [label = 'Python']
nltk [label = 'Learn and use NLTK', fillcolor = Cornsilk]

R [label = 'R']
text [label = 'Learn and use\n Quanteda or Tidytext', fillcolor = Cornsilk]

tdm [label = 'Use ProQuest TDM Studio', fillcolor = Cornsilk]

# order
quantQual -> quant -> coding
quantQual -> qual -> nvivo

coding -> qda [label = 'No']
coding -> {python R} [label = 'Yes']
R -> text
python -> nltk
{R python} -> tdm
}")

textA

# save output pdf and png
export_svg(textA) %>%
  charToRaw() %>%
  rsvg::rsvg_png(here("figures", "text_analysis.png"))

export_svg(textA) %>%
  charToRaw() %>%
  rsvg::rsvg_pdf(here("figures", "text_analysis.pdf"))
