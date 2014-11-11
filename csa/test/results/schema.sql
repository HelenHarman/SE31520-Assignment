DROP TABLE results;

CREATE TABLE results (
                   testId integer primary key AUTOINCREMENT,
                   num_scenarios integer,
                   scenarios_passed integer,
                   scenarios_failed integer,
                      
                   num_steps integer,
                   steps_passed integer,
                   steps_failed integer,

                   coverage float,
                      
                   date datetime default current_timestamp
);
