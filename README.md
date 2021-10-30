# IRL_FASTCDS
> Script que possibilita a coleta de coordenadas do jogador de forma prática e personalizada.
###### O script foi desenvolvido pensando em facilitar a coleta de coordenadas do jogador para utilização em outros scripts que usam percusos/rotas. 

## Config.lua
1. Config.webhookCDS
     - Link do webhook para enviar a mensagem com as coordenadas
2. Config.checkPermission
     -  Quem vai poder usar o sistema

## /fastCDS
### Inicia a coleta de CDS, tecla [E] envia a coordenada e tecla [G] altera o modelo.

#### Os modelos são predefinidos pelos padrões frequentemente utilizados, porém é possível personaliza-lo no arquivo server.lua.

#### Modelo = 1
x,y,z,h

#### Modelo = 2
['x'] = x, ['y'] = y, ['z'] = , ['h'] =  h

#### Modelo = 3
x = x, y = y, z = z, h = h
