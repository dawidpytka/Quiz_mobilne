import "database.dart";

class QuestionsData{
  static QuestionsData instance = new QuestionsData();
  List<Question> questionList;
  static int stageCount = 16;
  List<List<Question>> questionsStage = new List.generate(stageCount+1,(i) => []);
  Map stageAttempts = new Map();
  Map stagePercentage = new Map();
  QuestionsData(){
    getList();
    for(int i=1;i<stageCount+1;i++)
      {
        stageAttempts[i] = 0;
        stagePercentage[i] = 0;
      }
  }
  void getList() async{
    await getDatabase();
    await questionsInit();
    questionList = await getQuestions();
    for(var question in questionList)
      {
          questionsStage[question.stageNumber].add(question);
      }
  }
  static QuestionsData getInstance(){
    return instance;
  }
  Future<void> questionsInit() async
  {
//WSTEP////////////////////////////////////////
    var question1 = Question(
        id: 1,
        stageNumber: 1,
        question: 'Kiedy został uchwalony aktualny regulamin studiów w Politechnice Łódzkiej ?',
        answers: [
          '23 września 2015',
          '28 stycznia 2017',
          '24 kwietnia 2019',
          '28 września 2016'
        ],
        correctAnswer: '24 kwietnia 2019',
        done: 0
    );
    var question2 = Question(
        id: 2,
        stageNumber: 1,
        question: 'Za co odpowiada punkt ECTS ?',
        answers: ['Określa nakład pracy studenta, wymagany przy realizacji studiów','Można go wymienić na darmowe piwo','Jednostka rozliczeniowa realizacja programu studiów','Jest równy 20 godzinom pracy studenta na uczelni'],
        correctAnswer: 'Określa nakład pracy studenta, wymagany przy realizacji studiów',
        done: 0
    );

    var question3 = Question(
        id: 3,
        stageNumber: 1,
        question: 'Za co jest odpowiedzialny prodziekan ds. studenckich ?',
        answers: ['Rozstrzyga w indywidualnych sprawach studenta, związanych z przebiegiem studiów','Wspomaga studentów przy organizacji wszystkich wydarzeń','Wypłaca stypendia naukowe','Oprowadza pierwszorocznych studentów po uczelni'],
        correctAnswer: 'Rozstrzyga w indywidualnych sprawach studenta, związanych z przebiegiem studiów',
        done: 0
    );
    var question4 = Question(
        id: 4,
        stageNumber: 1,
        question: 'Jakie formy studiów oferuje PŁ ?',
        answers: ['stacjonarne i niestacjonarne','stacjonarne i wieczorowe','stacjonarne i internetowe','niestacjonarne i internetowe'],
        correctAnswer: 'stacjonarne i niestacjonarne',
        done: 0
    );

    var question5 = Question(
        id: 5,
        stageNumber: 1,
        question: 'Co zawiera karta przedmiotu ?',
        answers: ['Pytania na kolokwium','Formę i liczbę godzin zajęć','Salę, w której odbywa się przedmiot','Prezentacje z wykładów'],
        correctAnswer: 'Formę i liczbę godzin zajęć',
        done: 0
    );
    var question6 = Question(
        id: 6,
        stageNumber: 1,
        question: 'Za co NIE jest odpowiedzialny kierownik przedmiotu ?',
        answers: ['program przedmiotu','zmiany w karcie przedmiotu','realizację programu przedmiotu','pobieranie opłat za niezaliczony przedmiot'],
        correctAnswer: 'pobieranie opłat za niezaliczony przedmiot',
        done: 0
    );

    var question7 = Question(
        id: 7,
        stageNumber: 1,
        question: 'Kiedy następuje nabycie praw studenta ?',
        answers: ['Z chwilą złożenia podpisu podczas ślubowania','Podczas otrzymania legitymacji studenckiej','Po opublikowaniu wyników rekrutacji','Po pierwszej imprezie w akademiku'],
        correctAnswer: 'Z chwilą złożenia podpisu podczas ślubowania',
        done: 0
    );

    var question8 = Question(
        id: 8,
        stageNumber: 1,
        question: 'Czym skutkuje niezłożenie ślubowania ?',
        answers: ['Wykreśleniem wpisu na listę studentów','Naliczeniem dodatkowej opłaty','Wpisaniem na czarną listę dr inż. Ewy Marciniak','Zakazem wstępu na teren Politechniki'],
        correctAnswer: 'Wykreśleniem wpisu na listę studentów',
        done: 0
    );
    var question9 = Question(
        id: 9,
        stageNumber: 1,
        question: 'Kto jest zwierzchnikiem i opiekunem studentów ?',
        answers: ['Rektor','Kierownik przedmiotu','Wydziałowa Rada Samorządu','Dyrektor Instytutu'],
        correctAnswer: 'Rektor',
        done: 0
    );


    var question10 = Question(
        id: 10,
        stageNumber: 1,
        question: 'Ile wynosi okres odwołania się od decyzji prodziekana ?',
        answers: ['14 dni','7 dni','1 miesiąc','48 godzin'],
        correctAnswer: '14 dni',
        done: 0
    );

    var question11 = Question(
        id: 11,
        stageNumber: 1,
        question: 'Która z odpowiedzi jest FAŁSZYWA ?(dotyczy roztrzygnięcia w indywidualnych sprawach studenta)',
        answers: ['Decyzja Rektora dotycząca roztrzygnięcia jest ostateczna','Od decyzji Prodziekana w sprawie roztrzygnięcia przysługuje odwołanie do Rektora','Wniosek o odwołanie należy złożyć do Rektora na piśmie','Decyzja Prodziekana dotycząca roztrzygnięcia jest ostateczna'],
        correctAnswer: 'Decyzja Prodziekana dotycząca roztrzygnięcia jest ostateczna',
        done: 0
    );





//PRAWA I OBOWIAZKI STUDENTA
    var question12 = Question(
        id: 12,
        stageNumber: 2,
        question: 'Jakie prawo ma student ?',
        answers: ['Do korzystania z infrastruktury Uczelni','Do darmowego akademika','Do bezpłatnej komunikacji miejskiej','Do darmowego miejsca parkingowego'],
        correctAnswer: 'Do korzystania z infrastruktury Uczelni',
        done: 0
    );

    var question13 = Question(
        id: 13,
        stageNumber: 2,
        question: 'Jakie prawo ma student ?',
        answers: ['Do wyrażania opinii o procesie kształcenia','Do wprowadzania zmian w karcie przedmiotu','Do rezygnacji z przedmiotów obowiązkowych','Do rezygnacji z ECTS'],
        correctAnswer: 'Do wyrażania opinii o procesie kształcenia',
        done: 0
    );

    var question14 = Question(
        id: 14,
        stageNumber: 2,
        question: 'Jakie prawo ma student ?',
        answers: ['Do zmiany kierunku studiów','Do wyboru kilku specjalności','Do rezygnacji ze szkolenia o Szkolnictwie Wyższym','25% zniżki na komunikację miejską'],
        correctAnswer: 'Do zmiany kierunku studiów',
        done: 0
    );

    var question15 = Question(
        id: 15,
        stageNumber: 2,
        question: 'Jakie prawo ma student ?',
        answers: ['Do ubiegania się o zakwaterowanie swoich dzieci w akademiku','Do trzymania zwierząt w akademiku','Do bezpłatnego powtarzania przedmiotu','Do dużego mieszkania z łazienką i garderobą'],
        correctAnswer: 'Do zmiany kierunku studiów',
        done: 0
    );

    var question16 = Question(
        id: 16,
        stageNumber: 2,
        question: 'Co NIE należy do obowiązków studenta ?',
        answers: ['Zaliczenie szkolenia BHP','Przestrzeganie ślubowania akademickiego','Odbywanie studiów zgodnie z programem nauczania','Opłacenie ubezpieczenie'],
        correctAnswer: 'Do zmiany kierunku studiów',
        done: 0
    );

    var question17 = Question(
        id: 17,
        stageNumber: 2,
        question: 'Co NIE należy do obowiązków studenta ?',
        answers: ['Uczęszczanie na wykłady','Korzystanie z uczelnianego maila','Przestrzeganie własności intelektualnej','Wniesienie opłaty za legitymację'],
        correctAnswer: 'Uczęszczanie na wykłady',
        done: 0
    );

    var question18 = Question(
        id: 18,
        stageNumber: 2,
        question: 'Kogo należy powiadomić o zmianach dotyczących nazwiska, adresu oraz o zmianach mających wpływ na wysokość przyznanej pomocy materialnej',
        answers: ['Prodziekan','Rektor','Kierownik przedmiotu','Opiekun roku'],
        correctAnswer: 'Prodziekan',
        done: 0
    );

    var question19 = Question(
        id: 19,
        stageNumber: 2,
        question: 'Kiedy NIE wygasają praca i obowiązki studenta ?',
        answers: ['Z dniem utraty statusu studenta ','Z dniem ukończenia studiów','Z dniem skreślenia z listy studentów','Z dniem uzyskania 200 punktów ECTS'],
        correctAnswer: 'Uczęszczanie na wykłady',
        done: 0
    );
// Organizacja studiow
    var question20 = Question(
        id: 20,
        stageNumber: 3,
        question: 'Kiedy rozpoczyna się rok akademicki ?',
        answers: ['30 września','1 pażdziernika','1 września','1 stycznia'],
        correctAnswer: '1 pażdziernika',
        done: 0
    );

    var question21 = Question(
        id: 21,
        stageNumber: 3,
        question: 'Kiedy kończy się się rok akademicki ?',
        answers: ['30 września','1 pażdziernika','1 września','30 czerwca'],
        correctAnswer: '30 września',
        done: 0
    );

    var question22 = Question(
        id: 22,
        stageNumber: 3,
        question: 'Ile semestrów liczy rok akademicki ?',
        answers: ['2','4','1','12'],
        correctAnswer: '2',
        done: 0
    );

    var question23 = Question(
        id: 23,
        stageNumber: 3,
        question: 'Ile powinien trwać łączny czas trwania sesji egzaminacyjnych w roku akademickim ?',
        answers: ['nie mniej niż 6 tygodni','nie mniej niż 8 tygodni','nie mniej niż 4 tygodnie','nie mniej niż 12 tygodni'],
        correctAnswer: 'nie mniej niż 6 tygodni',
        done: 0
    );

    var question24 = Question(
        id: 24,
        stageNumber: 3,
        question: 'Kto ma prawo do wnoszenia propozycji ustanowienia godzin dziekańskich ?',
        answers: ['Każdy student','Odpowiedni członkowie Samorządu Studenckiego','Opiekun roku','Kierownik przedmiotu'],
        correctAnswer: 'Odpowiedni członkowie Samorządu Studenckiego',
        done: 0
    );

    var question25 = Question(
        id: 25,
        stageNumber: 3,
        question: 'Ile trwa podstawowa jednostka dydaktyczna tzw. "godzina zajęć" ?',
        answers: ['45 min','60 min(1h)','90 min(1h30min)','75 min(1h15min)'],
        correctAnswer: '45 min',
        done: 0
    );


    var question26 = Question(
        id: 26,
        stageNumber: 3,
        question: 'W jakich dniach i godzinach odbywają się zajęcia na studia stacjonarnych ?',
        answers: ['pon-pia 8-21','pon-niedz 6-22','pon-pia 7-20','pon-niedz 8-20'],
        correctAnswer: 'pon-pia 8-21',
        done: 0
    );

    var question27 = Question(
        id: 27,
        stageNumber: 3,
        question: 'W jakich dniach i godzinach odbywają się zajęcia na studia niestacjonarnych ?',
        answers: ['pon-pia 8-21','sob-niedz 6-22','pon-pia 7-20','sob-niedz 8-20'],
        correctAnswer: 'sob-niedz 8-20',
        done: 0
    );

    var question28 = Question(
        id: 28,
        stageNumber: 3,
        question: 'W jakich godzinach odbywają się zajęcia z WF-u ?',
        answers: ['6-21','6-22','7-20','8-20'],
        correctAnswer: '6-21',
        done: 0
    );

    var question29 = Question(
        id: 29,
        stageNumber: 3,
        question: 'Na ile dni przed rozpoczęciem semestru zostają opublikowane plany zajęć ?',
        answers: ['Co najmniej 3 dni robocze','Co najmniej 4 dni robocze','Co najmniej 6 dni roboczych','Co najmniej 10 dni roboczych'],
        correctAnswer: 'Co najmniej 3 dni robocze',
        done: 0
    );

    var question30 = Question(
        id: 30,
        stageNumber: 3,
        question: 'Kto może ubiegać się o indywidualną organizację studiów ?',
        answers: ['Student z dobrymi wynikami w nauce','Student ostatniego roku studiów','Student pierwszego roku studiów','Student studiów niestacjonarnych'],
        correctAnswer: 'Studenci z dobrymi wynikami w nauce',
        done: 0
    );

    var question31 = Question(
        id: 31,
        stageNumber: 3,
        question: 'Co/Kogo otrzymuje student rozpoczynający indywidualny program studiów ?',
        answers: ['Opiekuna naukowego','Darmowe przejazdy komunikacją miejską','Sale laboratoryjne do własnego użytku','Grant na rozwój badań'],
        correctAnswer: 'Opiekuna naukowego',
        done: 0
    );

    var question32 = Question(
        id: 32,
        stageNumber: 3,
        question: 'Co/kogo otrzymuje student rozpoczynający indywidualny program studiów ?',
        answers: ['Opiekuna naukowego','Darmowe przejazdy komunikacją miejską','Sale laboratoryjne do własnego użytku','Grant na rozwój badań'],
        correctAnswer: 'Opiekuna naukowego',
        done: 0
    );

    var question33 = Question(
        id: 33,
        stageNumber: 3,
        question: 'W jakim przypadku NIE JEST możliwe ustalenie indywidualnej organizacji studiów?',
        answers: ['Z powodów zdrowotnych','Z powodu studiowania na wielu kierunkach','Z powodu reprezentowania uczelni na szczeblu krajowym','Z powodu podjęcia przez studenta pracy zarobkowej'],
        correctAnswer: 'Z powodu podjęcia przez studenta pracy zarobkowej',
        done: 0
    );

//ROZDZIAL4
    var question34 = Question(
        id: 34,
        stageNumber: 4,
        question: 'Gdzie zawarte są treści i formy weryfikacji efektów uczenia się ?',
        answers: ['W karcie przedmiotu','W mailu otrzymanym od prowadzącego po zapisaniu się na zajęcia','W regulaminie studiów','W sali, w której odbywają się zajęcia'],
        correctAnswer: 'W karcie przedmiotu',
        done: 0
    );
    var question35 = Question(
        id: 35,
        stageNumber: 4,
        question: 'Gdzie zawarty jest sposób ustalania oceny końcowej z przedmiotu ?',
        answers: ['W karcie przedmiotu','W mailu otrzymanym od prowadzącego po zapisaniu się na zajęcia','W regulaminie studiów','W sali, w której odbywają się zajęcia'],
        correctAnswer: 'W karcie przedmiotu',
        done: 0
    );

    var question36 = Question(
        id: 36,
        stageNumber: 4,
        question: 'Do omówienia czego nie jest zobowiązany prowadzący podczas pierwszych zajęć ?',
        answers: ['Zasad odbywania zajęć dydaktycznych','Terminów konsultacji','Warunków zaliczenia przedmiotu','Sposobów popraw niezaliczonych kolokwiów'],
        correctAnswer: 'Sposobów popraw niezaliczonych kolokwiów',
        done: 0
    );

    var question37 = Question(
        id: 37,
        stageNumber: 4,
        question: 'Ile wynosi limit nieuprawiedliwionych nieobecności ?',
        answers: ['20 %','30 %','25 %','50 %'],
        correctAnswer: '20 %',
        done: 0
    );

    var question38 = Question(
        id: 38,
        stageNumber: 4,
        question: 'Dla którego studenta wszystkie formy zajęć są obowiązkowe ?',
        answers: ['Dla studenta pierwszego roku','Dla studenta studiów stacjonarnych','Dla studenta studiów niestacjonarnych','Dla każdego studenta'],
        correctAnswer: 'Dla studenta pierwszego roku',
        done: 0
    );

    var question39 = Question(
        id: 39,
        stageNumber: 4,
        question: 'Jakie formy zajęć NIE SĄ obowiązkowe dla studentów lat wyższych pierwszego stopnia ?',
        answers: ['Ćwiczenia audytoryjne','Wykłady','Lektoraty','Zajęcia laboratoryjne'],
        correctAnswer: 'Wykłady',
        done: 0
    );

    var question40 = Question(
        id: 40,
        stageNumber: 4,
        question: 'W jakim terminie student ma prawo usprawiedliwić swoją nieobecność ?',
        answers: ['14 dni','7 dni','3 dni','Na następnych zajęciach'],
        correctAnswer: '14 dni',
        done: 0
    );


    var question41 = Question(
        id: 41,
        stageNumber: 4,
        question: 'Kto może dokonać zaliczenia zajęć z przedmiotu ?',
        answers: ['Prowadzący zajęcia','Panie z sekretariatu','Prodziekan','Rektor'],
        correctAnswer: 'Prowadzący zajęcia',
        done: 0
    );

    var question42 = Question(
        id: 42,
        stageNumber: 4,
        question: 'W jakiej formie NIE MOŻE być przeprowadzony egzamin ?',
        answers: ['W formie ustnej','W formie pisemnej','W formie ustnej i pisemnej','A co to egzamin ?'],
        correctAnswer: 'A co to egzamin ?',
        done: 0
    );


    var question43 = Question(
        id: 43,
        stageNumber: 4,
        question: 'W jakiej formie NIE MOŻE być przeprowadzony egzamin ?',
        answers: ['W formie ustnej','W formie pisemnej','W formie ustnej i pisemnej','W formie prezentacji'],
        correctAnswer: 'W formie prezentacji',
        done: 0
    );


    var question44 = Question(
        id: 44,
        stageNumber: 4,
        question: 'Co NIE JEST prawdą o egzaminie kompetencyjnym ?',
        answers: ['Jest przeprowadzany głównie w formie ustnej','Jest przeprowadzany przez komisję powołaną przez Prodziekan','Wynik egzaminu staje się częścią oceny za studiów','Jest przeprowadzany przez opiekuna roku'],
        correctAnswer: 'Jest przeprowadzany przez opiekuna roku',
        done: 0
    );

    var question45 = Question(
        id: 45,
        stageNumber: 4,
        question: 'W jakim terminie powinny zostać opublikowane wyniki przeprowadzonego egzaminu ?',
        answers: ['Do 10 dni','Do 7 dni','Do 14 dni','Do 28 dni'],
        correctAnswer: 'Do 10 dni',
        done: 0
    );

    var question46 = Question(
        id: 46,
        stageNumber: 4,
        question: 'Student złapany na niesamodzielnej pracy ma prawo przystąpić ponownie do egzaminu...',
        answers: ['w następnym semestrze','podczas kolejnego terminu','podczas sesji poprawkowej','Taki student nie ma prawa ponownie przystąpić.'],
        correctAnswer: 'W następnym semestrze',
        done: 0
    );



    var question47= Question(
        id: 47,
        stageNumber: 4,
        question: 'Czy można robić zdjęcia i filmy podczas zajęć ?',
        answers: ['Tak, po otrzymaniu zgody prowadzącego','Nie','Tak, ale wyłącznie podczas wykładów','Żadna z odpowiedzi'],
        correctAnswer: 'Tak, po otrzymaniu zgody prowadzącego',
        done: 0
    );


    var question48 = Question(
        id: 48,
        stageNumber: 4,
        question: 'Kiedy powinno odbyć się zaliczenie przedmiotu niekończącego się egzaminem ?',
        answers: ['Podczas 13 zajęć','Przed końcem zajęć z tego przedmiotu','Poczas sesji','Po omówieniu całego materiału'],
        correctAnswer: 'Przed końcem zajęć z tego przedmiotu',
        done: 0
    );


    var question49 = Question(
        id: 49,
        stageNumber: 4,
        question: 'W przypadku przedmiotu niekończącego się egzaminem student ma prawo do co najmniej...',
        answers: ['1 przystąpienia w czasie sesji egzaminacyjnej, 2 popraw w czasie następnej sesji','2 przystąpień w czasie sesji egzaminacyjnej, 2 popraw w czasie następnej sesji','Nie ma prawa do poprawy','Żadna z odpowiedzi'],
        correctAnswer: '1 przystąpienia w czasie sesji egzaminacyjnej, 2 popraw w czasie następnej sesji',
        done: 0
    );

    var question50 = Question(
        id: 50,
        stageNumber: 4,
        question: 'W przypadku przedmiotu kończącego się egzaminem student ma prawo do co najmniej...',
        answers: ['1 przystąpienia w czasie sesji egzaminacyjnej, 2 popraw w czasie następnej sesji','2 przystąpień w czasie sesji egzaminacyjnej, 2 popraw w czasie następnej sesji','Nie ma prawa do poprawy','Żadna z odpowiedzi'],
        correctAnswer: '2 przystąpień w czasie sesji egzaminacyjnej, 2 popraw w czasie następnej sesji',
        done: 0
    );

    var question51 = Question(
        id: 51,
        stageNumber: 4,
        question: 'Kierownik przedmiotu ma prawo do wyznaczenia terminu zerowego, który odbędzie się przed sesją',
        answers: ['Tak','Nie, w żadnym przypadku','Tak, ale za zgodą Prodziekana','Żadna z odpowiedzi'],
        correctAnswer: 'Tak',
        done: 0
    );

    var question52 = Question(
        id: 52,
        stageNumber: 4,
        question: 'Która z odpowiedzi NIE JEST prawidłowa ?',
        answers: ['Egzamin komisyjny obejmuje zakres materiału z karty przedmiotu','W egzaminie komisyjnym nie uczestniczy osoba, która przeprowadzała poprzedni egzamin','Wynik egzaminu komisyjnego jest ostateczny','Od wyniku egzaminu kosmisyjnego można się odwołać'],
        correctAnswer: 'Od wyniku egzaminu kosmisyjnego można się odwołać',
        done: 0
    );

    var question53 = Question(
        id: 53,
        stageNumber: 4,
        question: 'Kto może przystąpić do egzaminu komisyjnego ?',
        answers: ['Student, który został złapany na ściąganiu','Student, który jest niezadowolony z oceny','Student, który 3 krotnie oblał egzamin','Student powtarzający przedmiot'],
        correctAnswer: 'Student, który jest niezadowolony z oceny',
        done: 0
    );

    var question54 = Question(
        id: 54,
        stageNumber: 4,
        question: 'Najniższą możliwą do uzyskania oceną jest ...',
        answers: ['2.0','1.0','niezal','3.0'],
        correctAnswer: '2.0',
        done: 0
    );

    var question55 = Question(
        id: 55,
        stageNumber: 4,
        question: 'Która z podanych ocen nie istnieje ?',
        answers: ['2.5','2.0','4.5','3.5'],
        correctAnswer: '2.5',
        done: 0
    );


    var question56 = Question(
        id: 56,
        stageNumber: 4,
        question: 'Czy student jest zobowiązany do uczestniczenia we wszystkich formach przedmiotu, którego nie zaliczył ?',
        answers: ['Tak','Nie, tylko w formie, której nie zaliczył','Nie, wystarczy, że podejdzie do kolokwium/egzaminu, którego nie zaliczył','Żadne z pozostałych. Niezaliczenie przedmiotu jest równoważne ze skreśleniem z listy studentów'],
        correctAnswer: 'Tak',
        done: 0
    );

    var question57 = Question(
        id: 57,
        stageNumber: 4,
        question: 'Jakie są dopuszczalne limity braku punktów ECTS na wszystkich semestrach i kierunkach ?',
        answers: ['15 punktów','12 punktów','10 punktów','30 punktów'],
        correctAnswer: '15 punktów',
        done: 0
    );

    var question58 = Question(
        id: 58,
        stageNumber: 4,
        question: 'Za co student NIE MOŻE zostać skreślony z listy studentów',
        answers: ['Za przekroczenie deficytu punktowego','Za nieodbycie szkolenia BHP','Za brak udziału w obowiązkowych zajęciach','Za niezaliczenie ponad 3 przedmiotów w semestrze'],
        correctAnswer: 'Za niezaliczenie ponad 3 przedmiotów w semestrze',
        done: 0
    );


    var question59 = Question(
        id: 59,
        stageNumber: 4,
        question: 'Kiedy student otrzymuje rejestrację warunkową ?',
        answers: ['Gdy nie przekroczył dopuszczalnego limitu punktowego','Gdy uzyskał zaliczenie ze wszystkich powtarzanych przedmiotów','Spełnił wszystkie podstawowe warunki postawione przez Prodziekana','Wszystkie odpowiedzi są prawidłowe'],
        correctAnswer: 'Wszystkie odpowiedzi są prawidłowe',
        done: 0
    );
    var question60 = Question(
        id: 60,
        stageNumber: 4,
        question: 'Czym skutkuje złapanie studenta na ściąganiu ?',
        answers: ['Pisemnym powiadomieniem Prodziekana','Skreślenie z listy studentów','Powtarzaniem całego roku akademickiego','Obniżeniem otrzymanej oceny o 1'],
        correctAnswer: 'Pisemnym powiadomieniem Prodziekana',
        done: 0
    );

    var question61 = Question(
        id: 61,
        stageNumber: 4,
        question: 'Ile razy można powtarzać ostatni semestr w jednym toku studiów ?',
        answers: ['2','1','3','Ostatniego semestru nie można powtarzać'],
        correctAnswer: '2',
        done: 0
    );

    var question62 = Question(
        id: 62,
        stageNumber: 4,
        question: 'Która odpowiedź jest poprawna ?',
        answers: ['Student może ubiegać się o nowy termin złożenia pracy dyplomowej','Student, który nie złożył pracy dyplomowej w terminie zostaje skreślony z listy studentów','Można dwukrotnie zmienić termin złożenia pracy dyplomowej','Wszystkie odpowiedzi są prawidłowe'],
        correctAnswer: 'Wszystkie odpowiedzi są prawidłowe',
        done: 0
    );
//ROZDZIAL5

    var question63 = Question(
        id: 63,
        stageNumber: 5,
        question: 'Która z odpowiedzi nie jest poprawna w przypadku osób z niepełnosprawnością',
        answers: ['Możliwe jest zwiększenie dopuszczalnej ilości nieobecności','Możliwe jest ustalenie indywidualnej organizacji zajęć','Asystenci mogą uczestniczyć w zajęciach','Asystenci nie mogą uczestniczyć w zaliczeniach przedmiotów'],
        correctAnswer: 'Asystenci nie mogą uczestniczyć w zaliczeniach przedmiotów',
        done: 0
    );


//Rozdzial 6
    var question64 = Question(
        id: 64,
        stageNumber: 5,
        question: 'Jakie rodzaje urlopów obowiązują na PŁ ?',
        answers: ['Krótkoterminowe, długoterminowe','Roczne, bezterminowe','Okolicznościowe, zdrowotne','Żadna z pozostałych odpowiedzi'],
        correctAnswer: 'Krótkoterminowe, długoterminowe',
        done: 0
    );

    var question65 = Question(
        id: 65,
        stageNumber: 5,
        question: 'Ile maksymalnie może trwać urlop krótkoterminowy ?',
        answers: ['2 semestry','1 semestr','31 dni','Na PŁ nie ma takiego urlopu'],
        correctAnswer: '2 semestry',
        done: 0
    );

    var question66 = Question(
        id: 66,
        stageNumber: 5,
        question: 'Jakie formy urlopu można otrzymać na PŁ ?',
        answers: ['zdrowotny dla studentki w ciąży, wychowawczy','dziekański, zdrowotny','okazjonalny, zawodowy','Wszystkie z wymienionych'],
        correctAnswer: 'Wszystkie z wymienionych',
        done: 0
    );

    var question67 = Question(
        id: 67,
        stageNumber: 5,
        question: 'Kto może udzielić urlopu krótkoterminowego ?',
        answers: ['Prodziekan','Prorektor','Rektor','Każdy z wymienionych'],
        correctAnswer: 'Prodziekan',
        done: 0
    );

    var question68 = Question(
        id: 68,
        stageNumber: 5,
        question: 'Czego nie może student korzystający z urlopu krótkoterminowego ?',
        answers: ['Przystąpić do egzaminów z niezaliczonych przedmiotów','Powtarzać niezaliczone przedmioty','Zaliczać przedmioty awansem','Ukończyć studiów w planowanym terminie'],
        correctAnswer: 'Ukończyć studiów w planowanym terminie',
        done: 0
    );

    var question69 = Question(
        id: 69,
        stageNumber: 5,
        question: 'Z jakim urlopem nie można łączyć urlopu długoterminowego ?',
        answers: ['zawodowym','zdrowotnym','okolicznościowym','dziekańskim'],
        correctAnswer: 'zawodowym',
        done: 0
    );

//Rodzial7
    var question70 = Question(
        id: 70,
        stageNumber: 5,
        question: 'Ponowny wpis na listę studentów, po skreślenie z niej, jest możliwy po maks...',
        answers: ['5 latach','1 roku','2 latach','10 latach'],
        correctAnswer: '5 latach',
        done: 0
    );

    var question71 = Question(
        id: 71,
        stageNumber: 5,
        question: 'Student 1 roku może zostać ponownie przyjęty na studia o ile...',
        answers: ['przejdzie ponownie pozytywnie rekrutację','od skreślenia z listy nie minęły 2 lata','posiadał wzorową frekwencję','uzyska zgodę Prorektora'],
        correctAnswer: 'przejdzie ponownie pozytywnie rekrutację',
        done: 0
    );

    var question72 = Question(
        id: 72,
        stageNumber: 5,
        question: 'Za przywrócenie w prawach studenta pobiera się opłatę w wysokości:',
        answers: ['70 złotych','500 złotych','200 złotych','nie pobiera się opłaty'],
        correctAnswer: 'nie pobiera się opłaty',
        done: 0
    );

    var question73 = Question(
        id: 73,
        stageNumber: 5,
        question: 'Co może student za zgodą odpowiednich Prodziekanów ?',
        answers: ['zmienić kierunek studiów','przenieść się na studia stacjonarne','przenieść się na studia niestacjonarne','wszystkie z wymienionych'],
        correctAnswer: 'wszystkie z wymienionych',
        done: 0
    );

    var question74 = Question(
        id: 74,
        stageNumber: 5,
        question: 'Czy student może ubiegać się o przeniesienie na inny kierunek studiów ?',
        answers: ['Nie','Tak, jeżeli otrzymał rejestracje na co najmniej 2 rok studiów','Tak, jeżeli otrzymał rejestracje na co najmniej 2 semestr studiów','Tak, każdy student może ubiegać się o takie przeniesienie'],
        correctAnswer: 'Tak, jeżeli otrzymał rejestracje na co najmniej 2 rok studiów',
        done: 0
    );

    var question75 = Question(
        id: 75,
        stageNumber: 5,
        question: 'Do czego zobowiązany jest student PŁ w trybie przeniesienia na inną uczelnię ?',
        answers: ['Złożenia pisemnej informacji o przeniesieniu','Złożenia pisemnej rezygnacji ze studiów w PŁ','Obie odpowiedzi są poprawne','Obie odpowiedzi są niepoprawne'],
        correctAnswer: 'Obie odpowiedzi są poprawne',
        done: 0
    );

    await insertQuestion(question1);
    await insertQuestion(question2);
    await insertQuestion(question3);
    await insertQuestion(question4);
    await insertQuestion(question5);
    await insertQuestion(question6);
    await insertQuestion(question7);
    await insertQuestion(question8);
    await insertQuestion(question9);
    await insertQuestion(question10);
    await insertQuestion(question11);
    await insertQuestion(question12);
    await insertQuestion(question13);
    await insertQuestion(question14);
    await insertQuestion(question15);
    await insertQuestion(question16);
    await insertQuestion(question17);
    await insertQuestion(question18);
    await insertQuestion(question19);
    await insertQuestion(question20);
    await insertQuestion(question21);
    await insertQuestion(question22);
    await insertQuestion(question23);
    await insertQuestion(question24);
    await insertQuestion(question25);
    await insertQuestion(question26);
    await insertQuestion(question27);
    await insertQuestion(question28);
    await insertQuestion(question29);
    await insertQuestion(question30);
    await insertQuestion(question31);
    await insertQuestion(question32);
    await insertQuestion(question33);
    await insertQuestion(question34);
    await insertQuestion(question35);
    await insertQuestion(question36);
    await insertQuestion(question37);
    await insertQuestion(question38);
    await insertQuestion(question39);
    await insertQuestion(question40);
    await insertQuestion(question41);
    await insertQuestion(question42);
    await insertQuestion(question43);
    await insertQuestion(question44);
    await insertQuestion(question45);
    await insertQuestion(question46);
    await insertQuestion(question47);
    await insertQuestion(question48);
    await insertQuestion(question49);
    await insertQuestion(question50);
    await insertQuestion(question51);
    await insertQuestion(question52);
    await insertQuestion(question53);
    await insertQuestion(question54);
    await insertQuestion(question55);
    await insertQuestion(question56);
    await insertQuestion(question57);
    await insertQuestion(question58);
    await insertQuestion(question59);
    await insertQuestion(question60);
    await insertQuestion(question61);
    await insertQuestion(question62);
    await insertQuestion(question63);
    await insertQuestion(question64);
    await insertQuestion(question65);
    await insertQuestion(question66);
    await insertQuestion(question67);
    await insertQuestion(question68);
    await insertQuestion(question69);
    await insertQuestion(question70);
    await insertQuestion(question71);
    await insertQuestion(question72);
    await insertQuestion(question73);
    await insertQuestion(question74);
    await insertQuestion(question75);


//    var question1 = Question(
//        id: 1,
//        stageNumber: 1,
//        question: 'Ile lat ma Politechnika Lodzka',
//        answers: ['35', '67', '89', '74'],
//        correctAnswer: '74',
//        done: 0
//    );
//
//    var question2 = Question(
//        id: 2,
//        stageNumber: 1,
//        question: 'Ile wydzialow ma Politechnika Lodzka',
//        answers: ['10', '11', '17', '9'],
//        correctAnswer: '9',
//        done: 0
//    );
//    var question3 = Question(
//        id: 3,
//        stageNumber: 1,
//        question: 'Ile kierunkow studiow ma Politechnika Lodzka',
//        answers: ['30', '35', '22', '45'],
//        correctAnswer: '45',
//        done: 0
//    );
//
//    var question4 = Question(
//        id: 4,
//        stageNumber: 2,
//        question: 'Ilu profesorow posiada Politechnika Lodzka',
//        answers: ['200', '211', '222', '229'],
//        correctAnswer: '229',
//        done: 0
//    );
//    var question5 = Question(
//        id: 5,
//        stageNumber: 3,
//        question: 'Na jakim wydziale naucza dr Kossowski',
//        answers: ['WEEIA', 'FTIMS', 'MECHANICZNY', 'ELEKTRYCZNY'],
//        correctAnswer: 'FTIMS',
//        done: 0
//    );
//    await insertQuestion(question1);
//    await insertQuestion(question2);
//    await insertQuestion(question3);
//    await insertQuestion(question4);
//    await insertQuestion(question5);
  }
}