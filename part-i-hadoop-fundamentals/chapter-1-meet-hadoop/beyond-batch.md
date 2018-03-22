# lBeyond Batch

For all its strengths, MapReduce is fundamentally根本上 a batch processing批处理 system, and is not suitable for interactive analysis. You can’t run a query and get results back in a few seconds or less. Queries typically take minutes or more, so it’s best for offline use, where there isn’t a human sitting in the processing loop waiting for results.

However, since its original incarnation化身, Hadoop has evolved进化 beyond batch processing. Indeed确实, the term “Hadoop” is sometimes used to refer to a larger ecosystem生态系统 of projects, not just HDFS and MapReduce, that fall under the umbrella of infrastructure基础设施 for distributed computing and large-scale data processing. Many of these are hosted by the **Apache Software Foundation**, which provides support for a community of open source software projects, including the original HTTP Server from which it gets its name.

The first component to provide online access was HBase, a key-value store that uses HDFS for its underlying根本的 storage. HBase provides both online read/write access of individual个体的 rows and batch operations for reading and writing data in bulk大块, making it a good solution for building applications on.

The real enabler促成者 for new processing models in Hadoop was the introduction of YARN \(which stands for Yet Another另一种 Resource Negotiator交涉者\) in Hadoop 2. YARN is a cluster resource management system, which allows any distributed program \(not just MapReduce\) to run on data in a Hadoop cluster.

In the last few years, there has been a flowering of different processing patterns模式 that work with Hadoop. Here is a sample:

* Interactive SQL

  * By dispensing调剂 with MapReduce and using a distributed query engine that uses dedicated专用的 “always on” daemons守护进程 \(like Impala\) or container容器 reuse \(like Hive on Tez\), it’s possible to achieve low-latency低延迟 responses for SQL queries on Hadoop while still scaling up to large dataset sizes. 

* Iterative迭代 processing

  * Many algorithms—such as those in machine learning—are iterative in nature, so it’s much more efficient效率 to hold each intermediate中间的 working set in memory, compared to loading from disk on each iteration. The architecture of MapReduce does not allow this, but it’s straightforward简单的 with Spark, for example, and it enables a highly exploratory style of working with datasets. 

* Stream processing

  * Streaming systems like Storm, Spark Streaming, or Samza make it possible to run real-time, distributed computations on unbounded streams of data and emit results to Hadoop storage or external systems. 

* Search

  * The Solr search platform can run on a Hadoop cluster, indexing documents as they are added to HDFS, and serving search queries from indexes stored in HDFS. 

Despite the emergence of different processing frameworks on Hadoop, MapReduce still has a place for batch processing, and it is useful to understand how it works since it introduces several concepts that apply more generally \(like the idea of input formats, or how a dataset is split into pieces\).

