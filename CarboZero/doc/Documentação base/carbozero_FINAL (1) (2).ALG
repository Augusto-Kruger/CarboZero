algoritmo "semnome"

tipo
   dadousuario = registro
      nome: caractere
      idade: inteiro
      cpf: caractere
      senha: caractere
      cnpj: caractere
      saldoDinheiro: real
      somaSaldoCredito: real
      saldoCredito: real
      sessao: inteiro
      fisicooujuri: caractere
      qtdAnuncio:inteiro
      vendedorOUcomprador: inteiro
      vezesCompensado:inteiro
      opcSenha: inteiro
      titularCartao,  validadecartao, numerocartao, cvccartao: caractere
      titularConta, numeroContaBancaria, numeroAgenciaBancaria, tipoConta, nomeBanco: caractere
      dividaCo2:real
      vezessacado: inteiro

   fimregistro

   mercadoUsuario = registro
      qtdAnuncioM,id_anuncio,id_origem, id_destino, qtdCredAnuncio: inteiro
      precoCredAnuncio:real
      compensasoes:inteiro
      creditosComp:real
      arvoresComp:real
      co2kgComp:real

   fimregistro

   cadastroArea = registro
      tamanhoArea: inteiro
      vegetacao: caractere
      numeroregistro: inteiro
      adicaoArea: inteiro

   fimregistro

   saqueReg = registro
      vezessacado, adicaoSaque: inteiro
      saquerelatorio: real
      quantiasaque: inteiro
      titularConta, numeroContaBancaria, numeroAgenciaBancaria, tipoConta, nomeBanco: caractere

   fimregistro

var
   usuario: vetor[0..40] de dadoUsuario

   countSaque, parametroTemp,idCompraTemp,credCompraTemp,achouAnuncio,idAnuncioTemp,qtdAnuncioGeral,precoCredAnuncioTemp,credVendaTemp,countArea,qtdCalc,vendedorOUcompradorTemp,idadeTemp,anoNascTemp,qtdUsuario,pause,op,logado: inteiro
   opc,nomeTemp,cpfTemp,cnpjTemp,senhaTemp,fisicooujuriTemp,confSenha,cpfoucnpj: caractere
   qtdSessao,y,logou,sessaoLogado,x, countLogin: inteiro
   combustivelUsadoTEMP:real
   combustivelRelatorioTEMP: vetor[0..30] de caractere
   carbonoEmitidoTEMP: vetor[0..30] de real
   carbonoEmitidoTEMPAnual:real
   carbonoTotalEmitidoTEMP:real
   cotacaoCredito: real
   cadArea: vetor[0..30,0..30] de cadastroArea
   usuarioMercado: vetor[0..30,0..30] de mercadoUsuario
   saquerelatorio: vetor[0..30, 0..30] de saqueReg


procedimento checalogin()
inicio
   limpatela
   se sessaoLogado=0 entao
      escreval("                                                                        ^CX%@@@@@@@@gDkv'               ")
      escreval("                                                                      !8@@@@@@@@@@@@@@@@@@@P_           ")
      escreval("                                                                    T@@@@@@@@@@@@@@@@@@@@@@@@$,         ")
      escreval("                                                                  -g@@@@@@@@@@8U5ujP8@@@@@@@@@@V        ")
      escreval("                                                                 '@@@@@@@@@G_         _G@@@@@@@@A       ")
      escreval("                                                                 X@@@@@@@@;             r@@@@@@@@!      ")
      escreval("                                                                 5@@@@@@@r               @@@@@@@@u      ")
      escreval("                                                                     -_-                *@@@@@@@@c      ")
      escreval("                                                                                      -b@@@@@@@@g       ")
      escreval("                                                                                    ^8@@@@@@@@@8        ")
      escreval("                                                                                  i@@@@@@@@@@@!         ")
      escreval("                                                                                c@@@@@@@@@@@T           ")
      escreval("                                                                              _@@@@@@@@@@g!             ")
      escreval("                                                                             -@@@@@@@@@A:               ")
      escreval("                                                                             R@@@@@@@@_                 ")
      escreval("                                                                             @@@@@@@@-                  ")
      escreval("                                                                             8@@@@@@8                   ")
      escreval("                                                                              ^vttv,                    ")
      escreval("                                                                                                        ")
      escreval("                                                                             T@@@@@@c                   ")
      escreval("                                                                             @@@@@@@g                   ")
      escreval("                                                                             @@@@@@@g                   ")
      escreval("                                                                             8@@@@@@b                   ")
      escreval("                                                                             _LTTr'                    ")
      escrevaL(" ")
      escreval(" ")
      escrevaL("                                         Oops, parece que você não possui uma conta ou não esta logado em nossa plataforma")
      escreval(" ")
      escreval("                                                              Pressione <ENTER> para fazer sua conta")
      leia(pause)
      escolhaLogin()

   fimse
fimprocedimento



procedimento paginainicial()
inicio
   limpatela
   limpatela
   escreval("                             _cteeJr-                             2@&_                        ^TTTTTTTTTTT,                                        ")
   escreval("                           T@@@@@@@@@@v                           2@@@                        b@@@@@@@@@@@^                                        ")
   escreval("                         *@@@@eTrriS@@@&_                         2@@@_                       ^TTTTTS@@@%                                          ")
   escreval("                        _@@@M       ~PPPc    _itL    -,  ^    _*_ 2@@@_ !Ji'        'TxJ!          _@@@@-       _r1F;      _    ;;     _luF;       ")
   escreval("                        8@@@*              v@@@@@@@F8@8  @@Kr@@@U 2@@@g@@@@@@3   -e@@@@@@@gc      -@@@Q_     _2@@@@@@@&^  ^@@iP@@@- _X@@@@@@@O,    ")
   escreval("                        g@@@;             %@@@8^-^X@@@8  @@@@&tv; 2@@@g!-:X@@@g  &@@@^ _v@@@t    ^@@@g      -@@@8-  *@@@z ,@@@@Uvx c@@@@, '6@@@*   ")
   escreval("                        ^@@@#       _xuur-@@@@     @@@8  @@@@     2@@@;    @@@@_;@@@I    0@@@   _@@@8-      1@@@@@@@@@@@D ,@@@E    X@@@_    #@@g   ")
   escreval("                         i@@@&r_  _T@@@@_ @@@@!   _@@@8  @@@@     2@@@2   _@@@@ -@@@X   -@@@N  -@@@8_______-^@@@S         ,@@@j    e@@@3   _@@@X   ")
   escreval("                          _8@@@@@@@@@@g-  ^@@@@@g@@@@@8  @@@@     2@@@@@g@@@@@^  c@@@@M@@@@@_ _@@@@@@@@@@@@- 4@@@@XR@@@D- ,@@@j     S@@@@g&@@@D    ")
   escreval("                             r58g0G3;       TR@@@X! _Ve  JdHS     i8r :eQ@@8c      *A@@@g5^   3HHHHHHHdPF;     iD&@@&S;   -XHd;      -J8@@@$E_     ")
   escreval(" ")
   escreval(" ")
   escreval(" ")
   escreval("                                                                      ___________________________                  ")
   escreval("                                                                     |                           |                ")
   escreval("                                                                     |  [1] para Minha Conta     |                  ")
   escreval("                                                                     |                           |                 ")
   escreval("                                                                     |                           |                  ")
   escreval("                                                                     |  [2] para Calculadora     |                  ")
   escreval("                                                                     |                           |                  ")
   escreval("                                                                     |                           |                  ")
   escreval("                                                                     |  [3] para Mercado Co2     |                  ")
   escreval("                                                                     |                           |                   ")
   escreval("                                                                     |                           |                  ")
   escreval("                                                                     |  [4] para Suporte         |                  ")
   escreval("                                                                     |                           |                   ")
   escreval("                                                                     |                           |                   ")
   escreval("                                                                     |  [0] para Encerrar        |                   ")
   escreval("                                                                     |___________________________|                   ")
   escreva("                                                                                           ")
   leia(op)
   escolha op
   caso 1
      limpatela
      minhaconta()
   caso 2
      limpatela
      calculadora()
   caso 3
      checaLogin()
      se usuario[sessaoLogado].vendedorOUcomprador=1 entao
         anunciaouolha()
      senao
         mercado()
      fimse
   caso 4
      limpatela
      suporte()
   caso 0
      limpatela
      interrompa

   fimescolha



fimprocedimento

procedimento suporte()
var
   problemaOuDuv: Caractere
Inicio
   limpatela
   escreval("                                       -cP88#E*                                                                                                        ")
   escreval("                                       +@@C*;rS&T                                                       ,@@                                            ")
   escreval("                                       g@e          !F_     ^F,   _F^ *u2Cr-       !Fe2t*-     vT *jeT_vy@@JJJ^    ;zeeF;                              ")
   escreval("                                       ;@@D*-       g@T     G@E   u@@@8tT2@@5   -G@@SvvS@@#   -@@@@33X,fX@@CCC^  x@@kivP@@T                            ")
   escreval("                                         T8@@@P;    g@T     G@E   u@@_    '@@*  8@G      B@G  -@@f      ^@@     v@&     -@@,                           ")
   escreval("                                            'T&@@-  g@T     G@E   u@8      8@y -@@,      +@@  -@@-      ^@@     g@@@@@@@@@@;                           ")
   escreval("                                               @@l  M@J     G@E   u@8      @@v  @@r      3@g  -@@-      ^@@     8@G                                    ")
   escreval("                                      _$5;' -^X@@-  v@@^  ;8@@E   u@@8;  _8@0   r@@J'  :E@@_  -@@-      _@@^ .- _@@k:   _+L                            ")
   escreval("                                       TGQ@@@@Gr     ;8@@@%vt@i   u@g3g@@@8+     _jM@@@@Dc    -@@        !%@@@T   T8@@@@&DT                            ")
   escreval("                                                                  u@8                                                                                  ")
   escreval("                                                                  x@8                                                                                  ")
   escreval("                                                                   -                                                                                   ")
   escreval("")
   escreval("")
   escreval("")
   escreval("                                                                         Bem-vindo ao Suporte!")
   escreval("")
   escreval("                                                       ------------------------------------------------------- ")
   escreval("")
   escreval("                                                                      Qual o seu problema/Dúvida?")
   escreva("                                                                      ")
   leia(problemaOuDuv)
   escreval("")
   escreval("                                                       ------------------------------------------------------- ")
   escreval("")
   escreval("")
   escreval("")
   escreval("")
   escreval("                                                    Obrigado por compartilhar seu feedback. Retornaremos em breve!")
   escreval("")
   escreval("                                                                   Pressione [ENTER] para continuar")
   leia(pause)
   paginainicial()
fimprocedimento

procedimento erroAnuncia()
inicio
   desenhoMercado()
   escreval("                                                                     |----------------------------------------------------|")
   escreval("                                                                       Creditos de carbono:",credVendaTemp)
   escreval("                                                                     |----------------------------------------------------|")
   escreval("")
   escreval("                                                                Você não possui a quantidade de créditos de carbono selecionada")
   escreval("                                                                            Saldo de crédito de carbono atual:",usuario[sessaoLogado].saldoCredito)
   escreval("                                                                                   ------------------------")
   escreval("")
   escreval("                                                                              [1] Inserir a quantidade novamente")
   escreval("                                                                              [0] Voltar ao mercado")
   leia(op)
   escolha op
   caso 1
      anunciaCredito()
   caso 0
      mercado()
   outrocaso
      desenhoMercado()
      invalido()
      erroAnuncia()
fimprocedimento

procedimento sucessoAnuncia()
inicio
   qtdAnuncioGeral:=qtdAnuncioGeral+1
   usuario[sessaoLogado].qtdAnuncio:=usuario[sessaoLogado].qtdAnuncio + 1
   usuarioMercado[sessaoLogado,usuario[sessaoLogado].qtdAnuncio].qtdAnuncioM:= usuarioMercado[sessaoLogado,usuario[sessaoLogado].qtdAnuncio].qtdAnuncioM + 1
   usuarioMercado[sessaoLogado,usuario[sessaoLogado].qtdAnuncio].id_origem:=sessaoLogado
   usuarioMercado[sessaoLogado,usuario[sessaoLogado].qtdAnuncio].qtdCredAnuncio:= credVendaTemp
   usuarioMercado[sessaoLogado,usuario[sessaoLogado].qtdAnuncio].precoCredAnuncio:= precoCredAnuncioTemp
   usuarioMercado[sessaoLogado,usuario[sessaoLogado].qtdAnuncio].id_anuncio:= (sessaoLogado * 10) +  usuario[sessaoLogado].qtdAnuncio
   desenhoMercado()
   escreval("                                                                              Parabéns, seu anúncio foi criado.")
   escreval("")
   escreval("                                                                              Informações do anúncio: ")
   escreval("                                                                              Qtd. Crédito: ",usuarioMercado[sessaoLogado,usuario[sessaoLogado].qtdAnuncio].qtdCredAnuncio)
   escreval("                                                                              Valor(unidade):", usuarioMercado[sessaoLogado,usuario[sessaoLogado].qtdAnuncio].precoCredAnuncio)
   escreval("                                                                              ----")
   escreval("")
   escreval("                                                                              Obrigado por escolher a CarboZero.")
   escreval("")
   escreval("                                                                              [1] Mercado")
   escreval("                                                                              [2] Pagina inicial")
   leia(op)
   escolha op
   caso 1
      mercado()
   caso 2
      paginainicial()
   outrocaso
      desenhoMercado()
      invalido()
      sucessoAnuncia()
   fimescolha
fimprocedimento

procedimento anunciaCredito()
inicio
   desenhoMercado()
   leia(pause)
   escreval("                                                                 Informe a quantidade de creditos de carbono que voce deseja vender ")
   escreval("")
   escreval("                                                                     |----------------------------------------------------|")
   escreva("                                                                       Creditos de carbono: ")
   leia(credVendaTemp)
   escreval("                                                                     |----------------------------------------------------|")
   escreval("")
   se usuario[sessaoLogado].saldoCredito < credVendaTemp entao
      erroAnuncia()
   fimse
   precoAnuncia()
fimprocedimento

procedimento checaprecoanuncia()
inicio
   se (precoCredAnuncioTemp < (cotacaoCredito - 10)) ou (precoCredAnuncioTemp > (cotacaoCredito + 10))  entao
      desenhoMercado()
      escreval("                                                                 Informe a quantidade de creditos de carbono que voce deseja vender ")
      escreval("")
      escreval("                                                                     |----------------------------------------------------|")
      escreval("                                                                       Creditos de carbono:",credVendaTemp)
      escreval("                                                                     |----------------------------------------------------|")
      escreval("")
      escreval("                                                                     |----------------------------------------------------|")
      escreval("                                                                       Valor(unidade):",precoCredAnuncioTemp)
      escreval("                                                                     |----------------------------------------------------|")
      escreval("")
      escreval("                                                      O preço por unidade dos seus créditos de carbono devem estar entre R$375,00 e R$395,00")
      escreval("")
      escreval("                                                                           Pressione [ENTER] para tentar novamente")
      leia(pause)
      precoAnuncia()
   fimse
fimprocedimento

procedimento precoAnuncia()
inicio
   desenhoMercado()
   escreval("                                                                 Informe a quantidade de creditos de carbono que voce deseja vender ")
   escreval("")
   escreval("                                                                     |----------------------------------------------------|")
   escreval("                                                                       Creditos de carbono:",credVendaTemp)
   escreval("                                                                     |----------------------------------------------------|")
   escreval("")
   escreval("                                                                     |----------------------------------------------------|")
   escreval("                                                                       Valor(unidade): ")
   leia(precoCredAnuncioTemp)
   checaprecoanuncia()
   escreval("                                                                     |----------------------------------------------------|")
   confirmaAnuncia()
fimprocedimento

procedimento confirmaAnuncia()
inicio
   desenhoMercado()
   escreval("                                                                 Informe a quantidade de creditos de carbono que voce deseja vender ")
   escreval("")
   escreval("                                                                     |----------------------------------------------------|")
   escreval("                                                                       Creditos de carbono:",credVendaTemp)
   escreval("                                                                     |----------------------------------------------------|")
   escreval("")
   escreval("                                                                     |----------------------------------------------------|")
   escreval("                                                                       Valor(unidade):",precoCredAnuncioTemp)
   escreval("                                                                     |----------------------------------------------------|")
   escreval("")
   escreval("                                                                          Voce deseja anunciar",credVendaTemp," creditos para venda?")
   escreval("                                                                                        [S] para SIM ")
   escreval("                                                                                        [N] para NAO ")
   leia (opc)
   opc:=maiusc(opc)
   escolha opc
   caso "S"
      sucessoAnuncia()
   caso "N"
      mercado()
   outrocaso
      desenhoMercado()
      invalido()
      confirmaAnuncia()
   fimescolha
fimprocedimento

procedimento desenhoMercado() //mercado de co2
inicio
   limpatela
   escreval("                                                               -J8@@gdr        rdQ@@8J-       ^S$@@%e,     ")
   escreval("                                                              ^@@@@@@@@%-    -B@@@@@@@@^     E@@@@@@@@I   ")
   escreval("                                                              @@@@@@@@@@X    U@@@@@@@@@@    *@@@@@@@@@@;  ")
   escreval("                                                              @@@@@@@@@@8    G@@@@@@@@@@-   c@@@@@@@@@@r  ")
   escreval("                                                            :8@@@@@@@@@@8  -P@@@@@@@@@@@-  i&@@@@@@@@@@r  ")
   escreval("                                                            8@@@@@@@@@@@;  t@@@@@@@@@@@t  _@@@@@@@@@@@D-  ")
   escreval("                                                            J@@@@@@rG@@@@O* @@@@@@4u@@@@g; %@@@@@@*g@@@@i ")
   escreval("                                                             :l5zi&F@@@@@@* -cj1T8j@@@@@@4  *u3LSgH@@@@@& ")
   escreval("                                                                  g38@@@@8-      e#S@@@@Q^      ^@v@@@@@t ")
   escreval("                                                                  &! _**,        eP -!+~        ^&  ;+;-  ")
   escreval("                                                                  O~             Jt             ,#        ")
   escreval("")
   escreval("                                                                   Mercado de Credito de Carbono         ")
   escreval("                                                                           -------------          ")
   escreval("")
fimprocedimento



procedimento mercado()
inicio

   desenhoMercado()
   escreval("                                                                 Cotação do Crédito de Carobono:",cotacaoCredito)
   escreval("                                                                      ----")
   se usuario[sessaoLogado].vendedorOUcomprador=0 entao
      escreval("                                                              Suas futuras compensações:",usuario[sessaoLogado].dividaCo2:2:0," créditos de carbono")
      escreval("")
      escreval("                                                                • • • • • • • • • • • • • • • • • • • • • ")
   fimse
   para x de 1 ate qtdSessao faca
      se (usuario[x].vendedorOUcomprador=1) e (usuario[x].qtdAnuncio>0) entao
         para y de 1 ate usuario[x].qtdAnuncio faca
            se usuarioMercado[x,y].id_anuncio>0 entao
               escrevaL("                                                                      ___________________________")
               escrevaL("   ")
               escreval("                                                                          Vendedor: ",usuario[x].nome)
               escreval("                                                                          ID do anuncio:",usuarioMercado[x,y].id_anuncio )
               escreval("                                                                          Qtd. Creditos:",usuarioMercado[x,y].qtdCredAnuncio)
               escreval("                                                                          Valor(unidade):",usuarioMercado[x,y].precoCredAnuncio)
            fimse
         fimpara
      fimse
   fimpara
   escrevaL("                                                                      ___________________________")

   se usuario[sessaoLogado].vendedorOUcomprador = 1 entao
      escreval("                                                                      Esses são os anúncios disponíveis no momento.")
      escreval("")
      escreval("                                                                      [1] Anunciar")
      escreval("                                                                      [2] Pagina inicial")
      leia(op)
      escolha op
      caso 1
         anunciaCredito()
      caso 2
         paginainicial()
      outrocaso
         desenhoMercado()
         invalido
         mercado()
      fimescolha
   senao
      escreval("")
      escreval("                                                  Informe o ID do anúncio que você deseja comprar, ou pressione [0] para voltar: ")
      leia(idAnuncioTemp)
      se idAnuncioTemp =0 entao
         paginainicial()
      senao
         achouAnuncio:=0
         para x de 1 ate qtdSessao faca
            se (usuario[x].vendedorOUcomprador=1) e (usuario[x].qtdAnuncio>0) entao
               para y de 1 ate usuario[x].qtdAnuncio faca
                  se idAnuncioTemp=usuarioMercado[x,y].id_anuncio entao
                     achouAnuncio:=1
                  fimse
               fimpara
            fimse
         fimpara

         se achouAnuncio=1 entao
            finalizaCompra()
         senao
            limpatela()
            desenhoMercado()
            escreval("                                                                       O ID de anúncio informado não existe.")
            escreval("                                                                      Pressione [ENTER] para tentar novamente")
            leia(pause)
            mercado()
         fimse
      fimse
   fimse
fimprocedimento

procedimento finalizaCompra()
inicio
   desenhoMercado()

   escreval("                                                                        Anúncio selecionado:")
   para x de 1 ate qtdSessao faca
      se (usuario[x].vendedorOUcomprador=1) e (usuario[x].qtdAnuncio>0) entao
         para y de 0 ate usuario[x].qtdAnuncio faca
            se idAnuncioTemp=usuarioMercado[x,y].id_anuncio entao
               escreval(" ")
               escreval("                                                                          Vendedor: ",usuario[x].nome)
               escreval("                                                                          ID do anuncio:", usuarioMercado[x,y].id_anuncio)
               escreval("                                                                          Qtd. Creditos:",usuarioMercado[x,y].qtdCredAnuncio)
               escreval("                                                                          Valor(unidade):",usuarioMercado[x,y].precoCredAnuncio)
               escreval("")
               idCompraTemp:=x
               parametroTemp:=y
            fimse
         fimpara
      fimse
   fimpara

   escreval("                                                    Informe a quantidade de créditos de carbono que você deseja comprar: ")
   leia(credCompraTemp)
   se credCompraTemp > usuarioMercado[idCompraTemp,parametroTemp].qtdCredAnuncio entao
      erroCompra()
   senao
      confirmaCompra()
   fimse
fimprocedimento

procedimento confirmaCompra()
inicio
   desenhoMercado()
   escreval("                                                     Você realmente deseja efetuar a compra de ",credCompraTemp," Créditos de Carbono?")
   escreval("")
   escreval("                                                                         Valor total: R$", credCompraTemp*usuarioMercado[idCompraTemp,parametroTemp].precoCredAnuncio)
   escreval("                                                                               [S] Sim")
   escreval("                                                                               [N] Não")
   leia(opc)
   opc:=maiusc(opc)
   escolha opc
   caso "S"
      formaPagamento()
   caso "N"
      mercado()
   outrocaso
      desenhoMercado()
      invalido()
      confirmaCompra()
   fimescolha
fimprocedimento

procedimento erroCompra()
inicio
   desenhoMercado()
   escreval("                                                                      A quantidade de créditos desejada é maior que a quantidade informada no anúncio")
   escreval("")
   escreval("                                                                      [1] Inserir novamente")
   escreval("                                                                      [2] Voltar ao mercado")
   leia(op)
   escolha op
   caso 1
      finalizaCompra()
   caso 2
      mercado()
   outrocaso
      desenhoMercado()
      invalido()
      erroCompra()
   fimescolha
fimprocedimento

procedimento anunciaouolha()
inicio
   desenhoMercado()
   escreval("                                                                      Bem vindo ao mercado.")
   escreval("                                                                      Você deseja anunciar ou visitar o mercado?")
   escreval("                                                                      [1] Visitar o mercado")
   escreval("                                                                      [2] Anunciar Crédito de Carbono")
   leia(op)
   escolha op
   caso 1
      mercado()
   caso 2
      anunciaCredito()
   fimescolha
fimprocedimento



procedimento desenhopagamento()
inicio
   limpatela
   escreval("            _;;;;;;_                                                                                                                                           ")
   escreval("            @@@@@@@@@gi                                                                                                            _53!                        ")
   escreval("            @@E    _y@@G                                                                                                           r@@G                        ")
   escreval("            @@E      P@@-   ,kD%ggB8G'      tUWgg8#mmmG^  ^e8$gg08P;     Sm^-v8gg%x'  ;8$g%G-      -*G%ggg8P~    _rmT z#%ggPF_   vmg@@@mmd^    -TD%gg%Ac-      ")
   escreval("            @@E    -r@@%   ^GuL_  ;S@@,   ^@@g-  :b@@1L_ ,O3!   ~G@@,    @@@@E^-^3@@G@O^-_3@@T    '@@f^   c%@8   ~b@@@2*__c@@@^  ^TX@@gTTc_  'g@@u;--c8@@j-    ")
   escreval("            @@gSSSPg@@6-            e@r   h@@i    *@@*           _@@r    @@g*     @@@;     b@g    8@S      '&@1  ~b@@F     D@@S    r@@G     _8@@T      G@@u    ")
   escreval("            @@@@@@@%J_       -*3%ggg@@r   *@@G    f@@_     -cP8gg@@@r    @@8_     @@@_     3@@   ,@@@ggggggg@@8  ~b@@^     U@@4    r@@G     *@@g^      r@@8    ")
   escreval("            @@E            T@@%J:___h@r   ;@@g@@@@gr     *@@G*^__^@@r    @@8_     @@@_     3@@   ^@@j_________   ~b@@^     U@@4    r@@G     *@@g^      T@@D    ")
   escreval("            @@E           -@@q      e@r  -@@i_          ^#@8     _@@r    @@8_     @@@_     3@@    8@G            ~b@@^     U@@4    r@@G     _N@@v     -0@@r    ")
   escreval("            @@E            2@@X*^*8@@@r   :@@@@@@@@@gv   i@@u;^rm@@@r    @@8_     @@@_     3@@     @@&3*;;*lP0   ~b@@^     U@@4    ^@@@v*J:  -g@@%v**X@@%_     ")
   escreval("            ze;             _kg@@O^ -e_  _Q@P;    -t@@@;  _j&@@U! ~e_    ve*-     i53      ,5r      ^y%@@@gRC_   -;ei-     ;e3;     ;S8@@A:    -rD@@@DT-       ")
   escreval("                                         r@@-      ;@@@;                                                                                                       ")
   escreval("                                         -S@@gGbUG8@@J                                                                                                         ")
   escreval(" ")
   escreval(" ")

fimprocedimento


procedimento formaPagamento()
inicio
   desenhopagamento()
   escreval("                                                                    Qual será a forma de pagamento?")
   escreval(" ")
   escreval("                                                                 ______________________________________ ")
   escreval("                                                                |                                      | ")
   escreval("                                                                |  [1] para Cartão de Crédito / Débito | ")
   escreval("                                                                |                                      | ")
   escreval("                                                                |  [2] para PIX                        | ")
   escreval("                                                                |                                      | ")
   escreval("                                                                |  [0] para Cancelar                   | ")
   escreval("                                                                |______________________________________| ")
   leia(op)

   escolha op
   caso 1
      limpatela
      numerocartao()
   caso 2
      limpatela
      pix()
   caso 3
      limpatela
      paginainicial()
   outrocaso
      invalido()
      limpatela
      formapagamento()
   fimescolha

fimprocedimento

procedimento errocartao()
inicio
   escrevaL(" ")
   escreval("                                                                       O dado inserido está incorreto")
   escreval(" ")
   escreval("                                                                          Deseja tentar novamente? ")
   escreval(" ")
   escreval("                                                                         [S] para SIM [N] para NÃO")
   leia(opc)
   opc := maiusc(opc)

   escolha opc
   caso "S"
      usuario[sessaoLogado].opcSenha := 1
   caso "N"
      usuario[sessaoLogado].opcSenha := 2
   fimescolha

fimprocedimento

procedimento numerocartao()
var
   comparacao: inteiro
inicio

   limpatela
   desenhopagamento()
   escreval("                                                                       Número do cartão/débito ")
   escreval("                                                             |---------------------------------------------|   ")
   escreva("                                                              ")
   leia(usuario[sessaoLogado].numerocartao)
   comparacao := (compr(usuario[sessaoLogado].numerocartao))

   se (comparacao > 12) e (comparacao < 20) entao
      titularcartao()
   senao
      errocartao()
      se usuario[sessaoLogado].opcSenha = 1 entao
         numerocartao()
      senao
         paginainicial()
      fimse
   fimse

   limpatela
   cvccartao()
fimprocedimento

procedimento titularcartao()
inicio
   limpatela
   desenhopagamento()
   escreval("                                                                        Número do cartão/débito ")
   escreval("                                                             |---------------------------------------------|  ")
   escrevaL("                                                              Número: ", usuario[sessaoLogado].numerocartao)
   escreval("                                                             |---------------------------------------------|  ")
   escreval(" ")
   escreval("                                                                             Nome do Titular                  ")
   escrevaL("                                                             |---------------------------------------------|  ")
   escreva("                                                              ")
   leia(usuario[sessaoLogado].titularcartao)
   limpatela
   cvccartao()


fimprocedimento

procedimento cvccartao()
inicio
   limpatela
   desenhopagamento()
   escreval("                                                                        Número do cartão/débito ")
   escreval("                                                             |---------------------------------------------|  ")
   escrevaL("                                                              Número: ", usuario[sessaoLogado].numerocartao)
   escreval("                                                             |---------------------------------------------|  ")
   escreval(" ")
   escreval("                                                                            Nome do Titular                  ")
   escrevaL("                                                             |---------------------------------------------|  ")
   escrevaL("                                                              Nome: ", usuario[sessaoLogado].titularcartao)
   escreval("                                                             |---------------------------------------------|   ")
   escreval(" ")
   escreval("                                                                           Código de Segurança           ")
   escreval("                                                             |---------------------------------------------|   ")
   escreva("                                                              ")
   leia(usuario[sessaoLogado].cvccartao)

   se (compr(usuario[sessaoLogado].cvccartao)) = 3 entao
      limpatela
      validadecartao()
   senao
      errocartao()
      se usuario[sessaoLogado].opcSenha = 1 entao
         cvccartao()
      senao
         paginainicial()
      fimse
   fimse

fimprocedimento

procedimento validadecartao()
inicio
   limpatela
   desenhopagamento()
   escreval("                                                                        Número do cartão/débito ")
   escreval("                                                             |---------------------------------------------|  ")
   escrevaL("                                                              Número: ", usuario[sessaoLogado].numerocartao)
   escreval("                                                             |---------------------------------------------|  ")
   escreval(" ")
   escreval("                                                                            Nome do Titular                  ")
   escrevaL("                                                             |---------------------------------------------|  ")
   escrevaL("                                                              Nome: ", usuario[sessaoLogado].titularcartao)
   escreval("                                                             |---------------------------------------------|   ")
   escreval(" ")
   escreval("                                                                           Código de Segurança           ")
   escreval("                                                             |---------------------------------------------|   ")
   escreval("                                                              CVC: ", usuario[sessaoLogado].cvccartao)
   escreval("                                                             |---------------------------------------------|   ")
   escreval(" ")
   escreval("                                                              ex: 01/23      Data De Validade                ")
   escreval("                                                             |---------------------------------------------|   ")
   escreva("                                                              ")
   leia(usuario[sessaoLogado].validadecartao)
   se (compr(usuario[sessaoLogado].validadecartao)) = 5 entao
      limpatela
      confirmasenha()
      se usuario[sessaoLogado].opcSenha = 1 entao
         sucessoPagamento()
      senao
         paginainicial()
      fimse
   senao
      errocartao()
      se usuario[sessaoLogado].opcSenha = 1 entao
         validadecartao()
      senao
         paginainicial()
      fimse
   fimse

fimprocedimento

procedimento confirmacartao()
inicio
   limpatela
   desenhopagamento()
   escreval("                                                                         Número do cartão/débito ")
   escreval("                                                              |---------------------------------------------|  ")
   escrevaL("                                                               Número: ", usuario[sessaoLogado].numerocartao)
   escreval("                                                              |---------------------------------------------|  ")
   escreval(" ")
   escreval("                                                                             Nome do Titular                  ")
   escrevaL("                                                              |---------------------------------------------|  ")
   escrevaL("                                                               Nome: ", usuario[sessaoLogado].titularcartao)
   escreval("                                                              |---------------------------------------------|   ")
   escreval(" ")
   escreval("                                                                            Código de Segurança           ")
   escreval("                                                              |---------------------------------------------|   ")
   escreval("                                                               CVC: ", usuario[sessaoLogado].cvccartao)
   escreval("                                                              |---------------------------------------------|   ")
   escreval(" ")
   escreval("                                                                             Data De Validade                   ")
   escreval("                                                              |---------------------------------------------|   ")
   escreval("                                                               Validade: ", usuario[sessaoLogado].validadecartao)
   escreval("                                                              |---------------------------------------------|   ")
   escreval(" ")
   escreval("                                                                         Você confirma essa operação?                                               ")
   escreval(" ")
   escreval("                                                                             [S] Sim      [N] Não                                           ")
   leia(opc)
   opc := maiusc(opc)

   escolha opc
   caso "S"
      confirmasenha()
      se usuario[sessaoLogado].opcSenha = 1 entao
         sucessoPagamento()
      senao
         paginainicial()
      fimse
   caso "N"
      escreval("                                                                Pagamento Cancelado                ")
      escreval(" ")
      escreval("                                                Pressione <ENTER> para voltar para a Página Inicial")
      leia(pause)
      limpatela
      paginainicial()
   fimescolha


fimprocedimento

procedimento sucessopagamento()
inicio
   limpatela
   //comprador
   usuario[sessaoLogado].vezesCompensado:= usuario[sessaoLogado].vezesCompensado+1
   usuarioMercado[sessaoLogado,usuario[sessaoLogado].vezesCompensado].creditosComp:= credCompraTemp
   usuarioMercado[sessaoLogado,usuario[sessaoLogado].vezesCompensado].arvoresComp:=(credCompraTemp*1000)/22
   usuarioMercado[sessaoLogado,usuario[sessaoLogado].vezesCompensado].co2kgComp:= credCompraTemp * 1000
   usuario[sessaoLogado].dividaCo2:=usuario[sessaoLogado].dividaCo2 - credCompraTemp
   //vendedor
   usuario[idCompraTemp].saldoDinheiro:= usuarioMercado[idCompraTemp,parametroTemp].precoCredAnuncio * credCompraTemp
   usuarioMercado[idCompraTemp,parametroTemp].qtdCredAnuncio := usuarioMercado[idCompraTemp,parametroTemp].qtdCredAnuncio - credCompraTemp
   se usuarioMercado[idCompraTemp,parametroTemp].qtdCredAnuncio= 0 entao
      usuarioMercado[idCompraTemp,parametroTemp].id_anuncio:= 0
      qtdAnuncioGeral:=qtdAnuncioGeral - 1
   fimse

   escreval(" ")
   escrevaL(" ")
   escreval("                                                               Aguarde enquanto conferimos seu pagamento. ")
   escrevaL(" ")
   escreval("                                                    ____________________________________________________________________ ")
   escreva("                                       VERIFICAÇÃO |")
   timer (100)
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   escreva(" /")
   timer (0)
   limpatela

   desenhosucesso()

   escreval(" ")
   escrevaL(" ")
   escreval("                                                                                 Prontinho! ")
   escrevaL("  ")
   escreval("                                                    ____________________________________________________________________ ")
   escreval("                                                   |                                                                    |")
   escreval("                                       VERIFICAÇÃO |/ / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / | COMPLETA")
   escreval("                                                   |____________________________________________________________________|")
   escreval("                                                                                                                         ")
   escrevaL(" ")
   escrevaL("                                                                   Seu pagamento foi efetuado com sucesso!          ")
   escreval(" ")
   escreval("                                                         Você pode ver sua compensação na aba <Minhas Compensações> ")
   escreval(" ")
   escreval("                                                                      ___________________________________           ")
   escreval("                                                                     |                                   |           ")
   escreval("                                                                     |  [1] para Minhas Compensações     |          ")
   escreval("                                                                     |                                   |           ")
   escreval("                                                                     |  [2] para Página Inicial          |          ")
   escreval("                                                                     |___________________________________|          ")
   escreva("                                                                                      ")


   leia(op)

   escolha op
   caso 1
      limpatela
      compensacoes()
   caso 2
      limpatela
      paginainicial()
   fimescolha

fimprocedimento

procedimento pix()
inicio
   //mudacor("branco", "fundos")
   //mudacor("preto", "frente")
   desenhopagamento()


   escreval("        *@@@@@@@@@@@J    *@*    E@'    G% *@@@@E E@'    %% J@@@@@@@@@@@*  ")
   escreval("        T@T _____ _@e -_@@@u_@@@@@_^@t 8@@8___@m -_ ^@@@@g e@; _____ ;@T                                  Copie e cole")
   escreval("        T@T @@@@@__@e m@8@@@8*;      _*-_@@@g8@m t8c*****! e@; @@@@@ ;@T  ")
   escreval("        T@T @@@@@__@e m@ ^e^ eT *eeeeee_-e8@; eee^ @@@8e@@ e@; @@@@@ ;@T                          00020126580014br.gov.bcb.pix01365ce5fb9d-  ")
   escreval("        T@T rTTTT _@e m@     mC ;T@@@e CP _T- myT_ @@Tym@@ e@; TTTTT ;@T                          6253-4de7-9091-e40febc54054520400005303  ")
   escreval("        T@@@@@@@@@@@e m@ *@* @g E@;i@e g@ *@^ @m E@;L@F^@@ e@@@@@@@@@@@T                          9865406199.995802BR5925BAZAMPICHAUIN  ")
   escreval("         _--________- 6@@@@z-@@@i----  -_ T@*-_t@t_ ;@@@@@ -________---                           FORMATICALTD6009Sao Paulo62240520mpqri  ")
   escreval("        *g* 8@@@@&gge;- ;y@@g@@g* @@;_ U8 *g@@ggggg-^ggg*^ Tg@@g@@@g;^                            nter678522222516304A9EE  ")
   escreval("        ^e^ tm@ge--eee^ eeeeeeT   teeee_  ^e@@ ^eee-_eee@@eeeeeeee_ @@e^ ")
   escreval("        :tEU@@@e 5PteU^ Uc !tUUUUU-_Uet_  :t@@U0@8t-;@@@EE@%tyU@m   tX@T ")
   escreval("        *gt;@@;eg@@ge;- @m   ;;;;; -;egg8   ^;@@@@gg@@y;8&@@g@@@@gggg@@T                          Como pagar com Pix:")
   escreval("         -  @@@y_--_--X@@8---------;@@@*:@@@@@@@@@@,----@@@y-g@___--___     ")
   escreval("        -;;;;Tggg**g@@y;@@ggg@@g@@@g e@t^ T@@@;_    -;Ug@@gT g@@@g^ ggg*                          1 - Acesse o app ou site do seu banco")
   escreval("        ^UUU@g   5Pt%@0UUEttt@g cUUyteUUPtjU@@UEttttX@T 5PtttyU@m rtttt:     ")
   escreval("        ^UUU@g *UUPttt:  T@@@@@U^ 5yt^ FPtjU@@UEt@@EX@T 5PtttyUtjUCt@@t:                          2 - Busque a opção de pagar com Pix ")
   escreval("        -;%@L^ _;;*gT   g@@@@;t@T @@gT ^*gU;@@@m _;8m;Ug**ggg@@ T@@g@@g*    ")
   escreval("           -@@@@@@@-e@c @@@@@  -  @g-  %@@@@@@-  6@,   - _@y---  ----*@T                          3 - Leia o QR code ou código Pix")
   escreval("        T@y;@@g@@&gge;Ugg@@@@;^ Cg@@@@g^_@@g^ g@@@gggggg*L@@g^ gU;-         ")
   escreval("        ;mmmmC *m- T8@T  T@@@@g   @@@e *Jmi   TCm; r* ;T@@@8TTTTG@;  -T_                          4 - Pronto! Você verá a confirmação do pagamento")
   escreval("        ^e^  _e; teeg@8ee8@8eeT *eem@e Teeee_ eee^ tee@@UU@@@@@@@e_ em@T    ")
   escreval("        T@T AK*e8cc8e*g@@@@T    m@0K*_ ED*X@g88@@T Ag@X*D0@@@j*@m E8*j@T    ")
   escreval("        T@T @@@e_  _e@@@@@@@@ ^@J_@@@t -_  _&@_u@T _L@@@@@___8@_- g@  _                           A confirmação do pagamento será realizada em até 10 minutos.")
   escreval("        T@T ^TgT 8gge;- @m m@;;;;; -;eg^  *gT;;_    ;@@@@@@@g^ ;_ Ug@@@T    ")
   escreval("        T@T @@TTT  T8@T mi m@@@@gm-_meTTr _TUm@m ;TTtmmm@@@8TTT@gTTTm%@T    ")
   escreval("        ^e^ teeee--eeeeee* *e@@@8e-_eg@mee8@meeeeeeeT   @@eeeee@@@meem@T    ")
   escreval("        ;@@@@@@@@@@@L ^**^ t8*****Dg@@@; *X@@@ _*_  ,8; @@ L8, @g*K8@@@T                          Pressione <ENTER> quando o pagamento for efetuado")
   escreval("        T@u_______;@e P@ r@@@@8 P@^L@@@@@@@@@@@@@@@_ _  @@ -_  @@@*_@&_     ")
   escreval("        T@T @@@@@__@e m@ T@5^ ;@@@@@@e^^;@X^8@^^^X@@@@@@@@@@@@@@%^8@ ;@T    ")
   escreval("        T@T @@@@@__@e m@*X@@@*j@@@@@*e8@@*u8J*888u*@@*P8@@ L8, 888J**j@T    ")
   escreval("        T@T 5UUUU-_@e cU@@UUU@@U@@@@U* FG@@t@@   cUUUU^ @@t^   t! FUU8@T    ")
   escreval("        T@gmmmmmmm8@e imTCm; @g ;T@@m*  _@@@yT ;mmmmmmmmJTTem_ @@mmmm%@T    ")
   escreval("        -^^^^^^^^^^^- _^ -^- ^_   :^^-   ^^^   -^^^^^^^^   -^  ^^^^^^^^-    ")
   leia(pause)

   limpatela



   sucessopagamento()

fimprocedimento

procedimento desenhoCompensacoes()
inicio
   limpatela
   escreval("                                                                        ^*_                            ")
   escreval("                                                                        _33t;-                         ")
   escreval("                                                                        _33F3Cr'                       ")
   escreval("                                                                        ^33-'*C3L-                 -   ")
   escreval("                                                                        J3F   -*33*               ^t^  ")
   escreval("                                                                       ^33^     _J3J-           ^J33r  ")
   escreval("                                                                      -f3v        r3u_       ,ru3Tt3F  ")
   escreval("                                                                      J3u-         rT;   _;TC3F!' r33  ")
   escreval("                                                                     T33:           _;rt331r^-    rj3  ")
   escreval("                                                                    ^33;    _    ^Lf3CT*^-        Jez  ")
   escreval("                                                                    J3u    *-  ;x3x*_            -e2*  ")
   escreval("                                                                    u3T   *^ -z3F^   -,_-        *EE-  ")
   escreval("                                                                    v3F  :1 -13r  _*c^          _ES*   ")
   escreval("                                                                    _33, ic +5T ^FJ_           _eyv    ")
   escreval("                                                                     ,33;j* t2~v3^            ;SVr     ")
   escreval("                                                                      -Te2r JEEl- _;        ^3Pj^      ")
   escreval("                                                                        -*i ;Sr  _v      :raPt^        ")
   escreval("                                                                             !  -E_-_^*FhyJ;-          ")
   escreval("                                                                                sE3xvr;,-              ")
   escreval("")

fimprocedimento

procedimento compensacoes()
inicio
   desenhoCompensacoes()
   escreval("                                                                     Bem vindo sua área de compensasões")
   escreval("                                                       Aqui você pode ver seu histórico de compensações detalhadamente")
   escreval("")
   escreval("                                                                 • • • • • • • • • • • • • • • • • • • • •")
   se usuario[sessaoLogado].vezesCompensado=0 entao
      escreval("")
      escreval("                                                                       Você não possui compensações")
      escreval("                                          Visite a calculadora para calcular suas emissões e o mercado para compensar suas emissões")
      escreval("")
      escreval("")
      escreval("                                                                       [1] Calculadora de Co2")
      escreval("                                                                       [2] Mercado de Crédito de Carbono")
      escreval("                                                                       [0] Voltar")
      leia(op)
      escolha op
      caso 1
         calculadora()
      caso 2
         mercado()
      caso 0
         minhaconta()
      outrocaso
         desenhoCompensacoes()
         invalido()
         compensacoes()
      fimescolha
   senao
      para x de 1 ate usuario[sessaoLogado].vezesCompensado faca
         escreval("                                                            --------------------------------------------")
         escreval("                                                            Créditos de carbono adquiridos: ", usuarioMercado[sessaoLogado,x].creditosComp:2:0)
         escreval("                                                            Co2 compensado(kg):",usuarioMercado[sessaoLogado,x].co2kgComp:2:0)
         escreval("                                                            Total de árvores plantadas: ",usuarioMercado[sessaoLogado,x].arvoresComp:2:0)
         escreval("                                                            --------------------------------------------")
         escreval("")
      fimpara
      escreval("                                                                Essas são suas compensações desde o começo")
      escreval("")
      escreval("                                                                         [1] Minha conta")
      escreval(" ")
      escreval("                                                                         [2] Pagina inicial")
      leia(op)
      escolha op
      caso 1
         minhaconta()
      caso 2
         paginainicial()
      outrocaso
         desenhocompensacoes()
         invalido()
         compensacoes()
      fimescolha
   fimse
   //vendedor

fimprocedimento


procedimento minhaconta()
inicio
   limpatela
   checalogin()
   limpatela
   escreval("             _3e3;           reeJ    Tg8-                 _@@_                              -*3XmGET_                                                       ")
   escreval("             T@@@@r         j@@@@    *GP                  _@@_                            _#@@8Cvzyg@X                                -@@_                  ")
   escreval("             T@@;@@,       L@@+@@     _-    -_   ^;^      _@@_ -^;:        -,;;^-        ,@@G       -_      ,;;^-       _-  _;;_     _^@@;__-     _;;^'     ")
   escreval("             T@@ L@@_     *@@-!@@    T@@    @@k@@G#@@&_   _@@G@gG8@@R    C@&GPU%@@*      @@%             5@@%bb%@@P    T@QD@8G%@@x  :%$@@g%%S  ;@@84P8@@e   ")
   escreval("             T@@  U@@    ^@@: !@@    T@@    @@g,    g@8   _@@X-   -@@J   -      F@@     _@@F            %@M-    -&@%   T@@F    ;@@:   -@@_      -     ,@@_  ")
   escreval("             T@@   8@g  _@@^  !@@    T@@    @@T     u@&   _@@_     %@y    ^tX8%%&@@     -@@j           ^@@,      !@@_  T@@      @@!   -@@_      _iPO8%%@@^  ")
   escreval("             T@@   -@@P-@@L   !@@    T@@    @@T     x@&   _@@_     %@y   g@8*:__T@@      0@@-          ,@@^      r@@-  T@@      @@!   -@@_     S@@T^__:@@^  ")
   escreval("             T@@    :@@@@E    !@@    T@@    @@T     x@&   _@@_     %@y  ,@@^   -P@@      _@@@r     _J3  %@&_    ^@@j   T@@      @@!   -@@*     @@x    c@@^  ")
   escreval("             r@@     ;@@X     ;@@    r@@    @@r     s@g   '@@'     8@e   c@@@Q@gF@@        !#@@@@@@@G~   cg@@@@@@G^    r@@      @@;    v@@@@%  ^g@@Q@@E&@,  ")
   escreval("                                                                            __                 '_-          -__                          -_-      ._        ")




   se usuario[sessaoLogado].vendedorOUcomprador = 1 entao
      escreval("                                                        ")
      escreval("                                                        ")
      escreval("                                                        ")
      escreval(" ")
      escreval(" ")
      escreval("                                                                      ___________________________                  ")
      escreval("                                                                     |                           |                ")
      escreval("                                                                     |  [1] para Carteira        |                  ")
      escreval("                                                                     |                           |                 ")
      escreval("                                                                     |                           |                  ")
      escreval("                                                                     |  [2] para Área            |                  ")
      escreval("                                                                     |                           |                   ")
      escreval("                                                                     |                           | ")
      escreval("                                                                     |  [3] para Logoff          | ")
      escreval("                                                                     |                           | ")
      escreval("                                                                     |                           |              ")
      escreval("                                                                     |  [0] para Voltar          |                  ")
      escreval("                                                                     |___________________________|                   ")
      escreval("                                                                                                ")

      leia(op)

      escolha op
      caso 1
         limpatela
         carteira()

      caso 2
         limpatela
         tamanhoarea()

      caso 3
         logoff()

      caso 0
         paginainicial()

      outrocaso
         invalido()
         minhaconta()
      fimescolha

   senao
      escreval("                                                        ")
      escreval("                                                        ")
      escreval("                                                        ")
      escreval(" ")
      escreval(" ")
      escreval("                                                                     _______________________________                  ")
      escreval("                                                                    |                               |                ")
      escreval("                                                                    |  [1] para Minhas Compensações |                 ")
      escreval("                                                                    |                               |                 ")
      escreval("                                                                    |                               |                  ")
      escreval("                                                                    |  [2] Logoff                   |                  ")
      escreval("                                                                    |                               |                  ")
      escreval("                                                                    |                               |                  ")
      escreval("                                                                    |  [0] para Voltar              |                  ")
      escreval("                                                                    |_______________________________|                   ")
      escreval("                                                                                                                        ")
      leia(op)

      escolha op
      caso 1
         compensacoes()
      caso 2
         logoff()
      fimse
   caso 0
      paginainicial()

   outrocaso
      invalido()
      minhaconta()

   fimescolha



fimprocedimento


procedimento carteira()
inicio
   checalogin()
   escreval("                                           @@@@@@                                                                                            ")
   escreval("                                        @@@@#####@@#                               @@#                      #@@#                             ")
   escreval("                                      @@@                #######       ##   ###  ##@@####       #####        ##      #   ####    #######     ")
   escreval("                                     #@@               ##      @@@     @@@@#      #@@#       @@#     #@@    #@@#    #@@@#      ##      @@@   ")
   escreval("                                     #@@                   #####@@     @@#        #@@#      @@########@@@   #@@#    #@@             ####@@#  ")
   escreval("                                     #@@#              @@@#    #@@     @@#        #@@#      @@#             #@@#    #@@        @@@#    #@@#  ")
   escreval("                                      #@@@#       ##  #@@      @@@     @@#         @@#      #@@#            #@@#    #@@       #@@#     #@@#  ")
   escreval("                                         ##@@@@@@##     #@@@@## ##     ###          #@@@@#    ##@@@@@@##     ##     ###         #@@@@## ##   ")
   escreval("                                                                                                                                                     ")
   escreval("                                                                                                                                                     ")
   escreval("                                                                                                                                                     ")
   escreval("                                                                                                                                                     ")
   escreval("                                                                    SALDO: R$", usuario[sessaoLogado].saldoDinheiro)
   escreval("                                                                                                                                                     ")
   escreval("                                                                                                                                                     ")
   escreval("                                                                                                                                                     ")
   escreval("                                                                    CRÉDITOS DE CARBONO: ", usuario[sessaoLogado].saldoCredito, "                    ")
   escreval("                                                                                                                                                     ")
   escreval("                                                                                                                                                     ")
   escreval("                                                                                                                                                     ")
   escreval("                                                                      ___________________________                  ")
   escreval("                                                                     |                           |                  ")
   escreval("                                                                     |  [1] para Sacar           |                  ")
   escreval("                                                                     |                           |                  ")
   escreval("                                                                     |                           |                  ")
   escreval("                                                                     |  [2] para Extrato         |                  ")
   escreval("                                                                     |                           |                   ")
   escreval("                                                                     |                           |              ")
   escreval("                                                                     |  [0] para Voltar          |                  ")
   escreval("                                                                     |___________________________|                   ")
   escreva("                                                                                   ")
   leia(op)

   escolha op
   caso 1
      limpatela
      informeSaque()
   caso 2
      limpatela
      extrato()
   caso 0
      limpatela
      minhaconta()
   fimescolha

fimprocedimento

procedimento desenhosaque()
inicio
   limpatela
   escreval("                               _;rteeur;_                                                                                                            ")
   escreval("                            ^8@@@@@@@@@@@@%.                                                                                                         ")
   escreval("                           x@@@@c_    -!1%&_                                                                                                         ")
   escreval("                          '@@@@_                                                                                                                     ")
   escreval("                          -@@@@T                  _TXQ@@@@@@@@AT           :ug@@@@@@b; -@@@^      k@@&-         T@@@*         ;S&@@@@@@@Gr-          ")
   escreval("                           i@@@@gt_              ^@@@QX3tJtSM@@@@^       _B@@@@De3V0@@@G@@@;      %@@@_         E@@@u       C@@@@OuvvtX@@@@5         ")
   escreval("                            -3@@@@@@@GT_          ,-         _@@@@_     ;@@@@*       *8@@@@;      %@@@_         E@@@u     _g@@@!        ^@@@g-       ")
   escreval("                               ,lD@@@@@@@b^                   &@@@^     8@@@L          G@@@;      %@@@_         E@@@u     2@@@i          S@@@c       ")
   escreval("                                    _J8@@@@%-      -!1U$&@@@@@@@@@^    _@@@@           4@@@;      %@@@_         E@@@u     @@@@@@@@@@@@@@@@@@@I       ")
   escreval("                                       _0@@@B    :8@@@@m5lTTTT@@@@^    _@@@@           4@@@;      %@@@_         E@@@u     @@@@5TTTTTTTTTTTTTr-       ")
   escreval("                                        L@@@@   -@@@@;        g@@@^    -&@@@~          4@@@;      8@@@^         E@@@u     8@@@c                      ")
   escreval("                          rJ:          *@@@@r   ^@@@&        !@@@@^     v@@@@,       !8@@@@;      e@@@8-      ,8@@@@u     ^@@@@;                     ")
   escreval("                          %@@@gDStJFk8@@@@@;     G@@@@u;:^cG@@@@@@^      F@@@@8fcrtG@@@@@@@;       8@@@@XTriH@@@8@@@u      _g@@@@Gi!^^!c38&@P        ")
   escreval("                          -*E#@@@@@@@@&Ht_        ^Eg@@@@@@#x_^@@g_       -rR@@@@@@Qk^ 4@@@;        ^P&@@@@@QX* '@@@r        _cH@@@@@@@@@%Xi-        ")
   escreval("                                -___-                 -__-                    -___     4@@@;            ___-                      -___-              ")
   escreval("                                                                                       4@@@;                                                         ")
   escreval("                                                                                       4@@@;                                                         ")
   escreval("                                                                                       *GmA_                                                         ")
   escreval(" ")

fimprocedimento

procedimento informeSaque()    // informar o valor do saque
inicio
   limpatela
   desenhosaque()
   escreval("                                                                                SALDO: R$", usuario[sessaoLogado].saldoDinheiro)
   escreval(" ")
   escreva("                                                        Informe a quantia de dinheiro que você deseja sacar de sua conta: ")
   leia(saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].quantiasaque)

   se usuario[sessaoLogado].saldoDinheiro >= saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].quantiasaque entao
      titularCo()
   senao
      escrevaL("                                                                                    ERRO")
      escreval(" ")
      escreval("                                                 A quantia informada não corresponde com seu saldo, favor inserir um valor válido")
      escreval(" ")
      escreval("                                                                          Deseja tentar novamente?")
      escreval(" ")
      escreval("                                                                         [S] para SIM  [N] para NÃO ")
      leia(opc)
      opc := maiusc(opc)

      escolha opc
      caso "S"
         informesaque()
      caso "N"
         carteira()
      fimescolha
   fimse

   titularCo()

fimprocedimento

procedimento titularCo()    // titular da conta
inicio
   limpatela
   desenhosaque()
   escreval("                                                              SALDO: R$", usuario[sessaoLogado].saldoDinheiro, "           Saque: ", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].quantiasaque)
   escreval(" ")
   escreval("                                                                        Nome do Titular da Conta         ")
   escrevaL("                                                              |-----------------------------------------|")
   escreva("                                                               ")
   leia(saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].titularConta)

   numeroCoBa()
fimprocedimento

procedimento numeroCoBa()     // numero da conta bancaria
inicio
   limpatela
   desenhosaque()
   escreval("                                                              SALDO: R$", usuario[sessaoLogado].saldoDinheiro, "           Saque: R$", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].quantiasaque)
   escreval(" ")
   escreval("                                                                        Nome do Titular da Conta         ")
   escrevaL("                                                              |-----------------------------------------|")
   escreval("                                                               Nome: ", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].titularConta)
   escrevaL("                                                              |-----------------------------------------|")
   escreval(" ")
   escrevaL("                                                                        Número da Conta Bancária         ")
   escrevaL("                                                              |-----------------------------------------|")
   escreva("                                                               ")
   leia(saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].numeroContaBancaria)

   numeroAgBa()
fimprocedimento

procedimento numeroAgBa()   // numero da agencia
inicio
   limpatela
   desenhosaque()
   escreval("                                                              SALDO: R$", usuario[sessaoLogado].saldoDinheiro, "           Saque: R$", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].quantiasaque)
   escreval(" ")
   escreval("                                                                        Nome do Titular da Conta         ")
   escrevaL("                                                              |-----------------------------------------|")
   escreval("                                                               Nome: ", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].titularConta)
   escrevaL("                                                              |-----------------------------------------|")
   escreval(" ")
   escrevaL("                                                                        Número da Conta Bancária         ")
   escrevaL("                                                              |-----------------------------------------|")
   escreval("                                                               Número da conta: ", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].numeroContaBancaria)
   escrevaL("                                                              |-----------------------------------------|")
   escrevaL(" ")
   escreval("                                                                       Número da Agência Bancária        ")
   escrevaL("                                                              |-----------------------------------------|")
   escreva("                                                               ")
   leia(saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].numeroAgenciaBancaria)

   tipoCo()
fimprocedimento

procedimento tipoCo()    // tipo da conta
inicio
   limpatela
   desenhosaque()
   escreval("                                                              SALDO: R$", usuario[sessaoLogado].saldoDinheiro, "            Saque: R$", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].quantiasaque)
   escreval(" ")
   escreval("                                                                        Nome do Titular da Conta         ")
   escrevaL("                                                              |-----------------------------------------|")
   escreval("                                                               Nome: ", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].titularConta)
   escrevaL("                                                              |-----------------------------------------|")
   escreval(" ")
   escrevaL("                                                                        Número da Conta Bancária         ")
   escrevaL("                                                              |-----------------------------------------|")
   escreval("                                                               Número da conta: ", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].numeroContaBancaria)
   escrevaL("                                                              |-----------------------------------------|")
   escrevaL(" ")
   escreval("                                                                       Número da Agência Bancária        ")
   escrevaL("                                                              |-----------------------------------------|")
   escreval("                                                               Número da agência: ", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].numeroAgenciaBancaria)
   escrevaL("                                                              |-----------------------------------------|")
   escreval(" ")
   escreval("                                                                            Tipo de Conta              ")
   escrevaL("                                                              |-----------------------------------------|")
   escreva("                                                               ")
   leia(saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].tipoConta)
   nomeBa()
fimprocedimento

procedimento nomeBa()   // nome do banco
inicio
   limpatela
   desenhoSaque()
   escreval("                                                              SALDO: R$", usuario[sessaoLogado].saldoDinheiro, "            Saque: R$", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].quantiasaque)
   escreval(" ")
   escreval("                                                                        Nome do Titular da Conta         ")
   escrevaL("                                                              |-----------------------------------------|")
   escreval("                                                               Nome: ", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].titularConta)
   escrevaL("                                                              |-----------------------------------------|")
   escreval(" ")
   escrevaL("                                                                        Número da Conta Bancária         ")
   escrevaL("                                                              |-----------------------------------------|")
   escreval("                                                               Número da conta: ", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].numeroContaBancaria)
   escrevaL("                                                              |-----------------------------------------|")
   escrevaL(" ")
   escreval("                                                                       Número da Agência Bancária        ")
   escrevaL("                                                              |-----------------------------------------|")
   escreval("                                                               Número da agência: ", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].numeroAgenciaBancaria)
   escrevaL("                                                              |-----------------------------------------|")
   escreval(" ")
   escreval("                                                                            Tipo de Conta              ")
   escrevaL("                                                              |-----------------------------------------|")
   escreval("                                                               Tipo: ", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].tipoConta)
   escrevaL("                                                              |-----------------------------------------|")
   escreval("")
   escreval("                                                                            Nome do Banco              ")
   escrevaL("                                                              |-----------------------------------------|")
   escreva("                                                               ")
   leia(saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].nomeBanco)

   confirmasaque()

fimprocedimento

procedimento confirmaSaque()    // para confirmar os dados e a operação de saque
inicio

   limpatela
   desenhoSaque()
   escreval("                                                              SALDO: R$", usuario[sessaoLogado].saldoDinheiro, "           Saque: R$", saqueRelatorio[sessaoLogado, countSaque].quantiasaque)
   escreval(" ")
   escreval("                                                                        Nome do Titular da Conta         ")
   escrevaL("                                                              |-----------------------------------------|")
   escreval("                                                               Nome: ", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].titularConta)
   escrevaL("                                                              |-----------------------------------------|")
   escreval(" ")
   escrevaL("                                                                        Número da Conta Bancária         ")
   escrevaL("                                                              |-----------------------------------------|")
   escreval("                                                               Número da conta: ", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].numeroContaBancaria)
   escrevaL("                                                              |-----------------------------------------|")
   escrevaL(" ")
   escreval("                                                                       Número da Agência Bancária        ")
   escrevaL("                                                              |-----------------------------------------|")
   escreval("                                                               Número da agência: ", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].numeroAgenciaBancaria)
   escrevaL("                                                              |-----------------------------------------|")
   escreval(" ")
   escreval("                                                                              Tipo de Conta              ")
   escrevaL("                                                              |-----------------------------------------|")
   escreval("                                                               Tipo: ", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].tipoConta)
   escrevaL("                                                              |-----------------------------------------|")
   escreval("")
   escreval("                                                                              Nome do Banco              ")
   escrevaL("                                                              |-----------------------------------------|")
   escreval("                                                                Nome: ", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].nomeBanco)
   escrevaL("                                                              |-----------------------------------------|")
   escreval(" ")
   escreval("                                                                      Você confirma essa operação?                                               ")
   escreval(" ")
   escreval("                                                                          [S] Sim      [N] Não                                           ")
   leia(opc)

   opc := maiusc(opc)

   escolha opc
   caso "S"
      confirmasenha()
      se usuario[sessaoLogado].opcSenha = 1 entao
         sucessoSaque()
      senao
         paginainicial()
      fimse
   caso "N"
      escreval("                                                                                 Saque Cancelado                ")
      escreval(" ")
      escreval("                                                                Pressione <ENTER> para voltar para a Página Inicial")
      leia(pause)
      limpatela
      paginainicial()
   fimescolha

fimprocedimento

procedimento sucessoSaque()   // saque foi um sucesso
inicio

   usuario[sessaoLogado].saldoDinheiro := usuario[sessaoLogado].saldoDinheiro - saqueRelatorio[sessaoLogado,usuario[sessaoLogado].vezesSacado].quantiasaque
   limpatela
   desenhosucesso()
   escrevaL("                                                     Perfeito! Seu saque de ", saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].quantiasaque, " foi enviado a sua conta com sucesso.")
   escrevaL(" ")
   escrevaL("                                                                   Seu saldo agora está com R$", usuario[sessaoLogado].saldoDinheiro  )
   escreval(" ")
   escreval("   ")
   escreval("                                                                     _______________________________                  ")
   escreval("                                                                    |                               |                ")
   escreval("                                                                    |  [1] para Página Inicial      |                 ")
   escreval("                                                                    |                               |                 ")
   escreval("                                                                    |                               |                  ")
   escreval("                                                                    |  [2] Carteira                 |                  ")
   escreval("                                                                    |                               |                  ")
   escreval("                                                                    |                               |                  ")
   escreval("                                                                    |  [0] para Voltar              |                  ")
   escreval("                                                                    |_______________________________|                   ")
   escreval("                                                                                                                        ")
   leia(op)
   usuario[sessaoLogado].vezesSacado := usuario[sessaoLogado].vezesSacado + 1
   escolha op
   caso 1
      compensacoes()
   caso 2
      logoff()
   fimse
caso 0
   paginainicial()

outrocaso
   invalido()
   minhaconta()

fimescolha
fimprocedimento

procedimento extrato()
inicio



   escreval("                                   @@@@@@@@@@@@:                    .::                                        ::                           ")
   escreval("                                   @@#                              !@@:                                      :@@:                          ")
   escreval("                                   @@#            :@@!       #@@ .@@@@@@@@@#   .@@. #@@@#    :#@@@@@@@:     @@@@@@@@@@      :@@@@@@@#.      ")
   escreval("                                   @@#             .@@@.   :@@!     !@@:       .@@@@#       ##:     .@@#      :@@:        #@@#.    :@@@:    ")
   escreval("                                   @@@@@@@@@@@.      #@@! #@@.      !@@:       .@@@.                 :@@.     :@@:       #@@:        #@@:   ")
   escreval("                                   @@#                .@@@@!        !@@:       .@@!           :@@@@@@@@@.     :@@:      .@@#         :@@#   ")
   escreval("                                   @@#                #@@@@@.       !@@:       .@@!        .@@@:     :@@.     :@@:      .@@#         :@@!   ")
   escreval("                                   @@#              :@@!  !@@#      !@@:       .@@!        !@@:      :@@.     :@@:       !@@!       .@@@    ")
   escreval("                                   @@@@@@@@@@@@:   #@@.    .@@@.    .@@@:.:#   .@@!        .@@@:   #@@@@.      @@@!..#    !@@@#:..!@@@#     ")
   escreval("                                    ...........   ...        ...      .#@@#.    ..            :#@@:.  ..        .!@@#:       .#@@@#.        ")
   escreval(" ")
   escreval(" ")
   escreval(" ")
   escreval(" ")
   escreval(" ")

   se usuario[sessaoLogado].vezesSacado = 0 entao
      escreval("                                                       Você ainda não realizou nenhum saque em nossa plataforma ")
      escreval(" ")
      escrevaL("                                                       Caso deseje realizar um saque, aperte [1] para sacar ")
      escreval(" ")
      escreval("                                                                    Ou [0] para voltar para sua conta           ")
      escreva("                                                                                   ")
      leia(op)

      escolha op
      caso 1
         limpatela
         informesaque()
      caso 2
         limpatela
         minhaConta()
      outrocaso
         invalido()
         limpatela
         extrato()
      fimescolha

   senao
      se usuario[sessaoLogado].vezesSacado = 1 entao
         escreval("                                                                Você já realizou", usuario[sessaoLogado].vezesSacado," saque em nossa plataforma!")
         escreval("                                                                _______________________")
         escreval("                                                                Saque número 1          ")
         escreval("                                                                R$",saqueRelatorio[sessaoLogado, 1].quantiasaque)
         escreval("                                                                _______________________ ")
         escreval("                                                                  ")
         escreval("                                                                           ___________________________                                                    ")
         escreval("                                                                          |                           |                                                   ")
         escreval("                                                                          |  [1] para Sacar           |                                                    ")
         escreval("                                                                          |                           |                                                    ")
         escreval("                                                                          |  [2] para Minha Conta     |                                                     ")
         escreval("                                                                          |                           |                                                    ")
         escreval("                                                                          |  [3] para Página Inicial  |                                                    ")
         escreval("                                                                          |                           |                                                    ")
         escreval("                                                                          |  [0] para Sair            |                                                    ")
         escreval("                                                                          |___________________________|                                                    ")
         escreva("                                                                                         ")
         leia(op)

         escolha op
         caso 1
            limpatela
            informesaque()
            caso2
            limpatela
            minhaConta()
            caso3
            limpatela
            paginaInicial()
         outrocaso
            invalido()
            limpatela
            extratoCarteira()
         fimescolha

      senao
         escreval("                                                                Você já realizou", usuario[sessaoLogado].vezesSacado," saques em nossa plataforma!")

         para x de 1 ate usuario[sessaoLogado].vezesSacado faça
            escreval("                                                                _______________________")
            escreval("                                                                Saque número",x )
            escreval("                                                                R$",saqueRelatorio[sessaoLogado, usuario[sessaoLogado].vezesSacado].quantiasaque)

         fimpara
         escrevaL("                                                                _______________________")
      fimse
   fimse
   escreval("     ")








fimprocedimento




procedimento confirmaSenha()
var
   confirmesenha: caractere
inicio
   limpatela

   escreval("                                       rju-                                                                                                 _T                  ")
   escreval("         _D@bS6%x                     D@   P8                                     *@D2P%^                        *@D2P%^                    T@-                 ")
   escreval("        ,@b        ,3AGS*   *r;SGS^ -e@@eT *v  ,u,PG_ -e_zGXr c6AJ    *yXXv-      Q@       x;   ;3  _tUAXi       Q@        TUXPr   F;rXG3-  T@;3GU*   *EdG2^    ")
   escreval("        b@-       U@,  _@g  G@*  v@:  g%   G@  T@V    _@#- _@g_  @8  &8   j@-     -V@&P;   @y   5@  _-   @K      -V@&P;  _@t   %g  @@,  D@  T@t  ,@J  ,   v@'   ")
   escreval("        S@_       @G    j@- G@   ^@;  g%   G@  T@-    _@r   @y   %g _@gXXXbG-        -T@%  @y   5@  ;8GUX@8         -T@% i@RXXXAP  @X   x@  T@-   @5  SNUX%@_   ")
   escreval("        -@@^   _; #@_  _@8  G@   ^@;  g%   G@  T@-    _@r   @y   %g  @%-   -      *-  -@@  @$  :g@  @8  _@8      *-  -@@ _@2       @X   x@  T@-   @5 T@,  3@_   ")
   escreval("          ^3HG4F_  ;2GG5^   *v   -e_  cr   *v  ,e     -e_   x;   rc   rVGHyL      rEGGE*   -1GXc^3  _jHPrrr      rEGGE*   -vUGbE~  F!   ^3  ,e    u;  rUX3^e-   ")
   escreval("                                                                                                                                                                ")
   escreval("                                 _rfX8ggggg8A5c^                                        ")
   escreval("                             _F%@85r^_     -,*1#@ge^                                              ___________________________   ")
   escreval("                           i@@x_                 -T%@5-                                          |                           |")

   se usuario[sessaoLogado].fisicooujuri = "pessoa física" entao
      escreval("                         T@8^                       _P@S                                         CPF: ",usuario[sessaoLogado].cnpj)
   senao
      escreval("                         T@8^                       _P@S                                         CNPJ: ",usuario[sessaoLogado].cnpj)
   fimse

   escreval("                       _g@^                           _8@;                                       |___________________________|")
   escreval("                      ,@8             ^Lic;-            x@c                                       ")
   escreval("                     -@$           r0@@@@@@@@t           j@^                                                        ")
   escreval("                     4@'         -g@@@@@@@@@@@@^          @@                                     ")
   escreval("                     @8          G@@@@@@@@@@@@@@          F@,                                     ___________________________")
   escreval("                    -@S          8@@@@@@@@@@@@@@          !@*                                    |                           |")
   escreval("                     @R          ^@@@@@@@@@@@@@v          T@^                                    Nome: ",usuario[sessaoLogado].nome)
   escreval("                     8@           _8@@@@@@@@@g;           %@                                     |___________________________| ")
   escreval("                     _@X        _UQ3^rEG8DPT^v08;        r@L                                                               ")
   escreval("                      *@3     _8@@@@@@MRbG%@@@@@@&^     !@k                                                                     ")
   escreval("                       ;@8-  !@@@@@@@@@@@@@@@@@@@@@3   e@F                                       ")
   escreval("                        -b@3;@@@@@@@@@@@@@@@@@@@@@@@Jc@g:                                         ")
   escreval("                          _H@@@@@@@@@@@@@@@@@@@@@@@@@%;                                           ")
   escreval("                             rD@@@@@@@@@@@@@@@@@@@%J-                                             ")
   escreval("                                _cS8@@@@@@@@@%Uv^                                                 ")
   escreval("                                                                                                  ")
   escreval("                                                           Para efetuar a ação desejada, confirme sua senha.             ")
   escreval("                                                                                                 ")
   escreval("                                                                                                 ")
   escreval("                                                                  ____________________________________                          ")
   escreval("                                                                 |                                    |")
   escreva("                                                                  Senha: ")
   leia(confirmesenha)

   se confirmesenha = usuario[sessaoLogado].senha entao
      usuario[sessaoLogado].opcSenha := 1
   senao
      escreval("                                                                 |____________________________________|                                ")
      escreval("                                                                                                 ")
      escreval("                                                                           <SENHA INCORRETA>                               ")
      escreval("                                                                                                 ")
      escreval("                                                                        Deseja tentar novamente?                        ")
      escreval("                                                                       [S] para Sim  [N] para Não                     ")
      escreva("                                                                                    ")
      leia(opc)
      opc := maiusc(opc)

      escolha opc
      caso "S"
         confirmasenha()
      caso "N"
         usuario[sessaoLogado].opcSenha := 3
      fimescolha
   fimse
fimprocedimento

procedimento desenhoSucesso()
inicio
   escreval("                                                                                                                                                           #@@@  ")
   escreval("           #@@@@@@@@@@@@.                                                                                                                                  #@@#  ")
   escreval("         :@@@.                                                                                                                                             #@@#  ")
   escreval("         !@@@.                .@@@.        .@@@.        :#@@@@@@@!.        :#@@@@@@@#.         !@@@@@@@@!       :#@@@@@@@#.        .!@@@@@@@@@!            #@@#  ")
   escreval("          :@@@@@!             .@@@.        .@@@:     .@@@#.     .#@:    :@@@:      .#@@#     #@@#       :     :@@@.      ..      #@@@!      .#@@@:         !@@#  ")
   escreval("             .!@@@@@@#:       .@@@.        .@@@:    .@@@:              !@@#          #@@!    @@@#             :@@@:             @@@#          :@@@!        !@@#  ")
   escreval("                   .#@@@#     .@@@.        .@@@:    #@@@.              #@@@@@@@@@@@@@@@@#     .#@@@@@#!         :@@@@@@#.      :@@@.           #@@#        !@@#  ")
   escreval("                     .@@@!    .@@@.        .@@@:    !@@@.              #@@#                         .!@@@#            :@@@@.   :@@@:          .@@@!        :@@!  ")
   escreval("         :           #@@@.    .@@@#       :@@@@:     #@@@.        ..   .@@@#                          :@@@.             @@@:    !@@@:        .@@@#               ")
   escreval("        .@@@@@@@@@@@@@@.        #@@@@@@@@@# #@@:      .@@@@@@@@@@@@.     .#@@@@@##@@@@@@    :@@@@@#@@@@@#     #@@@@#@@@@@@:       !@@@@@@@@@@@@!          .@@@@. ")
   escreval("  ")
   escreval("  ")
   escreval("  ")

fimprocedimento


procedimento desenhoArea()
inicio
   limpatela
   escreval("                                             .@@@@@#.                                                                                    ")
   escreval("                                            :@@@#@@@@.                                                                                   ")
   escreval("                                           :@@@: :@@@@.                                                                                  ")
   escreval("                                          !@@@!   .@@@@.           .#@@# :@@@@@@@:      :@@@@@@@@@@@@@!         !@@@@@@@@@@@@@@#.        ")
   escreval("                                         !@@@:     .#@@@:          .#@@@@@#           !@@@#         !@@@#       #:          .@@@@:       ")
   escreval("                                        !@@@:       .@@@@!         .#@@@#            #@@@:           :@@@!                   :@@@#       ")
   escreval("                                       #@@@:          #@@@!        .#@@@.           :@@@@@@@@@@@@@@@@@@@@#        .:!@@@@@@@@@@@@#       ")
   escreval("                                      #@@@@@@@@@@@@@@@@@@@@!       .#@@@.           :@@@#.                     .@@@@@!.      :@@@#       ")
   escreval("                                    .@@@@!             .@@@@!      .#@@@.           .@@@@:                    :@@@@.         :@@@#       ")
   escreval("                                   .#@@@:                #@@@#     .#@@@.            .#@@@#.                  .@@@@:       .!@@@@#       ")
   escreval("                                  .@@@@:                  #@@@#.   .#@@@.               !@@@@@@@@@@@@@@@#       #@@@@@@@@@@@!.#@@#       ")
   escreval(" ")
   escreval(" ")
   escreval(" ")
   escreval(" ")


fimprocedimento




procedimento tamanhoArea()
var

inicio
   desenhoArea()
   escreval("                                                                               [0] para SAIR   ")
   escreval("                                                                                                ")
   escreva("                                                                  Informe a área do seu terreno(Hectare): ")
   leia(cadArea[sessaoLogado, countArea].tamanhoarea)
   limpatela
   escolheMata()
fimprocedimento


procedimento escolheMata()
inicio
   desenhoArea()
   escreval("                                                              Tamanho da área de seu terreno(Hectare):", cadArea[sessaoLogado, countArea].tamanhoarea)
   escreval(" ")
   escreval(" ")
   escreval("                                                                                                                                                         ")
   escreval("                                                        Selecione o tipo de vegetação que abrange a sua área:       ")
   escreval("                                                               _______________________________________                 ")
   escreval("                                                              |                                       |                ")
   escreval("                                                              |  [1] Floresta Primária ou Secundária  |               ")
   escreval("                                                              |                                       |              ")
   escreval("                                                              |  [2] Reflorestamento e Restauração    |            ")
   escreval("                                                              |                                       |              ")
   escreval("                                                              |  [3] Manguezais                       |             ")
   escreval("                                                              |                                       |          ")
   escreval("                                                              |  [4] Manejo Florestal Sustentável     |            ")
   escreval("                                                              |                                       |            ")
   escreval("                                                              |  [5] AgroFlorestas                    |             ")
   escreval("                                                              |                                       |    ")
   escreval("                                                              |  [6] Florestas Urbanas                |   ")
   escreval("                                                              |_______________________________________|           ")
   escreva("                                                                                  ")
   leia(op)

   escolha op
   caso 1
      cadArea[sessaoLogado, countArea].vegetacao := "Floresta Primária ou Secundária"
      usuario[sessaoLogado].somaSaldoCredito := cadArea[sessaoLogado, countArea].tamanhoarea * 0.5

   caso 2
      cadArea[sessaoLogado, countArea].vegetacao := "Reflorestamento e Restauração"
      usuario[sessaoLogado].somaSaldoCredito := cadArea[sessaoLogado, countArea].tamanhoarea * 0.3
   caso 3
      cadArea[sessaoLogado, countArea].vegetacao := "Manguezais"
      usuario[sessaoLogado].somaSaldoCredito := cadArea[sessaoLogado, countArea].tamanhoarea * 0.8
   caso 4
      cadArea[sessaoLogado, countArea].vegetacao := "Manejo Florestal Sustentável"
      usuario[sessaoLogado].somaSaldoCredito := cadArea[sessaoLogado, countArea].tamanhoarea * 0.4
   caso 5
      cadArea[sessaoLogado, countArea].vegetacao := "AgroFlorestas"
      usuario[sessaoLogado].somaSaldoCredito := cadArea[sessaoLogado, countArea].tamanhoarea * 0.2
   caso 6
      cadArea[sessaoLogado, countArea].vegetacao := "Florestas Urbanas"
      usuario[sessaoLogado].somaSaldoCredito := cadArea[sessaoLogado, countArea].tamanhoarea * 0.6
   outrocaso
      desenhoArea()
      invalido()
      escolhemata()
   fimescolha
   limpatela

   desenhoArea()
   escreval(" ")
   escreval("                                                                    Tamanho de sua área(Hectare):", cadArea[sessaoLogado, countArea].tamanhoarea)
   escreval(" ")
   escreval(" ")
   escreval("                                                                                                                             ")
   escreval("                                                               Vegetação: ", cadArea[sessaoLogado, countArea].vegetacao)
   escreval("                                                                                                                               ")
   escreval("                                                                                                                             ")
   escreval(" ")
   escreva("                                                      Informe o número do registro ambiental (NRA) de seu terreno:  ")
   leia(cadArea[sessaoLogado, countArea].numeroregistro)

   limpatela
   desenhoarea()
   escreval("                                                                    Tamanho de sua área(Hectare):", cadArea[sessaoLogado, countArea].tamanhoarea)
   escreval(" ")
   escreval(" ")
   escreval("                                                               Vegetação: ", cadArea[sessaoLogado, countArea].vegetacao)
   escreval(" ")
   escreval(" ")
   escreval("                                                                           NRA:", cadArea[sessaoLogado, countArea].numeroregistro)
   escreval(" ")
   escreval(" ")
   escreval("                                                           Você confirma os dados do cadastro de sua área?                                ")
   escreval(" ")
   escreval("                                           Toda a documentação será analisada e, caso esteja ok, liberaremos seus créditos.          ")
   escreval("  ")
   escreval("                                                                   [S] para SIM  [N] para NÃO ")
   escreva("                                                                                ")
   leia(opc)
   opc := maiusc(opc)

   escolha opc
   caso "S"
      confirmasenha()
      se usuario[sessaoLogado].opcSenha = 1 entao
         limpatela
         sucessoArea()
      senao
         limpatela
         tamanhoArea()
      fimse
   caso "N"
      tamanhoArea()
   fimescolha
fimprocedimento

procedimento sucessoArea()
inicio
   usuario[sessaoLogado].saldoCredito := usuario[sessaoLogado].somaSaldoCredito + usuario[sessaoLogado].saldoCredito
   cadArea[sessaoLogado, countArea].adicaoArea := cadArea[sessaoLogado, countArea].adicaoArea + 1
   countArea := countArea + 1
   desenhoSucesso()
   escreval("                                                               Perfeito! Sua área foi registrada com sucesso    ")
   escreval(" ")
   escreval("                                                Baseado na medida de sua área, você receberá mensalmente", usuario[sessaoLogado].somaSaldoCredito, " Créditos de Carbono. ")
   escrevaL(" ")
   escreval("                                                               Obrigado por escolher a CarboZero!")
   escreval(" ")
   escreval("                                                                      ___________________________ ")
   escreval("                                                                     |                           | ")
   escreval("                                                                     |  [1] para Mercado Co2     | ")
   escreval("                                                                     |                           | ")
   escreval("                                                                     |  [2] para Minha Conta     | ")
   escreval("                                                                     |                           | ")
   escreval("                                                                     |  [0] para Página Inicial  | ")
   escreval("                                                                     |___________________________| ")
   escreva("                                                                                      ")
   leia(op)

   escolha op

   caso 1
      limpatela
      mercado()
   caso 2
      limpatela
      minhaconta()
   caso 0
      limpatela
      paginainicial()

   fimescolha

fimprocedimento
/////////////////////////////////////////////////////////////////////////////////////////////////////



procedimento registroDesenho() //desenho do registro
inicio
   limpatela
   escreval("                                                 :@@@@@@#  @@@@@@#  #@@@@@#  @@#  @@@@@@. @@@@@@@# @@@@@@@.  @@@@@@!  ")
   escreval("                                                 :@@  :@@  @@      @@#   .   @@#  @@@. .    !@@    @@#  @@@ @@@   @@: ")
   escreval("                                                 :@@@@@@   @@@@@@. @@: :@@@! @@#   #@@@@!   !@@    @@@@@@#  @@.   @@! ")
   escreval("                                                 :@@ :@@:  @@      #@@   #@! @@# @@@  #@@   !@@    @@# @@@  @@@  .@@: ")
   escreval("                                                 :@@  !@@. @@@@@@@  #@@@@@#. @@#  @@@@@@.   !@@    @@#  @@@  #@@@@@:  ")
   escreval("                                                                                                                              ")
   escreval("                                                                          _rfX8ggggg8A5c^                   ")
   escreval("                                                                      _F%@85r^_     -,*1#@ge^               ")
   escreval("                                                                    i@@x_                 -T%@5-            ")
   escreval("                                                                  T@8^                       _P@S           ")
   escreval("                                                                _g@^                           _8@;         ")
   escreval("                                                               ,@8             ^Lic;-            x@c        ")
   escreval("                                                              -@$           r0@@@@@@@@t           j@^       ")
   escreval("                                                              4@'         -g@@@@@@@@@@@@^          @@       ")
   escreval("                                                              @8          G@@@@@@@@@@@@@@          F@,      ")
   escreval("                                                             -@S          8@@@@@@@@@@@@@@          !@*      ")
   escreval("                                                              @R          ^@@@@@@@@@@@@@v          T@^      ")
   escreval("                                                              8@           _8@@@@@@@@@g;           %@       ")
   escreval("                                                              _@X        _UQ3^rEG8DPT^v08;        r@L       ")
   escreval("                                                               *@3     _8@@@@@@MRbG%@@@@@@&^     !@k        ")
   escreval("                                                                ;@8-  !@@@@@@@@@@@@@@@@@@@@@3   e@F         ")
   escreval("                                                                 -b@3;@@@@@@@@@@@@@@@@@@@@@@@Jc@g:          ")
   escreval("                                                                   _H@@@@@@@@@@@@@@@@@@@@@@@@@%;            ")
   escreval("                                                                      rD@@@@@@@@@@@@@@@@@@@%J-              ")
   escreval("                                                                         _cS8@@@@@@@@@%Uv^                  ")
   escreval("                                                                                                            ")
fimprocedimento

procedimento escolheRegistro()   //escolhe se continua registrando ou volta
inicio
   registroDesenho()
   escreval("                                                                  Você deseja criar uma nova conta?           ")
   escreval("")
   escreval("                                                                   Pressione [1] para PROSSEGUIR            ")
   escreval("                                                                   Pressione [0] para VOLTAR                   ")
   leia(op)
   escolha op
   caso 1
      limpatela
      compraOUvende()
   caso 0
      limpatela
      escolhalogin()
   outrocaso
      registroDesenho()
      invalido()
      escolheRegistro()
   fimescolha
fimprocedimento

procedimento compraOUvende()  //escolhe se é vendedor ou comprador
inicio
   registroDesenho()
   escreval("                                                                 Você é um vendedor ou um comprador?")
   escreval("")
   escreval("                                                                    Pressione [1] para VENDEDOR     ")
   escreval("                                                                    -")
   escreval("                                                                    Pressione [2] para COMPRADOR                                 ")
   leia (op)
   escolha op
   caso 1
      vendedorOUcompradorTemp:=1
      regNome()
   caso 2
      vendedorOUcompradorTemp:=2
      regNome()
   outrocaso
      registroDesenho()
      invalido()
      compraOUvende()
   fimescolha
fimprocedimento


procedimento cpfReg()  //registra cpf
inicio
   limpatela
   registroDesenho()
   escreval("                                                       |----------------------------------------------------|")
   escreval("                                                         Nome Completo: ",nomeTemp)
   escreval("                                                       |----------------------------------------------------|")
   escreval("")
   escreval("                                                       |----------------------------------------------------|")
   escreva("                                                         CPF/CNPJ: ")
   leia(cpfoucnpj)
   escreval("                                                       |----------------------------------------------------|")
   fisOUjuri()
   escreval("                                                                                                             ")

fimprocedimento


procedimento fisOUjuri()  //verifica se é pessoa fisica ou juridica
inicio
   se (compr(cpfoucnpj)) = 11 entao
      fisicooujuriTemp:= "pessoa física"
      cpfTemp:=cpfoucnpj
      regIdade()
   senao
      se (compr(cpfoucnpj)) = 14 entao
         fisicooujuriTemp:= "pessoa jurídica"
         cnpjTemp:=cpfoucnpj
         regSenha()
      senao
         se ((compr(cpfoucnpj)) <> 11) e ((compr(cpfoucnpj)) <> 14) entao
            erroCpf()
         fimse
      fimse
   fimse
fimprocedimento

procedimento erroCpf()   //cpf ou cnpj invalido
inicio
   registroDesenho()
   escreval("")
   escreval("                                                               CPF ou CNPJ invalido, insira novamente.")
   escreval("                                                               --")
   escreval("                                                               Pressione [1] para inserir novamente")
   escreval("                                                               Pressione [0] para VOLTAR")
   leia(op)
   escolha op
   caso 1
      limpatela
      registroDesenho()
      cpfReg()
   caso 0
      limpatela
      minhaconta()
   outrocaso
      registroDesenho()
      invalido()
      erroCpf()
   fimescolha
fimprocedimento

procedimento regSenha()  // registra senha
inicio
   limpatela
   registroDesenho()
   escreval("                                                       |----------------------------------------------------|")
   escreval("                                                         Nome Completo: ",nomeTemp)
   escreval("                                                       |----------------------------------------------------|")
   escreval("")
   escreval("                                                       |----------------------------------------------------|")
   escreval("                                                        CPF/CNPJ: ",cpfoucnpj)
   escreval("                                                       |----------------------------------------------------|")
   escreva("")
   escreval("                                                                                                             ")
   se (compr(cpfoucnpj)) = 11 entao
      escreval("                                                       |----------------------------------------------------|")
      escreval("                                                         Ano de Nascimento: ",anoNascTemp)
      escreval("                                                       |----------------------------------------------------|")
      escreval("")
   fimse
   //senha
   escreval("                                                       |----------------------------------------------------|")
   escreva("                                                         Senha: ")
   leia(senhaTemp)
   escreval("                                                       |----------------------------------------------------|")
   escreval("")
   escreval("                                                       |----------------------------------------------------|")
   escreva("                                                         Confirme a senha: ")
   leia(confSenha)
   escreval("                                                       |----------------------------------------------------|")
   se senhaTemp = confsenha entao
      sucessoReg()
   senao
      escreval("")
      escreval("                                                                     As senhas não coincidem.")
      escreval("                                                         Pressione [ENTER] para inserir a senha novamente.")
      leia(pause)
      regSenha()
   fimse
fimprocedimento



procedimento sucessoReg() //sucesso registro
inicio
   limpatela
   qtdUsuario:=qtdUsuario+1
   //aloca
   usuario[qtdUsuario].sessao := usuario[qtdUsuario].sessao + qtdUsuario
   usuario[qtdUsuario].nome:=nomeTemp
   usuario[qtdUsuario].cpf:=cpfTemp
   usuario[qtdUsuario].cnpj:=cnpjTemp
   usuario[qtdUsuario].idade:=idadeTemp
   usuario[qtdUsuario].senha:=senhaTemp
   usuario[qtdUsuario].fisicooujuri:=fisicooujuriTemp
   usuario[qtdUsuario].vendedorOUcomprador:=vendedorOUcompradorTemp
   qtdSessao:=qtdSessao + 1
   escreval("")
   registroDesenho()
   escreval("")
   escreval("                                                          Parabéns, ",nomeTemp,"! Conta criada como ",usuario[qtdUsuario].fisicooujuri,".")
   escreval("                                                          - ")
   escreval("                                                          Pressione [1] para LOGIN            ")
   escreval("                                                          Pressione [2] para INICIO             ")
   leia(op)
   escolha op
   caso 1
      login()
   caso 2
      paginainicial()
   outrocaso
      registroDesenho()
      invalido()
      sucessoReg
   fimescolha
fimprocedimento

procedimento regNome()    //registra nome
inicio
   limpatela
   registroDesenho()
   escreval("                                                       |----------------------------------------------------|")
   escreva("                                                         Nome Completo: ")
   leia(nomeTemp)
   escreval("                                                       |----------------------------------------------------|")
   cpfReg()
fimprocedimento


procedimento regIdade()    //idade caso seja pessoa fisica
inicio
   limpatela
   registroDesenho()
   escreval("                                                      |----------------------------------------------------|")
   escreval("                                                        Nome Completo: ",nomeTemp)
   escreval("                                                      |----------------------------------------------------|")
   escreval("")
   escreval("                                                      |----------------------------------------------------|")
   escreval("                                                       CPF/CNPJ: ",cpfoucnpj)
   escreval("                                                      |----------------------------------------------------|")
   escreva("")
   escreval("                                                                                                            ")
   escreval("                                                      |----------------------------------------------------|")
   escreva("                                                       Ano de Nascimento: ")
   leia (anoNascTemp)
   escreval("                                                      |----------------------------------------------------|")
   se anoNascTemp >= 1900 entao
      idadeTemp:= 2023-anoNascTemp
      se idadeTemp < 18 entao
         escreval("")
         escreval("                                                             Você não possui a idade mínima (18 anos)")
         escreval("                                                          Pressione [ENTER] para retornar a tela inicial")
         leia(pause)
         paginainicial()
      senao
         regSenha()
      fimse
   senao
      escreval("")
      escreval("                                                          Ano de nascimento inválido, insira novamente.")
      escreval("                                                        Pressione [ENTER] para inserir a senha novamente.")
      leia(pause)
      regIdade()
   fimse
fimprocedimento

procedimento desenhoLogin() //desenho do login
inicio
   limpatela
   escreval("                                                        @@!        :@@@@@@@!     @@@@@@@@    !@@   @@@!    !@:")
   escreval("                                                        @@!       @@#     !@@. :@@      !:   !@@   @@!@@.  !@:")
   escreval("                                                        @@!      .@@.      @@: @@@   @@@@@:  !@@   @@  #@@.!@:")
   escreval("                                                        @@!       #@@     @@@  .@@!     @@:  !@@   @@    @@@@:")
   escreval("                                                        @@@@@@@@:   :@@@@@:       #@@@@: @:  !@@   @@     .@@:")
   escreval("                                                                                                            ")
   escreval("                                                                                                            ")
   escreval("                                                                          _rfX8ggggg8A5c^                   ")
   escreval("                                                                      _F%@85r^_     -,*1#@ge^               ")
   escreval("                                                                    i@@x_                 -T%@5-            ")
   escreval("                                                                  T@8^                       _P@S           ")
   escreval("                                                                _g@^                           _8@;         ")
   escreval("                                                               ,@8             ^Lic;-            x@c        ")
   escreval("                                                              -@$           r0@@@@@@@@t           j@^       ")
   escreval("                                                              4@'         -g@@@@@@@@@@@@^          @@       ")
   escreval("                                                              @8          G@@@@@@@@@@@@@@          F@,      ")
   escreval("                                                             -@S          8@@@@@@@@@@@@@@          !@*      ")
   escreval("                                                              @R          ^@@@@@@@@@@@@@v          T@^      ")
   escreval("                                                              8@           _8@@@@@@@@@g;           %@       ")
   escreval("                                                              _@X        _UQ3^rEG8DPT^v08;        r@L       ")
   escreval("                                                               *@3     _8@@@@@@MRbG%@@@@@@&^     !@k        ")
   escreval("                                                                ;@8-  !@@@@@@@@@@@@@@@@@@@@@3   e@F         ")
   escreval("                                                                 -b@3;@@@@@@@@@@@@@@@@@@@@@@@Jc@g:          ")
   escreval("                                                                   _H@@@@@@@@@@@@@@@@@@@@@@@@@%;            ")
   escreval("                                                                      rD@@@@@@@@@@@@@@@@@@@%J-              ")
   escreval("                                                                         _cS8@@@@@@@@@%Uv^                  ")
   escreval("                                                                                                            ")
fimprocedimento

procedimento escolhaLogin()   //escolhe se loga ou cria conta
inicio

   desenhoLogin()
   escreval("                                                                                                            ")
   escreval("                                                                    Pressione [1] para LOGIN        ")
   escreval("                                                                    Pressione [2] para CRIAR CONTA  ")
   escreval("                                                                    -")
   escreval("                                                                    Pressione [0] para VOLTAR                      ")
   leia(op)
   escolha op
   caso 1
      login()
   caso 2
      limpatela
      escolheRegistro()
   caso 0
      paginainicial()
   outrocaso
      desenhoLogin
      invalido()
      escolhaLogin()
   fimescolha
fimprocedimento

procedimento login()  //login da conta
inicio
   desenhoLogin()
   escreval("                                                         |----------------------------------------------------|")
   escreva("                                                           CPF: ")
   leia(cpfTemp)
   escreval("                                                         |----------------------------------------------------|")
   escreval("")
   escreval("                                                         |----------------------------------------------------|")
   escreva("                                                           Senha: ")
   leia(senhaTemp)
   escreval("                                                         |----------------------------------------------------|")

   para countLogin de 1 ate qtdUsuario faca
      se (cpfTemp = usuario[countLogin].cpf) e (senhaTemp = usuario[countLogin].senha) entao
         sessaoLogado:= usuario[countLogin].sessao
         logou:=1
      fimse
   fimpara

   se logou=1 entao
      sucessoLogin()
   senao
      falhaLogin()
   fimse

fimprocedimento

procedimento sucessoLogin()   //login deu certo
inicio
   limpatela
   desenhoLogin()
   escreval("                                                                 Olá ",usuario[sessaoLogado].nome,", é bom te ver novamente.")
   escreval("                                                                 -                                                         ")
   escreval("                                                                 Pressione [ENTER] para TELA INICIAL                        ")
   leia(pause)
   paginainicial()
fimprocedimento

procedimento falhaLogin()   //login deu errado
inicio
   limpatela
   desenhoLogin()
   escreval("                                                                 Seu CPF ou SENHA estão incorretos.")
   escreval("                                                                 -                                                         ")
   escreval("                                                                 Pressione [1] para tentar novamente")
   escreval("                                                                 Pressione [2] para TELA INICIAL")
   leia(op)
   escolha op
   caso 1
      login()
   caso 2
      escreval("")
   outrocaso
      desenhoLogin()
      invalido()
      falhaLogin()
   fimescolha
fimprocedimento



procedimento invalido() //opção inválida
inicio
   escreval("")
   escreval("                                                                              OPÇÃO INVÁLIDA")
   escreval("")
   escreval("                                                                    Por favor, escolha uma opção válida.")
   escreval("                                                                                     --")
   escreval("                                                                       Pressione ENTER para continuar")
   leia (pause)
fimprocedimento



procedimento desenhoLogoff()   //desenho tela logoff
inicio
   limpatela
   escreval("                                             umA_        'iX8gg%Ht_       ;3G%gg8Hx_     ;5O$g08S*     xmmmmmmmT  xmmmmmmmT ")
   escreval("                                             @@@!      -R@@@G2E#@@@8-   T@@@&X2EX0@g   *@@@0VePg@@@*   @@@%mmmmT  @@@%mmmmT ")
   escreval("                                             @@@!      g@@X      0@@D  5@@@:       -  !@@@,     *@@@,  @@@;       @@@;      ")
   escreval("                                             @@@!     ^@@@       ^@@@ -@@@_  ;eeeee*  $@@3       %@@E  @@@Geeee_  @@@Geeee_ ")
   escreval("                                             @@@!     ;@@@       ^@@@ _@@@-  rmmg@@g  g@@u       %@@e  @@@@gggg;  @@@@gggg; ")
   escreval("                                             @@@!      @@@v      %@@b  8@@%-    r@@g  f@@@-     ;@@@_  @@@;       @@@;      ")
   escreval("                                             @@@Deeee^ ;@@@%uTik@@@A    G@@@GxTJ8@@g   R@@@PvTx8@@@;   @@@;       @@@;      ")
   escreval("                                             ygggggggr   cAg@@@@8u_      _FOQ@@@@%U;    ,eN@@@@gX*     Ug$_       Ug$_      ")
   escreval("")
   escreval("")
   escreval("                                                             -eNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN%8S_              ")
   escreval("                                                             ;@@@@@@@@0Gb66666666666666666666666b@@@^             ")
   escreval("                                                             ;@@g^u8@@@@8u^                      8@@;             ")
   escreval("                                                             ;@@g    _t8@@@@gu;-                 8@@;             ")
   escreval("                                                             ;@@g        -^1W@@@@8z^             8@@;             ")
   escreval("                                                             ;@@g             ^z8@@@@%i          8@@;  -FC_       ")
   escreval("                                                             ;@@g                 -!2@@@_        l@@_  ^g@@%;     ")
   escreval("                                                             ;@@g                    C@@c                *g@@g*   ")
   escreval("                                                             ;@@g                    u@@T     m@@@@@@@@@@@@@@@@&_ ")
   escreval("                                                             ;@@g                    u@@T     ^iviiiiiiiivA@@@@L  ")
   escreval("                                                             ;@@g                    u@@T        -i+    ;g@@g!    ")
   escreval("                                                             ;@@g                    u@@T        8@@;  *@@D_       ")
   escreval("                                                             ;@@g                    u@@T        8@@;    -        ")
   escreval("                                                             ;@@g                    u@@T        8@@;             ")
   escreval("                                                             ;@@g                    u@@T        8@@;             ")
   escreval("                                                             ;@@g                    u@@x________%@@;             ")
   escreval("                                                             ^@@@&C!-                u@@@@@@@@@@@@@8-             ")
   escreval("                                                              _*X@@@@gP*-            u@@E;;;;;;;;;_               ")
   escreval("                                                                  -*hg@@@@Xi_        u@@T                         ")
   escreval("                                                                       _vH@@@@0e*-   u@@T                         ")
   escreval("                                                                           _*U@@@@@H*P@@c                         ")
   escreval("                                                                                ,TG@@@@8-                         ")
   escreval("                                                                                    -_                            ")
fimprocedimento

procedimento logoff()   //fazer logoff
inicio
   desenhoLogoff()

   escreval("                                                                          ")
   escreval("")
   escreval("                                                             Tem certeza que deseja sair de sua conta?")
   escreval("")
   escreval("                                                                   [S] para SIM   |  [N] para Não       ")
   leia (opc)
   opc:=maiusc(opc)
   escolha opc
   caso "S"
      sucessoLogoff()

   caso "N"
      minhaconta()
   outrocaso
      desenhoLogoff()
      invalido()
      logoff()
   fimescolha
fimprocedimento

procedimento sucessoLogoff()  //logoff deu certo
inicio
   desenhoLogoff()
   escreval("")
   escreval("                                                              Sua conta foi desconectada, até a proxima.")
   escreval("                                                                                  -                     ")
   escreval("                                                                Pressione [ENTER] para TELA INICIAL")
   leia(pause)
   sessaoLogado:=0
   paginainicial()
fimprocedimento



procedimento desenhoCalculadora() //desenho tela calculadora
inicio
   limpatela
   escreval("                                                                              -^*Tvic!:                          ")
   escreval("                                                                          _s8@@&8b4UG%@@@d*                      ")
   escreval("                                                                       ;8@gF_          ;y@@P'                   ")
   escreval("                                                                      -O@8,                r@@J                  ")
   escreval("                                                                     -@@L                    O@b                 ")
   escreval("                                                                     %@i                      M@1;;;^-           ")
   escreval("                                                               ~sP8%0@@                       ^@&%%%&@@&V!       ")
   escreval("                                                            ;8@@Gt+;;!_  '*vuxT;    -+txc:            -;P@@S-    ")
   escreval("                                                          _g@q,        c@@gX2SGQr _8@gPS8@@*              c@@T   ")
   escreval("                                                         ,@@^         P@8-       _@@^    -g@T              -%@3  ")
   escreval("                                                         &@*         -@@         X@u      :@@                @@^ ")
   escreval("                                                         @@          -@@         P@5      ^@@ *%@@D'         e@E ")
   escreval("                                                         @@_          3@$_       '@@r    :@@* +u_g@c         2@E ")
   escreval("                                                         T@g           ;N@@8GG0@L -6@@DG&@%^   ^g@S         -@@_ ")
   escreval("                                                          T@@*            :*rr;'     ^rr;-    C@@@@@-      *@@*  ")
   escreval("                                                           _X@@k*_                                     _rP@@U'   ")
   escreval("                                                              *Pg@@@@@@@@@@@@@@@@@@@@@@@@@@&@@@&&&QQ@@@@%E!      ")
   escreval("                                                                   ----------''___________::,,,,:_-              ")
   escreval("")
   escreval("")
   escreval("                                                                           Calculadora de CO2                     ")
   escreval("                                                                        ------------------------                   ")
   escreval("")
fimprocedimento

procedimento calculadora()  //opçoes da calculadora
inicio
   desenhoCalculadora()
   escreval("                                                                   Selecione o tipo de emissão de CO2             ")
   escreval("")
   escreval("                                                                       [1] Consumo de combustível                   ")
   escreval("")
   escreval("                                                                       [2] Viagens aéreas                           ")
   escreval("")
   escreval("                                                                       [3] Energia elétrica                         ")
   escreval("                                                                       -- ")
   escreval("")
   escreval("                                                                       [0] Sair                                     ")
   leia (op)
   escolha op
   caso 1
      calcCombustivel()
   caso 2
      calcAerea()
   caso 3
      calcEletrico()
   caso 4
      calcGas()
   caso 0
      paginainicial()
   outrocaso
      desenhoCalculadora()
      invalido()
      calculadora()
   fimescolha
fimprocedimento


procedimento sucessoCalc()
inicio
   desenhoCalculadora()
   escreval("                                                                       Co2 emitido(kg): ",carbonoEmitidoTEMP[qtdCalc])
   escreval("                                                                       --")
   escreval("                                                                       Combustivel: ",combustivelRelatorioTEMP[qtdCalc])
   escreval("")
   escreval("")
   escreval("                                                Voce pode continuar calculando ou ver o resultado ampliado de suas emissoes.")
   escreval("")
   escreval("                                                                        [1] Continuar Calculando")
   escreval("                                                                        [2] Resultado ampliado  ")
   leia (op)
   escolha op
   caso 1
      calculadora()
   caso 2
      resultadoCalc()
   outrocaso
      desenhoCalculadora()
      invalido()
      sucessoCalc()
   fimescolha
fimprocedimento

procedimento resultadoCalc()   //resultado ampliado calculadora
inicio
   desenhoCalculadora()
   //   usuario[sessaoLogado].vezesEmitido:=usuario[sessaoLogado].vezesEmitido+1
   para x de 1 ate qtdCalc faca
      carbonoTotalEmitidoTEMP:= carbonoTotalEmitidoTEMP + carbonoEmitidoTEMP[x]
      carbonoEmitidoTEMPAnual:=carbonoTotalEmitidoTEMP*12
   fimpara
   escreval("                                                     Baseado nos seus cálculos anteriores, essa é sua taxa de emissão")
   escreval("")
   escreval("                                                     Emissão mensal(kg):",carbonoTotalEmitidoTEMP)
   escreval("                                                     Emissão anual (estimativa): ",carbonoEmitidoTEMPAnual)
   escreval("")
   escreval("                                                               • • • • • • • • • • • • • • • • • • • • •")

   escreval("")
   escreval("                                          Você pode compensar o carbono que emitiu comprando de maneira segura com a CarboZero")
   escreval("")
   escreval("                                                               Créditos de carbono necessários: ",carbonoTotalEmitidoTEMP/1000:2:0,"/mês.")
   escreval("                                                               Árvores equivalentes: : ",carbonoTotalEmitidoTEMP/22:2:0," árvores/mês.")
   escreval("")
   escreval("                                                              -----------------------------------------")
   escreval("                                                                             Calculos:")
   para x de 1 ate qtdCalc faca
      escreval("                                                             ___________________________________________")
      escreval("")
      escreval("                                                               Forma de emissão: ", combustivelRelatorioTEMP[x])
      escreval("                                                               Co2 emitido(kg): ",carbonoEmitidoTEMP[x])
      escreval("                                                             ___________________________________________")
      escreval("")
   fimpara
   escreval("                                                              -----------------------------------------")
   escreval("")
   se usuario[sessaoLogado].vendedorOUcomprador=1  entao
      escreval("                                                               [1] Continuar calculando ")
      escreval("                                                               [2] Inicio ")
      escreval("")
      leia(op)
      escolha op
      caso 1
         calculadora()
      caso 2
         para x de 1 ate qtdCalc faca
            combustivelRelatorioTemp[x]:=""
            carbonoEmitidoTEMP[x]:=0
         fimpara
         qtdCalc:=0
         paginainicial()
      fimescolha

   senao
      escreval("                                                               [1] Adicionar as futuras compensações (Selecione para saber mais)")
      escreval("                                                               [2] Continuar calculando ")
      escreval("                                                               [3] Inicio ")
      escreval("")
      leia(op)
      escolha op
      caso 1
         confirmaDivida()
      caso 2
         calculadora()
      caso 3
         para x de 1 ate qtdCalc faca
            combustivelRelatorioTemp[x]:=""
            carbonoEmitidoTEMP[x]:=0
         fimpara
         qtdCalc:=0
         paginainicial()
      fimescolha

fimprocedimento

procedimento confirmaDivida()
inicio
   desenhoCalculadora()
   escreval("                                          As futuras compensações servem para o comprador ter controle das suas emissões de carbono")
   escreval("                                                  Você pode ver suas futuras compensações na aba 'Mercado de crédito de carbono'       ")
   escreval("")
   escreval("                                                                 • • • • • • • • • • • • • • • • • • • • •                   ")
   escreval("")
   escreval("                                            Você tem certeza que deseja adicionar ",carbonoTotalEmitidoTEMP/1000:2:0," créditos de carbono as suas futuras compensações?")
   escreval("")
   escreval("                                                                               [S] Sim")
   escreval("                                                                               [N] Não")
   leia(opc)
   opc:=maiusc(opc)
   escolha opc
   caso "S"
      sucessoDivida()
   caso "N"
      resultadoCalc()
   outrocaso
      desenhoCalculadora()
      invalido()
      confirmaDivida()
   fimescolha

fimprocedimento

procedimento sucessoDivida()
inicio
   desenhoCalculadora()
   para x de 1 ate qtdCalc faca
      combustivelRelatorioTemp[x]:=""
      carbonoEmitidoTEMP[x]:=0
   fimpara
   qtdCalc:=0
   escreval("                                                                                 Sucesso!")
   usuario[sessaoLogado].dividaCo2:=usuario[sessaoLogado].dividaCo2+ carbonoTotalEmitidoTemp/1000
   escreval("")
   escreval("                                                          Suas futuras compensações são de ",usuario[sessaoLogado].dividaCo2:2:0," créditos de carbono")
   escreval("")
   escreval("                                                                             [1] Mercado")
   escreval("                                                                             [2] Pagina incial")
   leia(op)
   escolha op
   caso 1
      mercado()
   caso 2
      paginainicial()
   outrocaso
      desenhoCalculadora()
      invalido()
      sucessoDivida()
   fimescolha
fimprocedimento




procedimento calcCombustivel()  //opçoes emissoes por combustivel
inicio
   desenhoCalculadora()
   escreval("                                                                      Informe o tipo de combustível                    ")
   escreval("")
   escreval("                                                                         [1] Gasolina                   ")
   escreval("")
   escreval("                                                                         [2] Diesel                           ")
   escreval("")
   escreval("                                                                         [3] Álcool(Etanol)                        ")
   escreval("")
   escreval("                                                                         [4] Gás Natural(GNV)                        ")
   escreval("                                                                         -- ")
   escreval("")
   escreval("                                                                         [0] Voltar                                    ")
   leia(op)
   escolha op
   caso 1
      calcGasolina()
   caso 2
      calcDiesel()
   caso 3
      calcAlcool()
   caso 4
      calcGnv()
   caso 0
      calculadora()
   outrocaso
      desenhoCalculadora()
      invalido()
      calcCombustivel()
   fimescolha
fimprocedimento





procedimento calcGasolina()  //calcular emissao gasolina
inicio
   desenhoCalculadora()
   escreval("                                                                      Forma de emissão: Gasolina     ")
   escreval("                                                                                                                 ")
   escreval("                                                        |----------------------------------------------------|")
   escreva("                                                          Litro/Mês: ")
   leia(combustivelUsadoTEMP)
   qtdCalc:=qtdCalc+1 //quantidade de calculos
   combustivelRelatorioTEMP[qtdCalc]:=Numpcarac(combustivelUsadoTEMP)+ " Litros (Gasolina)"   //atribuir ao relatorio
   carbonoEmitidoTEMP[qtdCalc]:=(combustivelUsadoTEMP * (231/100))//formula de calculo mensal
   escreval("                                                        |----------------------------------------------------|")
   sucessoCalc()
fimprocedimento

procedimento calcDiesel()    //calcular emissao diesel
inicio
   desenhoCalculadora()
   escreval("                                                                       Forma de emissão: Diesel     ")
   escreval("                                                                                                                 ")
   escreval("                                                        |----------------------------------------------------|")
   escreva("                                                          Litro/Mês: ")
   leia(combustivelUsadoTEMP)
   qtdCalc:=qtdCalc+1 //quantidade de calculos
   combustivelRelatorioTEMP[qtdCalc]:=Numpcarac(combustivelUsadoTEMP)+ " Litros (Diesel)"   //atribuir ao relatorio
   carbonoEmitidoTEMP[qtdCalc]:=(combustivelUsadoTEMP * (268/100))//formula de calculo mensal
   escreval("                                                        |----------------------------------------------------|")
   sucessoCalc()
fimprocedimento

procedimento calcAlcool()  //calcular emissao alcool
inicio
   desenhoCalculadora()
   escreval("                                                                        Forma de emissão: Álcool(Etanol)     ")
   escreval("                                                                                                                 ")
   escreval("                                                        |----------------------------------------------------|")
   escreva("                                                          Litro/Mês: ")
   leia(combustivelUsadoTEMP)
   qtdCalc:=qtdCalc+1 //quantidade de calculos
   combustivelRelatorioTEMP[qtdCalc]:=Numpcarac(combustivelUsadoTEMP)+ " Litros (Álcool)"   //atribuir ao relatorio
   carbonoEmitidoTEMP[qtdCalc]:=(combustivelUsadoTEMP * (200/100))//formula de calculo mensal
   escreval("                                                        |----------------------------------------------------|")
   sucessoCalc()
fimprocedimento

procedimento calcGnv() //calcular emissao gas natual
inicio
   desenhoCalculadora()
   escreval("                                                                   Forma de emissão: Gás Natural(GNV)     ")
   escreval("                                                                                                                 ")
   escreval("                                                        |----------------------------------------------------|")
   escreva("                                                          Metro cúbico/Mês: ")
   leia(combustivelUsadoTEMP)
   qtdCalc:=qtdCalc+1 //quantidade de calculos
   combustivelRelatorioTEMP[qtdCalc]:=Numpcarac(combustivelUsadoTEMP)+ " Metros cúbicos(GNV)"   //atribuir ao relatorio
   carbonoEmitidoTEMP[qtdCalc]:=(combustivelUsadoTEMP * (170/100))//formula de calculo mensal
   escreval("                                                        |----------------------------------------------------|")
   sucessoCalc()
fimprocedimento



procedimento calcAerea() //calcular emissao viagem de aviao
inicio
   desenhoCalculadora()
   escreval("                                                                   Forma de emissão: Viagem aérea     ")
   escreval("                                                                                                                ")
   escreval("                                                        |----------------------------------------------------|")
   escreva("                                                          Distância do voo(km): ")
   leia(combustivelUsadoTEMP)
   qtdCalc:=qtdCalc+1 //quantidade de calculos
   combustivelRelatorioTEMP[qtdCalc]:=Numpcarac(combustivelUsadoTEMP)+ " Quilômetros de voo "   //atribuir ao relatorio
   carbonoEmitidoTEMP[qtdCalc]:=combustivelUsadoTEMP * (90/100) //formula de calculo mensal
   escreval("                                                        |----------------------------------------------------|")
   sucessoCalc()
fimprocedimento

procedimento calcEletrico() //calcular emissao eletrecidade
inicio
   desenhoCalculadora()
   escreval("                                                                         Informe a sua região                    ")
   escreval("")
   escreval("                                                                     [1] Amazonas, Amapá e Roraima                   ")
   escreval("")
   escreval("                                                                     [2] Outros estados no Brasil                           ")
   escreval("")
   escreval("                                                                     [3] Internacional                        ")
   escreval("")
   escreval("                                                                     -- ")
   escreval("")
   escreval("                                                                     [0] Voltar                                    ")
   leia(op)
   escolha op
   caso 1
      calcEletNorte()
   caso 2
      calcEletOutro()
   caso 3
      calcEletInter()
   caso 0
      calculadora()
   outrocaso
      desenhoCalculadora()
      invalido()
      calcEletrico()
   fimescolha
fimprocedimento

procedimento calcEletNorte()  //calcular emissao eletricidade regiao norte
inicio
   desenhoCalculadora()
   escreval("                                                                   Forma de emissão: Energia elétrica     ")
   escreval("                                                                                                                ")
   escreval("                                                        |----------------------------------------------------|")
   escreva("                                                          Consumo energia elétrica(mensal/kWh: ")
   leia(combustivelUsadoTEMP)
   qtdCalc:=qtdCalc+1 //quantidade de calculos
   combustivelRelatorioTEMP[qtdCalc]:=Numpcarac(combustivelUsadoTEMP)+ " kWh/Mês (norte do Brasil) "   //atribuir ao relatorio
   carbonoEmitidoTEMP[qtdCalc]:=combustivelUsadoTEMP * (20/100) //formula de calculo mensal
   escreval("                                                        |----------------------------------------------------|")
   sucessoCalc()
fimprocedimento

procedimento calcEletOutro()   //calcular emissao eletricidade outros estados
inicio
   desenhoCalculadora()
   escreval("                                                                   Forma de emissão: Energia elétrica     ")
   escreval("                                                                                                                ")
   escreval("                                                        |----------------------------------------------------|")
   escreva("                                                          Consumo energia elétrica(mensal/kWh: ")
   leia(combustivelUsadoTEMP)
   qtdCalc:=qtdCalc+1 //quantidade de calculos
   combustivelRelatorioTEMP[qtdCalc]:=Numpcarac(combustivelUsadoTEMP)+ " kWh/Mês (outros estados do Brasil) "   //atribuir ao relatorio
   carbonoEmitidoTEMP[qtdCalc]:=combustivelUsadoTEMP * (60/100) //formula de calculo mensal
   escreval("                                                        |----------------------------------------------------|")
   sucessoCalc()
fimprocedimento

procedimento calcEletInter()   //calcular emissao internacional
inicio
   desenhoCalculadora()
   escreval("                                                                   Forma de emissão: Energia elétrica     ")
   escreval("                                                                                                                ")
   escreval("                                                        |----------------------------------------------------|")
   escreva("                                                          Consumo energia elétrica(mensal/kWh: ")
   leia(combustivelUsadoTEMP)
   qtdCalc:=qtdCalc+1 //quantidade de calculos
   combustivelRelatorioTEMP[qtdCalc]:=Numpcarac(combustivelUsadoTEMP)+ " kWh/Mês (internacional) "   //atribuir ao relatorio
   carbonoEmitidoTEMP[qtdCalc]:=combustivelUsadoTEMP * (50/100) //formula de calculo mensal
   escreval("                                                        |----------------------------------------------------|")
   sucessoCalc()
fimprocedimento


inicio
   sessaoLogado := 6
   qtdSessao := 6
cotacaoCredito:=385
qtdusuario:= 6
   usuario[1].sessao := 1
   usuario[1].nome := "Yamuna"
   usuario[1].cnpj := "11111111111111"
   usuario[1].senha := "a"
   usuario[1].vendedorOUcomprador := 1
   usuario[1].saldoCredito := 9000
   usuario[1].fisicooujuri := "pessoa juridica"

   usuario[2].sessao := 2
   usuario[2].nome := "Kesia Laís"
   usuario[2].cpf := "22222222222"
   usuario[2].idade := 24
   usuario[2].senha := "b"
   usuario[2].vendedorOUcomprador := 1
   usuario[2].saldoCredito := 9000
   usuario[2].fisicooujuri := "pessoa física"

   usuario[3].saldoCredito := 9000
   usuario[3].sessao := 3
   usuario[3].nome := "Agro Tech"
   usuario[3].cnpj := "33333333333333"
   usuario[3].idade := 18
   usuario[3].senha := "c"
   usuario[3].vendedorOUcomprador := 1
   usuario[3].fisicooujuri := "pessoa jurídica"

   usuario[4].saldoDinheiro := 20000
   usuario[4].sessao := 4
   usuario[4].nome:="Caio Cidral Ramos"
   usuario[4].cpf:="44444444444"
   usuario[4].idade:=30
   usuario[4].senha:="d"
   usuario[4].fisicooujuri := "pessoa física"
   usuario[4].vendedorOUcomprador := 1

   usuario[5].saldoCredito := 9000
   usuario[5].sessao := 5
   usuario[5].nome := "Maria Eduarda"
   usuario[5].cpf := "55555555555"
   usuario[5].idade := 18
   usuario[5].senha := "c"
   usuario[5].vendedorOUcomprador := 1
   usuario[5].fisicooujuri := "pessoa física"

   usuario[6].sessao := 6
   usuario[6].nome := "Transville"
   usuario[6].cpf := "12345678901"
   usuario[6].senha := "123"
   usuario[6].vendedorOUcomprador := 0
   usuario[6].fisicooujuri := "pessoa jurídica"


   usuarioMercado[1,1].qtdAnuncioM := 1
   usuarioMercado[2,1].qtdAnuncioM := 1
   usuarioMercado[3,1].qtdAnuncioM := 1
   usuarioMercado[4,1].qtdAnuncioM := 1
   usuarioMercado[5,1].qtdAnuncioM := 1

   usuario[1].qtdAnuncio := 1
   usuario[2].qtdAnuncio := 1
   usuario[3].qtdAnuncio := 1
   usuario[4].qtdAnuncio := 1
   usuario[5].qtdAnuncio := 1


   usuarioMercado[1,1].qtdCredAnuncio := 15
   usuarioMercado[2,1].qtdCredAnuncio := 50
   usuarioMercado[3,1].qtdCredAnuncio := 35
   usuarioMercado[4,1].qtdCredAnuncio := 25
   usuarioMercado[5,1].qtdCredAnuncio := 20

   usuarioMercado[1,1].precoCredAnuncio := 385
   usuarioMercado[2,1].precoCredAnuncio := 385
   usuarioMercado[3,1].precoCredAnuncio := 385
   usuarioMercado[4,1].precoCredAnuncio := 385
   usuarioMercado[5,1].precoCredAnuncio := 385


   usuarioMercado[1,1].id_anuncio := 1
   usuarioMercado[2,1].id_anuncio := 2
   usuarioMercado[3,1].id_anuncio := 3
   usuarioMercado[4,1].id_anuncio := 4
   usuarioMercado[5,1].id_anuncio := 5




   paginainicial()

fimalgoritmo