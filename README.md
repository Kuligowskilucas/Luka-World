# Luka: Guerra do Paraguai

Jogo educativo top-down 2D, feito em Godot, sobre um dos conflitos mais
devastadores e menos lembrados da história da América do Sul: a Guerra do
Paraguai (1864–1870).

O jogador controla **Luka**, um garoto transportado para dentro do conflito.
A proposta não é vencer a guerra — é atravessá-la, observar e entender. Ao
longo do jogo, Luka tenta interferir nos acontecimentos e descobre que a
história se cumpre de qualquer forma. O que muda é o **caminho** e o que ele
aprende pelo caminho.

> Originalmente desenvolvido como meu projeto de conclusão do curso técnico
> (TCC) em Godot 3.5. Atualmente passa por uma reconstrução do zero em
> Godot 4 como um título próprio.

---

## Conceito

A guerra é apresentada não como uma lista de datas, mas como um espaço para
explorar. Em vez de narrar o que aconteceu, o jogo coloca o jogador *dentro*
do evento e deixa o contexto histórico emergir da exploração — objetos,
diálogos e cenas que situam o jogador no período sem interromper a experiência
para "dar uma aula".

A ideia faz parte de uma proposta maior: uma série em que cada título aborda um
evento histórico importante, porém pouco presente no imaginário comum.

---

## Funcionalidades

- Exploração top-down 2D em múltiplas cenas jogáveis
- Inimigos e NPCs com os quais o jogador interage ao longo do percurso
- Itens colecionáveis com peso histórico (cartas oficiais, diários, moedas,
  cédula paraguaia, manifesto de carga) que ampliam o contexto do período
- Sistema de diálogos próprio
- Cutscenes que costuram a narrativa entre as fases
- Menu principal, pausa, game over e cena final
- Trilha sonora com hinos de época integrados

---

## Tecnologias

- **Engine:** Godot 3.5.x
- **Linguagem:** GDScript
- **Arte:** pixel art

---

## Como rodar

1. Instale o [Godot 3.5.x](https://godotengine.org/download/archive/).
2. Clone o repositório:
   ```bash
   git clone https://github.com/Kuligowskilucas/Luka-World.git
   ```
3. Abra o Godot, clique em **Import**, selecione o arquivo `project.godot`
   da pasta clonada e abra o projeto.
4. Pressione **F5** (ou o botão de play) para iniciar. A cena inicial é
   `Scenes/Cutscenes/Logo.tscn`.

> Versão jogável (sem precisar do editor): https://kuligowskilucas.itch.io/luka-world

---

## Estrutura do projeto

```
Scenes/
  Collectible/      cenas dos itens colecionáveis
  Cutscenes/        cenas de transição narrativa
  PhysicsObjects/   objetos físicos do mundo
  PlayableScenes/   fases jogáveis (Main, Main_2, Main_3, Road)
  VisualScenes/     player, inimigos, NPCs, menus e UI
Scripts/
  CutscenesScripts/ lógica das cutscenes
  DialoguesScripts/ sistema de diálogos
  EntitiesScripts/  player, inimigos e estado do jogador
  SpecificScripts/  scripts pontuais (itens, fases, telas)
Tiles_arts/         sprites, tilesets, retratos e objetos
Sounds/             trilha e efeitos
Fonts/              fontes do jogo
```

---

## Status

Versão do TCC concluída e jogável. A reconstrução em Godot 4 está em
desenvolvimento, com redesenho de mecânicas e arte.

---

## Créditos

- **Programação e game design:** Lucas Gabriel Kuligowski
- **Arte:** [preencher — colaboradora(es)]

---

## Licença

Todos os direitos reservados. Este repositório é público para fins de
portfólio; o uso, a redistribuição ou a reutilização do código e dos assets
não estão autorizados sem permissão.