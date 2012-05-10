dataSource {
    pooled = true
    dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
    driverClassName = "com.mysql.jdbc.Driver"
    username = "root"
    password = "admin"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
//    dialect = "org.hibernate.dialect.MySQL5Dialect"
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create"
            url = "jdbc:mysql://localhost/kinder"
        }
    }
    test {
        dataSource {
            url = "jdbc:h2:mem:pruebasDB;MVCC=TRUE"
        }
    }
    production {
        dataSource {
            dbCreate = "validate"
            url = "jdbc:h2:produccionDB;MVCC=TRUE"
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
