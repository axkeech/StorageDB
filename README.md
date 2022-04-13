# StorageDB

This was a group project I undertook during ACO 320. We modeled the database after a typical storage facility.
I wrote most of the SQL code for the database itself. The tables consist of Facility, storageUnit, tenant, account, and Manager.
The Relationships are ownedBy, rentedBy, owns, manages, and employs. ownedBy and rentedBy are the main relationships that the tenant interacts with, which is the main focus of the database. It is meant to be a database that an employee or manager might use to carry out the operations of their job, although not all are implemeneted. With the queries that were written, one could view which tenant rents a specific storage unit, they could view all of the storage units that a particular tenant rents, and they could view the account balance for rent that a tenant has due.
