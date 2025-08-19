# Projeto DBT - Case Will Bank

Este projeto utiliza **DBT (Data Build Tool)** para modelagem, transformação e documentação de dados.  
Abaixo estão as instruções para configurar e executar o projeto localmente.

---

## Pré-requisitos

- **Python**  
  Caso não esteja instalado na sua máquina, faça o download em:  
  [https://www.python.org/downloads/](https://www.python.org/downloads/)
  
  Opte pela versão 3.11 ou acima.

---

## Instalação e Configuração

1. **Instalar a biblioteca `uv` via pip**  
   ```bash
   pip install uv
   ```

2. **Sincronizar dependências com `uv`**  
   ```bash
   uv sync --locked
   ```

---

## Ativação do ambiente virtual

Após instalar as bibliotecas, ativar o ambiente virtual:
```bash
source .venv/Scripts/activate
```

## Execução dos comandos do DBT

Após a configuração inicial, siga a ordem de execução:

1. **Mover para a pasta do projeto DBT**
    ```bash
    cd case_dw_willbank
    ```

2. **Instalar dependências**  
   ```bash
   dbt deps
   ```

3. **Carregar dados de seeds**  
   ```bash
   dbt seed
   ```

4. **Executar modelos**  
   ```bash
   dbt run
   ```

5. **Gerar documentação**  
   ```bash
   dbt docs generate
   ```

6. **Servir a documentação em localhost**  
   ```bash
   dbt docs serve
   ```

   > O comando `dbt docs serve` inicia um servidor local (geralmente em `http://localhost:8080`)  
   > onde é possível visualizar a **documentação do projeto**, incluindo a descrição das tabelas, colunas, relacionamentos e lineage.

---

## Observações

- Certifique-se de rodar os comandos sempre dentro da pasta do projeto DBT.  
- O `uv` garante que todas as dependências serão instaladas de forma consistente de acordo com o arquivo de lock.  
- A documentação gerada pelo DBT é interativa e permite explorar o modelo de dados visualmente.

---

## Tecnologias utilizadas

- [Python](https://www.python.org/)  
- [uv](https://github.com/astral-sh/uv)  
- [DBT Core](https://docs.getdbt.com/)  
