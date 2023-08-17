library(gtsummary)

##create model 1
model1 <- glm(Judgement_error == "Judgement error" ~ pt_Gender + pt_age_yrs, data = bm_without_tbi, family = binomial())
model1.table <- (tbl_regression(model1, exponentiate = TRUE))


##create model 2
model2 <- glm(Judgement_error == "Judgement error" ~ pt_Gender + res_survival + pt_age_yrs + ed_sbp_value + ed_rr_value + ed_gcs_sum + ISS, data = bm_without_tbi, family = binomial())
model2.table <- (tbl_regression(model2, exponentiate = TRUE))


##create model 3
model3 <- glm(Judgement_error == "Judgement error" ~ pt_Gender + res_survival + pt_age_yrs + ed_sbp_value + ed_rr_value + ed_gcs_sum + ISS + resuscitation.procedures, data = bm_without_tbi, family = binomial())
model3.table <- (tbl_regression(model3, exponentiate = TRUE))


## combine the three models using table_merge
merged_table <- tbl_merge(list(model1.table, model2.table, model3.table), tab_spanner = c("Model 1", "Model 2", "Model 3"))

## print the combined model
merged_models<- as_kable(merged_table, format = "pandoc")
saveRDS(merged_models, " merged_models.Rds")
write(merged_models, "merged_models.Rmd")
rmarkdown::render("merged_models.Rmd", output_format = "word_document")

print(model_table)