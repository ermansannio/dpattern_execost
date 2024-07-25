import numpy as np
from sklearn.model_selection import cross_val_score, KFold
from sklearn.ensemble import RandomForestClassifier, GradientBoostingClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.neighbors import KNeighborsClassifier
from sklearn.svm import SVC
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.neural_network import MLPClassifier
from sklearn.metrics import classification_report, roc_auc_score, matthews_corrcoef, accuracy_score
import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from imblearn.combine import SMOTEENN
from imblearn.under_sampling import TomekLinks
from imblearn.over_sampling import SMOTE
from imblearn.under_sampling import RandomUnderSampler
from sklearn.model_selection import StratifiedKFold

def calcola_metrica(metrica, y_test, y_pred):
    if metrica == 'accuracy':
        return accuracy_score(y_test, y_pred)
    elif metrica == 'auc':
        return roc_auc_score(y_test, y_pred)
    elif metrica == 'mcc':
        return matthews_corrcoef(y_test, y_pred)

# Dataset upload
#df = pd.read_csv('./funmetrics_t.csv')
df = pd.read_csv('./funmetricsemb_t.csv')

# Correlated features removing
indexes_to_remove=[0,1,2,3,4,5,12,22,25,27,28,30,31,32,38,41,50]

# Select all columns but indexes_to_remove
X = df.drop(df.columns[indexes_to_remove], axis=1)

# Correlated matrix computation
#correlation_matrix = X.corr()

# Show correlation matrix
#correlation_matrix.to_csv('correlation_matrix.csv')

# Target
#y = df['Mode-over-3t']
y = df['Median-over-3t']
#y = df['Mean-over-3q']

# Print classes
#print(np.unique(y))

# Features standardization
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Models definition
models = {
    'RandomForestClassifier': RandomForestClassifier(class_weight='balanced'),
    'GradientBoostingClassifier': GradientBoostingClassifier(loss='exponential'),
    'SVM': SVC(C=1.0),
    'LogisticRegression': LogisticRegression(max_iter=2000),
    'DecisionTreeClassifier': DecisionTreeClassifier(),
    'NaiveBayes': GaussianNB(),
    'KNeighborsClassifier': KNeighborsClassifier(),
    'MLPClassifier': MLPClassifier(max_iter=1000),
}

# Dictionary to save any class models metrics
class_metrics = {model_name: {} for model_name in models.keys()}

# 10-fold cross validation
skf = StratifiedKFold(n_splits=10, shuffle=True, random_state=42)

# Additional metrics list
perf_metrics=['accuracy','auc','mcc']

# Only metrics
#importances = [0] * (26+19+150)
# importances = [0] * (4+26+6+13-len(indexes_to_remove))
# Metrics and embeddings
#importances = [0] * (150+38+4-len(indexes_to_remove))


# 5 iter training and validation for every model
for model_name, model in models.items():
    print(f"Training and validation of {model_name}")
    class_metrics[model_name] = {}
    class_metrics[model_name]['Performance']={}
    for iteration in range(5):      
        
        # Cross validation with Stratified K fold
        for train_index, test_index in skf.split(X_scaled, y):
            X_train, X_test = X_scaled[train_index], X_scaled[test_index]
            y_train, y_test = y[train_index], y[test_index]

            #Apply SMOTE-ENN to balance traning set classes
            # smote_enn = SMOTEENN()
            # X_train_resampled, y_train_resampled = smote_enn.fit_resample(X_train, y_train)

            # Apply Tomek Links  to balance traning set classes
            # tomek_links = TomekLinks()
            # X_train_resampled, y_train_resampled = tomek_links.fit_resample(X_train, y_train)

            # Minority class over-sampling 
            # smote = SMOTE(sampling_strategy='minority')
            # X_train_resampled, y_train_resampled = smote.fit_resample(X_train, y_train)

            # # Majority class under-sampling
            # rus = RandomUnderSampler(sampling_strategy='majority')
            # X_train_resampled, y_train_resampled = rus.fit_resample(X_train_resampled, y_train_resampled)
            
            # # Minority class over-sampling
            # rus = RandomUnderSampler(sampling_strategy='majority')
            # X_train_resampled, y_train_resampled = rus.fit_resample(X_train, y_train)

            # Minority class over-sampling
            # smote = SMOTE(sampling_strategy='auto')
            # X_train_resampled, y_train_resampled = smote.fit_resample(X_train, y_train)

            # model.fit(X_train_resampled, y_train_resampled)
            # y_pred = model.predict(X_test)
            
            # Class ratio computation
            #ratio_falso_a_vero = 3267 / 1089 #quartile
            ratio_falso_a_vero = 2907 / 1089 #terzile
            # Class ratio setting
            class_weights = np.where(y_train == 'True', ratio_falso_a_vero, 1.0)
            if model_name in ["GradientBoostingClassifier","SVM"] :
                model.fit(X_train, y_train,sample_weight=class_weights)
            else:
                model.fit(X_train, y_train)
            y_pred = model.predict(X_test)
            
            # Get features importance
            # if model_name == 'RandomForestClassifier':
            #     importances += model.feature_importances_
            
            # Report computation for every class
            report = classification_report(y_test, y_pred, output_dict=True)
            # Support dictionary to remove support from report
            class_metrics_dict = {
                class_label: {k: v for k, v in report[class_label].items() if k != 'support'} 
                for class_label in report.keys() 
                if class_label in ['True', 'False']
            }
            
            # Add metrics to partial sum
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
            
            # Accuracy, AUC e MCC adding
            for perf_metric_name in perf_metrics:
                if perf_metric_name not in class_metrics[model_name]['Performance']:
                    class_metrics[model_name]['Performance'][perf_metric_name]=calcola_metrica(perf_metric_name,y_test,y_pred)
                else:
                    class_metrics[model_name]['Performance'][perf_metric_name]+=calcola_metrica(perf_metric_name,y_test,y_pred)
    
    # Print features contributions
    # if model_name == 'RandomForestClassifier':
    #     importances=[x/5 for x in importances]
    #     print(importances)

# Metrics average computation for every class
for model_name, metrics_per_class in class_metrics.items():
    for class_name, metrics in metrics_per_class.items():
        for metric_name, metric_value in metrics.items():
                class_metrics[model_name][class_name][metric_name] /= 50 # Folds number * 5 iters
  

# Save metrics for every class
results_df = pd.DataFrame([(model_name, class_name, metric_name, metric_value) 
                           for model_name, metrics_per_class in class_metrics.items()
                           for class_name, metrics in metrics_per_class.items()
                           for metric_name, metric_value in metrics.items()],
                          columns=['Model', 'Class', 'Metric', 'Value'])

# Save results to csv
file_out_name='./results/results_metrics_corr_modelbal_median_t_10f.csv';
results_df.to_csv(file_out_name, index=False)

print("Elaboration results saved in file ", file_out_name)
