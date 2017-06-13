

### Background:

At _Gatehouse Media NE_ there are 150 publications and their corresponding websites. The business process produces millions of records/transactions on thousands of accounts in real-time for display, classified and web advertising 7 days per week. 

In my capacity as a programmer, developed a multitude of _Crystal Reports_ based on user needs from a variety of data sources. Using ETL software like _DTS (SQL Server) and XML/XSLT_, utilized tools to deal with structured data (Excel and Access) as well as un-structured  data or documents like Word.

Since the scale of data was quite large and transactional databases store data at the atomic level (for normalization purposes) on numerous relational tables, conventionally designed _Crystal Reports_ can run very slow.  My solution was to develop [massive sub-queries](https://github.com/RayNieva/SolutionPortfolioSampleCodeSnippets/blob/master/CreatTestDailyTable.sql) inside _SQL Server_ [stored procedures](https://github.com/RayNieva/SolutionPortfolioSampleCodeSnippets/blob/master/MultiProceTempTables.sql) to reduce multiple joins. This cut query execution time in half.  To even further increase speed and efficiency, I also developed this idea into ¡°pre-caching¡± a large all-purpose reports table that is updated over night and then continuously updated every 10 minutes using _SQL Agent automation_. This further reduced a _Crystal reports_ execution time that would measure one day¡¯s transactions across all business subsets from one hour to a few seconds! Conversely using an  _XML rss feed_ this could be used to display data  in real-time or reports now can be quickly developed to forecast multiple days or weeks based on current ad orders in the pipeline. 

Another project was to automate the scheduling process for inserting drop-out advertising
(National advertisers like _Kohl¡¯s, Macy_ prefer this advertising). Originally we linked tables into MS Access from SQL Server, which produced a printable schedule, but this was only useful for reporting to sales groups. The real need was for production who had to manually copy and reformat into Excel for the production floor. Using VBA in Access  I wrote a program that would automate and transfer database to Excel, after loading into Excel using VBA and cell formula transfer. The data was re-styled to that specific production groups format. This reduced time significantly (man-days to a few seconds¡­remember there are 150 pubs).

Note there is also a notable _code re-factoring_ to the above example where during the original development process I brute force developed the Insert Tracking code in _VBA_ by direct manipulation of the Excel Spreadsheet (over 500 lines of code). This was reduced to less than 20 lines of code by taking advantage of built-in software within _MS Access VBA_ and the _declarative nature of SQL_ that is built into MS Access. (Compare [InsertTrackingConvert2ExceFromAcessOld.vb](https://github.com/RayNieva/SolutionPortfolioSampleCodeSnippets/blob/master/InsertTrackingConvert2ExcelFromAccessOld.vb) to [InsertTrackingConverttoExcelFromAccess.vb](https://github.com/RayNieva/SolutionPortfolioSampleCodeSnippets/blob/master/InsertTrackingConvert2ExcelFromAccess.vb)) Somewhat shorter!


These solutions are quite complex and the means of documenting them was accomplished by using a framework called [_JOOMLA_](http://rgnterprises.net/joomla/). This enabled building and developing an intranet website based on _Apache, MySQL and PHP_(Lamp stack) Linux server (on-premises) that was easy to administer. To further enhance IT project communication a MediaWiki plug-in was also installed.

Simultaneously with _programming and DB admin_ responsibilities (monitoring mission critical systems) my function is to provide _helpdesk support_ for advertising and related production and financial systems via _virtualization_ and the Wickett ticket system (an on-premise SQL Server based system). This covers multiple sites from _Danvers to the Cape and west to Auburn_.
