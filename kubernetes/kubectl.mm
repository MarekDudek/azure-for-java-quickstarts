<map version="1.1.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1609446034829" ID="ID_1456424085" MODIFIED="1609446072377" TEXT="kubectl">
<node CREATED="1609446351995" ID="ID_167173009" MODIFIED="1609446364806" POSITION="right" TEXT="Context of operations">
<node CREATED="1609446380163" ID="ID_1055715528" MODIFIED="1609446389455" TEXT="contents">
<node CREATED="1609446146638" ID="ID_644967902" MODIFIED="1609446152335" TEXT="context">
<node CREATED="1609446185795" ID="ID_1061026956" MODIFIED="1609446280893" TEXT="name"/>
<node CREATED="1609446167171" ID="ID_1784185782" MODIFIED="1609446170063" TEXT="cluster">
<node CREATED="1609446170611" ID="ID_1035887639" MODIFIED="1609446172646" TEXT="namespace"/>
<node CREATED="1609446173403" ID="ID_1810958836" MODIFIED="1609446174446" TEXT="user"/>
</node>
<node CREATED="1609446221163" ID="ID_1512999021" MODIFIED="1609446226071" TEXT="current-context"/>
</node>
<node CREATED="1609446243083" ID="ID_1817933340" MODIFIED="1609446245695" TEXT="cluster">
<node CREATED="1609446270059" ID="ID_1294709598" MODIFIED="1609446284004" TEXT="name"/>
<node CREATED="1609446256283" ID="ID_1497601596" MODIFIED="1609446258743" TEXT="server"/>
<node CREATED="1609446259323" ID="ID_1196863658" MODIFIED="1609446265670" TEXT="certificate-authority"/>
</node>
<node CREATED="1609446296859" ID="ID_1373749606" MODIFIED="1609446302799" TEXT="user">
<node CREATED="1609446305395" ID="ID_870357768" MODIFIED="1609446306958" TEXT="name"/>
<node CREATED="1609446308043" ID="ID_1326865116" MODIFIED="1609446320151" TEXT="client-certificate-data"/>
<node CREATED="1609446320859" ID="ID_120606525" MODIFIED="1609446324215" TEXT="client-key-data"/>
<node CREATED="1609446325187" ID="ID_220578176" MODIFIED="1609446327606" TEXT="token"/>
</node>
<node CREATED="1609447976510" ID="ID_286928333" MODIFIED="1609447979690" TEXT="namespace"/>
</node>
<node CREATED="1609446397923" ID="ID_1743909941" MODIFIED="1609446399758" TEXT="commands">
<node CREATED="1609446404123" ID="ID_1495708196" MODIFIED="1609446416911" TEXT="kubectl config view"/>
<node CREATED="1609446769291" ID="ID_1298084396" MODIFIED="1609446770343" TEXT="kubectl config get-contexts"/>
<node CREATED="1609447951806" ID="ID_1684158356" MODIFIED="1609448768260" TEXT="kubectl config set-context ctx-1 --cluster=minikube --user=minikube --namespace=ns--1"/>
<node CREATED="1609447680598" ID="ID_174526831" MODIFIED="1609447681929" TEXT="kubectl config use-context ctx-1"/>
</node>
<node CREATED="1609446460011" ID="ID_1337714378" MODIFIED="1609446465991" TEXT="storage">
<node CREATED="1609446483587" ID="ID_948066878" MODIFIED="1609446484911" TEXT="~/.minikube/config/config.json"/>
<node CREATED="1609447017196" ID="ID_1236814833" MODIFIED="1609447018680" TEXT="~/.kube/config"/>
</node>
<node CREATED="1609446562683" ID="ID_493990835" MODIFIED="1609446565663" TEXT="profiles">
<node CREATED="1609446642899" ID="ID_939754630" MODIFIED="1609446645231" TEXT="storage">
<node CREATED="1609446646426" ID="ID_1385085887" MODIFIED="1609446646426" TEXT="~/.minikube/profiles/minikube/config.json"/>
</node>
</node>
</node>
<node CREATED="1609448061606" ID="ID_71069757" MODIFIED="1609448063994" POSITION="right" TEXT="Namespaces">
<node CREATED="1609448080126" ID="ID_1782466703" MODIFIED="1609448082114" TEXT="commands">
<node CREATED="1609448082966" ID="ID_447958715" MODIFIED="1609448083914" TEXT="kubectl get namespaces"/>
<node CREATED="1609448166343" ID="ID_907157407" MODIFIED="1609448777516" TEXT="kubectl create namespace ns-1 "/>
<node CREATED="1609448122247" ID="ID_1859925609" MODIFIED="1609448781124" TEXT="kubectl delete namespaces ns-1"/>
</node>
</node>
<node CREATED="1609448311815" ID="ID_130283042" MODIFIED="1609448314523" POSITION="right" TEXT="Deployments">
<node CREATED="1609448315847" ID="ID_514085004" MODIFIED="1609448922116" TEXT="nodeport">
<node CREATED="1609448332895" ID="ID_50150223" MODIFIED="1609448803281" TEXT="kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4"/>
<node CREATED="1609448358855" ID="ID_298788524" MODIFIED="1609448359739" TEXT="kubectl expose deployment hello-minikube --type=NodePort --port=8080"/>
</node>
<node CREATED="1609448336943" ID="ID_1427717915" MODIFIED="1609448924556" TEXT="load-balanced">
<node CREATED="1609448883544" ID="ID_265141326" MODIFIED="1609448884428" TEXT="kubectl create deployment balanced --image=k8s.gcr.io/echoserver:1.4"/>
<node CREATED="1609448900808" ID="ID_825581083" MODIFIED="1609448914449" TEXT="kubectl expose deployment balanced --type=LoadBalancer --port=8080"/>
</node>
</node>
<node CREATED="1609449589250" ID="ID_1477326275" MODIFIED="1609449592214" POSITION="left" TEXT="Resources">
<node CREATED="1609449594618" ID="ID_1130042487" MODIFIED="1609449596574" TEXT="short names">
<node CREATED="1609449609530" ID="ID_1912470147" MODIFIED="1609449610270" TEXT="kubectl api-resources"/>
</node>
<node CREATED="1609449915675" ID="ID_1198410579" MODIFIED="1609449918175" TEXT="describing">
<node CREATED="1609449918939" ID="ID_317952609" MODIFIED="1609449938207" TEXT="kubectl describe &lt;short-name&gt; &lt;name&gt;?"/>
</node>
</node>
</node>
</map>
