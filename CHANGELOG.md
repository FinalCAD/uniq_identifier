### VERSION 0.0.7

* Enhancements
  * Add validation model of presence and uniqueness
  * Update Ruby from 2.1.2 to 2.3.1
  * Use last version of the gem Ammeter => 1.1.4
  * Re-add generator specs
  * Add bin/console

### VERSION 0.0.6

* Enhancements
  * Lazy assignation of UUID
  * UUID always available, not only after validation

### VERSION 0.0.5

* Enhancements
  * decrease time of migration for big table
  * change after initialize to before validation for avoid loading this hook each time we have an instance (iteration case)

### VERSION 0.0.4

* Enhancements
  * don't override settled uuid and make sure model have uuid field
  * for avoid manual attempts to set uuid at nil

### VERSION 0.0.3

* Bug Fix
  * Change bad naming of migration files

### VERSION 0.0.2

* Enhancements
  * Little enhancement

### VERSION 0.0.1

* Skeleton and first parsing
