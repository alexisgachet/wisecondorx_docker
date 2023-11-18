FROM bioconductor/bioconductor_docker:3.18

# Install WisecondorX
RUN pip install -U git+https://github.com/CenterForMedicalGeneticsGhent/WisecondorX

RUN mkdir /home/script \
    && mkdir /home/input \
    && mkdir /home/output

COPY ./files/run.sh /home/script/ 

RUN chmod +x /home/script/run.sh

CMD [ "/home/script/run.sh" ]