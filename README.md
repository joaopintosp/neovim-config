# Overview

Esta é a minha configuração pessoal do `neovim`, feito propositadamente para produzir documentos com LaTeX.
Inclui *autocomplete*, *fuzzy finder*, esquema de cores personalizado, integração com *git*, compilação de documentos utilizando a distribuição *texlive*.

> *Esta configuração foi feita para sistemas Linux, mais precisamente na distribuição Ubuntu 24.04 LTS. Não se verificou se é compatível com outros sistemas operativos, nem se fornece opções de instalação de pacotes para outras distribuições Linux.*

## Conteúdo 
- [⚠️ Dependências](#️-dependências)
  - [Opcional](#opcional)
  - [🔤 Fontes](#-fontes)
- [📌 Clonar o repositório](#-clonar-o-repositório)
- [🚀 Utilização](#-utilização)
- [⚙️ Troubleshooting](#️-troubleshooting)
- [📝 LaTeX](#-latex)
- [💭 Feedback](#-feedback)

## Instalação

### ⚠️ Dependências

É necessário instalar outros pacotes adicionais de forma a que a configuração funcione corretamente. 

```bash
sudo apt install lua luarocks python3 pip curl
```

Instalar a biblioteca `jsregexp` utilizando o `luarocks`.

```bash
sudo luarocks install jsregexp
```

Instalar o [nodejs](https://nodejs.org/en).

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
nvm install 22
```

Verificar a versão do `nodejs` instalada.

```bash
node -v # should print `v22.9.0`
npm -v # should print `10.8.3`
```

#### Opcional

Se desejar ter suporte para diferentes tipos de linguagens de programação, pode instalar os seguintes pacotes.

```bash
sudo apt install php javacc
```
O seguinte comando instala a linguagem de programação [julia](https://julialang.org/downloads/).

```bash
curl -fsSL https://install.julialang.org | sh
```

Para obter a linguagem de programação `go`, pode instalar a partir do `snap` ou de outra [forma](https://go.dev/dl/).

```bash
sudo snap install go --classic
```

#### 🔤 Fontes

Esta configuração foi feita para ser utilizada com uma *Nerd Font* de forma a que seja possível representar ícones no terminal. 
Para instalar uma *Nerd Font*, basta escolher a [fonte](https://www.nerdfonts.com/font-downloads) que deseja e colocá-la no directório de fontes do sistema.

Faça o download da fonte que deseja, por exemplo a **JetBrainsMono Nerd Font** é uma boa escolha. Ou a **MesloLG Nerd Font**. Coloque o arquivo que fez download no directório de downloads do sistema `$HOME/Downloads/`.
Navegue para o directório onde as fontes estão localizadas.

```bash
cd $HOME/Downloads/
```

Extraia as fontes do ficheiro `.zip` que baixou.

```bash
sudo unzip JetBrainsMono.zip '*.ttf' -d /usr/share/fonts/truetype/jetbrainsmono/
```

Faça update da cache de fontes do sistema, para que o OS reconheça as novas fontes instaladas.

```bash
sudo fc-cache -f -v
```

### 📌 Clonar o repositório
Para utilizar esta configuração basta clonar este repositório para o directório `/$HOME/.config/nvim`.

Antes de clonar este repositório, é necessário instalar o `git` e o `neovim`. Para distribuições Linux baseadas em Ubuntu, basta copiar e colar os seguintes comandos no terminal.

```bash
sudo apt update -y && sudo apt upgrade -y
sudo apt install git neovim
```

Se desejar obter uma versão do `neovim` superior à versão disponível nos repositórios do Ubuntu, ou utilizar outro sistema operativo, basta seguir as instruções do [link](https://github.com/`neovim`/`neovim`/blob/master/INSTALL.md) para instalar o `neovim`.

Tendo instalado todas as dependências, assim como o `neovim`, pode clonar este repositório. Basta copiar e colar o seguinte comando no seu terminal que irá colocar a configuração na devida localização.

```bash
mkdir -p $HOME/.config/nvim && git clone https://github.com/joaopintosp/neovim-config $HOME/.config/nvim
```

## 🚀 Utilização

Após ter completado os passos anteriores, terá o `neovim` instalado no seu sistema. Para lançar uma nova instância do `neovim`, basta escrever `nvim` no seu terminal de escolha.

```bash
nvim
```

**É necessário deixar o `neovim` aberto para que ele instale os pacotes associados aos plugins já incluidos nesta configuração. Se sair do `neovim` enquanto ele está a descomprimir os arquivos, irá resultar numa instalação falhada.**

É recomendado fazer um `:PackerSync` e um `:PackerUpdate` para que os plugins sejam todos instalados e atualizados.

Aconselha-se a fazer um `:checkhealth` para verificar o estado da instalação e corrigir possíveis erros.


### ⚙️ Troubleshooting

Caso tenha erros relacionados com o `Mason`, verifique que tem os servidores de linguagem necessários instalados. Pode instalá-los manualmente, através da consola do neovim, com os seguintes comandos.

```nvim
:MasonInstall pyright
:MasonInstall json-lsp
:MasonInstall texlab
:MasonInstall lua-language-server
```

Caso continue com erros, tente forçar a instalação, adicionando o argumento `--force` aos comandos em cima.

```nvim
:MasonInstall --force pyright
:MasonInstall --force json-lsp
:MasonInstall --force texlab
:MasonInstall --force lua-language-server
```

## 📝 LaTeX 

Uma vez que a motivação principal para esta configuração é escrever e compilar documentos em LaTeX, se desejar, é necessário instalar uma distribuição LaTeX para o fazer. 
Para sistemas Linux, é recomendada a distribuição `texlive`, que pode ser instalada com o seguinte comando.
```bash
sudo apt install texlive-full
```

O comando anterior irá instalar **todos** os pacotes necessários para compilar documentos em LaTeX. No entanto, esta instalação irá ocupar bastante espaço (cerca de 6 Gb). Se for uma utilizador avançado e souber que pacotes são necessários para o seu uso pessoal, instale apenas o que achar necessário. Se for um iniciante, recomenda-se a instalar o pacote `texlive-full` dessa forma sabe que tudo o que poderá precisar está incluído neste pacote.

Caso não instale o pacote `texlive-full` e escolha a dedo apenas os pacotes necessários, não se esqueça de instalar os pacotes `latexmk` e `biber`. Além disso, recomenda-se a instalação dos pacotes `texlive-luatex` e `texlive-xetex` se desejar compilar documentos com outros motores de compilação.

## 💭 Feedback

Estou aberto a melhorias, isto é apenas o ínicio na minha viagem dentro do mundo do `neovim`. É de esperar que haja muita coisa a melhorar, portanto não exitem em informar-me de qualquer tipo de problema.
