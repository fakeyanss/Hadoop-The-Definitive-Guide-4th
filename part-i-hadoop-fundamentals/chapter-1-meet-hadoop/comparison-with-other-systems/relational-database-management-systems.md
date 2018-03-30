# Relational Database Management Systems

Why can’t we use databases with lots of disks to do large-scale analysis? Why is Hadoop needed?

The answer to these questions comes from another trend in disk drives: seek timeq寻道时间 is improving more slowly than transfer rate. Seeking is the process of moving the disk’s head to a particular place on the disk to read or write data. It characterizes描述 the latency延迟 of a disk operation, whereas反之 the transfer rate corresponds符合 to a disk’s bandwidth带宽.

If the data access pattern is dominated控制 by seeks, it will take longer to read or write large portions部分 of the dataset than streaming through it, which operates at the transfer rate. On the other hand, for updating a small proportion of records in a database, a traditional B-Tree \(the data structure used in relational databases, which is limited by the rate at which it can perform执行 seeks\) works well. For updating the majority of a database, a B-Tree is less efficient than MapReduce, which uses Sort/Merge to rebuild the database.

In many ways, MapReduce can be seen as a complement补足 to a Relational Database Management System \(RDBMS\). \(The differences between the two systems are shown in Table 1-1.\) MapReduce is a good fit for problems that need to analyze the whole dataset in a batch fashion, particularly for ad hoc analysis. An RDBMS is good for point queries or updates, where the dataset has been indexed to deliver实现 low-latency retrieval检索 and update times of a relatively small amount of data. MapReduce suits applications where the data is written once and read many times, whereas反之 a relational database is good for datasets that are continually updated.[^1]

Table 1-1. RDBMS compared to MapReduce  
![rdms1](http://ouat6a0as.bkt.clouddn.com/rdms1.png)  
![rdms-2](http://ouat6a0as.bkt.clouddn.com/rdms-2.png)

However, the differences between relational databases and Hadoop systems are blurring. Relational databases have started incorporating合并 some of the ideas from Hadoop, and from the other direction, Hadoop systems such as Hive are becoming more interactive \(by moving away from MapReduce\) and adding features like indexes and transactions that make them look more and more like traditional RDBMSs.

Another difference between Hadoop and an RDBMS is the amount of structure in the datasets on which they operate. Structured data is organized into entities that have a defined format, such as XML documents or database tables that conform to a particular predefined schema模式. This is the realm领域 of the RDBMS. Semi-structured半结构化 data, on the other hand, is looser宽松的, and though there may be a schema, it is often ignored, so it may be used only as a guide to the structure of the data: for example, a spreadsheet电子数据表, in which the structure is the grid of cells单元格, although the cells themselves may hold any form形式 of data. Unstructured data does not have any particular internal内部 structure: for example, plain无格式 text or image data. Hadoop works well on unstructured or semi-structured data because it is designed to interpret解释 the data at processing time \(so called schema-on-read\). This provides flexibility灵活性 and avoids the costly data loading phase of an RDBMS, since in Hadoop it is just a file copy.

Relational data is often normalized to retain保持 its integrity完整 and remove redundancy冗余. Normalization poses problems for Hadoop processing because it makes reading a record a nonlocal operation, and one of the central assumptions that Hadoop makes is that it is possible to perform \(high-speed\) streaming reads and writes.

A web server log is a good example of a set of records that is not normalized \(for example, the client hostnames are specified in full each time, even though the same client may appear many times\), and this is one reason that logfiles of all kinds are particularly well suited to analysis with Hadoop. Note that Hadoop can perform joins; it’s just that they are not used as much as in the relational world.

MapReduce—and the other processing models in Hadoop—scales linearly with the size of the data. Data is partitioned, and the functional primitives \(like map and reduce\) can work in parallel on separate partitions. This means that if you double the size of the input data, a job will run twice as slowly. But if you also double the size of the cluster, a job will run as fast as the original one. This is not generally true of SQL queries.

[^1]: In January 2007, David J. DeWitt and Michael Stonebraker caused a stir by publishing “**MapReduce: A major step backwards**,” in which they criticized MapReduce for being a poor substitute for relational databases. Many commentators argued that it was a false comparison \(see, for example, Mark C. Chu-Carroll’s “**Databases are hammers; MapReduce is a screwdriver**”\), and DeWitt and Stonebraker followed up with “MapReduce II,” where they addressed the main topics brought up by others.

