# Proyecto Yoppen

El Proyecto Yoppen busca innovar en el espacio de las criptomonedas, combinando tecnología blockchain avanzada con una visión de inclusión y comunidad. Este repositorio contiene el código fuente de la criptomoneda Yoppen (YPN), la estructura de su Oferta Inicial de Monedas (ICO) y el intercambio descentralizado (DEX) asociado.

## Introducción

Yoppen es una criptomoneda diseñada para promover la conectividad y el apoyo dentro de su comunidad de usuarios. Inspirada en valores de cooperación y solidaridad, Yoppen busca ser más que una moneda digital: un movimiento hacia transacciones más justas y equitativas.

Para el nombre de la criptomoneda "Yoppen", inspirado en el vocabulario Selk'nam que significa "amigo" o "compañero", podríamos proponer un acrónimo y símbolo que reflejen tanto la herencia cultural como la naturaleza innovadora de la criptomoneda.

### Acrónimo: YPN
"YPN" captura las iniciales de "Yoppen" y lo condensa en una forma fácil de recordar y usar en comunicaciones digitales. Este acrónimo es corto, lo que facilita su uso en el mercado de criptomonedas, donde la simplicidad y la facilidad de recordación son claves para la adopción y el reconocimiento.

### Símbolo: ⓨ
Como símbolo, propongo utilizar "ⓨ", que es la letra "Y" dentro de un círculo. Esta representación visual hace referencia a la inicial de "Yoppen" y la inclusión en un círculo puede simbolizar la unidad, comunidad y la idea de globalidad, valores importantes para la criptomoneda inspirada en el concepto de amistad y cooperación. Además, el uso de un círculo es una práctica común en logotipos y símbolos para transmitir inclusión y totalidad.

Estas propuestas de acrónimo y símbolo buscan combinar la relevancia cultural del término "Yoppen" con la funcionalidad y el diseño requerido para una identificación clara en el ecosistema de criptomonedas.

### Imagen de Yoppen

<img src="https://github.com/richpob/MiCryptoCoins-ICo-DEX/assets/133718913/1676f7ed-79dd-46e4-b36e-65899a231731" width="100" height="100">


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
![image](https://github.com/richpob/MiCryptoCoins-ICo-DEX/assets/133718913/c02f1784-68e5-4ea8-890e-a2bb7bcdabfb)

Luego usando Visual Code Studio, creamos los códigos del proyecto

![image](https://github.com/richpob/MiCryptoCoins-ICo-DEX/assets/133718913/6eb783c2-9162-43b7-899e-1dfde1d314fc)


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
- **constructor(address initialOwner)**: Establece el nombre y símbolo del token, el propietario inicial y habilita los permisos según el estándar ERC20Permit.El constructor del contrato crea el token con el nombre "Yoppen" y el símbolo "YPN", y acuña inicialmente 1,000,000 de tokens para el creador del contrato. La función mint permite al propietario del contrato acuñar más tokens en el futuro.
- **pause()**: Pausa todas las transferencias de tokens.
- **unpause()**: Reanuda todas las transferencias de tokens.
- **mint(address to, uint256 amount)**: Permite al propietario del contrato acuñar nuevos tokens a una dirección específica.
- **_update(address from, address to, uint256 value)**: Sobrescribe las funciones de actualización de balances de tokens para ser compatibles con la pausabilidad.

## Despliegue
El contrato `YoppenToken` fue creado utilizando Visual Studio Code, compilado y desplegado a través de Remix, integrado con MetaMask y utilizando una cuenta de la red de prueba Sepolia.

## Licencia
Este proyecto está bajo la licencia MIT.

## Resultado del despliegue en Renix Yoppen Token ERC20

URL TX https://sepolia.etherscan.io/tx/0xe39b94713a973d60e80f881bc6d67d2ac06015261c94d49592e55e7ef0cb3642

URL del Contrato ERC20 https://sepolia.etherscan.io/token/0xa9be8b620119cd83d05c3b75211e8e6d9b27e1ef?a=0x9a9dee7e3e68175549ca5815671cb3717754d29f

URL del Token Yoppen 


### Imagen del contrato Toekn ERC20
![image](https://github.com/richpob/MiCryptoCoins-ICo-DEX/assets/133718913/707c175f-f11c-43ec-86eb-15143f2a7735)


# Oferta Inicial de Monedas (ICO)
Para organizar una Oferta Inicial de Monedas (ICO) para financiar tu proyecto de criptomoneda como "Yoppen" en Ethereum, necesitas crear un contrato de Crowdsale. A continuación, se muestra un ejemplo básico de cómo podría ser este contrato utilizando Solidity y aprovechando las librerías de OpenZeppelin, que proporcionan implementaciones seguras y comprobadas de estos tipos de contratos.

Este ejemplo asume que ya has creado el token ERC-20 "Yoppen" como se describió anteriormente. Ahora, crearemos el contrato Crowdsale que permitirá a los usuarios comprar tu token con Ether.

## Código fuente
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ICO {
    IERC20 public token;
    address public wallet;
    uint256 public rate;

    event TokensPurchased(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);

    constructor(address _token, address _wallet, uint256 _rate) {
        require(_token != address(0), "ICO: token is the zero address");
        require(_wallet != address(0), "ICO: wallet is the zero address");
        require(_rate > 0, "ICO: rate is 0");
        
        token = IERC20(_token);
        wallet = _wallet;
        rate = _rate;
    }

    function buyTokens(address beneficiary, uint256 weiAmount) public payable {
        require(beneficiary != address(0), "ICO: beneficiary is the zero address");
        require(weiAmount > 0, "ICO: weiAmount is 0");

        uint256 tokens = weiAmount * rate;
        token.transferFrom(wallet, beneficiary, tokens);

        emit TokensPurchased(msg.sender, beneficiary, weiAmount, tokens);
    }

    receive() external payable {
        buyTokens(msg.sender, msg.value);
    }
}
```

Este código Solidity define un contrato inteligente para una Oferta Inicial de Monedas (ICO, por sus siglas en inglés) utilizando un token ERC20 en la blockchain de Ethereum. A continuación, se detallan los componentes principales del contrato:

- Importación del Contrato IERC20 de OpenZeppelin: Se importa la interfaz IERC20 del contrato estándar ERC20 de OpenZeppelin. Esto permite interactuar con cualquier token ERC20, ya que IERC20 define las funciones estándar que debe tener un token ERC20.

- Variables de Estado:
    - IERC20 public token: Almacena la dirección del contrato del token ERC20 que se venderá en la ICO.
    - address public wallet: Dirección de la billetera que recibe el ether (ETH) pagado por los compradores de tokens.
    - uint256 public rate: Tasa de conversión entre ether y el token ERC20. Indica cuántos tokens se pueden comprar con 1 ETH.
    - Evento TokensPurchased: Un evento que se emite cada vez que se compran tokens. Esto permite a las aplicaciones externas y a los exploradores de blockchain rastrear las compras de tokens.

- Constructor: Establece las condiciones iniciales del contrato de ICO:
    - Verifica que la dirección del token ERC20 y la dirección de la billetera no sean la dirección cero.
    - Inicializa las variables de estado token, wallet y rate con los valores proporcionados.
- Función buyTokens:
    - Acepta dos parámetros: la dirección del beneficiario que recibirá los tokens (beneficiary) y la cantidad de ether (weiAmount) que se está pagando.
    - Verifica que la dirección del beneficiario no sea cero y que la cantidad de ether pagada sea mayor que cero.
    - Calcula la cantidad de tokens a transferir basándose en la tasa (rate) y la cantidad de ether recibida.
    - Transfiere los tokens del wallet del vendedor al beneficiario utilizando token.transferFrom.
    - Fallback Function (receive()): Permite que el contrato reciba ether directamente (sin llamar a una función específica). Cuando se envía ether al contrato, automáticamente llama a buyTokens para el remitente y el valor enviado.

El contrato es una implementación básica de una ICO donde los compradores pueden enviar ether al contrato y recibir tokens ERC20 a cambio, según una tasa predefinida. Este mecanismo es fundamental en el mundo de las criptomonedas y las finanzas descentralizadas (DeFi), permitiendo a los proyectos recaudar fondos vendiendo tokens propios a los inversores

## Pasos para desplegar y usar este contrato:
- Asegúrate de tener el token ERC-20 "Yoppen" desplegado.
- Despliega este contrato Crowdsale en Remix, especificando la tasa de cambio (tokens por Ether) y la dirección del contrato token "Yoppen" como argumentos del constructor.
- Los usuarios pueden enviar Ether al contrato para comprar tokens durante el período de la ICO.
- Este es un ejemplo simplificado. Para una ICO real, considera implementar características adicionales como límites de compra, bonificaciones, y la posibilidad de pausar o finalizar la venta, siempre asegurándote de cumplir con las regulaciones legales aplicables.

## Despliegue en REmix y Testnet Sepolia:
- URL TX:  https://sepolia.etherscan.io/tx/0x398737376af5b9bd2324fbe96bb228ca035b40e39a8572b4d083e1f6ea85cc32
- URL Contrato ICO : https://sepolia.etherscan.io/address/0x43dc930d55d2a8adebe14a7bb4cf869c8b4473a3


Despliegue en Remix y Testnet Sepolia contrato para Crea una DEX

URL Contrato DEX https://sepolia.etherscan.io/address/0x888931d52f6c4dc019faf076d76e26e3782bc0be
URL TX de Creación del Contrato https://sepolia.etherscan.io/tx/0x481e7509795114310bad3de1841abe3e2e7ce4e605590870eb0fa72f4b4fd39c




