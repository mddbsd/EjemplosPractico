CREATE DATABASE ejemplopractico;

USE ejemplopractico;

CREATE TABLE tb_curs (
    id_curs INT NOT NULL AUTO_INCREMENT, 
    curs_nom VARCHAR(20), 
    curs_desc VARCHAR(20),
    PRIMARY KEY(id_curs)
);

CREATE TABLE tb_sede (
    id_sede INT NOT NULL AUTO_INCREMENT,
    sede_nom VARCHAR(20),
    sede_sponsor VARCHAR(20),
    PRIMARY KEY(id_sede)
);

CREATE TABLE tb_curs_sede (
    id_tbcurs INT NOT NULL,
    id_tbsede INT NOT NULL,
    PRIMARY KEY(id_tbcurs, id_tbsede),
    FOREIGN KEY (id_tbcurs) REFERENCES tb_curs(id_curs) ON CASCADE DELETE,
       
    FOREIGN KEY (id_tbsede) REFERENCES tb_sede(id_sede)  ON CASCADE DELETE
);

/**INSERTS INICIALES**/
INSERT INTO tb_sede (sede_nom, sede_sponsor) 
    VALUES ('lomas','pepsi'),('catan','coca cola'),('san justo','manaos');

INSERT INTO tb_curso (curso_nom, curso_desc) VALUES ('maquillaje','pintate la cara'),('programacion','coder master'),('astrofisica','big bang'),('fisica cuantica','shrodinger'),('aviacion','salis volando'),('electricidad','LA LOZ');

INSERT INTO tb_curs_sede (id_tbsede, id_tbcurs) VALUES (1,1),(1,2),(1,3),(2,4),(2,5),(3,6);
