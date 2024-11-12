/* ====================== *
 *  Toggle Between        *
 *  Sign Up / Login       *
 * ====================== */
$(document).ready(function() {
  $('#goRight').on('click', function() {
    clearErrors(); // Limpa os campos ao alternar para a seção de login
    $('#slideBox').animate({
      'marginLeft': '0'
    });
    $('.topLayer').animate({
      'marginLeft': '100%'
    });
    $(this).blur(); // Remove foco do botão
  });

  $('#goLeft').on('click', function() {
    clearErrors(); // Limpa os campos ao alternar para a seção de registro
    if (window.innerWidth > 769) {
      $('#slideBox').animate({
        'marginLeft': '50%'
      });
    } else {
      $('#slideBox').animate({
        'marginLeft': '20%'
      });
    }
    $('.topLayer').animate({
      'marginLeft': '0'
    });
    $(this).blur(); // Remove foco do botão
  });

  // Alternar entre campos de pessoa física e jurídica
  $('input[name="tipoCadastro"]').on('change', function() {
    clearErrors(); // Limpa os campos ao alternar entre pessoa física e jurídica
    if ($(this).val() === 'pessoaFisica') {
      $('#campos-pessoa-fisica').show();
      $('#campos-pessoa-juridica').hide();
    } else if ($(this).val() === 'pessoaJuridica') {
      $('#campos-pessoa-fisica').hide();
      $('#campos-pessoa-juridica').show();
    }
  });

  // Definir pessoa física como padrão
  $('input[name="tipoCadastro"][value="pessoaFisica"]').prop('checked', true).trigger('change');

  // Validação de campos ao clicar em "Confirmar" no cadastro
  $('#signUp').on('click', function() {
    let isValid = validateSignUpForm();
    const termsChecked = $('#confirm-terms').is(':checked');

    if (!termsChecked) {
      showErrorAboveCheckbox('#confirm-terms', "Você deve aceitar os termos de serviço.");
      isValid = false;
    } else {
      clearSingleError('#confirm-terms');
    }

    if (isValid) {
      let users = JSON.parse(localStorage.getItem('users')) || [];
      const email = $('#email').val();
      const cpf = $('#cpf').val();
      const cnpj = $('#cnpj').val();

      // Verifica se o e-mail, CPF ou CNPJ já existem
      const existingUser = users.find(user => user.email === email || user.cpf === cpf || user.cnpj === cnpj);
      if (existingUser) {
        if (existingUser.email === email) {
          showError('#email', "Este e-mail já está registrado.", true);
        } else if (existingUser.cpf === cpf) {
          showError('#cpf', "Este CPF já está registrado.", true);
        } else if (existingUser.cnpj === cnpj) {
          showError('#cnpj', "Este CNPJ já está registrado.", true);
        }
        return;
      }

      const newUser = {
        tipoCadastro: $('input[name="tipoCadastro"]:checked').val(),
        email: email,
        senha: $('#password-signup').val(),
        cpf: cpf || null,
        nome: $('#username-signup').val() || null,
        cnpj: cnpj || null,
        empresa: $('#empresa').val() || null
      };

      // Armazena o novo usuário
      users.push(newUser);
      localStorage.setItem('users', JSON.stringify(users));

      // Autentica e redireciona
      localStorage.setItem('loggedInUser', JSON.stringify(newUser));
      alert("Cadastro realizado com sucesso!");
      window.location.href = 'homepage.html'; // Redireciona para a página inicial após o cadastro
    }
    $(this).blur(); // Remove foco do botão
  });

  // Validação de campos ao clicar em "Entrar" no login
  $('#logIn').on('click', function() {
    let isValid = validateLoginForm();
    if (isValid) {
      const email = $('#username-login').val();
      const senha = $('#password-login').val();
      let users = JSON.parse(localStorage.getItem('users')) || [];

      const user = users.find(user => user.email === email && user.senha === senha);
      if (user) {
        localStorage.setItem('loggedInUser', JSON.stringify(user));
        alert("Login realizado com sucesso!");
        window.location.href = 'homepage.html'; // Redireciona para a página inicial
      } else {
        showError('#username-login', "Credenciais inválidas. Verifique seu e-mail e senha.", true);
        showError('#password-login', "Credenciais inválidas. Verifique seu e-mail e senha.", true);
      }
    }
    $(this).blur(); // Remove foco do botão
  });

  // Limpar mensagens de erro ao focar em campos
  $('input').on('focus', function() {
    clearSingleError(`#${$(this).attr('id')}`);
  });
});

// Função para validar o formulário de cadastro
function validateSignUpForm() {
  const tipoCadastro = $('input[name="tipoCadastro"]:checked').val();
  const email = $('#email').val();
  const senha = $('#password-signup').val();
  const confirmaSenha = $('#confirm-password').val();

  let isValid = true;
  clearErrors();

  if (tipoCadastro === 'pessoaFisica') {
    const cpf = $('#cpf').val();
    const nome = $('#username-signup').val();

    if (!/^\d{11}$/.test(cpf)) {
      showError('#cpf', "CPF deve conter exatamente 11 dígitos numéricos.", true);
      isValid = false;
    }
    if (nome.length < 3) {
      showError('#username-signup', "O nome deve conter pelo menos 3 caracteres.", true);
      isValid = false;
    }
  }

  if (tipoCadastro === 'pessoaJuridica') {
    const cnpj = $('#cnpj').val();
    const empresa = $('#empresa').val();

    if (!/^\d{14}$/.test(cnpj)) {
      showError('#cnpj', "CNPJ deve conter exatamente 14 dígitos numéricos.", true);
      isValid = false;
    }
    if (empresa.trim() === "") {
      showError('#empresa', "O nome da empresa é obrigatório.", true);
      isValid = false;
    }
  }

  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
    showError('#email', "Email inválido.", true);
    isValid = false;
  }
  if (senha.length < 6) {
    showError('#password-signup', "A senha deve conter pelo menos 6 caracteres.", true);
    isValid = false;
  }
  if (senha !== confirmaSenha) {
    showError('#confirm-password', "A confirmação de senha não coincide com a senha.", true);
    isValid = false;
  }

  return isValid;
}

// Função para validar o formulário de login
function validateLoginForm() {
  const email = $('#username-login').val();
  const senha = $('#password-login').val();

  let isValid = true;
  clearErrors();

  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
    showError('#username-login', "Email inválido.", true);
    isValid = false;
  }
  if (senha.length < 6) {
    showError('#password-login', "A senha deve conter pelo menos 6 caracteres.", true);
    isValid = false;
  }

  return isValid;
}

// Função para exibir mensagem de erro e substituir o valor do campo
function showError(selector, message, replaceValue = false) {
  $(selector).addClass('error-border');
  if (replaceValue) {
    $(selector).val('');
    $(selector).attr('placeholder', message);
  } else {
    $(selector).attr('placeholder', message);
  }
}

// Função para exibir a mensagem de erro acima da caixa de seleção
function showErrorAboveCheckbox(selector, message) {
  let errorSpan = $(selector).siblings('.error-message');
  if (errorSpan.length === 0) {
    errorSpan = $('<span class="error-message"></span>');
    $(selector).before(errorSpan);
  }
  errorSpan.text(message).css('color', 'red').show();
}

// Função para limpar a mensagem de erro de um único campo
function clearSingleError(selector) {
  $(selector).removeClass('error-border');
  $(selector).attr('placeholder', '');
  $(selector).siblings('.error-message').text('').hide();
}

// Função para limpar mensagens de erro
function clearErrors() {
  $('.error-border').removeClass('error-border');
  $('input').attr('placeholder', '');
  $('.error-message').text('').hide();
}



/* ====================== *
 *  Initiate Canvas       *
 * ====================== */
paper.install(window);
paper.setup(document.getElementById("canvas"));

// Variáveis do Paper.js (Canvas)
var canvasWidth, 
    canvasHeight,
    canvasMiddleX,
    canvasMiddleY;

var shapeGroup = new Group();

var positionArray = [];

function getCanvasBounds() {
  canvasWidth = view.size.width;
  canvasHeight = view.size.height;
  canvasMiddleX = canvasWidth / 2;
  canvasMiddleY = canvasHeight / 2;

  var position1 = { x: (canvasMiddleX / 2) + 100, y: 100 };
  var position2 = { x: 200, y: canvasMiddleY };
  var position3 = { x: (canvasMiddleX - 50) + (canvasMiddleX / 2), y: 150 };
  var position4 = { x: 0, y: canvasMiddleY + 100 };
  var position5 = { x: canvasWidth - 130, y: canvasHeight - 75 };
  var position6 = { x: canvasMiddleX + 80, y: canvasHeight - 50 };
  var position7 = { x: canvasWidth + 60, y: canvasMiddleY - 50 };
  var position8 = { x: canvasMiddleX + 100, y: canvasMiddleY + 100 };

  positionArray = [position3, position2, position5, position4, position1, position6, position7, position8];
}

/* ====================== *
 * Create Shapes          *
 * ====================== */
function initializeShapes() {
  getCanvasBounds();

  var shapePathData = [
    'M231,352l445-156L600,0L452,54L331,3L0,48L231,352', 
    'M0,0l64,219L29,343l535,30L478,37l-133,4L0,0z', 
    'M0,65l16,138l96,107l270-2L470,0L337,4L0,65z',
    'M333,0L0,94l64,219L29,437l570-151l-196-42L333,0',
    'M331.9,3.6l-331,45l231,304l445-156l-76-196l-148,54L331.9,3.6z',
    'M389,352l92-113l195-43l0,0l0,0L445,48l-80,1L122.7,0L0,275.2L162,297L389,352',
    'M 50 100 L 300 150 L 550 50 L 750 300 L 500 250 L 300 450 L 50 100',
    'M 700 350 L 500 350 L 700 500 L 400 400 L 200 450 L 250 350 L 100 300 L 150 50 L 350 100 L 250 150 L 450 150 L 400 50 L 550 150 L 350 250 L 650 150 L 650 50 L 700 150 L 600 250 L 750 250 L 650 300 L 700 350 '
  ];

  for (var i = 0; i <= shapePathData.length; i++) {
    var headerShape = new Path({
      strokeColor: 'rgba(255, 255, 255, 0.5)',
      strokeWidth: 2,
      parent: shapeGroup,
    });
    headerShape.pathData = shapePathData[i];
    headerShape.scale(2);
    headerShape.position = positionArray[i];
  }
}

initializeShapes();

/* ====================== *
 * Animation              *
 * ====================== */
view.onFrame = function paperOnFrame(event) {
  if (event.count % 4 === 0) {
    for (var i = 0; i < shapeGroup.children.length; i++) {
      shapeGroup.children[i].rotate(i % 2 === 0 ? -0.1 : 0.1);
    }
  }
};

view.onResize = function paperOnResize() {
  getCanvasBounds();
  for (var i = 0; i < shapeGroup.children.length; i++) {
    shapeGroup.children[i].position = positionArray[i];
  }

  if (canvasWidth < 700) {
    shapeGroup.children[3].opacity = 0;
    shapeGroup.children[2].opacity = 0;
    shapeGroup.children[5].opacity = 0;
  } else {
    shapeGroup.children[3].opacity = 1;
    shapeGroup.children[2].opacity = 1;
    shapeGroup.children[5].opacity = 1;
  }
};
