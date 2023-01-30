# load libraries ----
library(DiagrammeR)
library(DiagrammeRsvg)
library(magrittr)
library(rsvg)
library(here)

# idea came from https://spin.atomicobject.com/2017/11/15/table-rel-diagrams-graphviz/
# We are using html tables within the node input calls to make table nodes

# one group aggregation ----
agg <- DiagrammeR::grViz("digraph {
graph [pad=0.8, nodesep=0.8, ranksep=0.8, color = 'white', fontname = 'avenir'];
node [shape=plain, fontname = 'avenir', fontsize = 9];
edge [color = Black, arrowhead = vee, penwidth = 1.2]
rankdir=LR; 

label = 'Aggregation illustration\n using sum function'

# input data
subgraph cluster1{
label = 'Input data'
input [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td>A</td>
            <td port='1'>1</td>
         </tr>
         <tr>
            <td>B</td>
            <td port='2'>2</td>
         </tr>
         <tr>
            <td>C</td>
            <td port='3'>3</td>
         </tr>
         <tr>
            <td>A</td>
            <td port='4'>4</td>
         </tr>
         <tr>
            <td>B</td>
            <td port='5'>5</td>
         </tr>
         <tr>
            <td>C</td>
            <td port='6'>6</td>
         </tr>
         </table>>];

}

# splits
subgraph cluster2{
label = 'Split data'
splita [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td port='1'>A</td>
            <td port='1'>1</td>
         </tr>
         <tr>
            <td port='2'>A</td>
            <td port='2'>4</td>
         </tr>
         </table>>];

splitb [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td port='1'>B</td>
            <td port='1'>2</td>
         </tr>
         <tr>
            <td port='2'>B</td>
            <td port='2'>5</td>
         </tr>
         </table>>];

splitc [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td port='1'>C</td>
            <td port='1'>3</td>
         </tr>
         <tr>
            <td port='2'>C</td>
            <td port='2'>6</td>
         </tr>
         </table>>];

}

# apply function 
subgraph cluster3{
label = 'Apply function\n (sum)'

suma [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td port='1'>A</td>
            <td port='1'>5</td>
         </tr>
         </table>>];

sumb [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td port='1'>B</td>
            <td port='1'>7</td>
         </tr>
         </table>>];

sumc [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td port='1'>C</td>
            <td port='1'>9</td>
         </tr>
         </table>>];

}

# combine 
subgraph cluster4{
label = 'Combine'
combine [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td port='1'>A</td>
            <td port='1'>5</td>
         </tr>
         <tr>
            <td port='2'>B</td>
            <td port='2'>7</td>
         </tr>
         <tr>
            <td port='3'>C</td>
            <td port='3'>9</td>
         </tr>
         </table>>];
}
# edges

input:1 -> splita:1 
input:4 -> splita:2 
splita -> suma -> combine:1

input:2 -> splitb:1
input:5 -> splitb:2 
splitb -> sumb -> combine:2

input:3 -> splitc:1 
input:6 -> splitc:2
splitc -> sumc -> combine:3
} ")

agg

# save one group aggregation ----

export_svg(agg) %>%
  charToRaw() %>%
  rsvg::rsvg_png(here("figures", "Aggregation.png"))

export_svg(agg) %>%
  charToRaw() %>%
  rsvg::rsvg_pdf(here("figures", "Aggregation.pdf"))

# aggregation with two groups ----
agg2 <- DiagrammeR::grViz("digraph {
graph [pad=0.8, nodesep=0.5, ranksep=0.8, color = 'white', fontname = 'avenir'];
node [shape=plain, fontname = 'avenir', fontsize = 9];
edge [color = Black, arrowhead = vee, penwidth = 1.2]
rankdir=LR; 

label = 'Two grouped\n  aggregation illustration\n using sum function'

# input data
subgraph cluster1{
label = 'Input data'
input [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Key2</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td>A</td>
            <td>X</td>
            <td port='1'>1</td>
         </tr>
         <tr>
            <td>B</td>
            <td>Y</td>
            <td port='2'>2</td>
         </tr>
         <tr>
            <td>C</td>
            <td>X</td>
            <td port='3'>3</td>
         </tr>
         <tr>
            <td>A</td>
            <td>Y</td>
            <td port='4'>4</td>
         </tr>
         <tr>
            <td>B</td>
            <td>X</td>
            <td port='5'>5</td>
         </tr>
         <tr>
            <td>C</td>
            <td>Y</td>
            <td port='6'>6</td>
         </tr>
         <tr>
            <td>A</td>
            <td>X</td>
            <td port='7'>7</td>
         </tr>
         <tr>
            <td>B</td>
            <td>Y</td>
            <td port='8'>8</td>
         </tr>
         <tr>
            <td>C</td>
            <td>X</td>
            <td port='9'>9</td>
         </tr>
         </table>>];

}

# splits
subgraph cluster2{
label = 'Split data'
splita [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Key2</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td port='1'>A</td>
            <td>X</td>
            <td port='1'>1</td>
         </tr>
         <tr>
            <td port='3'>A</td>
            <td>X</td>
            <td port='3'>7</td>
         </tr>
         </table>>];

splita2 [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Key2</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td port='2'>A</td>
            <td>Y</td>
            <td port='2'>4</td>
         </tr>
         </table>>];

splitb [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Key2</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td port='2'>B</td>
            <td>X</td>
            <td port='2'>5</td>
         </tr>
         </table>>];

splitb2 [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Key2</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td port='1'>B</td>
            <td>Y</td>
            <td port='1'>2</td>
         </tr>
         <tr>
            <td port='3'>B</td>
            <td>Y</td>
            <td port='3'>8</td>
         </tr>
         </table>>];

splitc [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Key2</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td port='1'>C</td>
            <td>X</td>
            <td port='1'>3</td>
         </tr>
         <tr>
            <td port='3'>C</td>
            <td>X</td>
            <td port='3'>9</td>
         </tr>
         </table>>];

splitc2 [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Key2</i></td>
            <td><i>Data</i></td>
         </tr>

         <tr>
            <td port='2'>C</td>
            <td>Y</td>
            <td port='2'>6</td>
         </tr>
         </table>>];

}

# apply function 
subgraph cluster3{
label = 'Apply function\n (sum)'

suma [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Key2</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td port='1'>A</td>
            <td port='1'>X</td>
            <td port='1'>8</td>
         </tr>
         </table>>];

suma2 [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Key2</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td port='1'>A</td>
            <td port='1'>Y</td>
            <td port='1'>4</td>
         </tr>
         </table>>];

sumb [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Key2</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td port='1'>B</td>
            <td port='1'>X</td>
            <td port='1'>5</td>
         </tr>
         </table>>];

sumb2 [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Key2</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td port='1'>B</td>
            <td port='1'>Y</td>
            <td port='1'>10</td>
         </tr>
         </table>>];

sumc [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Key2</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td port='1'>C</td>
            <td port='1'>X</td>
            <td port='1'>12</td>
         </tr>
         </table>>];

sumc2 [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Key2</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td port='1'>C</td>
            <td port='1'>Y</td>
            <td port='1'>6</td>
         </tr>
         </table>>];

}

# combine 
subgraph cluster4{
label = 'Combine'
combine [label=<
         <table border='0' cellborder='1' cellspacing='0'>
         <tr>
            <td><i>Key</i></td>
            <td><i>Key2</i></td>
            <td><i>Data</i></td>
         </tr>
         <tr>
            <td port='1'>A</td>
            <td port='1'>X</td>
            <td port='1'>8</td>
         </tr>
         <tr>
            <td port='2'>A</td>
            <td port='2'>Y</td>
            <td port='2'>4</td>
         </tr>
         <tr>
            <td port='3'>B</td>
            <td port='3'>X</td>
            <td port='3'>5</td>
         </tr>
         <tr>
            <td port='4'>B</td>
            <td port='4'>Y</td>
            <td port='4'>10</td>
         </tr>
         <tr>
            <td port='5'>C</td>
            <td port='5'>X</td>
            <td port='5'>12</td>
         </tr>
         <tr>
            <td port='6'>C</td>
            <td port='6'>Y</td>
            <td port='6'>6</td>
         </tr>
         </table>>];
}
# edges
edge [color = DarkGreen]
input:1 -> splita:1 
input:4 -> splita2:2 
input:7 -> splita:3 
splita -> suma -> combine:1 
splita2 -> suma2 -> combine:2

edge [color = Maroon]
input:2 -> splitb2:1 
input:5 -> splitb:2 
input:8 -> splitb2:3 
splitb -> sumb -> combine:3 
splitb2 -> sumb2 -> combine:4

edge [color = Navy]
input:3 -> splitc:1 
input:6 -> splitc2:2 
input:9 -> splitc:3 
splitc -> sumc -> combine:5 
splitc2 -> sumc2 -> combine:6
} ")

agg2

# save two group aggregation ----

export_svg(agg2) %>%
  charToRaw() %>%
  rsvg::rsvg_png(here("figures", "Aggregation_twogroup.png"))

export_svg(agg2) %>%
  charToRaw() %>%
  rsvg::rsvg_pdf(here("figures", "Aggregation_twogroup.pdf"))

# dplyr aggregation with same data
library(dplyr)

test <- data.frame(
  key = c("A", "B", "C", "A", "B", "C"),
  data = c(1,2,3,4,5,6)
)

test %>%
  group_by(key) %>%
  summarise(sum = sum(data)) 

test2 <- data.frame(
  key = c("A", "B", "C", "A", "B", "C","A", "B", "C"),
  key2 = c("X", "Y","X", "Y","X", "Y","X", "Y","X"),
  data = c(1,2,3,4,5,6,7,8,9)
)
test2
test2 %>%
  group_by(key, key2) %>%
  summarise(sum = sum(data)) 
