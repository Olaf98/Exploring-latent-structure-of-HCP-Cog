library(lavaan)
library(foreign)
library(openxlsx)
args = commandArgs(trailingOnly=TRUE)

if (length(args)==0) {
  args[1] = "C:/Users/olah4/OneDrive - ku.ac.ae/Data science/project/data_res_test.csv"
}

data <- read.csv(args[1])

print('3 Factors, threshold 0.45')
# 3-factor model, using variables with loadings > 0.45 as indicator variables

model_3f<- 'factor1 =~ CardSort_Unadj + Flanker_Unadj + ProcSpeed_Unadj + VSPLOT_CRTE + SCPT_TPRT + IWRD_RTC + Language_Task_Median_RT + WM_Task_Median_RT
factor2 =~ ReadEng_Unadj + PicVocab_Unadj + Language_Task_Acc
factor3 =~ PicSeq_Unadj + PMAT24_A_CR + SCPT_SPEC + ListSort_Unadj + WM_Task_Acc'

fit_3f <- cfa(model_3f, data=data, std.lv=TRUE, estimator='ML')

summary(fit_3f, fit.measures=TRUE, standardized = TRUE)
