library(rjson)
library(RJDBC)



jdbcDriver = JDBC("oracle.jdbc.OracleDriver", classPath = "C:/app/client/rodrigo.emmanuel/product/12.2.0/client_1/jdbc/lib/ojdbc8.jar")

###Exemplo para RJPO1DR
esquemapd <- "RJPO1DR.saude.gov"
servidorpd <- "exaccdfdr-scan.saude.gov"
#CNES.TB_ESTABELECIMENTO

###Exemplo para DFPO1
esquemaodbc <- "DFPO1.saude.gov"
servidorodbc <- "exaccdfprd-scan.saude.gov"

baseodbc <- "jdbc:oracle:thin:@//"

odbcender <- paste0(baseodbc,servidorodbc,":1521/",esquemaodbc)

con_cnes  <-  dbConnect(jdbcDriver, odbcender,Sys.getenv("usuarioodbc"),Sys.getenv("senhaodbc"))


#testecnes <- dbGetQuery(con_cnes,'select * from DBCNESRJ.TB_ESTABELECIMENTO')


pd_ender <- paste0(baseodbc,servidorpd,":1521/",esquemapd)
con_pd  <-  dbConnect(jdbcDriver, pd_ender,Sys.getenv("usrjp"),Sys.getenv("senharjp"))


#cnesvalidos <- dbGetQuery(con_pd,'select * from CNES.TB_ESTABELECIMENTO WHERE co_motivo_desab is null')

#saveRDS(cnesvalidos,"dados/2022-10-19e20-cnes_validos.rds")

#tabs_rjp <- dbGetTables(con_pd)





#http://landpage-h.cgu.gov.br/dadosabertos/index.php?url=https://s3.sa-east-1.amazonaws.com/ckan.saude.gov.br/CNES/cnes_estabelecimentos.zip
#ftp://ftp.datasus.gov.br/cnes/BASE_DE_DADOS_CNES_202208.ZIP

#apisaude <- "https://apidadosabertos.saude.gov.br/cnes/estabelecimentos?limit=20&offset="


#lepgapi <- function(pg){  t <- rjson::fromJSON(file=paste0(apisaude,pg)) }

#cnes_api <- rbindlist(lapply(0:25000,lepgapi))

#CNES_SNP
#cnes_val_t <- dbGetQuery(con_pd,'select * from CNES_SNP.TB_CNES_VALIDOS')
