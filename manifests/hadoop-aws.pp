##
## Instancias en Amazon:
##
##   Hadoop 2.8.5
##   Hive 2.3.4
##   Pig 0.17.0
##   Hue 4.3.0
##   Spark 2.4.0
##   Jupyter 4.4.0
##

package {['openjdk-8-jdk',
          'ssh',
          'rsync']:
    ensure => present,
}


package {['bigdata']:
    ensure   => present,
    provider => 'pip3',
}

package {['findspark',
          'pyspark']:
    ensure   => present,
    provider => 'pip3',
}


##
##
##  HADOOP
##
##

exec { 'hadoop-download':
    command => '/usr/bin/wget -P /vagrant/resources/ www-eu.apache.org/dist/hadoop/common/hadoop-2.8.5/hadoop-2.8.5.tar.gz',
    timeout => 0,
    onlyif  => '/usr/bin/test ! -f /vagrant/resources/hadoop-2.8.5.tar.gz'
}

exec { 'hadoop-mv':
    command => '/bin/tar -xzf /vagrant/resources/hadoop-2.8.5.tar.gz && /bin/mv hadoop-2.8.5 /usr/local/hadoop-2.8.5 && /usr/bin/sudo /bin/chmod 0777 /usr/local/hadoop-2.8.5', 
    timeout => 0,
    onlyif  => '/usr/bin/test ! -d /usr/local/hadoop-2.8.5'
}

file { '/etc/ssh/ssh_config':
    content => 'Host *
    StrictHostKeyChecking no
    SendEnv LANG LC_*
    HashKnownHosts yes
    GSSAPIAuthentication yes'
}

exec { 'hadoop-ssh':
    command => "/usr/bin/sudo -u vagrant /usr/bin/ssh-keygen  -t rsa -P '' -f /home/vagrant/.ssh/id_rsa && \
                /bin/cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys && \
                /bin/chmod 0600 /home/vagrant/.ssh/authorized_keys",
    timeout => 0,
    onlyif  => '/usr/bin/test ! -f /home/vagrant/.ssh/id_rsa.pub'
}


file { '/usr/local/hadoop-2.8.5/etc/hadoop/core-site.xml':
    content => '<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://0.0.0.0:9000</value>
    </property>
</configuration>'
}


file { '/usr/local//hadoop-2.8.5/etc/hadoop/hdfs-site.xml':
    content => '<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?> 
<configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
</configuration>'
}


file { '/usr/local/hadoop-2.8.5/etc/hadoop/mapred-site.xml':
    content => '<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?> 
<configuration>
    <property>
        <name>mapreduce.framework.name</name>
        <value>yarn</value>
    </property>
</configuration>'
}


file { '/usr/local/hadoop-2.8.5/etc/hadoop/yarn-site.xml':
    content => '<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?> 
<configuration>
    <property>
        <name>yarn.nodemanager.aux-services</name>
        <value>mapreduce_shuffle</value>
    </property>
</configuration>'
}


##
##
##  Pig
##
##
exec { 'pig-download':
    command => '/usr/bin/wget -P /vagrant/resources/ www-us.apache.org/dist/pig/pig-0.17.0/pig-0.17.0.tar.gz',
    timeout => 0,
    onlyif  => '/usr/bin/test ! -f /vagrant/resources/pig-0.17.0.tar.gz'
}

exec { 'pig-mv':
    command => '/bin/tar -xzf /vagrant/resources/pig-0.17.0.tar.gz && /bin/mv pig-0.17.0 /usr/local/pig-0.17.0', 
    timeout => 0,
    onlyif  => '/usr/bin/test ! -d /usr/local/pig-0.17.0' 
}


##
##
##  Hive
##
##
exec { 'hive-download':
    command => '/usr/bin/wget -P /vagrant/resources/ www-us.apache.org/dist/hive/hive-2.3.4/apache-hive-2.3.4-bin.tar.gz',
    timeout => 0,
    onlyif  => '/usr/bin/test ! -f /vagrant/resources/apache-hive-2.3.4-bin.tar.gz'
}

exec { 'hive-mv':
    command => '/bin/tar -xzf /vagrant/resources/apache-hive-2.3.4-bin.tar.gz &&  /bin/mv apache-hive-2.3.4-bin /usr/local/hive-2.3.4', 
    timeout => 0,
    onlyif  => '/usr/bin/test ! -d /usr/local/hive-2.3.4' 
}

##
##
##  Mahout
##
##
exec { 'mahout-download':
    command => '/usr/bin/wget -P /vagrant/resources/ www-us.apache.org/dist/mahout/0.13.0/apache-mahout-distribution-0.13.0.tar.gz',
    timeout => 0,
    onlyif  => '/usr/bin/test ! -f /vagrant/resources/apache-mahout-distribution-0.13.0.tar.gz'
}

exec { 'mahout-mv':
    command => '/bin/tar -xzf /vagrant/resources/apache-mahout-distribution-0.13.0.tar.gz && /bin/mv apache-mahout-distribution-0.13.0 /usr/local/mahout-0.13.0', 
    timeout => 0,
    onlyif  => '/usr/bin/test ! -d /usr/local/mahout-0.13.0' 
}


##
##
##  Spark
##
##
exec { 'spark-download':
    command => '/usr/bin/wget -P /vagrant/resources/ https://archive.apache.org/dist/spark/spark-2.4.0/spark-2.4.0-bin-without-hadoop.tgz',
    timeout => 0,
    onlyif  => '/usr/bin/test ! -f /vagrant/resources/spark-2.4.0-bin-without-hadoop.tgz'
}

exec { 'spark-mv':
    command => '/bin/tar -xzf /vagrant/resources/spark-2.4.0-bin-without-hadoop.tgz && /bin/mv spark-2.4.0-bin-without-hadoop /usr/local/spark-2.4.0', 
    timeout => 0,
    onlyif  => '/usr/bin/test ! -d /usr/local/spark-2.4.0' 
}


##
##
##  Zeppelin
##
##
exec { 'zeppelin-download':
    command => '/usr/bin/wget -P /vagrant/resources/ https://www-us.apache.org/dist/zeppelin/zeppelin-0.8.1/zeppelin-0.8.1-bin-all.tgz',
    timeout => 0,
    onlyif  => '/usr/bin/test ! -f /vagrant/resources/zeppelin-0.8.1-bin-all.tgz'
}

exec { 'zeppelin-mv':
    command => '/bin/tar -xzf /vagrant/resources/zeppelin-0.8.1-bin-all.tgz && /bin/mv zeppelin-0.8.1-bin-all /usr/local/zeppelin-0.8.1', 
    timeout => 0,
    onlyif  => '/usr/bin/test ! -d /usr/local/zeppelin-0.8.1' 
}

exec { 'zeppelin-log':
    command => '/bin/mkdir /usr/local/zeppelin-0.8.1/logs && /bin/chmod 777 /usr/local/zeppelin-0.8.1', 
    timeout => 0,
    onlyif  => '/usr/bin/test ! -d /usr/local/zeppelin-0.8.1/logs' 
}

exec { 'zeppelin-run':
    command => '/bin/mkdir /usr/local/zeppelin-0.8.1/run && /bin/chmod 777 /usr/local/zeppelin-0.8.1' , 
    timeout => 0,
    onlyif  => '/usr/bin/test ! -d /usr/local/zeppelin-0.8.1/run' 
}

##
##
##  Sqoop
##
##
exec { 'sqoop-download':
    command => '/usr/bin/wget -P /vagrant/resources/ https://www-eu.apache.org/dist/sqoop/1.4.7/sqoop-1.4.7.tar.gz',
    timeout => 0,
    onlyif  => '/usr/bin/test ! -f /vagrant/resources/sqoop-1.4.7.tar.gz'
}

##
##
##  HBase
##
##
exec { 'hbase-download':
    command => '/usr/bin/wget -P /vagrant/resources/ https://www.apache.org/dyn/closer.lua/hbase/2.1.5/hbase-2.1.5-bin.tar.gz',
    timeout => 0,
    onlyif  => '/usr/bin/test ! -f /vagrant/resources/hbase-2.1.5-bin.tar.gz'
}

exec { 'hbase-connectors-download':
    command => '/usr/bin/wget -P /vagrant/resources/ https://www.apache.org/dyn/closer.lua/hbase/hbase-connectors-1.0.0/hbase-connectors-1.0.0-bin.tar.gz',
    timeout => 0,
    onlyif  => '/usr/bin/test ! -f /vagrant/resources/hbase-connectors-1.0.0-bin.tar.gz'
}


##
##
##  Drill
##
##
exec { 'drill-download':
    command => '/usr/bin/wget -P /vagrant/resources/ https://www-us.apache.org/dist/drill/drill-1.16.0/apache-drill-1.16.0.tar.gz',
    timeout => 0,
    onlyif  => '/usr/bin/test ! -f /vagrant/resources/apache-drill-1.16.0.tar.gz'
}

#exec { 'drill-mapr-jdbc-download':
#    command => '/usr/bin/wget -P /vagrant/resources/ https://package.mapr.com/tools/MapR-JDBC/MapR_Drill/MapRDrill_jdbc_v1.6.0.1001/MapRDrillJDBC-1.6.0.1001.zip',
#    timeout => 0,
#    onlyif  => '/usr/bin/test ! -f /vagrant/resources/MapRDrillJDBC-1.6.0.1001.zip'
#}

exec { 'drill-mv':
    command => '/bin/tar -xzf /vagrant/resources/apache-drill-1.16.0.tar.gz && /bin/mv apache-drill-1.16.0 /usr/local/drill-1.16.0', 
    timeout => 0,
    onlyif  => '/usr/bin/test ! -d /usr/local/drill-1.16.0' 
}


##
##
##  SparkR & sparklyr
##
##
file { '/home/vagrant/spark-on-R.R':
    content => "
        install.packages(c('SparkR',
                           'sparklyr',
                           'dplyr'))
        library(sparklyr)
        spark_install(version = '2.4')
        "
    }

exec { 'spark-on-R-install':
    command => '/usr/bin/Rscript /home/vagrant/spark-on-R.R && /bin/rm /home/vagrant/spark-on-R.R',
    user    => 'root',
    onlyif  => '/usr/bin/test ! -d /home/vagrant/spark',
    timeout => 0,
}


##
##
##  Variables de entorno del sistema
##
## /usr/lib/jvm
file { '/etc/environment':
    content => '
        PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/snap/bin:/usr/local/julia-1.1.0/bin:/usr/local/hadoop-2.8.5/bin:/usr/local/hadoop-2.8.5/sbin:/usr/local/pig-0.17.0/bin:/usr/local/hive-2.3.4/bin:/usr/local/mahout-0.13.0/bin:/usr/local/zeppelin-0.8.1/bin:/usr/local/spark-2.4.0/bin:/usr/local/drill-1.16.0/bin:/usr/local/openrefine-3.1

        JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
        HADOOP_CLASSPATH=/usr/lib/jvm/java-8-openjdk-amd64/lib/tools.jar

        HADOOP_HOME=/usr/local/hadoop-2.8.5
        HADOOP_CONF_DIR=/usr/local/hadoop-2.8.5/etc/hadoop
        HADOOP_COMMON_LIB_NATIVE_DIR=/usr/local/hadoop-2.8.5/lib/native
        HADOOP_OPTS="-Djava.library.path=/usr/local/hadoop-2.8.5/lib/native
        HADOOP_ROOT_LOGGER="ERROR,console"

        PIG_HOME=/usr/local/pig-0.17.0

        HIVE_HOME=/usr/local/hive-2.3.4
        HIVE_CONF_DIR=/usr/local/hive-2.3.4/conf
        
        MAHOUT_HOME=/usr/local/mahout-0.13.0

        SPARK_HOME=/usr/local/spark-2.4.0
        SPARK_DIST_CLASSPATH=/usr/local/hadoop-2.8.5/etc/hadoop:/usr/local/hadoop-2.8.5/share/hadoop/common/lib/*:/usr/local/hadoop-2.8.5/share/hadoop/common/*:/usr/local/hadoop-2.8.5/share/hadoop/hdfs:/usr/local/hadoop-2.8.5/share/hadoop/hdfs/lib/*:/usr/local/hadoop-2.8.5/share/hadoop/hdfs/*:/usr/local/hadoop-2.8.5/share/hadoop/yarn/lib/*:/usr/local/hadoop-2.8.5/share/hadoop/yarn/*:/usr/local/hadoop-2.8.5/share/hadoop/mapreduce/lib/*:/usr/local/hadoop-2.8.5/share/hadoop/mapreduce/*:/usr/lib/jvm/java-8-openjdk-amd64/lib/tools.jar:/usr/local/hadoop-2.8.5/contrib/capacity-scheduler/*.jar
        PYSPARK_DRIVER_PYTHON=ipython
        PYSPARK_PYTHON=python3

        DRILL_HOME=/usr/local/drill-1.16.0

        '
}


##
##
##  Format hdp
##
##
file { '/usr/local/bin/hdp-format.sh':
    content => '

   
    cd ~
    rm -rf /home/vagrant/metastore_db
    rm -rf /tmp/hadoop-vagrant/dfs/name

    hdfs namenode -format

    bash /usr/local/hadoop-2.8.5/sbin/start-dfs.sh
    
    hdfs dfs -mkdir       /user
    hdfs dfs -mkdir       /user/vagrant
    
    hdfs dfs -mkdir       /tmp
    hdfs dfs -mkdir       /tmp/hive
    hdfs dfs -mkdir       /user/hive
    hdfs dfs -mkdir       /user/hive/warehouse
    hdfs dfs -chmod 777   /tmp
    hdfs dfs -chmod 777   /tmp/hive
    hdfs dfs -chmod 777   /user/hive/
    hdfs dfs -chmod 777   /user/hive/warehouse
    
    schematool -dbType derby -initSchema
    
    bash /usr/local/hadoop-2.8.5/sbin/stop-dfs.sh
    '
}

##
##
##  hdp start && stop
##
##
file { '/usr/local/bin/hdp-start.sh':
    content => '
bash start-dfs.sh
bash start-yarn.sh
sudo bash /usr/local/zeppelin-0.8.1/bin/zeppelin-daemon.sh start

echo 
echo
echo Hadoop NameNode at:
echo 
echo "    http://127.0.0.1:50070/"
echo
echo Yarn ResourceManager at:
echo
echo "     http://127.0.0.1:8088/"
echo 
echo Open zeppelin at:
echo 
echo "    http://127.0.0.1:8080/"
echo
echo Open Spark-UI at:
echo 
echo "    http://127.0.0.1:4040"
echo
'
}

file { '/usr/local/bin/hdp-stop.sh':
    content => '
sudo bash /usr/local/zeppelin-0.8.1/bin/zeppelin-daemon.sh stop
bash stop-yarn.sh
bash stop-dfs.sh
'
}

