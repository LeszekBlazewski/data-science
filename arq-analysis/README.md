# NiDUC

Project done for the NIDUC 2 class.

The class was held in polish so is all the documentation and README **BUT** the code is written in english !

## Transmisja w systemie  ARQ (Automatic Repeat Request)

## Opis

Głównym celem projektu jest sprawdzenie metody stosowanej do korekcji oraz walidacji przesyłanych danych podczas przesyłu informacji w kanale telekomunikacyjnym - ARQ. Program pozwala symulować przesył danych w kanale, modyfikować konkretne wartości dotyczące przesyłanych sygnałów oraz pozwala na wyznaczenie statystyk dotyczących konkretnych parametrów. Na podstawie otrzymanych danych wyznaczony zostanie  optymalny oraz skuteczny protokół pozwalający osiągnąć największą skuteczność.

Model systemu ARQ wykorzystuje algorytm:

- Stop and Wait ARQ

Algorytmy pozwalające na detekcję błędów:

- Parity bit
- two-out-of-five code
- CRC 16

Zaimplementowane modele kanału telekomunikacyjnego:

- Random error channel
- Binary symmetric Channel

Przeprowadzone badania dotyczyły poniższych kwesti:

- skuteczność każdego z protokołów
- optymalny algorytm w zależności od kanału transmisyjnego
- ilość błędnych pakietów oraz retransmisji w zależności od długości pakietów
- analiza danych statystycznych takich jak:
    - średnia ilość błędów
    - odchylenie standardowe zestawu dancych
    - mediania oraz kwartyle
    - IQR (rozstęp międzykwartylowy)

Całość wykonana została w środowisku Matlab.
