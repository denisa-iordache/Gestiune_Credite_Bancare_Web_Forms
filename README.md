# Gestiune_Credite_Bancare_Web_Forms

## Tehnologii folosite
• Aplicația este de tipul Web Forms și este realizată în C#. <br/>
• Baza de date a fost construită în SQL Server, componenta inegrată în Visual Studio. <br/>

## Descrierea aplicației
• Aplicația a fost realizată ca și proiect de seminar la materia baze de date pe internet.<br/>
• În interfață pot fi vizualizae date despre angajații și clienții băncii, precum și contractele de credit încheiate de aceștia.<br/>
• Se pot adăuga, edita și șterge date despre angajați, clienți și contracte, existând și o serie de validări, precum în cazul adresei de email care trebuie să fie de forma „@yahoo/gmail.com” sau în cazul numărului de telefon, etc.<br/>
• Pentru clienți există o procedură stocată care calculează automat vârsta în funcție de anul nașterii, fară să fie nevoie să fie completat acest câmp din interfață.<br/>
![image](https://user-images.githubusercontent.com/74931542/236155221-ce791b67-dbb8-41ec-ad3d-d202d99c5b55.png)
<br/>
• Asemănător este și în cazul contractelor unde numărul de rate e calculat automat pe baza datei de semnare și a celei scadente. De asemenea, tipul de credit, precum și angajatul și clientul care încheie contractul se aleg din radio buttons pentru a evita greșelile de ortografie.<br/>
![image](https://user-images.githubusercontent.com/74931542/236155389-cbce578c-0d24-46de-a1c4-f7a60747cd0b.png)
<br/>
• La editarea contractelor se pot edita toate câmpurile, exceptând angajatul și clientul, mergând pe ideea că nici în viața reală acest lucru nu este posibil.<br/>
• Există o pagină unde se pot vizualiza statistici despre contractele de credit, cum ar fi valoarea medie a creditelor în funcție de tipul de credit și sex și suma tuturor creditelor pentru fiecare client.<br/>
• Datele despre contractele de credit pot fi salvate în format txt, bin și xml și importate ulterior din aceleași formate, toate aceste opțiuni fiind disponibile în meniu.<br/>
## Capturi de ecran din aplicație
• Pagina Acasă<br/><br/>
![image](https://user-images.githubusercontent.com/74931542/236155863-af23ac5c-f48c-47dd-b965-c6905d35eb13.png)
<br/><br/>
• Vizualizarea angajaților băncii<br/><br/>
![image](https://user-images.githubusercontent.com/74931542/236155987-88f12a6d-7f0e-436a-b5da-474ed47043e0.png)
<br/><br/>
• Exemplu de validare<br/><br/>
![image](https://user-images.githubusercontent.com/74931542/236156307-bdc67a20-2027-4b3e-89a2-790254a14d93.png)
<br/><br/>
• Vizualizarea clienților băncii<br/><br/>
![image](https://user-images.githubusercontent.com/74931542/236156656-64422134-83ed-4c5f-9d9b-c3157ca1e743.png)
<br/><br/>
• Adăugare contract<br/><br/>
![image](https://user-images.githubusercontent.com/74931542/236157151-34025914-b97a-4f3d-aaf4-0ba9ef588108.png)
<br/><br/>
• Vizualizare contract adăugat<br/><br/>
![image](https://user-images.githubusercontent.com/74931542/236157328-0fa2a8d9-bca0-4073-a039-10c16096fdc2.png)
<br/><br/>
• Grafic - Valoarea medie a creditelor în funcție de tipul de credit și sex<br/><br/>
![image](https://user-images.githubusercontent.com/74931542/236158008-0c6d36d9-429c-429d-907b-bd6b84752b12.png)
<br/><br/>
• Grafic - Suma tuturor creditelor pentru fiecare client<br/><br/>
![image](https://user-images.githubusercontent.com/74931542/236158080-71686988-d791-4896-85af-b8050a9275b6.png)
