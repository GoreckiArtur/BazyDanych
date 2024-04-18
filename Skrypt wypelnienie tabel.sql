-- Dodać rekordy do tabeli Adres
INSERT INTO Adres (id_adres, miasto, ulica, nr_budynku, nr_mieszkania, kod_pocztowy)
VALUES
(1, 'Warszawa', 'Kwiatowa', '1', '2', '00-001'),
(2, 'Kraków', 'Słoneczna', '10', '3', '30-002'),
(3, 'Gdańsk', 'Brzozowa', '5', NULL, '80-003'),
(4, 'Poznań', 'Miodowa', '7', '12', '60-004'),
(5, 'Wrocław', 'Polna', '15', '6', '50-005');

-- Dodać rekordy do tabeli Kategoria
INSERT INTO Kategoria (id_kategoria, nazwa, Kategoria_id_kategoria)
VALUES
(1, 'Elektronika', NULL),
(2, 'Odzież', NULL),
(3, 'Książki', NULL),
(4, 'AGD', NULL),
(5, 'Meble', NULL);

-- Dodać rekordy do tabeli Osoba
INSERT INTO Osoba (id_osoba, pesel, imie, nazwisko, Adres_id_adres, nr_telefonu, email)
VALUES
(1, '12345678901', 'Jan', 'Kowalski', 1, '123456789', 'jan.kowalski@example.com'),
(2, '98765432109', 'Anna', 'Nowak', 2, '987654321', 'anna.nowak@example.com'),
(3, '45612378903', 'Krzysztof', 'Wiśniewski', 3, '456123789', 'krzysztof.wisniewski@example.com'),
(4, '78945612307', 'Magdalena', 'Dąbrowska', 4, '789456123', 'magdalena.dabrowska@example.com'),
(5, '32165498705', 'Piotr', 'Lewandowski', 5, '321654987', 'piotr.lewandowski@example.com'),
(6, '11111111111', 'Adam', 'Nowak', 1, '111111111', 'adam.nowak@example.com'),
(7, '22222222222', 'Ewa', 'Kowalska', 2, '222222222', 'ewa.kowalska@example.com'),
(8, '33333333333', 'Marek', 'Wiśniewski', 3, '333333333', 'marek.wisniewski@example.com'),
(9, '44444444444', 'Karolina', 'Dąbrowska', 4, '444444444', 'karolina.dabrowska@example.com'),
(10, '55555555555', 'Michał', 'Lewandowski', 5, '555555555', 'michal.lewandowski@example.com');

-- Dodać rekordy do tabeli Klient
INSERT INTO Klient (id_klient, Osoba_id_osoba, regon)
VALUES
(1, 1, '123456789'),
(2, 2, '987654321'),
(3, 3, '456123789'),
(4, 4, '789456123'),
(5, 5, '321654987');



-- Dodać rekordy do tabeli Pracownik
INSERT INTO Pracownik (Osoba_id_osoba, stanowisko, data_poczatek_pracy, data_koniec_pracy, pensja, id_pracownik)
VALUES
(6, 'Programista', '2023-01-01', NULL, 5000.00, 1),
(7, 'Księgowy', '2022-12-01', NULL, 4500.00, 2),
(8, 'Sprzedawca', '2023-03-15', NULL, 4000.00, 3),
(9, 'Magazynier', '2023-02-01', NULL, 3500.00, 4),
(10, 'Manager', '2022-11-15', NULL, 6000.00, 5);

-- Dodać rekordy do tabeli Produkt
INSERT INTO Produkt (id_produkt, nazwa, Kategoria_id_kategoria, opis, cena, ilosc)
VALUES
(1, 'Laptop', 1, 'Dell Inspiron 15', 2500.00, 10),
(2, 'Spodnie', 2, 'Jeansy z przetarciami', 100.00, 50),
(3, 'Encyklopedia', 3, 'Encyklopedia Britannica', 500.00, 5),
(4, 'Lodówka', 4, 'Whirlpool No-Frost', 2000.00, 3),
(5, 'Sofa', 5, 'Narożnik w kolorze szarym', 1500.00, 7);


-- Dodać rekordy do tabeli Zamowienie
INSERT INTO Zamowienie (id_zamowienie, data_zamowienie, Pracownik_Osoba_id_osoba, Klient_id_klient, czy_oplacone, czy_wyslane, cena_laczna, id_pracownik1)
VALUES
(1, '2024-04-18 10:00:00', 6, 1, 1, 0, 2500.00, 1),
(2, '2024-04-18 10:15:00', 7, 2, 0, 0, 400.00, 2),
(3, '2024-04-18 10:30:00', 8, 3, 0, 0, 500.00, 3),
(4, '2024-04-18 10:45:00', 9, 4, 0, 0, 2000.00, 4),
(5, '2024-04-18 11:00:00', 10, 5, 0, 0, 1500.00, 5);

-- Dodać rekordy do tabeli ProduktZamowienie
INSERT INTO ProduktZamowienie (Produkt_id_produkt, Zamowienie_id_zamowienie, ilosc, rabat, cena_produktow)
VALUES
(1, 1, 1, NULL, 2500.00),
(2, 2, 2, NULL, 200.00),
(3, 3, 1, NULL, 500.00),
(4, 4, 1, NULL, 2000.00),
(5, 5, 1, NULL, 1500.00);

