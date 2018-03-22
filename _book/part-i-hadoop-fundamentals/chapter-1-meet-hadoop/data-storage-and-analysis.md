# Data Storage and Analysis

The problem is simple: although the storage capacities of hard drives have increased massively over the years, access speeds—the rate at which data can be read from drives— have not kept up读数据的速度提升没有跟上硬盘存储能力的增长. One typical drive from 1990 could store 1,370 MB of data and had a transfer speed of 4.4 MB/s,[^1] so you could read all the data from a full drive in around five minutes. Over 20 years later, 1-terabyte drives are the norm基准, but the transfer speed is around 100 MB/s, so it takes more than two and a half hours to read all the data off the disk. 

This is a long time to read all data on a single drive—and writing is even slower. The obvious way to reduce the time is to read from multiple disks at once. Imagine if we had 100 drives, each holding one hundredth百分之一 of the data. Working in parallel平行的, we could read the data in under two minutes. 

Using only one hundredth of a disk may seem wasteful. But we can store 100 datasets数据集, each of which is 1 terabyte, and provide shared access to them. We can imagine that the users of such a system would be happy to share access in return for shorter analysis times, and statistically从统计角度, that their analysis jobs would be likely to be spread展开 over time, so they wouldn’t interfere干扰 with each other too much. 

There’s more to being able to read and write data in parallel to or from multiple disks, though. 

The first problem to solve is hardware failure: as soon as you start using many pieces of hardware, the chance that one will fail is fairly high. A common way of avoiding data loss is through replication重复，自我复制: redundant冗余的 copies of the data are kept by the system so that in the event of failure, there is another copy available. This is how RAID works, for instance, although Hadoop’s filesystem, the Hadoop Distributed Filesystem (HDFS), takes a slightly略微的 different approach, as you shall see later.

The second problem is that most analysis tasks need to be able to combine合并 the data in some way, and data read from one disk may need to be combined with data from any of the other 99 disks. Various distributed分布 systems allow data to be combined from multiple sources, but doing this correctly is notoriously众所周知地 challenging. MapReduce provides a programming model that abstracts抽象 the problem from disk reads and writes, transforming转化 it into a computation计算 over sets of keys and values. We look at the details of this model in later chapters, but the important point for the present discussion is that there are two parts to the computation—the map and the reduce—and it’s the interface between the two where the “mixing” occurs. Like HDFS, MapReduce has built-in reliability可靠性. 

In a nutshell简而言之, this is what Hadoop provides: a reliable可靠的, scalable可扩展的 platform for storage and analysis. What’s more, because it runs on commodity hardware不贵的硬件 and is open source, Hadoop is affordable.

[^1]: These specifications are for the Seagate ST-41600n.
