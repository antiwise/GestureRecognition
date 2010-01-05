package {
	
	import flash.geom.Point;
	
	/*
	
	Part of a very simple gesture recognition engine
	Written by Arnaud Icard
	http://www.sqrtof5.com/
	Project page and basic explanations:
	http://blog.sqrtof5.com/?p=173
	
	This class holds the raw data of symbols to be recognized,
	and is responsible to find a best match.
	Right now it returns an untyped object holding some info.
	Again. Not pretty. Feel free to improve.
	
	*/
	
	public class GestureDictionary {
		
		private var raw_data:Vector.<Vector.<Number>>;
		private var descr:Array = ["heart", "alpha", "o", "8", "down", "top left", "a", "up", "top right", "right", "left", "S", "@", "reverse @", "W"];
	
		public function GestureDictionary() {
			
			raw_data = new Vector.<Vector.<Number>>();
			var _v:Vector.<Number>;
			
			// "heart"
			_v = new Vector.<Number>();
			_v.push(0.46866961118107686,1,0.38353382498406036,0.9499201257664608,0.30969184831414165,0.8843193759528314,0.23584987164422294,0.8187186261392019,0.1670439414173047,0.7478536851582084,0.10610863631034184,0.6701170497399414,0.05630832262546232,0.5848174327916874,0.02499984236413867,0.4911377927499071,0.005663162137133942,0.3942760939601817,0,0.29566562550353276,0.014670435462585119,0.19798822679754058,0.057459303485831045,0.10896458573561726,0.1392849178080532,0.053641310928153246,0.23324783852211936,0.0231935618239365,0.33164152907377703,0.031840963413770795,0.41935115764698805,0.0772625106152985,0.4784175988137231,0.15642848450893454,0.5271646138376664,0.24233438896774717,0.5542164903803736,0.3373306618954223,0.5583760405675493,0.23864533351844644,0.5831560856852106,0.1430312903103597,0.6345575354611511,0.05868683669565698,0.7216156011846476,0.012028621051307305,0.8196533906856114,0,0.9184261110284999,0.00021356660174424901,0.9731365510847759,0.08245019860648535,0.9843634469154425,0.1805830305468639,0.976522218118501,0.27904424639142167,0.9611459044406193,0.3766130163555378,0.9300344626070861,0.4703582780047,0.8919459314653927,0.5614920241698984,0.8449683993313801,0.6483781989575422,0.7835398630550723,0.7257256670840528,0.7166747799120261,0.7984247492715517,0.6532697447371391,0.8741604568941953,0.5812729924276703,0.9417811900425442);
			raw_data.push(_v);
			
			// "alpha"
			_v = new Vector.<Number>();
			_v.push(0.9827865562212795,0,0.943417042799324,0.06999024608347597,0.8991129466297797,0.13696591477373118,0.854808850460236,0.20394158346398655,0.80741597245946,0.2687683391186796,0.7537701265260345,0.3285238103995107,0.6974642762838226,0.385779765220024,0.633995652177468,0.4349765830841232,0.5690916376718074,0.48226360069951846,0.5011782878936178,0.5251164892347426,0.4290018846887298,0.560318193089989,0.351569652535862,0.5815982907808229,0.2725973061185357,0.596157193048812,0.19238312299882865,0.5923785742078689,0.11628352755004652,0.5667378896140689,0.06060532282709455,0.5088713997193457,0.021450817383663768,0.43876064564133427,0.004592578520215702,0.36024699767914886,0,0.28007529845527884,0.03760788634455097,0.2091229199285346,0.09130940625581939,0.14941747718562648,0.1608408121863415,0.10924314802841455,0.24010217548592042,0.09635014908333292,0.3201960209761075,0.09055626882041191,0.4002864831380427,0.09639673152422777,0.47846508152061057,0.11474611540609801,0.5502723651382421,0.15069478928096272,0.6176761953684622,0.19434472403695888,0.6776222501411291,0.24777751968812678,0.7334436219718314,0.3055059146151316,0.7807089902819775,0.37042569659576763,0.8279567189128658,0.4353583176204034,0.8701641638457349,0.503674675296628,0.9116301491241655,0.5724436014100894,0.9563064205485254,0.6391715858358455,1,0.7065471322056134);
			raw_data.push(_v);
			
			// "O"
			_v = new Vector.<Number>();
			_v.push(0.49001089284542965,0,0.4152939174147341,0.009326042508726812,0.34434323516623333,0.03453719430428034,0.276436194400063,0.06706772305445902,0.20759213559833625,0.09756521564139774,0.1446559009389926,0.13890081595505618,0.08983000593871078,0.19051208142882395,0.045589006802866164,0.251441019396315,0.022142459932288208,0.32299422286220364,0.00645882851618047,0.39663948877923394,0,0.4716587197842496,0.00005659865135791062,0.5469554546601886,0.012622384601454689,0.6211962959124423,0.03637233044887304,0.6926493683350521,0.06581873708026922,0.761949517129155,0.11061138067594571,0.8224740622831278,0.16588698864477777,0.8736033948629667,0.2294119619578483,0.9140283778803752,0.2940415709705404,0.9526627553860652,0.3627121279549225,0.9835489349788845,0.43666832312587556,0.9976939935585963,0.5119297596035198,0.9999999999999999,0.5830647279538547,0.975313611763076,0.645447530678403,0.933147423761127,0.6937511502676053,0.8753861753244113,0.7261978787386331,0.8074390539879484,0.7495239415557609,0.7358464825867335,0.7674592540681983,0.6627169669896449,0.7750576218173922,0.5878045761992463,0.7750576218173922,0.5125078200514233,0.7676297742644609,0.43757832941444175,0.74245543952789,0.36661457558930644,0.71388788696838,0.2969475358420586,0.682765223949721,0.22838383310503504,0.640998098539394,0.16573314498954503,0.5929841373886229,0.10773089485217315);
			raw_data.push(_v);
			
			// "8"
			_v = new Vector.<Number>();
			_v.push(0.3311338469126309,0,0.2366503755231516,0.016673553774614026,0.14870738691883267,0.0550293162702561,0.06591864308067072,0.10351805367370535,0.022751400288606692,0.1892019081097217,0,0.28240870800216006,0.039742276907185674,0.3697338772691819,0.11192548306458106,0.43293766283713986,0.20003940754724792,0.47089909159777565,0.29308351173183056,0.4943069628758296,0.3861599782287088,0.5175858190706021,0.47832589326278413,0.5442424855391048,0.5709136644430474,0.5693947893928819,0.6576852886194026,0.6103315576957025,0.7356263103081764,0.6662809178295909,0.7927004565201589,0.7434020925837056,0.7811738926667705,0.8386505680938952,0.7213223425848723,0.9136367382459666,0.6325916506903504,0.9501332870855613,0.5398399333335933,0.9746741242484137,0.44512321875712263,0.9899671861107521,0.3497058387535551,1.0000000000000002,0.25377084375782766,0.9987309466318328,0.16094910539522306,0.974456296302207,0.08141408937528723,0.9207970474443445,0.08299005281808755,0.8248666033689187,0.14616359366354295,0.7526569260512004,0.21765582143151585,0.6886725910147735,0.29192722556172024,0.6279363391563544,0.375326871511652,0.5805060448634921,0.4570364671816376,0.5302201051115757,0.5278885155292768,0.4655275939049045,0.578656708704962,0.38411675726163086,0.5979006550901244,0.29012311764273735,0.5917143723632635,0.1943793780703517,0.5118800087996543,0.14116652101799138);
			raw_data.push(_v);
			
			// "down"
			_v = new Vector.<Number>();
			_v.push(0,0,0.0028446972859170368,0.028446972859169015,0.004807401005458348,0.05696837467619233,0.005301445134833608,0.08555295947109585,0.005795489264209588,0.11413754426601987,0.006289533393585209,0.14272212906094392,0.006308071323480697,0.17131097695385417,0.006326609253376186,0.19989982484676444,0.006330996410980507,0.22848867841334963,0.006335383568585186,0.2570775319799349,0.006339770726189507,0.2856663855465201,0.006344157883794188,0.31425523911310527,0.006344402141152735,0.34284409301526686,0.006344646398511284,0.37143294691742845,0.006344890655869831,0.40002180081959005,0.006344936764433261,0.42861065472273735,0.00634498287299669,0.45719950862588465,0.006345028981560119,0.4857883625290731,0.006345075090123909,0.5143772164322203,0.0063450815509887935,0.5429660703354247,0.006345088011853678,0.5715549242386289,0.006345094472718563,0.6001437781418331,0.006345100933583449,0.6287326320450373,0.00634510187805599,0.6573214859482421,0.0063451028225285306,0.6859103398514471,0.006345103767001071,0.7144991937546521,0.0063451047114739725,0.7430880476578571,0.00855671376690861,0.771591229109841,0.01076832282234361,0.800094410561825,0.012615020945469813,0.8286235583503734,0.014461719068594572,0.8571527061389015,0.015067913068653103,0.8857351324937982,0.015674107068711633,0.9143175588486948,0.017714907261873056,0.9428334789999087,0.018422288601293517,0.971413580104318,0.018795336917958736,1);
			raw_data.push(_v);
			
			// "top left"
			_v = new Vector.<Number>();
			_v.push(0,0,0.025259220862964452,0.031574026078705436,0.05422244646217484,0.059788896702403546,0.08318567206138523,0.08800376732610166,0.11258157272631043,0.1157675636356958,0.1419774733912356,0.14353135994528998,0.1707416234684533,0.1719491542256009,0.199505773545693,0.2003669485059331,0.2282699236229112,0.22878474278624386,0.25703407370012893,0.25720253706655477,0.2846428615921615,0.28674407041459,0.31225164948421497,0.3162856037626472,0.3398604373762685,0.34582713711070445,0.367469225268322,0.3753686704587617,0.39509059247948597,0.40489844246615825,0.422711959690629,0.4344282144735326,0.45033332690179306,0.4639579864809289,0.47795469411295705,0.4934877584883252,0.5055760613241007,0.5230175304956992,0.5340738590746807,0.5517024199811031,0.5625716568252608,0.5803873094665071,0.591069454575819,0.6090721989518892,0.6195672523263991,0.6377570884372932,0.6476528049111634,0.6668457305065139,0.6757383574959277,0.6959343725757345,0.7038239100806916,0.7250230146449552,0.7319094626654554,0.754111656714176,0.7604044900090188,0.7827992982713408,0.7888995173525821,0.8114869398285055,0.8173945446961455,0.8401745813856699,0.8465614472366145,0.868178851731772,0.8757283497770836,0.8961831220778742,0.9048952523175523,0.9241873924239763,0.9352820815829866,0.9508629986704358,0.9656689108483751,0.9775386049168552,1.0000000000000002,0.998900338907474);
			raw_data.push(_v);
			
			// "a"
			_v = new Vector.<Number>();
			_v.push(0.6686651353042671,0.0785261128541092,0.6017475806152811,0.04105228222827694,0.5304263329995293,0.01284719854005439,0.45452081634475644,0.001865411404118335,0.37784769623333536,0,0.3013046842168199,0.004838844776040361,0.22618740741101087,0.020319214041871137,0.15703175143204742,0.05348157755001465,0.09982669068107418,0.10456805454544328,0.054020559930502636,0.1660826503174107,0.019063874960932776,0.2343488739075966,0.005127699153801062,0.3097679040737272,0,0.3862921081448316,0.026995575548487832,0.45807989267766763,0.067813914864143,0.5230114742296291,0.12650327837804928,0.5723856144009737,0.2014071694839642,0.5888675501040467,0.27772423706646054,0.5964801911001598,0.35419809215941417,0.5906495312276459,0.42594284753963757,0.5635398063533701,0.4876939630519348,0.5180530298099183,0.5388165903674352,0.46088027332844966,0.5834676341404218,0.3985221832573944,0.6149242559921029,0.3285741450503986,0.6329043112693423,0.25401567994042984,0.6419516545414072,0.17785537080867522,0.6481766306459837,0.10141260280655276,0.6453490006902209,0.1780562693169714,0.6449429762926497,0.2547510035007183,0.6592826102117242,0.3300943642327293,0.687788539448198,0.40129590287967265,0.7256111428740222,0.46801694736656363,0.7789722711032375,0.5231063029757047,0.8511050010448924,0.5491661644199122,0.9275698563332104,0.5432186428299072,1,0.5179971956919013);
			raw_data.push(_v);
		
			// "up"
			_v = new Vector.<Number>();
			_v.push(0.007019932542792995,1,0.007019932542792995,0.9714164572935446,0.005421773347608464,0.9428776275901635,0.0038236141524235325,0.9143387978867822,0.003715258828634499,0.8857554605593191,0.003606903504845466,0.8571721232318559,0.002775364821139641,0.8286006784474345,0.001943826137433816,0.800029233663013,0.0011122874537287891,0.7714577888786165,0.0002807487700229642,0.7428863440941951,0.00021284758680802587,0.7143028820386452,0.00014494640359308752,0.6857194199830701,0.00007704522037814918,0.6571359579275202,0.000009144037163210822,0.6285524958719703,0.000006858027872507886,0.5999689532569034,0.000004572018581804951,0.5713854106418617,0.0000022860092911020143,0.54280186802682,0,0.5142183254117784,0.000739838979125153,0.48564435907987547,0.0014796779582495077,0.4570703927479978,0.0022195169373746605,0.428496426416095,0.0029593559164998134,0.3999224600841922,0.004458910275987964,0.37137827940975904,0.005958464635477312,0.3428340987353007,0.007458018994965065,0.31428991806086753,0.008957573354452818,0.2857457373864344,0.010457127713942166,0.25720155671197603,0.011416532500136824,0.228634119723195,0.012375937286331485,0.20006668273441397,0.013335342072526145,0.1714992457456329,0.013526873604855943,0.14291634475003995,0.013718405137185745,0.11433344375444696,0.013909936669515944,0.08575054275882893,0.01395710802570407,0.057167038975791694,0.014004279381892198,0.02858353519275446,0.01402500467431729,0);
			raw_data.push(_v);
			
			// "top right"
			_v = new Vector.<Number>();
			_v.push(0.8710155628698673,0,0.8424409991511395,0.025002743253886718,0.8144305583668446,0.05063588720863649,0.7864201175825498,0.07626903116338628,0.7593019106723996,0.1028443150925125,0.7321837037622495,0.12941959902163858,0.7050654968520994,0.1559948829507647,0.6779472899419792,0.18257016687986097,0.652445003685513,0.210699799967263,0.6269427174290748,0.2388294330546336,0.6014404311726655,0.26695906614197257,0.5759072016838379,0.29506061509939213,0.5503739721950096,0.32316216405681164,0.524840742706182,0.35126371301423115,0.4993075132173538,0.37936526197165066,0.47377428372852615,0.40746681092907033,0.44893604327220993,0.4361844827178772,0.42409780281589365,0.4649021545066838,0.399259562359578,0.4936198262954905,0.3744213219032618,0.5223374980842972,0.3495095464495755,0.5509914036763891,0.32459777099588927,0.5796453092684811,0.299685995542203,0.6082992148605731,0.2747742200885173,0.6369531204526653,0.2504177986409205,0.6660805576246114,0.22606137719335068,0.6952079947965248,0.20170495574578085,0.7243354319684383,0.17734853429821099,0.7534628691403518,0.15571042349026204,0.7846627893741458,0.1340723126823131,0.8158627096079396,0.1124342018743402,0.8470626298417682,0.0907960910663673,0.8782625500755967,0.06840420517698383,0.9089259860906456,0.04601231928757519,0.9395894221057288,0.023006159643787594,0.9697947110528644,0,1);
			raw_data.push(_v);
			
			// "right"
			_v = new Vector.<Number>();
			_v.push(0,0.006387372903664348,0.028537059223137456,0.004885422418235994,0.05707411844627491,0.0033834719328078213,0.08565048121231063,0.003278137088314643,0.1142081018094976,0.0022379879679222097,0.1427657224066846,0.001197838847529595,0.17132334300387156,0.0001576897271371618,0.19989983589558985,0.00009720522412355163,0.22847632878730814,0.00003672072111012304,0.2570528834889546,0.000025506919555727244,0.28562943819060105,0.000014293118001331449,0.3142059928922475,0.0000030793164471172005,0.3427825497756782,0.000002052877631471982,0.37135910665912997,0.0000010264388156452182,0.39993566354256066,0,0.42849808285222774,0.0008987811437075023,0.45706050216187416,0.0017975622874142783,0.485622921471562,0.0026963434311225065,0.5141991778526417,0.002827399176305273,0.5427754342337214,0.002958454921488039,0.5713516906148011,0.0030895106666708055,0.5999282364967812,0.003114606917531997,0.6285047823787407,0.0031397031683931885,0.6570813282607002,0.00316479941925438,0.6856578741426597,0.0031898956701157536,0.7142344310237837,0.0031909844371992837,0.7428109879049287,0.003192073204282814,0.7713875447860526,0.003193161971366344,0.7999641016876071,0.0031932995925061406,0.8285406585891409,0.0031934372136457555,0.8571172154906747,0.0031935748347855517,0.8856937723925394,0.003193579251077539,0.9142703292944044,0.003193583667369527,0.9428468861962696,0.0031935840993765775,0.9714234430981349,0.0031935842912257,1.0000000000000002,0.003193584483074641);
			raw_data.push(_v);
			
			// "left"
			_v = new Vector.<Number>();
			_v.push(1,0,0.9714265490919589,0,0.9428530981839178,0,0.9142796472758767,0,0.8857061963678357,0,0.8571327454597946,0,0.8285592945517535,0,0.7999858436437124,0,0.7714123927356713,0,0.7428389418276301,0,0.714265490919589,0,0.685692040011548,0,0.657118589103507,0,0.6285451381954659,0,0.5999716872874248,0,0.5713982363793837,0,0.5428247854713426,0,0.5142513345633015,0,0.4856778836552604,0,0.4571044327472193,0,0.4285309818391782,0,0.3999575309311371,0,0.371384080023096,0,0.3428106291150549,0,0.3142371782070138,0,0.2856637272989727,0,0.2570902763909316,0,0.22851682548289054,0,0.19994337457484945,0,0.17136992366680834,0,0.14279647275876728,0,0.11424652026323816,0.0011585807253981359,0.08569656776770905,0.0023171614507964807,0.05714661527217994,0.0034757421761946166,0.028573397180179844,0.003591088009352394,0,0.003646499000380199);
			raw_data.push(_v);
			
			// "S"
			_v = new Vector.<Number>();
			_v.push(0.48721244054562785,0.040460758544015346,0.43202886671505114,0.021358752218046416,0.37446708101800413,0.011522376169962118,0.3167503643018252,0.0026401423351412093,0.2584138995919747,0,0.20032611758852495,0.005993583928702688,0.143320366828416,0.018660779619479945,0.09113663933305102,0.04487093129934574,0.05168023487350002,0.08792096746096136,0.027879328657953315,0.14124666792247273,0.02065834958318439,0.19919466985173545,0.028405894114314968,0.25707462337737524,0.05538384422204428,0.3088655846966726,0.09005639000311781,0.3558541794346666,0.1329189244894732,0.39551419208970834,0.18186331839538672,0.4273663469865884,0.2324378594880806,0.4565610256053967,0.28308285346468076,0.48563331570270807,0.3341548288811981,0.5139488025155474,0.3840292921312275,0.5443239795835669,0.4327605023152165,0.5765013415076892,0.47963443865000666,0.611328738178636,0.5162876564520171,0.6567892165213728,0.5358634406654489,0.711806505974973,0.5325434902707947,0.7701082331858292,0.5096810642693296,0.8238429793350353,0.48057300554349996,0.8744674238614408,0.44239026298203976,0.9186510366254207,0.39567663237592254,0.953693156738041,0.3415566792234403,0.9756281547358802,0.28563320344208504,0.9924411949999987,0.22772829921659932,1,0.16933225336415775,0.9998763262694047,0.11181092249399331,0.9898060749658297,0.05607513714999313,0.9723809293859609,0,0.9560808539259651);
			raw_data.push(_v);
			
			// "@"
			_v = new Vector.<Number>();
			_v.push(0.5793237334697734,0.3208780195221236,0.49370903611523476,0.38131192353709226,0.4279245242723635,0.46288723327716713,0.4466556999295487,0.5659953135429707,0.52328890327374,0.6374759773815748,0.6201249694519927,0.6775372984371874,0.7238911915849277,0.692190090043504,0.8273674417603247,0.6756130333916616,0.9085363604674114,0.6093277424628133,0.971235973640573,0.5253581547209671,0.9776715582878375,0.4207602751638383,0.9564741888318831,0.3181308218585249,0.9120288661719047,0.2232269417942418,0.8466407720518443,0.1413335336043788,0.7583864523117209,0.08482416973600924,0.6634918547912807,0.04035903149228624,0.564074367415539,0.007218476857696156,0.4593810898320135,0.002586977486611551,0.3546173522837401,0,0.25091016781297315,0.015064960894274502,0.16015872624774946,0.06747019929115179,0.10947211658556795,0.1591926107212562,0.06986336862811883,0.25621467132008585,0.03821545539981557,0.356117337680352,0.015660276764924968,0.4584569540288017,0,0.56207591411452,0.023964752337040096,0.6640946565250401,0.07600602545021934,0.7550553021381798,0.14909989408030955,0.8301513707855444,0.23958105047968994,0.8830219060034763,0.33297235657291374,0.9305634363091101,0.4328031303694129,0.9624374031283175,0.5349940711143174,0.9856568946659329,0.639036199065765,0.9982015656033684,0.7438164395279578,1,0.8484785324804393,0.9947104389217929);
			raw_data.push(_v);
			
			// "reverse @"
			_v = new Vector.<Number>();
			_v.push(0.32973268483922696,0.28658827301096695,0.4361717741847458,0.27476170752813156,0.5372574105902788,0.3101289452533423,0.605481593464096,0.3926795858506333,0.6029434129376428,0.49974360889964015,0.5362577257247653,0.5835419770983674,0.4437532727526184,0.6375056090382861,0.3376853488874285,0.6522955691042035,0.2335542986274723,0.6272781399081725,0.14221427637258446,0.5713661758369672,0.07003462293614147,0.49225078528861593,0.023638062354706783,0.39572873310344725,0,0.2912759236632998,0.040859321882102624,0.19228267537253882,0.11855562285785771,0.1185776402222314,0.2064127356439128,0.05733815030990794,0.30978356071623364,0.02934493835252835,0.41476542844663494,0.00817999470366248,0.5215466771679079,0,0.6286079731373848,0.0026507163483235523,0.7304816019112126,0.03567966050758279,0.8227250741804598,0.09008820042123777,0.8875812300615583,0.17531041839372316,0.9343911388457722,0.27163268908664195,0.9454974559412929,0.3781493408946898,0.9413135357801085,0.4851616869296441,0.9277278163419219,0.5913905700978768,0.8941506153246966,0.6930848126274909,0.8435652641487544,0.7874790372295807,0.7620098687167363,0.8568898783694712,0.6782214070371432,0.9235880123852779,0.5840947456605167,0.9746695061957864,0.47858904064877,0.9930459476847538,0.37172095117292714,0.9999999999999999,0.26588775723410135,0.9836145658424907,0.1623219975837501,0.9563513888473417);
			raw_data.push(_v);
			
			//"W"
			_v = new Vector.<Number>();
			_v.push(0,0.1457091247958858,0,0.2297244125094506,0.0031896855266041126,0.313679129326512,0.007659509617759039,0.39757542985393207,0.009270369915232324,0.4815752732984,0.01311376832623782,0.5655026041164795,0.024577617492698194,0.6487320984792457,0.042013928576989816,0.730918129076695,0.07873287764727095,0.8064845723486075,0.13211326208963017,0.8713621734631599,0.2141387542048282,0.8895387301462252,0.2917401876371875,0.8573426729522738,0.34931484906475324,0.7961566702139495,0.3981150633120953,0.7277672875657152,0.4421717121610113,0.6562300227186693,0.467985789162284,0.576278775085093,0.4826207115508607,0.49354796089670594,0.4796445674348389,0.5775105188365027,0.47893332142298617,0.6615227959077956,0.48712015100214634,0.7451382513633203,0.5185987303639221,0.8230334862044676,0.5629894430766212,0.8943639368861481,0.6451093700044592,0.9121089691757672,0.7262552434880932,0.8903393622392332,0.8040979017704112,0.8587309911781472,0.867358578314331,0.8034439640126481,0.9134298899284221,0.7331872716926247,0.9464116952380185,0.6559165198643103,0.9730300352007382,0.5762294283925912,0.9900767344677853,0.49396170316761656,0.9966480386738744,0.4102037988801756,1.0000000000000002,0.32625540446514667,0.9950440931049604,0.24238641403099545,0.9774335638039365,0.160237538035454,0.9536581322086594,0.07965653889760313,0.9269485013529601,0);
			raw_data.push(_v);
						
		}
		
		public function findMatch(path:Vector.<Point>):Object {
			
			var _result					:Object = {};
			var _s						:String = "";
			
			var bestMatchIndex			:int = -1;
			var worstMatchIndex			:int = -1;
			
			var bestAvgDistSquared		:Number = 10000000;
			var worstAvgDistSquared		:Number = 0;
			var avgDistForAllSquared	:Number = 0;

			for (var i:uint=0; i<raw_data.length; i++) {
				
				var count			:uint = 0;
				var avgDistSquared	:Number = 0;
				var max				:int = (path.length*2 < raw_data[i].length)? path.length : raw_data[i].length*.5;
				
				for (var j:uint = 0; j<max; j++) {
					var dx:Number = raw_data[i][count] - path[j].x;
					count ++;
					var dy:Number = raw_data[i][count] - path[j].y;
					count ++;
					var distSquared:Number = dx*dx + dy*dy;
					avgDistSquared += distSquared;
				}
				
				avgDistSquared /= max;
				
				if (avgDistSquared < bestAvgDistSquared) {
					bestAvgDistSquared = avgDistSquared;
					bestMatchIndex = i;
				}
				if (avgDistSquared > worstAvgDistSquared) {
					worstAvgDistSquared = avgDistSquared;
					worstMatchIndex = i;
				}
				avgDistForAllSquared += avgDistSquared;
				
			}

			avgDistForAllSquared /= raw_data.length;

			var avgDistForAll		:Number = Math.sqrt(avgDistForAllSquared);
			var worstAvgDist		:Number = Math.sqrt(worstAvgDistSquared);
			var bestAvgDist			:Number = Math.sqrt(bestAvgDistSquared);

			_s += "worst average dist: " + worstAvgDist + "\n";
			_s += "worst match: " + descr[worstMatchIndex] + "\n";
			_s += "average distance: " + bestAvgDist +"\n";
			_s += "global average: " + avgDistForAll +"\n";
			_s += "best match: " + descr[bestMatchIndex] + "\n";
			_s += "(worst - best)/2 = " + ((worstAvgDist - bestAvgDist)*.5) + "\n";

			var diffRatio:Number = bestAvgDist/worstAvgDist;
			_s += "best over avg: " + bestAvgDist/avgDistForAll + "\n";
			_s += "difference ratio: " + diffRatio;
			
			_result.matchingIndex = bestMatchIndex;
			_result.details = _s;
			return _result;
			
		}
		
		public function getPathRawData(atIndex:uint):Vector.<Number> {
			return(raw_data[atIndex]);
		}
		
		public function getSummary():String {
			
			var _s:String = "";
			_s += raw_data.length + " entries\n";
			var _min:Number = 100000000;
			var _max:Number = 0;
			for (var i:uint=0; i<raw_data.length; i++) {
				if (raw_data[i].length < _min) _min = raw_data[i].length;
				if (raw_data[i].length > _max) _max = raw_data[i].length;
			}
			_s += "lowest : " + _min + "\n";
			_s += "highest: " + _max + "\n";
			return _s;
			
		}
	
	}

}