INSERT INTO ib.stock_list(contract_id, symbol, primary_exchange, exchange, category, industry, long_name, trading_class) VALUES (107113386, 'FB', 'NASDAQ', 'SMART', 'Internet', 'Communications', 'FACEBOOK INC-A', 'NMS');
INSERT INTO ib.stock_list(contract_id, symbol, primary_exchange, exchange, category, industry, long_name, trading_class) VALUES (265598, 'AAPL', 'NASDAQ', 'SMART', 'Computers', 'Technology', 'APPLE INC', 'NMS');
INSERT INTO ib.stock_list(contract_id, symbol, primary_exchange, exchange, category, industry, long_name, trading_class) VALUES (3691937, 'AMZN', 'NASDAQ', 'SMART', 'Internet', 'Communications', 'AMAZON.COM INC', 'NMS');
INSERT INTO ib.stock_list(contract_id, symbol, primary_exchange, exchange, category, industry, long_name, trading_class) VALUES (15124833, 'NFLX', 'NASDAQ', 'SMART', 'Internet', 'Communications', 'NETFLIX INC', 'NMS');
INSERT INTO ib.stock_list(contract_id, symbol, primary_exchange, exchange, category, industry, long_name, trading_class) VALUES (208813720, 'GOOG', 'NASDAQ', 'SMART', 'Internet', 'Communications', 'ALPHABET INC-CL C', 'NMS');


INSERT INTO ib.task_plan(id, task, contract_id, start_date, active, months_out, bracket_pct) VALUES (1, 'stock_quote', 107113386, '2019-12-01', 'Y', 3, 0.000);
INSERT INTO ib.task_plan(id, task, contract_id, start_date, active, months_out, bracket_pct) VALUES (2, 'option_quote', 107113386, '2019-12-01', 'Y', 3, 0.15);

INSERT INTO ib.task_plan(id, task, contract_id, start_date, active, months_out, bracket_pct) VALUES (3, 'stock_quote', 265598, '2019-12-01', 'Y', 3, 0.000);
INSERT INTO ib.task_plan(id, task, contract_id, start_date, active, months_out, bracket_pct) VALUES (4, 'option_quote', 265598, '2019-12-01', 'N', 3, 0.15);


INSERT INTO ib.task_plan(id, task, contract_id, start_date, active, months_out, bracket_pct) VALUES (5, 'stock_quote', 3691937, '2019-12-01', 'Y', 3, 0.000);
INSERT INTO ib.task_plan(id, task, contract_id, start_date, active, months_out, bracket_pct) VALUES (6, 'option_quote', 3691937, '2019-12-01', 'N', 3, 0.15);

INSERT INTO ib.task_plan(id, task, contract_id, start_date, active, months_out, bracket_pct) VALUES (7, 'stock_quote', 15124833, '2019-12-01', 'Y', 3, 0.000);
INSERT INTO ib.task_plan(id, task, contract_id, start_date, active, months_out, bracket_pct) VALUES (8, 'option_quote', 15124833, '2019-12-01', 'N', 3, 0.15);

INSERT INTO ib.task_plan(id, task, contract_id, start_date, active, months_out, bracket_pct) VALUES (9, 'stock_quote', 208813720, '2019-12-01', 'Y', 3, 0.000);
INSERT INTO ib.task_plan(id, task, contract_id, start_date, active, months_out, bracket_pct) VALUES (10, 'option_quote', 208813720, '2019-12-01', 'N', 3, 0.15);


INSERT INTO ib.task_status(id, description) VALUES  (100, 'ToDo');
INSERT INTO ib.task_status(id, description) VALUES  (101, 'Retry');
INSERT INTO ib.task_status(id, description) VALUES  (200, 'Success');
INSERT INTO ib.task_status(id, description) VALUES  (400, 'Incomplete Data');
INSERT INTO ib.task_status(id, description) VALUES  (500, 'Error');
INSERT INTO ib.task_status(id, description) VALUES  (501, 'Error Max Attempted');
INSERT INTO ib.task_status(id, description) VALUES  (502, 'Error No Security');
INSERT INTO ib.task_status(id, description) VALUES  (503, 'Error No Data');
INSERT INTO ib.task_status(id, description) VALUES  (510, 'Error Other');


INSERT INTO ib.sequence(SEQ_NAME, SEQ_COUNT) VALUES  ('SEQ_GEN', 25696550);
INSERT INTO model.sequence(SEQ_NAME, SEQ_COUNT) VALUES  ('SEQ_GEN', 256550);

