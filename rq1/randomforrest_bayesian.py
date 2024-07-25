import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split,cross_val_score,StratifiedKFold
from sklearn.metrics import confusion_matrix,classification_report,precision_score, recall_score, f1_score, accuracy_score
from sklearn.ensemble import RandomForestClassifier
from bayes_opt import BayesianOptimization
from sklearn.preprocessing import StandardScaler
from bayes_opt.util import UtilityFunction

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

X_train,X_test,y_train,y_test = train_test_split(X_scaled,y,test_size=0.2,stratify=y,random_state=42)

rf = RandomForestClassifier(n_jobs=-1)

rf.fit(X_train,y_train)

preds = rf.predict(X_test)

print(classification_report(preds,y_test))

print("Precision:{}".format(precision_score(preds,y_test)))
print("Recall:{}".format(recall_score(preds,y_test)))
print("F1 Score:{}".format((f1_score(preds,y_test))))
rf.get_params()

# Hyperparams tuning

def stratified_kfold_score(clf,X,y,n_fold):
    #X,y = X.values,y.values
    y=y.values
    strat_kfold = StratifiedKFold(n_splits=n_fold, shuffle=True, random_state=1)
    accuracy_list = []

    for train_index, test_index in strat_kfold.split(X, y):
        x_train_fold, x_test_fold = X[train_index], X[test_index]
        y_train_fold, y_test_fold = y[train_index], y[test_index]
        clf.fit(x_train_fold, y_train_fold)
        preds = clf.predict(x_test_fold)
        accuracy_test = accuracy_score(preds,y_test_fold)
        accuracy_list.append(accuracy_test)

    return np.array(accuracy_list).mean()

# def bo_params_rf(max_samples,n_estimators,max_features):
    
#     params = {
#         'max_samples': max_samples,
#         'max_features':max_features,
#         'n_estimators':int(n_estimators)
#     }
#     clf = RandomForestClassifier(max_samples=params['max_samples'],max_features=params['max_features'],n_estimators=params['n_estimators'],n_jobs=-1)
#     score = stratified_kfold_score(clf,X_train, y_train,5)
#     return score

# rf_bo = BayesianOptimization(bo_params_rf, {
#                                               'max_samples':(0.5,1),
#                                                 'max_features':(0.5,1),
#                                               'n_estimators':(100,200)
#                                              })

def bo_params_rf(max_depth,n_estimators,min_samples_split,max_features):
    
    params = {
        'max_depth': int(max_depth),
        'min_samples_split':int(min_samples_split),
        'n_estimators':int(n_estimators),
        'max_features':max_features
    }
    clf = RandomForestClassifier(max_depth=params['max_depth'],min_samples_split=params['min_samples_split'],n_estimators=params['n_estimators'],max_features=params['max_features'],n_jobs=-1)
    score = stratified_kfold_score(clf,X_train, y_train,5)
    return score

rf_bo = BayesianOptimization(bo_params_rf, {
                                                'max_depth':(5,15),
                                                'min_samples_split':(2,5),
                                                'n_estimators':(50,250),
                                                'max_features': (0.1, 1.0)
                                             })

# Gaussian process params
gp_params = {
    'alpha': 1e-5,  
    'n_restarts_optimizer': 5,  
    'normalize_y': True  
}

# Acquisition function definition
utility = UtilityFunction(kind="ei")

rf_bo.set_gp_params(**gp_params)

results = rf_bo.maximize(n_iter=200, init_points=20,acquisition_function=utility)

params = rf_bo.max['params']
params['n_estimators']= int(params['n_estimators'])
params['max_depth']= int(params['max_depth'])
params['min_samples_split']= int(params['min_samples_split'])
print(params)

#rf_v1 = RandomForestClassifier(max_samples=params['max_samples'],max_features=params['max_features'],n_estimators=params['n_estimators'],n_jobs=-1)
rf_v1=RandomForestClassifier(max_depth=params['max_depth'],min_samples_split=params['min_samples_split'],n_estimators=params['n_estimators'],max_features=params['max_features'],n_jobs=-1)
rf_v1.fit(X_train,y_train)

preds = rf_v1.predict(X_test)

print(classification_report(preds,y_test))

print("Precision:{}".format(precision_score(preds,y_test)))
print("Recall:{}".format(recall_score(preds,y_test)))
print("F1 Score:{}".format((f1_score(preds,y_test))))

# KFold validation

cv = StratifiedKFold(n_splits=10, random_state=123, shuffle=True)
scores = []
    
for (train, test), i in zip(cv.split(X, y), range(5)):
    rf_v1.fit(X.iloc[train], y.iloc[train])
    preds = rf_v1.predict(X.iloc[test])    
    accuracy = accuracy_score(preds,y.iloc[test])
    scores.append(accuracy)

df_val= pd.DataFrame(scores, columns=['Accuracy Test'])
print("KFold validation mean accuracy on test set : {}".format(df_val['Accuracy Test'].mean()))
