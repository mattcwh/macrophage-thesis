enrichment.package <- function(genelist, pkgname) {
  dir.create(file.path("./enrichr/",pkgname), recursive = T)
  dbs <- c("Reactome_2022","ChEA_2022", 
           "KEGG_2019_Mouse","UK_Biobank_GWAS_v1", 
           "GO_Molecular_Function_2021", "GO_Cellular_Component_2021",
           "GO_Biological_Process_2021")
  enrichments <- enrichr(genelist, dbs)

  # save enrichment results
  for (i in 1:length(enrichments)) {
    write.csv(enrichments[[dbs[i]]], 
              paste0("./enrichr/",pkgname,"/",dbs[i],".csv"))
  }
  # save gene list
  write.table(genelist, paste0("./enrichr/",pkgname,"/","genelist.csv"), 
              sep = ",", col.names = F, row.names = F)
}
