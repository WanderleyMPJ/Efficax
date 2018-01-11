unit Model.Dao.Interf;

interface

Type


  iModelEntidadeDao<M: class, constructor> = interface
    ['{55DA0634-75A4-45B2-926F-3CA926557DB4}']
    function Get(Filtro: string; var ResultJson: string): iModelEntidadeDao<M>;
    function Post(const JSON: string): iModelEntidadeDao<M>;
    function Lista(aFiltro: string; var ResultJson: string)
      : iModelEntidadeDao<M>;
  end;

  iModelEntidade<M: class, constructor> = interface
    ['{60CCEFB8-E500-4515-BC86-F41F1FC46E2D}']
    function OrmBr : iModelEntidadeDao<M>;
  end;

implementation

end.
