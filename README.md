# IBGEasy
Uma forma mais ágil de dispor de alguns dados do IBGE. Depois de me perder no repositório de dados do IBGE sempre que buscava alguma informação resolvi simplificar o caminho.



## Divisão Territorial

Aqui estão disponibilizados dados de **municípios, distritos e subdistritos**.

Endereço dos arquivos: https://www.ibge.gov.br/geociencias/downloads-geociencias.html

Localização: `organizacao_do_territorio > estrutura_territorial > divisao_territorial > 2019 > DTB_2019.zip`.

Os nome dos arquivos foram simplificados conforme tabela abaixo.

|           Arquivo IBGE           | Arquivo IBGEasy |
| :------------------------------: | :-------------: |
|  RELATORIO_DTB_BRASIL_MUNICIPIO  |    municipio    |
|  RELATORIO_DTB_BRASIL_DISTRITO   |    distrito     |
| RELATORIO_DTB_BRASIL_SUBDISTRITO |   subdistrito   |

### Amostra dos dados

#### municipio

|  uf  | uf_nome | mesorregiao_geografica |  mesorregiao_nome   | microrregiao_geografica |   microrregiao_nome    | municipio | municipio_codigo_completo | municipio_nome |
| :--: | :-----: | :--------------------: | :-----------------: | :---------------------: | :--------------------: | :-------: | :-----------------------: | :------------: |
|  23  |  Ceará  |           04           |  Sertões Cearenses  |           019           | Sertão de Quixeramobim |   11306   |          2311306          |    Quixadá     |
|  23  |  Ceará  |           06           | Centro-Sul Cearense |           026           |         Iguatu         |   11355   |          2311355          |    Quixelô     |
|  23  |  Ceará  |           04           |  Sertões Cearenses  |           019           | Sertão de Quixeramobim |   11405   |          2311405          |  Quixeramobim  |
|  23  |  Ceará  |           05           |      Jaguaribe      |           023           |    Baixo Jaguaribe     |   11504   |          2311504          |    Quixeré     |

#### distrito

|  uf  | uf_nome | mesorregiao_geografica | mesorregiao_nome  | microrregiao_geografica |   microrregiao_nome    | municipio | municipio_codigo_completo | municipio_nome | distrito | distrito_codigo_completo | distrito_nome  |
| :--: | :-----: | :--------------------: | :---------------: | :---------------------: | :--------------------: | :-------: | :-----------------------: | :------------: | :------: | :----------------------: | :------------: |
|  23  |  Ceará  |           04           | Sertões Cearenses |           019           | Sertão de Quixeramobim |   11306   |          2311306          |    Quixadá     |    05    |        231130605         |    Quixadá     |
|  23  |  Ceará  |           04           | Sertões Cearenses |           019           | Sertão de Quixeramobim |   11306   |          2311306          |    Quixadá     |    18    |        231130618         |   Califórnia   |
|  23  |  Ceará  |           04           | Sertões Cearenses |           019           | Sertão de Quixeramobim |   11306   |          2311306          |    Quixadá     |    25    |        231130625         | Cipó dos Anjos |
|  23  |  Ceará  |           04           | Sertões Cearenses |           019           | Sertão de Quixeramobim |   11306   |          2311306          |    Quixadá     |    30    |        231130630         |    Custódio    |

#### subdistrito

| uf   | uf_nome | mesorregiao_geografica | mesorregiao_nome           | geografica_microrregiao | microrregiao_nome | municipio | municipio_codigo_completo | municipio_nome | distrito | distrito_codigo_completo | distrito_nome | subdistrito | subdistrito_codigo_completo | subdistrito_nome |
| ---- | ------- | ---------------------- | -------------------------- | ----------------------- | ----------------- | --------- | ------------------------- | -------------- | -------- | ------------------------ | ------------- | ----------- | --------------------------- | ---------------- |
| 23   | Ceará   | 03                     | Metropolitana de Fortaleza | 016                     | Fortaleza         | 04400     | 2304400                   | Fortaleza      | 05       | 230440005                | Fortaleza     | 06          | 23044000506                 | Antônio Bezerra  |
| 23   | Ceará   | 03                     | Metropolitana de Fortaleza | 016                     | Fortaleza         | 04400     | 2304400                   | Fortaleza      | 05       | 230440005                | Fortaleza     | 07          | 23044000507                 | Barra do Ceará   |
| 23   | Ceará   | 03                     | Metropolitana de Fortaleza | 016                     | Fortaleza         | 04400     | 2304400                   | Fortaleza      | 05       | 230440005                | Fortaleza     | 08          | 23044000508                 | Centro           |
| 23   | Ceará   | 03                     | Metropolitana de Fortaleza | 016                     | Fortaleza         | 04400     | 2304400                   | Fortaleza      | 05       | 230440005                | Fortaleza     | 12          | 23044000512                 | Mucuripe         |