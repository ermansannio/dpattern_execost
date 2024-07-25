import pandas as pd
from sklearn.model_selection import StratifiedKFold
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import classification_report, f1_score
from joblib import dump

# Dataset upload
df = pd.read_csv('./funmetricsemb_t.csv')

# Correlated features removing
indici_da_escludere=[0,1,2,3,4,5,12,22,25,27,28,30,31,32,38,41,50] #metrics

X = df.drop(df.columns[indici_da_escludere], axis=1)
y = df['Median-over-3t']

# Features standardization
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Model definition
model = RandomForestClassifier(class_weight='balanced')

# Cross-validation definition
skf = StratifiedKFold(n_splits=10, shuffle=True, random_state=42)

# Best model temp variable
best_model = None
best_f1_score = 0  # Low value initializzation

for iteration in range(5):
    # Model tranining and evaluation
    for train_index, test_index in skf.split(X_scaled, y):
        X_train, X_test = X_scaled[train_index], X_scaled[test_index]
        y_train, y_test = y[train_index], y[test_index]

       # Model training
        model.fit(X_train, y_train)

        # Model evaluation
        f1 = f1_score(y_test, model.predict(X_test))

        # Save this model as the best if has the best f1
        if f1 > best_f1_score:
            best_f1_score = f1
            best_model = model

# Best model saving
dump(best_model, 'best_model_.joblib')

# Best model testing
previsioni = best_model.predict(X_test)

# Metrincs evaluation and print
report = classification_report(y_test, previsioni, output_dict=True)
print(report)
