# load libraries ----
library(DiagrammeR)
library(DiagrammeRsvg)
library(magrittr)
library(rsvg)
library(here)

# File systems ----

fileSys <- DiagrammeR::grViz("digraph {
                  
graph [layout = dot, rankdir = LR, nodesep = 0.5, ranksep = 0.75, fontsize = 35, fillcolor = 'Gainsboro', color = 'Purple3', style = 'filled, rounded, bold']

label = 'An example file system for analysis';

# define the global styles of the nodes
node[shape = rectangle, style = 'filled, rounded, bold', fillcolor = mistyrose, fontsize = 25, width = 4.5, height = 1.5, fixedsize = true]

edge [color = Black, arrowhead = vee, fontsize = 16, penwidth = 4]   
     
subgraph cluster1{
label = 'Overview'        
# nodes
topLayer [label = 'Name of your project\nFor example:\nmy_PHD or Company_project', fillcolor = honeydew]
secondLayer [label = 'Name of your analysis\n', fillcolor = aliceblue]
thirdLayer [label = 'Analysis specific files']
fourthLayer [label = 'Subfolders', fillcolor = cornsilk]

# order
topLayer -> secondLayer -> thirdLayer -> fourthLayer
}

subgraph cluster0{
label = 'Example' 
color = 'Orange'
# nodes
project [label = 'Company_project', fillcolor = honeydew]
node [fillcolor = aliceblue]
AnalysisA [label = 'Analysis_A']
AnalysisB [label = 'Analysis_B']

node [fillcolor = mistyrose]
rawDataA [label = 'RawData']
rawDataB [label = 'RawData']
processedDataA [label = 'ProcessedData']
processedDataB [label = 'ProcessedData']
codeA [label = 'Code']
codeB [label = 'Code']
outputsA [label = 'Outputs']
outputsB [label = 'Outputs']

node [fillcolor = cornsilk]
tablesA [label = 'Tables']
figuresA [label = 'Figures']
tablesB [label = 'Tables']
figuresB [label = 'Figures']

# order
project -> {AnalysisA AnalysisB}
AnalysisA -> {rawDataA processedDataA codeA outputsA}
AnalysisB -> {rawDataB processedDataB codeB outputsB}
outputsA -> {tablesA figuresA}
outputsB -> {tablesB figuresB}
}

}")
fileSys

# save ----
export_svg(fileSys) %>% 
  charToRaw() %>%
  rsvg::rsvg_png(here("figures", "fileSys.png"))
