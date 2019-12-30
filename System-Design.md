# System Design

A strong process is crucial to successfully solving system design questions. We broke it down into four steps:

- Scope the problem: Don't make assumptions; Ask questions; Understand the constraints and use cases.
- Sketch up an abstract design that illustrates the basic components of the system and the relationships between them.
- Think about the bottlenecks these components face when the system scales.
- Address these bottlenecks by using the fundamentals principles of scalable system design.

## Scalability
- the first golden rule for scalability: every server contains exactly the same codebase and does not store any user-related data, like sessions or profile pictures, on local disc or memory. 
- Sessions need to be stored in a centralized data store which is accessible to all your application servers. It can be an external database or an external persistent cache, like Redis. An external persistent cache will have better performance than an external database. By external I mean that the data store does not reside on the application servers. Instead, it is somewhere in or near the data center of your application servers. 

A load balancer performs the following functions:

- Distributes client requests or network load efficiently across multiple servers
- Ensures high availability and reliability by sending requests only to servers that are online
- Provides the flexibility to add or subtract servers as demand dictates

## Vertical scaling
- Improve one single machine to most advanced hardwares
- CPU
- DISK
- RAM
## Horizontal scaling
- More machines with less powerful hardwares
- Clients communicates with servers through load balancers, and load balancers have public IPs, while servers don't.
- Round robin
- RAID: Redundant Array of Independent Disks
	- RAID0, consists of striping, but no mirroring or parity.
		- write files for disks one by one, improve performance
	- RAID1, consists of data mirroring, without parity or striping. Data is written identically to two drives, thereby producing a "mirrored set" of drives. Reliable if one of the drives dies, you can just replace that one.
	- RAID10, combines RAID1 and RAID0, has 4 drives, has both striping and mirroring.
	- RAID 5, consists of block-level striping with distributed parity. Parity information is distributed among the drives, requiring all drives but one to be present to operate. Upon failure of a single drive, subsequent reads can be calculated from the distributed parity such that no data is lost. RAID 5 requires at least three disks.
	- RAID 6 consists of block-level striping with double distributed parity. Double parity provides fault tolerance up to two failed drives. 
## Caching
- html
	- craglist: file-based cache
		- space limited
		- hard to change
		- it makes cloning and auto-scaling of your servers just a pain.
- MySQL Query Cache
	- save result to queries
- memcached
	- key value cache
- Database caching
	- Cached database queries
	- Cached objects
## Load balancing
## Database replication
- Master-Slave
- Master-Master
## Database partitioning

## Database sharding [source](http://highscalability.com/blog/2009/8/6/an-unorthodox-approach-to-database-design-the-coming-of-the.html)
- How Is Sharding Different Than Traditional Architectures?
Sharding is different than traditional database architecture in several important ways:
	- Data are denormalized. 
	- Data are parallelized across many physical instances. 
	- Data are kept small. Smaller sets of data are also easier to backup, restore, and manage.
	- Data are more highly available. 
	- It doesn't use replication. 
	
