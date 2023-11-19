FROM bioconductor/bioconductor_docker:3.18

# Install WisecondorX
RUN pip install -U git+https://github.com/CenterForMedicalGeneticsGhent/WisecondorX \
    && apt update \
    && apt -y install inotify-tools

RUN mkdir /home/script \
    && mkdir /home/input \
    && mkdir /home/output

COPY ./files/* /home/script/ 

RUN chmod +x /home/script/menucnv.sh

CMD [ "/home/script/menucnv.sh" ]