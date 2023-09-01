library(gtsummary)

##create model 1
model1 <- glm(Judgement_error == "Judgement error" ~ pt_Gender + pt_age_yrs, data = bm_without_tbi, family = binomial())
model1.table <- (tbl_regression(model1, exponentiate = TRUE))
model1.table<- as_kable(model1.table, format = "pandoc")
saveRDS(model1.table," model1.table.Rds")
write(model1.table, "model1.table.Rmd")
rmarkdown::render("model1.table.Rmd", output_format = "word_document")


##create model 2
model2 <- glm(Judgement_error == "Judgement error" ~ pt_Gender + res_survival + pt_age_yrs + ed_sbp_value + ed_rr_value + ed_gcs_sum + ISS, data = bm_without_tbi, family = binomial())
model2.table <- (tbl_regression(model2, exponentiate = TRUE))
model2.table<- as_kable(model2.table, format = "pandoc")
saveRDS(model2.table," model2.table.Rds")
write(model2.table, "model2.table.Rmd")
rmarkdown::render("model2.table.Rmd", output_format = "word_document")

##create model 3
model3 <- glm(Judgement_error == "Judgement error" ~ pt_Gender + res_survival + pt_age_yrs + ed_sbp_value + ed_rr_value + ed_gcs_sum + ISS + resuscitation.procedures, data = bm_without_tbi, family = binomial())
model3.table <- (tbl_regression(model3, exponentiate = TRUE))
model3.table<- as_kable(model3.table, format = "pandoc")
saveRDS(model3.table," model3.table.Rds")
write(model3.table, "model3.table.Rmd")
rmarkdown::render("model3.table.Rmd", output_format = "word_document")

## combine the three models using table_merge
merged_table <- tbl_merge(list(model1.table, model2.table, model3.table), tab_spanner = c("Model 1", "Model 2", "Model 3"))

## print the combined model
merged_models<- as_kable(merged_table, format = "pandoc")
saveRDS(merged_models, " merged_models.Rds")
write(merged_models, "merged_models.Rmd")
rmarkdown::render("merged_models.Rmd", output_format = "word_document")

print(model_table)