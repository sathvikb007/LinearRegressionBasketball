function basketball = importfile(filename, dataLines)
%IMPORTFILE Import data from a text file

%  basketball = importfile("C:\Downloads\nba-salaries-prediction-in-20172018-season\basketball.csv", [2, Inf]);

%% Input handling

%%Import Options
opts = delimitedTextImportOptions("NumVariables", 28);
opts.DataLines = dataLines;
opts.Delimiter = ",";
opts.VariableNames = ["Player", "Salary", "NBA_Country", "NBA_DraftNumber", "Age", "Tm", "G", "MP", "PER", "TS", "PAr", "FTr", "ORB", "DRB", "TRB", "AST", "STL", "BLK", "TOV", "USG", "OWS", "DWS", "WS", "WS48", "OBPM", "DBPM", "BPM", "VORP"];
opts.VariableTypes = ["string", "double", "categorical", "double", "double", "categorical", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];
opts = setvaropts(opts, 1, "WhitespaceRule", "preserve");
opts = setvaropts(opts, [1, 3, 6], "EmptyFieldRule", "auto");
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

basketball = readtable(filename, opts);

end