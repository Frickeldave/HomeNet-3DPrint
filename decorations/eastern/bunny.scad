// Parameter für die Wellenform
wellen_breite = 100; // Gesamtbreite der Wellenform
wellen_hoehe = 50;  // Maximale Höhe der Wellen
wellen_tiefe = 10;  // Dicke der Wellenform
wellen_anzahl = 2;   // Anzahl der Wellen

// Funktion zur Erzeugung einer einzelnen Welle
function welle(x) = wellen_hoehe * sin(x / wellen_breite * 2 * PI * wellen_anzahl);

// Pfad für die Wellenform
path = [
  for (x = [0:wellen_breite])
    [x, welle(x)]
];

// Erzeugung der 3D-Wellenform
linear_extrude(height = wellen_tiefe)
  polygon(points = path);