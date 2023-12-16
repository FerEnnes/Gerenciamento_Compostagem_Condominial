-- Trigger para atualizar a data de entrega na tabela COMPOSTEIRAS ao inserir um novo composto líquido

CREATE OR REPLACE FUNCTION AtualizarDataEntregaComposteira()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
BEGIN
    UPDATE COMPOSTEIRAS
    SET dataEntrega = CURRENT_DATE
    WHERE idComposteira = NEW.idComposteira;
    RETURN NEW;
END;
$$;

CREATE TRIGGER TriggerAtualizarDataEntrega
AFTER INSERT
ON COMPOSTO_LIQUIDO
FOR EACH ROW
EXECUTE FUNCTION AtualizarDataEntregaComposteira();
