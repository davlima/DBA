# Tutorial Completo sobre Estatísticas no Oracle

## 1. O que são Estatísticas no Oracle?

Estatísticas são informações coletadas pelo otimizador do Oracle sobre dados em tabelas, índices e colunas. Essas informações incluem, por exemplo:

* Número de linhas em uma tabela
* Distribuição dos valores em uma coluna (histogramas)
* Número de blocos usados
* Distribuição de dados em índices

O otimizador usa essas estatísticas para gerar planos de execução eficientes, decidindo o melhor caminho para acessar e processar os dados.

---

## 2. Por que as Estatísticas são Importantes?

Sem estatísticas precisas, o otimizador pode escolher planos ruins, levando a:

* Scans de tabela completas quando um índice seria melhor
* Junções ineficientes
* Uso excessivo de CPU, memória e I/O

Estatísticas atualizadas garantem que o otimizador tenha uma visão realista dos dados para tomar boas decisões.

---

## 3. Quais Estatísticas o Oracle Coleta?

* **Estatísticas de tabela:** número de linhas, blocos, etc.
* **Estatísticas de índice:** profundidade, número de níveis, distribuição das entradas.
* **Estatísticas de coluna:** número de valores distintos, valor máximo, valor mínimo.
* **Histogramas:** descrevem a distribuição dos valores em uma coluna, útil para colunas com dados muito desbalanceados.

---

## 4. Como Verificar Estatísticas Existentes?

Você pode consultar:

```sql
-- Última análise das tabelas no seu schema
SELECT table_name, last_analyzed
FROM user_tables
ORDER BY last_analyzed DESC;

-- Estatísticas de índices
SELECT index_name, last_analyzed
FROM user_indexes;

-- Estatísticas de colunas
SELECT table_name, column_name, num_distinct, histogram
FROM user_tab_col_statistics
WHERE table_name = 'NOME_DA_TABELA';
```

---

## 5. Como Coletar ou Atualizar Estatísticas?

O pacote PL/SQL `DBMS_STATS` é a forma recomendada para coletar estatísticas:

### Coletar estatísticas para uma tabela:

```sql
EXEC DBMS_STATS.GATHER_TABLE_STATS(
    ownname => 'SCHEMA_NAME',
    tabname => 'TABLE_NAME',
    estimate_percent => DBMS_STATS.AUTO_SAMPLE_SIZE,
    method_opt => 'FOR ALL COLUMNS SIZE AUTO',
    cascade => TRUE -- também coleta estatísticas de índices
);
```

* `estimate_percent`: porcentagem dos dados para amostrar; `AUTO_SAMPLE_SIZE` permite que o Oracle escolha automaticamente.
* `method_opt`: para coletar histogramas automaticamente quando necessário.
* `cascade`: coleta estatísticas dos índices da tabela também.

### Coletar estatísticas para todo o schema:

```sql
EXEC DBMS_STATS.GATHER_SCHEMA_STATS('SCHEMA_NAME');
```

### Coletar estatísticas para todo o banco:

```sql
EXEC DBMS_STATS.GATHER_DATABASE_STATS;
```

---

## 6. Quando Atualizar as Estatísticas?

* Após grandes alterações no volume de dados (inserts, updates, deletes).
* Quando novas tabelas ou índices são criados.
* Após operações de manutenção (ex: reorganização de tabelas).
* Periodicamente, para garantir estatísticas atualizadas, especialmente em ambientes de dados dinâmicos.

---

## 7. Quando **Não** Atualizar Estatísticas?

* Durante picos de produção, para evitar impacto no desempenho.
* Se não houve mudanças significativas nos dados.
* Se estiver usando **Estatísticas Fixas** ou planos SQL estáveis (via `SQL Plan Baselines`), pois atualizar estatísticas pode fazer o otimizador mudar planos — e isso pode ser indesejado em ambientes críticos.

---

## 8. Cuidados ao Coletar Estatísticas

* Use o parâmetro `estimate_percent` com cuidado; amostragens muito pequenas podem gerar estatísticas imprecisas.
* Avalie o uso de histogramas (`method_opt`), pois histogramas ajudam em colunas com dados não uniformes, mas coletá-los pode ser custoso.
* Evite coletar estatísticas durante horários de pico; agende para janelas de manutenção.
* Use o `NO_INVALIDATE` para evitar que estatísticas inválidas causem problemas em planos já em uso:

```sql
EXEC DBMS_STATS.GATHER_TABLE_STATS(
    ownname => 'SCHEMA_NAME',
    tabname => 'TABLE_NAME',
    no_invalidate => DBMS_STATS.AUTO_INVALIDATE
);
```

---

## 9. Estatísticas Automáticas no Oracle

Desde versões mais recentes, o Oracle possui um job automático que coleta estatísticas para tabelas que sofreram mudanças significativas (mais de 10% dos dados alterados, por exemplo). Esse job geralmente roda em janelas de manutenção.

Você pode conferir o status do job:

```sql
SELECT job_name, enabled, last_start_date, last_run_duration
FROM dba_scheduler_jobs
WHERE job_name = 'GATHER_STATS_JOB';
```

---

## 10. Diagnóstico e Ajustes

* **Verifique planos de execução** com `EXPLAIN PLAN` ou `DBMS_XPLAN.DISPLAY` para avaliar se as estatísticas estão influenciando bem o otimizador.
* Use o `SQL Monitor` (Oracle Enterprise Manager) para monitorar consultas caras.
* Ajuste manualmente estatísticas para casos especiais com `DBMS_STATS.SET_*_STATS` se necessário.

---

## 11. Outras Dicas

* Para tabelas pequenas, às vezes é melhor usar estatísticas fixas, pois o custo de coleta pode não compensar.
* Em ambientes com replicação ou standby, sincronize políticas de coleta de estatísticas.
* Use o `LOCK_TABLE_STATS` para travar estatísticas e evitar que sejam alteradas automaticamente.

---

# Resumo

| Quando usar estatísticas atualizadas? | Quando evitar atualizá-las?           |
| ------------------------------------- | ------------------------------------- |
| Grandes alterações nos dados          | Em horário de pico                    |
| Após criação de objetos               | Quando não há mudanças significativas |
| Antes de análises de desempenho       | Em ambientes com planos SQL estáveis  |

---

Se quiser, posso ajudar a montar scripts específicos para coletar estatísticas no seu ambiente ou explicar detalhes sobre histogramas, coleta incremental e muito mais! Quer?
