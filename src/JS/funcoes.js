// VARIÁVEIS DE CONTROLE

let aux = false;

// FUNCOES PAGINA 'PERFIL'

function tabDadosLoader() {
    $.post(
        "./src/PHP/tabDados.php",
    )
    .done(
        function (retorno) {
            retorno = JSON.parse(retorno);

            $("#pfpImg").attr("src", "./src/imgs/pfp.png");
            $("#infoUserTitle").text("Olá, "+retorno['nome']);
            $("#infoNome").text(retorno['nome']);
            $("#infoSobrenome").text(retorno['sobrenome']);
            $("#infoCPF").text(retorno['cpf']);
            $("#infoEmail").text(retorno['email']);
            $("#infoNasc").text(retorno['nascimento']);
            $("#infoTel").text(retorno['tel']);
        }
    )
    .fail (
        function (cod, textStatus, msg) {
            alert("Erro!\nCódigo: " + cod + "\n\nStatus: " + textStatus + "\n\nMensagem: " + msg);
        }
    );
}

function tabVerificar() {
    if ($("#perfilInfoBox").css('visibility') === 'visible') {
        return "infoBox";
    } else if ($("#perfilCupomAtivoBox").css('visibility') === 'visible') {
        return "cupomAtivoBox";
    } else if ($("#perfilHistCupomBox").css('visibility') === 'visible') {
        return "histCupomBox";
    } else if ($("#perfilHistPontoBox").css('visibility') === 'visible') {
        return "histPontoBox";
    }
}

function tabDadosStyle() {
        let verifique = tabVerificar();
        let delay = "0";

        if (verifique == "cupomAtivoBox") {
            tabCupomAtivoStyle();
            delay = "200"; 
        } else if (verifique == "histCupomBox") {
            tabHistCupomStyle();
            delay = "200";
        } else if (verifique == "histPontoBox") {
            tabHistPontoStyle();
            delay = "200";
        }



        setTimeout(() => {
            if ($("#perfilInfoBox").css('visibility') === 'hidden') {
                $("#tabDados").css({
                    "border-left":" #611f1f solid"
                });
                $("#perfilInfoBox").css(
                    {
                        "display": "flex"
                    });
                $("#perfilTitle").html("<h1 style='text-align: center;'>Dados pessoais</h1>");
                setTimeout(() => {
                    $("#perfilTitle").css(
                        {
                            "visibility": "visible",
                            "opacity": "1",
                            "transition": "visibility 0s, opacity 0.2s linear"
                    });
                    $("#perfilInfoBox").css(
                        {
                            "visibility": "visible",
                            "opacity": "1",
                            "transition": "visibility 0s, opacity 0.2s linear"
                         });
                    }, 100);                
            } else {
                $("#tabDados").css({
                    "border-left":"white solid"
                });
                $("#perfilTitle").css({
                    "opacity": "0",
                    "transition": "visibility 0s, opacity 0.2s linear"
                });
                $("#perfilInfoBox").css(
                    {
                        "opacity": "0",
                        "transition": "visibility 0s, opacity 0.2s linear"
                    });
                setTimeout(() => {
                        $("#perfilTitle").css(
                            {
                                "visibility":"hidden"
                        });
                        $("#perfilInfoBox").css(
                            {
                                "visibility": "hidden",
                                "display": "none"
                            });
                    }, 200);
            }
        }, delay);
}

function tabCupomAtivoStyle() {
    let verifique = tabVerificar();
    let delay = "0";

    if (verifique == "infoBox") {
        tabDadosStyle();
        delay = "200"; 
    } else if (verifique == "histCupomBox") {
        tabHistCupomStyle();
        delay = "200";
    } else if (verifique == "histPontoBox") {
        tabHistPontoStyle();
        delay = "200";
    }

    setTimeout(() => {
        if ($("#perfilCupomAtivoBox").css('visibility') === 'hidden') {
            $("#tabCupomAtivo").css({
                "border-left":" #611f1f solid"
            });
            $("#perfilCupomAtivoBox").css(
                {
                    "display": "flex"
                });
            $("#perfilTitle").html("<h1 style='text-align: center;'>Cupons Ativos</h1>");                
            setTimeout(() => {
                $("#perfilTitle").css(
                    {
                        "visibility": "visible",
                        "opacity": "1",
                        "transition": "visibility 0s, opacity 0.2s linear"
                });
                $("#perfilCupomAtivoBox").css(
                    {
                        "visibility": "visible",
                        "opacity": "1",
                        "transition": "visibility 0s, opacity 0.2s linear"
                     });
                }, 100);                
        } else {
            $("#tabCupomAtivo").css({
                "border-left":"white solid"
            });
            $("#perfilTitle").css({
                "opacity": "0",
                "transition": "visibility 0s, opacity 0.2s linear"
            });
            $("#perfilCupomAtivoBox").css(
                {
                    "opacity": "0",
                    "transition": "visibility 0s, opacity 0.2s linear"
                });
            setTimeout(() => {
                    $("#perfilTitle").css(
                        {
                            "visibility":"hidden"
                    });
                    $("#perfilCupomAtivoBox").css(
                        {
                            "visibility": "hidden",
                            "display": "none"
                        });
                }, 200);
        }
    }, delay);
}

function tabHistCupomStyle() {
    let verifique = tabVerificar();
    let delay = "0";

    if (verifique == "infoBox") {
        tabDadosStyle();
        delay = "200"; 
    } else if (verifique == "cupomAtivoBox") {
        tabCupomAtivoStyle();
        delay = "200";
    } else if (verifique == "histPontoBox") {
        tabHistPontoStyle();
        delay = "200";
    }

    setTimeout(() => {
        if ($("#perfilHistCupomBox").css('visibility') === 'hidden') {
            $("#tabHistCupom").css({
                "border-left":" #611f1f solid"
            });
            $("#perfilHistCupomBox").css(
                {
                    "display": "flex"
                });
            $("#perfilTitle").html("<h1 style='text-align: center;'>Histórico de cupons</h1>");
            setTimeout(() => {
                $("#perfilTitle").css(
                    {
                        "visibility": "visible",
                        "opacity": "1",
                        "transition": "visibility 0s, opacity 0.2s linear"
                });
                $("#perfilHistCupomBox").css(
                    {
                        "visibility": "visible",
                        "opacity": "1",
                        "transition": "visibility 0s, opacity 0.2s linear"
                     });
                }, 100);                
        } else {
            $("#tabHistCupom").css({
                "border-left":"white solid"
            });
            $("#perfilTitle").css({
                "opacity": "0",
                "transition": "visibility 0s, opacity 0.2s linear"
            });
            $("#perfilHistCupomBox").css(
                {
                    "opacity": "0",
                    "transition": "visibility 0s, opacity 0.2s linear"
                });
            setTimeout(() => {
                    $("#perfilTitle").css(
                        {
                            "visibility":"hidden"
                        });
                    $("#perfilHistCupomBox").css(
                        {
                            "visibility": "hidden",
                            "display": "none"
                        });
                }, 200);
        }
    }, delay);
}

function tabHistPontoStyle() {
    let verifique = tabVerificar();
    let delay = "0";

    if (verifique == "infoBox") {
        tabDadosStyle();
        delay = "200"; 
    } else if (verifique == "cupomAtivoBox") {
        tabCupomAtivoStyle();
        delay = "200";
    } else if (verifique == "histCupomBox") {
        tabHistCupomStyle();
        delay = "200";
    }

    setTimeout(() => {
        if ($("#perfilHistPontoBox").css('visibility') === 'hidden') {
            $("#tabHistPonto").css({
                "border-left":" #611f1f solid"
            });
            $("#perfilHistPontoBox").css(
                {
                    "display": "flex"
                });
                $("#perfilTitle").html("<h1 style='text-align: center;'>Histórico de pontos</h1>");
            setTimeout(() => {
                $("#perfilTitle").css(
                    {
                        "visibility": "visible",
                        "opacity": "1",
                        "transition": "visibility 0s, opacity 0.2s linear"
                });
                $("#perfilHistPontoBox").css(
                    {
                        "visibility": "visible",
                        "opacity": "1",
                        "transition": "visibility 0s, opacity 0.2s linear"
                     });
                }, 100);                
        } else {
            $("#tabHistPonto").css({
                "border-left":"white solid"
            });
            $("#perfilTitle").css({
                "opacity": "0",
                "transition": "visibility 0s, opacity 0.2s linear"
            });
            $("#perfilHistPontoBox").css(
                {
                    "opacity": "0",
                    "transition": "visibility 0s, opacity 0.2s linear"
                });
            setTimeout(() => {
                    $("#perfilTitle").css(
                        {
                            "visibility":"hidden"
                    });
                    $("#perfilHistPontoBox").css(
                        {
                            "visibility": "hidden",
                            "display": "none"
                        });
                }, 200);
        }
    }, delay);
}

// FUNCOES PAGINA 'HOME'

function menuFadeOut() {
    if ($("#menuDropBG").css("visibility") === "visible") {
        $("#menuDropBG").css(
            {
                "visibility": "visible",
                "opacity":"0",
                "transition": "visibility 0s, opacity 0.2s linear;"
            });
        setTimeout(() => {
            $("#menuDropBG").css(
                {
                    "visibility": "hidden"
                });
        }, 200);
    }
};

function menuFadeIn() {
    event.stopPropagation();
    $("#menuDropBG").css(
        {
            "visibility": "visible",
            "opacity":"1",
            "transition": "visibility 0s, opacity 0.2s linear;"
        });
}

// Modo dark (ou noturno)

function ativarModoDark() {
    aux = !aux;
    let botaoDark = document.getElementById("botaoDark");
    let logo = document.getElementById("logo-login");
    let header = document.getElementsByTagName("header");
    let pesquisa = document.getElementById("inputSearch");
    let lupa = document.getElementById("lupa");
    let body = document.getElementsByTagName("body");
    let produtos = document.getElementsByClassName("produtos");
    if (aux == true) {
        botaoDark.innerHTML = "&#x2600;";
        logo.setAttribute("src", "./src/imgs/logo-login-dark.png");
    
        header[0].style.color = "white";
    
        pesquisa.classList.remove("inputSearchClass");
        pesquisa.classList.add("inputSearchDark");
    
        lupa.classList.remove("lupaClass");
        lupa.classList.add("lupa-darkClass");
    
        body[0].classList.add("bodyDark");
    
        for (i = 0; i < produtos.length; i++) {
            produtos[i].classList.add("produtosDark");
        }
    } else {
        botaoDark.innerHTML = "&#x1F319;";
        
        logo.setAttribute("src", "./src/imgs/logo-default.png");
    
        header[0].style.color = "#8A3C29";
    
        pesquisa.classList.add("inputSearchClass");
        pesquisa.classList.remove("inputSearchDark");
    
        lupa.classList.add("lupaClass");
        lupa.classList.remove("lupa-darkClass");
    
        body[0].classList.remove("bodyDark");
    
        for (i = 0; i < produtos.length; i++) {
            produtos[i].classList.remove("produtosDark");
        }
    }
}