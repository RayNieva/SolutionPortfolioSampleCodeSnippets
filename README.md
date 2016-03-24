;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

Background:

At Gatehouse Media NE we have 150 publications and their corresponding websites. Our business process produces millions of records/transactions on thousands of accounts in real-time for display, classified and web advertising 7 days per week. 

In my capacity as a programmer, developed a multitude of Crystal Reports based on user needs from a variety of data sources. Using ETL software like DTS (SQL Server) and XML/XSLT, I have the tools and expertise to deal with structured data (Excel and Access) as well as un-structured  data or documents like Word.

Since the scale of our data is quite large and our transactional databases store data at the atomic level on numerous relational tables, conventionally designed Crystal Reports can run very slow.  My solution was to develop massive sub-queries inside SQL Server stored procedures to reduce multiple joins. This cut query execution time in half.  To even further increase speed and efficiency, I also developed this idea into ¡°pre-caching¡± a large all-purpose reports table that is updated over night and then continuously updated every 10 minutes using SQL Agent automation. This further reduced a Crystal reports execution time that would measure one day¡¯s transactions across all business subsets from one hour to a few seconds! Conversely using an  XML rss feed this could be used to display data  in real-time or reports now can be quickly developed to forecast multiple days or weeks based on current ad orders in the pipeline. 

Another project was to automate the scheduling process for inserting drop-out advertising
(National advertisers like Kohl¡¯s, Macy prefer this advertising). Originally we linked tables into MS Access from SQL Server, which produced a printable schedule, but this was only useful for reporting to sales groups. The real need was for production who had to manually copy and reformat into Excel for the production floor. Using VBA in Access  I wrote a program that would automate and transfer database to Excel, after loading into Excel using VBA and cell formula transfer. The data was re-styled to that specific production groups format. This reduced time significantly (man-days to a few seconds¡­remember we have 150 pubs)

These solutions are quite complex and the means of documenting them was accomplished by using a framework called JOOMLA. This enabled me to build and develop an intranet website based on Apache, MySQL and PHP that was easy to administer. To further enhance IT project communication a MediaWiki plug-in was also installed.

Simultaneously with programming and DB admin responsibilities (monitoring mission critical systems) my function is to provide helpdesk support for our advertising and related production and financial systems via virtualization and our Wickett ticket system. This covers multiple sites from Danvers to the Cape and west to Auburn.
