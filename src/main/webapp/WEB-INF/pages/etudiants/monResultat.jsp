<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Mon résultat - Étudiant</title>
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>
<body class="bg-[#F7F8F5]">
<div class="flex min-h-screen">
  <aside class="w-64 bg-[#1D2E22] text-[#DDE4D6] flex flex-col px-5 py-6 shrink-0">
    <div class="flex items-center gap-2 font-medium text-lg text-white mb-8">
      <span class="w-9 h-9 rounded-lg bg-[#E7EFC9] flex items-center justify-center"><svg class="w-5 h-5 text-[#1D2E22]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8"><path d="M22 9 12 4 2 9l10 5 10-5Z"/><path d="M6 11v5c0 1.7 2.7 3 6 3s6-1.3 6-3v-5"/></svg></span>
      soutena.
    </div>
    <div class="flex items-center gap-3 pb-6 border-b border-[#2A3F31]">
      <span class="w-9 h-9 rounded-lg border border-[#3A5240] flex items-center justify-center"><svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><path d="M22 9 12 4 2 9l10 5 10-5Z"/><path d="M6 11v5c0 1.7 2.7 3 6 3s6-1.3 6-3v-5"/></svg></span>
      <div><p class="text-sm text-white font-medium">Espace étudiant</p><p class="text-xs text-[#9FB89C]">Année académique 2024-2025</p></div>
    </div>
    <p class="text-xs tracking-widest uppercase text-[#7E9078] mt-6 mb-3">Mon espace personnel</p>
    <nav class="flex flex-col gap-1 text-sm">
      <a href="${pageContext.request.contextPath}/Etudiant?page=tableauDeBord" class="px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">Tableau de bord</a>
      <a href="${pageContext.request.contextPath}/Etudiant?page=maSoutenance" class="px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">Ma soutenance</a>
      <a href="${pageContext.request.contextPath}/Etudiant?page=monResultat" class="px-3 py-2.5 rounded-lg bg-[#2F5B45] text-white">Mon résultat</a>
    </nav>
    <div class="mt-auto rounded-xl border border-[#3A5240] p-4 bg-[#24382B]">
      <p class="text-xs tracking-widest uppercase text-[#9FB89C] mb-2">Session de juin 2025</p>
      <p class="text-white font-medium mb-1">Votre avenir commence ici.</p>
      <p class="text-xs text-[#B9C2AF] mb-3">Un projet, une soutenance, un nouveau chapitre.</p>
      <p class="text-xs text-[#D8E4A6] flex items-center gap-1.5"><span class="w-1.5 h-1.5 rounded-full bg-[#D8E4A6]"></span>Ensemble, vers la réussite</p>
    </div>
    <nav class="flex flex-col gap-1 text-sm mt-4">
      <a href="#" class="px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">Aide &amp; contact</a>
      <a href="${pageContext.request.contextPath}/logout" class="px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">Se déconnecter</a>
    </nav>
  </aside>

  <main class="flex-1">
    <div class="flex items-center justify-between px-8 py-4 bg-white border-b border-[#E9EAE2]">
      <p class="text-sm text-[#6E6D5F]">Espace étudiant <span class="mx-2">›</span> <span class="text-[#2F3A2F]">Mon résultat</span></p>
      <span class="w-9 h-9 rounded-full bg-[#E7EFDF] text-[#5B7A4A] flex items-center justify-center text-sm font-medium">${sessionScope.ConnectedUser.prenomuser.substring(0,1)}${sessionScope.ConnectedUser.nomuser.substring(0,1)}</span>
    </div>
    <div class="px-8 py-8">
      <p class="text-xs tracking-widest uppercase text-[#9A9886] mb-2">Votre parcours vers la réussite</p>
      <div class="flex items-end justify-between mb-8"><h1 class="text-3xl font-medium text-[#2F3A2F]">Mon résultat</h1>
      <span class="bg-[#E7EFDF] text-[#5B7A4A] rounded-md px-3 py-1.5 text-xs">● Session de juin 2025</span></div>
      <p class="text-sm text-[#6E6D5F] mb-8">Toutes les informations pour aborder votre soutenance sereinement.</p>
      <div class="bg-white rounded-xl border border-[#ECEEE6] p-16 text-center max-w-4xl mx-auto">
        <span class="w-16 h-16 rounded-full bg-[#E7EFDF] inline-flex items-center justify-center mb-6"><svg class="w-7 h-7 text-[#5B7A4A]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><circle cx="12" cy="9" r="5"/><path d="M8 13.5 6.5 21 12 18l5.5 3-1.5-7.5"/></svg></span>
        <p class="text-xs tracking-widest uppercase text-[#9A9886] mb-4">La dernière étape de votre parcours</p>
        <h2 class="text-3xl font-medium text-[#5B7A4A] mb-4">Chaque réussite prend son temps.</h2>
        <p class="text-sm text-[#6E6D5F] mb-8">Votre résultat sera disponible après la soutenance,<br>lorsque tous les membres du jury auront saisi leur évaluation.</p>
        <p class="mb-8">
        <c:choose>
          <c:when test="${noteFinale != null}">
            <span class="bg-[#E6EEF5] text-[#4A6E8A] rounded-md px-3 py-1.5 text-xs">● Votre note finale : ${noteFinale} / 20</span>
          </c:when>
          <c:otherwise>
            <span class="bg-[#F5E9DE] text-[#B07A45] rounded-md px-3 py-1.5 text-xs">◷ En attente d'évaluation</span>
          </c:otherwise>
        </c:choose>
        </p>
        <a href="${pageContext.request.contextPath}/Etudiant?page=maSoutenance" class="border border-[#E3E1D6] rounded-lg px-5 py-2.5 text-sm inline-block">Consulter ma soutenance →</a>
      </div>
    </div>
  </main>
</div>
</body>
</html>


