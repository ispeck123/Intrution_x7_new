# Intrution on Zone for Edge x7

steps to execute the project.

1. Clone this repository into the edge box.
2. In a RDS or Local database create a schema and use eSentinel_new.sql to create the necessary tables.
3. Need to create a pipeline_id as per pipeline master table manually. Make sure to link the table with camera, model and pipeline_class_map to get the necessary data to create an alert.
4. Get and Set the pipeline id in run.sh file.
5. If there is an requirement of ROI insert into ROI or leave as a blank string. determine the ROI by zoning_tool.py
6. execute the run file through sh run.sh to execute the project.  
