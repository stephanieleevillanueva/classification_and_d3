# classification_and_d3
Predicting hypertension using classification algorithms and basic visualization of results using d3

####Folder structure:
<dl>
  <dt>d3</dt>
  <dd>contains <b>.html</b> files and <b>.csv</b> data files used to create the d3 bar graphs.</dd>
  * accuracy.html  
      html file with css and javascript. Uses ``d3.js`` (with tooltip) library to generate the graph.
  * tvseriesfinale.py  
      uses BeautifulSoup module to scrape data from www.tvseriesfinale.py and generates variable ``canceled_shows`` for concluded TV shows from 2011-2015 and ``title`` for concluded TV show titles (subset of ``canceled_shows``)
  * wikipedia-state.py  
      generates variable ``show_state`` for shows and their settings (US state) as of July 2015  
  * generate_tv_csv_dataset.py  
      generates ``data/tv.csv`` dataset used in analysis  
  * generate_tv_training_df.py  
      converts ``data/tv.csv`` dataset into pandas dataframe ``tv_df``

<dl>
  <dt>data</dt>
  <dd>contains csv files used in running <b>.ipynb</b> notebooks.</dd> 
  * tv_20150718_dataset.csv  
      backup copy of dataset used in analysis (can be used for analysis when webscraping fails)


