# classification_and_d3
Predicting hypertension using classification algorithms and basic visualization of results using d3

####Folder structure:
<dl>
  <dt>d3</dt>
  <dd>contains <b>.html</b> files and <b>.csv</b> data files used to create the d3 bar graphs.</dd>
  * accuracy.html  
      html file with css and javascript. Uses ``d3.js`` (with tooltip) library to generate the graph
  * pivot_accuracy.csv  
      dataset used by accuracy.html
  * recall.html  
      html file with css and javascript. Uses ``d3.js`` (with tooltip) library to generate the graph  
  * pivot_recall.csv  
      dataset used by recall.html  
  * feature_importance.html  
      html file with css and javascript. Uses ``d3.js`` library and also uses transition to generate the graph

<dl>
  <dt>sql</dt>
  <dd>contains <b>.sql</b> scripts to generate final datasets used in classification models.rom www.cdc.gov website for year 201</dd>
  * sql_tables.sql   
      creates table schemas
  * final_tables.sql  
      selects only columns needed from ``sql_tables.sql`` and creates new filtered ``.sql`` tables

<dl>
  <dt>data</dt>
  <dd>contains <b>.dat</b> files relating to hypertension, pulled from www.cdc.gov website for year 2011-2012. This dataset is used in classifying people at risk for hypertension.</dd>





