{//************************************************************//}
{//                                                            //}
{//         Código gerado pelo assistente                      //}
{//                                                            //}
{//         Projeto MVCBr                                      //}
{//         tireideletra.com.br  / amarildo lacerda            //}
{//************************************************************//}
{// Data: 15/12/2017 09:10:49                                  //}
{//************************************************************//}

unit Pessoa.Controller.Interf;
 ///
 /// <summary>
 ///  IPessoaController
 ///     Interaface de acesso ao object factory do controller
 /// </summary>
 {auth}
interface
uses
System.SysUtils,{$ifdef LINUX} {$else} {$ifdef FMX} FMX.Forms,{$else}VCL.Forms,{$endif} {$endif}
System.Classes, MVCBr.Interf;
type
  IPessoaController = interface(IController)
         ['{9492326B-37FE-47BE-9FDF-5A407D075346}']
         // incluir especializações aqui
  end;
Implementation
end.
