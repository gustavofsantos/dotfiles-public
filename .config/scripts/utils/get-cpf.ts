export const getCPF = () => {
  return fetch("https://www.4devs.com.br/ferramentas_online.php", {
    method: "POST",
    body: "acao=gerar_cpf&pontuacao=N&cpf_estado=",
    headers: {
      "content-length": 38,
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
      origin: "https://www.4devs.com.br"
    }
  })
    .then(res => res.text())
    .then(data => String(data))
}
