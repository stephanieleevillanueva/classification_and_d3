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
  <dd>contains <b>.sql</b> scripts to generate final datasets used in classification models.</dd>
  * sql_tables.sql   
      creates table schemas
  * final_tables.sql  
      selects only columns needed from ``sql_tables.sql`` and creates new filtered ``.sql`` tables
  * script_raw.sql  
      joins tables from ``final_tables.sql`` and generates a single ``.sql`` table with data in its original form to be used for analysis.
  * script_converted.sql  
      takes ``script_raw.sql`` generated table and converts selected columns into binary form.
      
<dl>
  <dt>data</dt>
  <dd>contains <b>.dat</b> files relating to hypertension, pulled from www.cdc.gov website for year 2011-2012. This dataset is used in classifying people at risk for hypertension.</dd>

<dl>
  <dt>py_and_ipynb_files</dt>
  <dd>contains <b>.py</b> helper files for database connection using python and <b>.ipynb</b> notebooks for classification modeling and results analysis</dd>
