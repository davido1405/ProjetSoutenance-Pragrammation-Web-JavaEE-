<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Insert title here</title>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
  </head>
  <body class="m-0 p-0">
    <header>
    <!-- Nav barre -->
      <div class="flex justify-between content-center px-10 py-2 h-15 border-b border-green-800 mx-6 my-3">
	      	<div class="flex w-100 gap-x-2 content-center items-center">
	      		<div class="w-fit bg-[#1D2E22] mb-3 p-2 -rotate-10 rounded-xl items-center">
		      		<svg class="w-8 rounded-md text-green-400" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
					  <path stroke-linecap="round" stroke-linejoin="round" d="M4.26 10.147a60.438 60.438 0 0 0-.491 6.347A48.62 48.62 0 0 1 12 20.904a48.62 48.62 0 0 1 8.232-4.41 60.46 60.46 0 0 0-.491-6.347m-15.482 0a50.636 50.636 0 0 0-2.658-.813A59.906 59.906 0 0 1 12 3.493a59.903 59.903 0 0 1 10.399 5.84c-.896.248-1.783.52-2.658.814m-15.482 0A50.717 50.717 0 0 1 12 13.489a50.702 50.702 0 0 1 7.74-3.342M6.75 15a.75.75 0 1 0 0-1.5.75.75 0 0 0 0 1.5Zm0 0v-3.675A55.378 55.378 0 0 1 12 8.443m-7.007 11.55A5.981 5.981 0 0 0 6.75 15.75v-1.5" />
					</svg>
				</div>
				<div>
					<h3 class="font-bold text-3xl">soutena<span class="text-amber-500 text-md">.</span></h3>
				</div>
	      	</div>
	      	<div class="flex-1 flex justify-between text-gray-400">
	      		<div class="flex gap-10 content-center items-center">
	      			<a class="hover:text-green-800 hover:font-semibold" href="#laplateforme">La plateforme</a>
	      			<a class="hover:text-green-800 hover:font-semibold" href="#pourqui">Pour qui ?</a>
	      			<a class="hover:text-green-800 hover:font-semibold" href="Comment ça marche">Comment ça marche ?</a>
	      		</div>
	      		<div class="flex gap-x-2 bg-[#1D2E22]  px-4 py-2 rounded-md text-white">
	      			<a href="./authPage.jsp">Se connecter</a>
	      			<svg class="w-8" data-slot="icon" fill="none" stroke-width="1.5" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
					  <path stroke-linecap="round" stroke-linejoin="round" d="M17.25 8.25 21 12m0 0-3.75 3.75M21 12H3"></path>
					</svg>
	      		</div>
	      	</div>
      </div>
    <!-- Hero section -->
    <div class="flex justify-center gap-x-20 items-center content-center mx-6 px-10 py-10 pb-25 border-b border-green-800">
	    <!-- Partie gauche -->
	    	<div class="flex-col space-y-5">
	    		<div class="flex w-fit rounded-2xl px-4 py bg-green-200 border border-green-800 items-center content-center">
		    		<p class="uppercase">la réussite se prépare ensemble</p>
	    		</div>
	    		<div class="flex-col space-y-2">
		    		<h1 class="font-bold text-4xl text-green-800">Vos soutenances.</h1>
		    		<h1 class="font-bold text-4xl text-green-800">Leur avenir.</h1>
		    		<h1 class="font-bold text-4xl text-green-600">Un même espace.</h1>
		    		<p class="w-100 text-sm line-clamp-6">De la première planification au dernier applaudissement, simplifiez les soutenances de fin d'études.<br> Et concentrez-vous su l'essentiel: les talents de demain.</p>
	    		</div>
	    		
	    		<div class="flex gap-x-4">
	    			<div class="flex gap-x-2 bg-[#1D2E22] text-white font-semibold rounded-md p-2 hover:text-green-800 hover:border-green-800 hover:bg-white hover:border-2 ">
	    				<a href="./authPage.jsp">Accéder à mon espace</a>
	    				<svg class="w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
						  <path stroke-linecap="round" stroke-linejoin="round" d="M17.25 8.25 21 12m0 0-3.75 3.75M21 12H3" />
						</svg>		
	    			</div>
	    			<div class="flex gap-x-2 rounded-md text-gray-400 hover:border-green-800 hover:text-green-800 hover:border-2 p-2">
	    				<a href="">Découvrir la plateforme</a>
	    				<svg class="w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
						  <path stroke-linecap="round" stroke-linejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" />
						</svg>
	    			</div>
	    		</div>
	    		<!-- Petit kiyaye -->
	    		<div class="flex gap-x-4">
	    			<div class="flex gap-x-2 text-gray-400">
	    				<svg class="w-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
						  <path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5" />
						</svg>				
	    				<p>Trois espaces dédiés</p>
	    				
	    			</div>
	    			<div class="flex gap-x-2 text-gray-400">
	    				<svg class="w-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
						  <path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5" />
						</svg>
	    				<p>Un parcours simplifé</p>
	    			</div>
	    		</div>
	    		
	    	</div>
	    	
	    <!-- Partie droite -->
		    <div class="flex-1 flex justify-center items-center content-center h-100 bg-[#E7EFC9]">
		    	<h3>A modifier pour afficher quelque petit trucs.</h3>
		    </div>
	    </div>

    </header>
    
    
    


<!-- ============================================================ -->
<!-- Section : "Un espace pensé pour vous" -->
<!-- À intégrer dans ta page d'accueil (index.jsp / landing.jsp)   -->
<!-- ============================================================ -->

<section class="bg-[#F7F6EF]">

  <!-- Bandeau du haut : accroche + 4 points forts -->
  <div class="max-w-6xl mx-auto px-6 py-16 border-b border-[#E3E1D6] flex flex-col md:flex-row md:items-center md:justify-between gap-10">

    <div class="max-w-xs">
      <p class="text-sm text-[#8B8A7C]">Moins de complexité.</p>
      <h2 class="text-xl font-medium text-[#2F3A2F]">Plus de sérénité.</h2>
    </div>

    <div class="grid grid-cols-2 md:grid-cols-4 gap-8">

      <div class="flex items-start gap-3">
        <svg class="w-5 h-5 text-[#2F3A2F] mt-0.5 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
          <rect x="3" y="4" width="18" height="17" rx="2"/>
          <path d="M3 9h18M8 2v4M16 2v4"/>
        </svg>
        <p class="text-sm text-[#5B5A4E]">Une organisation<br><span class="text-[#2F3A2F]">centralisée</span></p>
      </div>

      <div class="flex items-start gap-3">
        <svg class="w-5 h-5 text-[#2F3A2F] mt-0.5 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
          <circle cx="8" cy="8" r="3"/><circle cx="17" cy="9" r="2.5"/>
          <path d="M2 20c0-3 2.5-5 6-5s6 2 6 5M14 15.5c2.8.3 4.5 2 4.5 4.5"/>
        </svg>
        <p class="text-sm text-[#5B5A4E]">Des jurys<br><span class="text-[#2F3A2F]">coordonnés</span></p>
      </div>

      <div class="flex items-start gap-3">
        <svg class="w-5 h-5 text-[#2F3A2F] mt-0.5 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
          <circle cx="12" cy="9" r="5"/><path d="M8 13.5 6.5 21 12 18l5.5 3-1.5-7.5"/>
        </svg>
        <p class="text-sm text-[#5B5A4E]">Des évaluations<br><span class="text-[#2F3A2F]">transparentes</span></p>
      </div>

      <div class="flex items-start gap-3">
        <svg class="w-5 h-5 text-[#2F3A2F] mt-0.5 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
          <path d="M22 9 12 4 2 9l10 5 10-5Z"/>
          <path d="M6 11v5c0 1.7 2.7 3 6 3s6-1.3 6-3v-5"/>
        </svg>
        <p class="text-sm text-[#5B5A4E]">Des étudiants<br><span class="text-[#2F3A2F]">bien accompagnés</span></p>
      </div>

    </div>
  </div>

  <!-- Titre de section + 3 cartes rôle -->
  <div class="max-w-6xl mx-auto px-6 py-20 text-center">

    <p class="text-xs tracking-widest uppercase text-[#9A9886] mb-4">Chacun son rôle, une même ambition</p>
    <h2 class="text-3xl md:text-4xl font-medium text-[#2F3A2F] mb-3">Un espace pensé pour vous.</h2>
    <p class="text-[#6E6D5F] mb-14">La bonne information. Au bon moment. Pour chaque acteur.</p>

    <div class="grid md:grid-cols-3 gap-6 text-left">

      <!-- Carte Administrateur -->
      <article class="bg-white rounded-2xl p-7 flex flex-col gap-5 shadow-sm">
        <div class="w-11 h-11 rounded-lg bg-[#E7EFDF] flex items-center justify-center">
          <svg class="w-5 h-5 text-[#5B7A4A]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8">
            <rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/>
            <rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/>
          </svg>
        </div>

        <div class="flex flex-col gap-3">
          <p class="text-sm text-[#9A9886]">Administrateur</p>
          <h3 class="text-xl font-medium text-[#2F3A2F]">Organisez en toute confiance.</h3>
          <p class="text-sm text-[#6E6D5F] leading-relaxed">
            Pilotez votre session, gérez les étudiants et composez les jurys.
            Gardez une vue d'ensemble sans perdre les détails.
          </p>
        </div>

        <div class="flex flex-wrap gap-2">
          <span class="text-xs px-3 py-1 rounded-full bg-[#F1F0E8] text-[#6E6D5F]">Planification</span>
          <span class="text-xs px-3 py-1 rounded-full bg-[#F1F0E8] text-[#6E6D5F]">Gestion des comptes</span>
        </div>

        <a href="${pageContext.request.contextPath}/authPage.jsp" class="mt-2 pt-5 border-t border-[#EEEDE3] flex items-center justify-between text-sm text-[#2F3A2F] hover:text-[#5B7A4A] transition-colors">
          Accéder à mon espace
          <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
            <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h14M13 6l6 6-6 6"/>
          </svg>
        </a>
      </article>

      <!-- Carte Étudiant -->
      <article class="bg-white rounded-2xl p-7 flex flex-col gap-5 shadow-sm">
        <div class="w-11 h-11 rounded-lg bg-[#E6EEF5] flex items-center justify-center">
          <svg class="w-5 h-5 text-[#4A6E8A]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8">
            <path d="M22 9 12 4 2 9l10 5 10-5Z"/>
            <path d="M6 11v5c0 1.7 2.7 3 6 3s6-1.3 6-3v-5"/>
          </svg>
        </div>

        <div class="flex flex-col gap-3">
          <p class="text-sm text-[#9A9886]">Étudiant</p>
          <h3 class="text-xl font-medium text-[#2F3A2F]">Préparez votre grand moment.</h3>
          <p class="text-sm text-[#6E6D5F] leading-relaxed">
            Retrouvez la date, la salle et les membres de votre jury.
            Consultez votre résultat, dès qu'il est disponible.
          </p>
        </div>

        <div class="flex flex-wrap gap-2">
          <span class="text-xs px-3 py-1 rounded-full bg-[#F1F0E8] text-[#6E6D5F]">Ma soutenance</span>
          <span class="text-xs px-3 py-1 rounded-full bg-[#F1F0E8] text-[#6E6D5F]">Mes résultats</span>
        </div>

        <a href="${pageContext.request.contextPath}/authPage.jsp" class="mt-2 pt-5 border-t border-[#EEEDE3] flex items-center justify-between text-sm text-[#2F3A2F] hover:text-[#4A6E8A] transition-colors">
          Accéder à mon espace
          <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
            <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h14M13 6l6 6-6 6"/>
          </svg>
        </a>
      </article>

      <!-- Carte Enseignant -->
      <article class="bg-white rounded-2xl p-7 flex flex-col gap-5 shadow-sm">
        <div class="w-11 h-11 rounded-lg bg-[#F5E9DE] flex items-center justify-center">
          <svg class="w-5 h-5 text-[#B07A45]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8">
            <circle cx="8" cy="8" r="3"/><circle cx="17" cy="9" r="2.5"/>
            <path d="M2 20c0-3 2.5-5 6-5s6 2 6 5M14 15.5c2.8.3 4.5 2 4.5 4.5"/>
          </svg>
        </div>

        <div class="flex flex-col gap-3">
          <p class="text-sm text-[#9A9886]">Enseignant</p>
          <h3 class="text-xl font-medium text-[#2F3A2F]">Accompagnez les talents.</h3>
          <p class="text-sm text-[#6E6D5F] leading-relaxed">
            Consultez vos convocations et les projets encadrés.
            Attribuez vos notes et partagez vos appréciations simplement.
          </p>
        </div>

        <div class="flex flex-wrap gap-2">
          <span class="text-xs px-3 py-1 rounded-full bg-[#F1F0E8] text-[#6E6D5F]">Mes jurys</span>
          <span class="text-xs px-3 py-1 rounded-full bg-[#F1F0E8] text-[#6E6D5F]">Évaluations</span>
        </div>

        <a href="${pageContext.request.contextPath}/authPage.jsp" class="mt-2 pt-5 border-t border-[#EEEDE3] flex items-center justify-between text-sm text-[#2F3A2F] hover:text-[#B07A45] transition-colors">
          Accéder à mon espace
          <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
            <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h14M13 6l6 6-6 6"/>
          </svg>
        </a>
      </article>

    </div>
  </div>

</section>
<!-- ============================================================ -->
<!-- Section : "Trois étapes. Une belle réussite." -->
<!-- ============================================================ -->

<section class="bg-[#EFEEE4] py-20">
  <div class="max-w-6xl mx-auto px-6 grid md:grid-cols-2 gap-16">

    <!-- Colonne gauche : titre -->
    <div>
      <p class="text-xs tracking-widest uppercase text-[#9A9886] mb-5">Simple, du début à la fin</p>
      <h2 class="text-3xl md:text-4xl font-medium text-[#2F3A2F] leading-tight mb-6">
        Trois étapes.<br>Une belle réussite.
      </h2>
      <p class="text-[#6E6D5F] max-w-sm">
        Un parcours fluide pour que chacun puisse donner le meilleur de lui-même.
      </p>
    </div>

    <!-- Colonne droite : liste des 3 étapes -->
    <div class="flex flex-col">

      <div class="flex items-start gap-5 py-6 border-b border-[#DEDCCE]">
        <span class="w-10 h-10 rounded-full border border-[#2F3A2F] flex items-center justify-center text-sm text-[#2F3A2F] shrink-0">01</span>
        <div>
          <h4 class="font-medium text-[#2F3A2F] mb-1">Connectez-vous</h4>
          <p class="text-sm text-[#6E6D5F]">Un accès unique qui vous dirige vers votre espace personnel.</p>
        </div>
      </div>

      <div class="flex items-start gap-5 py-6 border-b border-[#DEDCCE]">
        <span class="w-10 h-10 rounded-full border border-[#2F3A2F] flex items-center justify-center text-sm text-[#2F3A2F] shrink-0">02</span>
        <div>
          <h4 class="font-medium text-[#2F3A2F] mb-1">Préparez votre soutenance</h4>
          <p class="text-sm text-[#6E6D5F]">Retrouvez les informations et les actions adaptées à votre rôle.</p>
        </div>
      </div>

      <div class="flex items-start gap-5 py-6">
        <span class="w-10 h-10 rounded-full border border-[#2F3A2F] flex items-center justify-center text-sm text-[#2F3A2F] shrink-0">03</span>
        <div>
          <h4 class="font-medium text-[#2F3A2F] mb-1">Faites place à la réussite</h4>
          <p class="text-sm text-[#6E6D5F]">Suivez les évaluations et consultez les résultats, en toute clarté.</p>
        </div>
      </div>

    </div>
  </div>
</section>

<!-- ============================================================ -->
<!-- Bandeau CTA foncé -->
<!-- ============================================================ -->

<section class="bg-[#1D2E22] py-20 relative overflow-hidden">
  <!-- Cercle décoratif en fond, discret -->
  <div class="absolute -right-24 -bottom-24 w-96 h-96 rounded-full bg-[#2A3F31] opacity-60"></div>

  <div class="max-w-6xl mx-auto px-6 relative flex flex-col md:flex-row md:items-center md:justify-between gap-8">
    <div class="max-w-lg">
      <p class="text-xs tracking-widest uppercase text-[#9FB89C] mb-5">Un nouveau chapitre vous attend</p>
      <h2 class="text-3xl md:text-4xl font-medium text-[#F3F1E4] mb-3">Prêt pour la prochaine étape ?</h2>
      <p class="text-[#B9C2AF]">Votre session de soutenances commence ici.</p>
    </div>

    <a href="authPage.jsp" class="shrink-0 inline-flex items-center gap-2 bg-[#E7EFC9] text-[#1D2E22] px-6 py-3.5 rounded-full text-sm font-medium hover:bg-[#F3F1E4] transition-colors">
      Rejoindre mon espace
      <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
        <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h14M13 6l6 6-6 6"/>
      </svg>
    </a>
  </div>
</section>

<!-- ============================================================ -->
<!-- Footer -->
<!-- ============================================================ -->

<footer class="bg-[#F7F6EF] py-8">
  <div class="max-w-6xl mx-auto px-6 flex flex-col md:flex-row md:items-center md:justify-between gap-3 text-sm">

    <div class="flex items-center gap-2 text-[#2F3A2F] font-medium">
      <svg class="w-5 h-5 text-[#5B7A4A]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8">
        <path d="M22 9 12 4 2 9l10 5 10-5Z"/>
        <path d="M6 11v5c0 1.7 2.7 3 6 3s6-1.3 6-3v-5"/>
      </svg>
      soutena.
    </div>

    <p class="text-[#9A9886]">© 2026 Soutena. Pensé pour la réussite.</p>
  </div>
</footer>   
  </body>
</html>

