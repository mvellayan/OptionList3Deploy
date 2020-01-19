FROM java:8

COPY ./wait-for-it.sh .
COPY ./OptionList3-0.0.1-SNAPSHOT-jar-with-dependencies.jar /home/OptionList3-0.0.1-SNAPSHOT-jar-with-dependencies.jar
ENTRYPOINT ["./wait-for-it.sh", "arbo-db:3306", "--", "java", "-jar", "/home/OptionList3-0.0.1-SNAPSHOT-jar-with-dependencies.jar"]
#CMD ["echo","Optionlist container has been created successfully."]
#CMD ["java","-cp","/home/OptionList3-0.0.1-SNAPSHOT-jar-with-dependencies.jar", "com.muthu.collect.TaskGenerate"]
