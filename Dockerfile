FROM python
RUN git clone https://github.com/akhil-rane/Ludus.git
RUN pip3 install -r Ludus/requirements.txt
EXPOSE 8080
WORKDIR Ludus
RUN mkdir resources
RUN echo -e $ludus_secret > resources/data-hub-kafka-ca.crt
CMD ["faust" ,"-A", "awarder" ,"worker"]