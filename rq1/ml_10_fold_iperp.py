from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import f1_score
from sklearn.metrics import make_scorer, precision_score
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import classification_report, roc_auc_score, matthews_corrcoef, accuracy_score
from sklearn.model_selection import StratifiedKFold
from imblearn.combine import SMOTEENN
from imblearn.under_sampling import TomekLinks, RandomUnderSampler
from imblearn.over_sampling import SMOTE

def calcola_metrica(metrica, y_test, y_pred):
    if metrica == 'accuracy':
        return accuracy_score(y_test, y_pred)
    elif metrica == 'auc':
        return roc_auc_score(y_test, y_pred)
    elif metrica == 'mcc':
        return matthews_corrcoef(y_test, y_pred)
    
# Iperparam search function
def iperparams_search(X_train, y_train):
    # Define param space
    # RandomForest
    param_grid = {
    #    'n_estimators': [100, 150, 200, 250],      
    #     'max_depth': [5, 10, 15, 20],          
    #     'min_samples_split': [2, 5, 10],  
    #     'min_samples_leaf': [1, 2, 4]     
        'max_samples':[0.5,1],
        'max_features':[0.5,1],
        'n_estimators':[100,200, 250, 300]
    }
    
    estimator=RandomForestClassifier()

    # Initialize Stratified K-Fold
    stratified_kfold = StratifiedKFold(n_splits=10, shuffle=True, random_state=42)

    # Define custom scorer (precision "True" class)
    scorer = make_scorer(precision_score, pos_label=True)

    # Initialize GridSearchCV with custom scorer
    searcher = GridSearchCV(estimator, param_grid=param_grid, cv=stratified_kfold, scoring=scorer,n_jobs=-1)
    
    searcher.fit(X_train, y_train)

    return searcher


# Dataset upload
df = pd.read_csv('./funmetricsemb_t.csv')

# Remove correlated features
indexes_to_remove=[0,1,2,3,4,5,12,22,25,27,28,30,31,32,38,41,50]

# Select all features but indexes_to_remove
X = df.drop(df.columns[indexes_to_remove], axis=1)

# Features standardization
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Target
y = df['Median-over-3q']

# Dataset division in in training set (80%) e temp set (20%)
X_trainval, X_temp, y_trainval, y_temp = train_test_split(X, y, test_size=0.2, random_state=42)

# Temp set division in validation set (10% of origin dataset) and testing set (10% of origin dataset)
X_val, X_test, y_val, y_test = train_test_split(X_temp, y_temp, test_size=1/2, random_state=42)

# Iperparam parallel search
best_model = iperparams_search(X_trainval, y_trainval)

# Get best iperparams
best_params = best_model.best_params_
print(best_params)

# Add class weight balancing 
best_params['class_weight'] = 'balanced'
best_params['n_jobs']=-1

model_name= 'RandomForestClassifier'

# Dictionary to save class metrics
class_metrics = {model_name: {}}

class_metrics[model_name] = {}
class_metrics[model_name]['Performance']={}

# Additional metrics list
perf_metrics=['accuracy','auc','mcc']

for i in range(5):
    # Model training
    best_model = RandomForestClassifier(**best_params)
    best_model.fit(X_trainval, y_trainval)

    # Model evaluation
    y_pred = best_model.predict(X_test)
    
    # Any class report getting
    report = classification_report(y_test, y_pred, output_dict=True)
    # Temp dictionary to remove support from report
    class_metrics_dict = {
        class_label: {k: v for k, v in report[class_label].items() if k != 'support'} 
        for class_label in report.keys() 
        if class_label in ['True', 'False']
    }
    
    # Add class metrics to partial sum
    for class_name, metrics in class_metrics_dict.items():
        if class_name in class_metrics[model_name]:
            for metric_name, metric_value in metrics.items():
                #if metric_name in ['precision', 'recall', 'f1-score']:
                    if metric_name not in class_metrics[model_name][class_name]:
                        class_metrics[model_name][class_name][metric_name] = metric_value
                    else:
                        class_metrics[model_name][class_name][metric_name]+=metric_value
        else:
            class_metrics[model_name][class_name] = metrics.copy()
    
    # Add accuracy, AUC e MCC
    for perf_metric_name in perf_metrics:
        if perf_metric_name not in class_metrics[model_name]['Performance']:
            class_metrics[model_name]['Performance'][perf_metric_name]=calcola_metrica(perf_metric_name,y_test,y_pred)
        else:
            class_metrics[model_name]['Performance'][perf_metric_name]+=calcola_metrica(perf_metric_name,y_test,y_pred)

# Compute metrics average for every class
for model_name, metrics_per_class in class_metrics.items():
    for class_name, metrics in metrics_per_class.items():
        for metric_name, metric_value in metrics.items():
                class_metrics[model_name][class_name][metric_name] /= 10 # Fold number division


# Any class metrics saving
results_df = pd.DataFrame([(model_name, class_name, metric_name, metric_value) 
                        for model_name, metrics_per_class in class_metrics.items()
                        for class_name, metrics in metrics_per_class.items()
                        for metric_name, metric_value in metrics.items()],
                        columns=['Model', 'Class', 'Metric', 'Value'])

# CSV results saving
file_out_name='./results/results_metrics_corr_emb_iperp_skf_rf_f1_t.csv';
results_df.to_csv(file_out_name, index=False)

print("Results saved in in ", file_out_name)
