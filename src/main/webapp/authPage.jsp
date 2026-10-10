<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>
<body>

<!-- ============================================================ -->
<!-- Écran de connexion -->
<!-- ============================================================ -->

<div class="min-h-screen flex flex-col md:flex-row">

  <!-- Colonne gauche : panneau de marque -->
  <aside class="relative bg-[#1D2E22] text-[#F3F1E4] w-full md:w-[46%] px-10 py-10 flex flex-col overflow-hidden">
    <div class="absolute -right-32 top-1/3 w-96 h-96 rounded-full bg-[#2A3F31] opacity-60"></div>

    <!-- Logo -->
    <div class="relative flex items-center gap-2 font-medium text-lg">
      <span class="w-9 h-9 rounded-lg bg-[#E7EFC9] flex items-center justify-center">
        <svg class="w-5 h-5 text-[#1D2E22]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8">
          <path d="M22 9 12 4 2 9l10 5 10-5Z"/>
          <path d="M6 11v5c0 1.7 2.7 3 6 3s6-1.3 6-3v-5"/>
        </svg>
      </span>
      soutena.
    </div>

    <!-- Texte principal -->
    <div class="relative mt-20 max-w-sm">
      <p class="text-xs tracking-widest uppercase text-[#9FB89C] mb-5">Ensemble, vers la réussite</p>
      <h1 class="text-4xl font-medium leading-tight mb-6">
        Les grands projets méritent une belle<br>
        <span class="text-[#D8E4A6]">dernière étape.</span>
      </h1>
      <p class="text-[#B9C2AF]">
        Un espace commun pour organiser, accompagner et célébrer les soutenances de demain.
      </p>
    </div>

    <!-- Photo -->
    <div class="relative mt-10 rounded-xl overflow-hidden">
      <img src="https://images.unsplash.com/photo-1434030216411-0b793f4b4173?auto=format&fit=crop&w=800&q=80"
           alt="Étudiante en train de préparer sa soutenance"
           class="w-full h-48 object-cover">
      <div class="absolute bottom-3 left-3 flex items-center gap-2 text-sm text-white">
        <span class="w-6 h-6 rounded-full bg-black/40 flex items-center justify-center">
          <svg class="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8">
            <path d="M22 9 12 4 2 9l10 5 10-5Z"/>
            <path d="M6 11v5c0 1.7 2.7 3 6 3s6-1.3 6-3v-5"/>
          </svg>
        </span>
        Chaque talent compte.
      </div>
    </div>

    <!-- Bas de panneau -->
    <div class="relative mt-auto pt-10 flex items-center justify-between text-xs text-[#9FB89C]">
      <div class="flex items-center gap-2">
        <span class="w-1.5 h-1.5 rounded-full bg-[#D8E4A6]"></span>
        Session de juin 2026
      </div>
      <span>2025 — 2026</span>
    </div>
  </aside>

  <!-- Colonne droite : formulaire -->
  <main class="flex-1 bg-[#FDFCF4] flex flex-col">

    <div class="px-10 pt-8">
      <a href="index.jsp" class="inline-flex items-center gap-1.5 text-sm text-[#6E6D5F] hover:text-[#2F3A2F] transition-colors">
        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
          <path stroke-linecap="round" stroke-linejoin="round" d="M15 6l-6 6 6 6"/>
        </svg>
        Retour à l'accueil
      </a>
    </div>

    <div class="flex-1 flex items-center">
      <div class="w-full max-w-md mx-auto px-10 py-10">

        <span class="w-11 h-11 rounded-lg bg-[#E7EFDF] flex items-center justify-center mb-8">
          <svg class="w-5 h-5 text-[#5B7A4A]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8">
            <path d="M22 9 12 4 2 9l10 5 10-5Z"/>
            <path d="M6 11v5c0 1.7 2.7 3 6 3s6-1.3 6-3v-5"/>
          </svg>
        </span>

        <p class="text-xs tracking-widest uppercase text-[#B07A45] mb-4">Votre prochaine étape commence ici</p>
        <h2 class="text-3xl font-medium text-[#2F3A2F] mb-2">Heureux de vous retrouver.</h2>
        <p class="text-[#6E6D5F] mb-8">Connectez-vous pour accéder à votre espace personnel.</p>

        <form action="${pageContext.request.contextPath}/login" method="post" class="flex flex-col gap-5">

          <c:if test="${not empty erreur}">
            <p class="text-sm text-[#B05B74] bg-[#FBF3F1] border border-[#E8CFC5] rounded-lg px-4 py-3">${erreur}</p>
          </c:if>

			<input type="text" name="action" value="connexion" hidden>
          <div>
            <label for="login" class="block text-sm text-[#2F3A2F] mb-2">Login</label>
            <input type="text" id="login" name="login" required
                   placeholder="Mr.Merde214"
                   class="w-full px-4 py-3 rounded-lg border border-[#E3E1D6] bg-white text-sm text-[#2F3A2F] placeholder-[#B4B2A3] focus:outline-none focus:ring-2 focus:ring-[#5B7A4A] focus:border-transparent">
          </div>

          <div>
            <div class="flex items-center justify-between mb-2">
              <label for="password" class="block text-sm text-[#2F3A2F]">Mot de passe</label>
              <a href="#" class="text-sm text-[#6E6D5F] hover:text-[#2F3A2F] transition-colors">Mot de passe oublié ?</a>
            </div>
            <div class="relative">
              <input type="password" id="password" name="password" required
                     placeholder="Votre mot de passe"
                     class="w-full px-4 py-3 pr-20 rounded-lg border border-[#E3E1D6] bg-white text-sm text-[#2F3A2F] placeholder-[#B4B2A3] focus:outline-none focus:ring-2 focus:ring-[#5B7A4A] focus:border-transparent">
              <button type="button" onclick="togglePassword()"
                      class="absolute right-4 top-1/2 -translate-y-1/2 text-xs text-[#6E6D5F] hover:text-[#2F3A2F]">
                <span id="toggleLabel">Afficher</span>
              </button>
            </div>
          </div>

          <button type="submit"
                  class="mt-2 w-full bg-[#2F5B45] hover:bg-[#274A39] text-white py-3.5 rounded-lg text-sm font-medium flex items-center justify-center gap-2 transition-colors">
            Se connecter
            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h14M13 6l6 6-6 6"/>
            </svg>
          </button>
        </form>

      </div>
    </div>

    <!-- Footer -->
    <div class="px-10 py-6 flex items-center justify-between text-xs text-[#9A9886]">
      <p>© 2026 Soutena. Pensé pour la réussite.</p>
      <p>Besoin d'aide ? <a href="#" class="text-[#2F5B45] hover:underline">Contactez la scolarité</a></p>
    </div>

  </main>
</div>

</body>
</html>