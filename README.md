# Proyecto Yoppen

El Proyecto Yoppen busca innovar en el espacio de las criptomonedas, combinando tecnología blockchain avanzada con una visión de inclusión y comunidad. Este repositorio contiene el código fuente de la criptomoneda Yoppen (YPN), la estructura de su Oferta Inicial de Monedas (ICO) y el intercambio descentralizado (DEX) asociado.

## Introducción

Yoppen es una criptomoneda diseñada para promover la conectividad y el apoyo dentro de su comunidad de usuarios. Inspirada en valores de cooperación y solidaridad, Yoppen busca ser más que una moneda digital: un movimiento hacia transacciones más justas y equitativas.

## Características

- **Token ERC-20:** Yoppen utiliza el estándar ERC-20 para garantizar la compatibilidad con la amplia gama de infraestructuras Ethereum.
- **ICO Trustless:** Una ICO descentralizada permite a los inversores participar de manera segura y transparente.
- **DEX Integrado:** La plataforma incluye un DEX para facilitar el intercambio de Yoppen por otras criptomonedas sin intermediarios.

## Tecnologías Utilizadas

- [Solidity](https://soliditylang.org/)
- [OpenZeppelin](https://openzeppelin.com/)
- [Remix IDE](https://remix.ethereum.org/)
- [Web3.js](https://web3js.readthedocs.io/)

## Estructura del Repositorio

- `contracts/` - Contiene los contratos inteligentes de Yoppen, ICO y DEX.
- `migrations/` - Scripts de migración para desplegar los contratos en la red Ethereum.
- `tests/` - Pruebas automatizadas para validar la lógica de los contratos.

## Desarrollo

Para comenzar a trabajar con el proyecto, clona este repositorio y sigue los pasos a continuación para instalar las dependencias y compilar los contratos.

```bash
npm install
truffle compile
```
## Contribuir
Si estás interesado en contribuir al proyecto Yoppen, por favor lee CONTRIBUTING.md para más información sobre cómo empezar.

## Licencia
Este proyecto está bajo la licencia MIT. Ver LICENSE para más detalles.

## Contacto
Para más información, por favor contacta a richard.poblete@hotmail.com.

# Creación de Token ERC20 YoppenToken

## Descripción
`YoppenToken` es un token ERC-20 desarrollado en Solidity que incorpora varias extensiones de la librería OpenZeppelin para proporcionar funcionalidades avanzadas como quema de tokens, pausabilidad y permisos. Este token ha sido diseñado para ser utilizado en la red de prueba Sepolia de Ethereum, facilitando una amplia gama de operaciones financieras descentralizadas.
## Código fuente Solidity
```bash
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";


contract YoppenToken is ERC20, ERC20Burnable, ERC20Pausable, Ownable, ERC20Permit {
    constructor(address initialOwner)
        ERC20("Yoppen", "YPN") 
        Ownable(initialOwner)
        ERC20Permit("Yoppen") {
        _mint(msg.sender, 1000000 * 10 ** decimals()); // Emite 1,000,000 YPN al desplegar el contrato
    
  }
    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Pausable)
    {
        super._update(from, to, value);
    }
}

```

## Características
- **ERC20**: Estándar básico para la creación de tokens intercambiables en la red Ethereum.
- **ERC20Burnable**: Permite a los titulares de tokens destruir (quemar) sus tokens, reduciendo el suministro total.
- **ERC20Pausable**: Introduce la capacidad de pausar y despausar las transferencias de tokens, lo que puede ser útil en situaciones de emergencia o mantenimiento.
- **Ownable**: Restringe ciertas acciones solo al propietario del contrato, como la emisión de nuevos tokens o la pausa del contrato.
- **ERC20Permit**: Permite a los usuarios realizar transacciones sin pagar gas, firmando una autorización.

## Funciones Principales
- **constructor(address initialOwner)**: Establece el nombre y símbolo del token, el propietario inicial y habilita los permisos según el estándar ERC20Permit.
- **pause()**: Pausa todas las transferencias de tokens.
- **unpause()**: Reanuda todas las transferencias de tokens.
- **mint(address to, uint256 amount)**: Permite al propietario del contrato acuñar nuevos tokens a una dirección específica.
- **_update(address from, address to, uint256 value)**: Sobrescribe las funciones de actualización de balances de tokens para ser compatibles con la pausabilidad.

## Despliegue
El contrato `YoppenToken` fue creado utilizando Visual Studio Code, compilado y desplegado a través de Remix, integrado con MetaMask y utilizando una cuenta de la red de prueba Sepolia.

## Licencia
Este proyecto está bajo la licencia MIT.

## Resultado del despliegue en Renix

URL TX https://sepolia.etherscan.io/tx/0x410ff30a0749306034cf9c95f1bc70656ee89960720a60ce16a9d56c0bc2325a

URL Contrato https://sepolia.etherscan.io/token/0xaa7a2a9cc60f5a696f37af3bde57fa06b884aed5

### Imagen del contrato Toekn ERC20
![image](https://github.com/richpob/MiCryptoCoins-ICo-DEX/assets/133718913/707c175f-f11c-43ec-86eb-15143f2a7735)

