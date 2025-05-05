# Replication Package for the paper entitled "The Gas Burn Identity: Early Detection of \\ Gas-Intensive Functions and Patterns in Smart Contracts".

Description of the content:

 1. *dataset* contains data required to execute scripts contained in rq1, rq2 and rq3 folders.

    a. *function_gas_cost_pred.csv* contains the pilot related to the estimation of gas expensive functions using ChatGPT and Gemini;

    b. *functions* is the set of functions retrieved from smart contracts for which there is a gas price;
    
    c. *pattern* is the set of filtered smart contracts to answer rq3;
    
    d. *smart_contracts* is the basic set of all smart contracts retrieved from Etherscan.

 2. *rq1* contains the main scripts and data to answer rq1.

    a. *best_model.joblib* is the best Random Forrest ML classifier found;

    b. *funmetrics_t.csv* contains all static metrics and gas cost statistics computed for each function;

    c. *funmetricsemb_t.csv* contains all of the previous file plus word embedding vectors;

    d. *ml_10_fold_class.py* is the script containing all the experiments done with ML shallow classifiers and optimization tecniques;
     
    e. *ml_10_fold_iperp.py* is the script to find the best hyperparameters for Random Forrest;
    
    f. *ml_10_fold_rf_best.py* is the script to obtain the best ML classifier;

    g. *ml_results.xlsx* is a sheet with gas statistics, metrics, word embedding vectors for all functions, and Ml performance results for all classifiers;

    h. *randomforrest_bayesian.py* is the script to find the best hyperparameters for Random Forrest classifier with bayesian search;

    i. *similarity_matrix_red.csv* is the similarity matrix computed for all functions, in a contracted form (i.e. without duplicated and diagonal values).

3. *rq2* contains the main scripts and data to answer rq2.

    a. *report_simfun_095_1_all.txt* is the report containing all similar function pairs, with a similar score between 95% and 100%;

    b. *report_simfun_095_1_red.txt* is the report containing all similar function pairs that don't have the same name, with an identical score between 95% and 100%;

    c. *similar_pairs_gas_red_filtered.csv* is the CSV file contained filtered similar function pairs;

    d. *similarityreport.py* is the script that creates similarity reports.

4. *rq3* contains the main scripts and data to answer rq3.

    a. *fisher_report.txt* contains the contingency tables computed for all patterns, with Fisher's test results;

    b. *fisher.py* is the script to create the fisher report;

    c. *functions.txt* is the list of functions present in the diff report.

