import 'package:leaflearn/content/lifestyle/chapter1_1.dart';
import 'package:leaflearn/content/lifestyle/chapter1_2.dart';
import 'package:leaflearn/content/lifestyle/chapter2_1.dart';
import 'package:leaflearn/content/lifestyle/chapter2_2.dart';
import 'package:leaflearn/content/lifestyle/chapter3_1.dart';
import 'package:leaflearn/content/lifestyle/chapter3_2.dart';
import 'package:leaflearn/content/lifestyle/chapter4_1.dart';
import 'package:leaflearn/content/lifestyle/chapter4_2.dart';
import 'package:leaflearn/content/lifestyle/chapter5_1.dart';
import 'package:leaflearn/content/lifestyle/chapter5_2.dart';
import 'package:leaflearn/content/lifestyle/chapter6_1.dart';
import 'package:leaflearn/content/lifestyle/chapter6_2.dart';
import 'package:leaflearn/content/lifestyle/chapter7_1.dart';
import 'package:leaflearn/content/lifestyle/chapter7_2.dart';
import 'package:leaflearn/content/sources/eatingsources.dart';
import 'package:leaflearn/content/sources/lifestylesources.dart';
import 'package:leaflearn/models/course.model.dart';
import 'package:leaflearn/models/lesson.model.dart';

CourseModel healthyLifeStyle = CourseModel(
    title: 'Gesunder Lebensstil',
    progress: 0,
    overview:
        'Dieser Kurs hilft dir dabei, einen gesunden Lebensstil zu führen',
    chapters: <LessonModel>[
      chapter1_1,
      chapter1_2,
      chapter2_1,
      chapter2_2,
      chapter3_1,
      chapter3_2,
      chapter4_1,
      chapter4_2,
      chapter5_1,
      chapter5_2,
      chapter6_1,
      chapter6_2,
      chapter7_1,
      chapter7_2,
      lifeSources
    ]);

CourseModel healthyDiet = CourseModel(
      title: "Gesunde Ernährung",
      progress: 0.5,
      overview: """
## Einleitung
Die weltweite Lebensmittelproduktion beansprucht mehr als ein Drittel der Landfläche und trägt etwa 30% der anthropogenen Treibhausgasemissionen bei. Die Umweltauswirkungen dieser Produktion sind als erhebliche Bedrohung für die Umwelt identifiziert worden. Technologische Fortschritte in der Landwirtschaft allein reichen nicht aus, um diesen Herausforderungen zu begegnen. Veränderungen hin zu nachhaltigeren Essgewohnheiten werden als entscheidend angesehen, um die Umweltbelastung des Ernährungssystems zu verringern.

## Umweltauswirkungen
Eine systematische Überprüfung zeigt, dass das Potenzial zur Reduzierung von Treibhausgasemissionen durch Ernährungsumstellungen in Regionen mit einem wohlhabenden Ernährungsmuster erheblich ist. Die Reduzierung hängt vor allem von der Menge und Art des enthaltenen Fleisches und tierischen Produkten ab. Vegan, vegetarisch oder der Verzicht auf Wiederkäuer haben die geringsten Treibhausgasemissionen. Selbst eine gesündere Ernährung, die Fleisch enthält, kann die Emissionen um bis zu 35% reduzieren.

## Gesundheitliche Aspekte
Die Umsetzung umweltfreundlicher Ernährungsziele, insbesondere der Ersatz tierischer Lebensmittel durch pflanzliche, zeigt sich besonders effektiv in wohlhabenden Ländern. Dies führt nicht nur zu einer Verbesserung der Nährstoffversorgung und einer Verringerung der vorzeitigen Sterblichkeit (um bis zu 12%), sondern auch zu erheblichen Reduzierungen der Treibhausgasemissionen (um bis zu 84%). Jedoch kann dies in Ländern mit niedrigem oder mäßigem Konsum von tierischen Lebensmitteln zu einem Anstieg des Wasserverbrauchs führen.

## Herausforderungen und Perspektiven nachhaltiger Ernährung
Die aktuellen Herausforderungen in Bezug auf Umweltauswirkungen der Lebensmittelproduktion sind beträchtlich. Etwa ein Viertel der Treibhausgasemissionen stammt aus der Landwirtschaft, die 40% der Erdoberfläche beansprucht und 70% der Süßwasserressourcen nutzt. Innovationen und Technologien spielen eine Schlüsselrolle bei der Gestaltung einer nachhaltigeren Ernährungszukunft.

## Fazit
Eine nachhaltige Ernährung, die sowohl Umwelt- als auch Gesundheitsziele berücksichtigt, ist entscheidend für die Bewältigung globaler Herausforderungen. Die Umstellung auf pflanzliche Ernährungsmuster, verbunden mit technologischen Innovationen, kann erheblich zur Verringerung der Umweltauswirkungen beitragen und die Gesundheit fördern. Es bedarf jedoch kollektiver Anstrengungen auf individueller, gesellschaftlicher und politischer Ebene, um diese Ziele zu erreichen. 
      """,
      chapters: <LessonModel>[
            eatingSources
      ]
);
