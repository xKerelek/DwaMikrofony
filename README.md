# Projekt z przedmiotu: Zaawansowane Programowanie Systemów Inteligentnych

## Tytuł projektu: **System wykrywania kierunku źródła dźwięku**

---

### Opis projektu

Celem projektu było stworzenie systemu, który na podstawie analizy dźwięku z dwóch mikrofonów, wyznacza kierunek, z którego pochodzi dźwięk. Wynik ten jest wizualizowany na kolorowym wyświetlaczu LCD TFT w formie strzałki wskazującej źródło dźwięku.

---

### Wykorzystane komponenty

1. **Mikrokontroler NXP LPCXPRESSO55S69**  
   Mikrokontroler klasy ARM Cortex-M33, wykorzystywany do zarządzania całym systemem, przetwarzania sygnałów z mikrofonów oraz sterowania wyświetlaczem LCD.

2. **Wyświetlacz LCD TFT 1.8" 128x160px SPI**  
   Kolorowy wyświetlacz TFT o rozdzielczości 128x160 pikseli, komunikujący się za pomocą interfejsu SPI. Na wyświetlaczu wizualizowana jest strzałka, która pokazuje kierunek dźwięku.

3. **Dwa mikrofony OPA344**  
   Mikrofony zostały użyte do rejestrowania dźwięków z otoczenia. Różnica w czasie dotarcia dźwięku do obu mikrofonów pozwala na określenie kierunku, z którego pochodzi dźwięk.

---

### Cele projektu

- **Pobieranie dźwięku z dwóch mikrofonów:**  
  System rejestruje dźwięk jednocześnie z obu mikrofonów, analizując różnice czasowe między dotarciem dźwięku do poszczególnych sensorów.
  
- **Wyznaczanie kierunku źródła dźwięku:**  
  Na podstawie analizy różnicy faz pomiędzy sygnałami z mikrofonów, system określa kierunek, z którego pochodzi dźwięk.

- **Wizualizacja na wyświetlaczu LCD:**  
  Na kolorowym wyświetlaczu TFT rysowana jest strzałka, która wskazuje kierunek pochodzenia dźwięku.

---

### Schemat działania

1. **Przetwarzanie sygnałów audio:**  
   Sygnały z dwóch mikrofonów są zbierane przez mikrokontroler i przetwarzane w celu określenia różnic czasowych.
   
2. **Obliczanie różnicy faz:**  
   Na podstawie różnic faz pomiędzy sygnałami z mikrofonów, wyznaczana jest względna różnica czasów dotarcia dźwięku do obu mikrofonów.

3. **Wyznaczanie kąta:**  
   System przekształca różnicę czasową na kąt w zakresie 0°-360°, który odpowiada kierunkowi pochodzenia dźwięku.

4. **Rysowanie strzałki na LCD:**  
   Strzałka, reprezentująca kierunek dźwięku, rysowana jest na wyświetlaczu TFT. Jej orientacja zmienia się dynamicznie w zależności od kierunku źródła dźwięku.

---
